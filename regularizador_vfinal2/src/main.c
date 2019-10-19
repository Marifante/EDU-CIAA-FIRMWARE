/*
===============================================================================
 Name        : TP.c
 Author      : Ezequiel Canay / Julian Rodriguez
 Version     : 1.0
 Description : main definition
===============================================================================
*/


#include "../inc/main.h"


/*  */
gpioPin_t led0_r, led0_g, led0_b, led1, led2, led3;
gpioPin_t tec1, tec2, tec3, tec4;

//interrupciones pulsadores
void GPIO0_IRQHandler(void)
{
	clearGPIOInterruptFlag( 0 );
	flags[0] = !flags[0];
	estado = NUEVO_BOTON;
	toggleGpio(&led0_r);
 }

void GPIO1_IRQHandler(void)
{
	clearGPIOInterruptFlag( 1 );
	flags[1] = !flags[1];
	estado = NUEVO_BOTON;
	toggleGpio(&led1);
}

void GPIO2_IRQHandler(void)
{
	clearGPIOInterruptFlag( 2 );
	flags[2] = !flags[2];
	estado = NUEVO_BOTON;
	toggleGpio(&led2);
}

void GPIO3_IRQHandler(void)
{
	clearGPIOInterruptFlag( 3 );
	flags[3] = !flags[3];
	estado = NUEVO_BOTON;
	toggleGpio(&led3);
 }

void DMA_IRQHandler(void){
	LPC_GPDMA->INTTCCLEAR |= 0x1; //clear terminal count interrupt
	estado = TERMINO_DMA;
}


int main(void) {

	//configuro leds

	configLed(LED0_R, &led0_r);
	configLed(LED0_G, &led0_g);
	configLed(LED0_B, &led0_b);
	configLed(LED1, &led1);
	configLed(LED2, &led2);
	configLed(LED3, &led3);

	//pongo todo en 0
	writeGpio(&led0_r,0);
	writeGpio(&led0_g,0);
	writeGpio(&led0_b,0);
	writeGpio(&led1,0);
	writeGpio(&led2,0);
	writeGpio(&led3,0);


	//pongo la lista en 0
	Escribir_Salida();

	//configuro DAC y timer
	enableDAC();

	/* Configuro teclas */
	/* Tecla 1 */
	configGpio(TEC1, &tec1, INPUT_GPIO);
	configTecInterrupts(&tec1, 0, ASCENDENT);
	/* Tecla 2 */
	configGpio(TEC2, &tec2, INPUT_GPIO);
	configTecInterrupts(&tec2, 1, ASCENDENT);
	/* Tecla 3 */
	configGpio(TEC3, &tec3, INPUT_GPIO);
	configTecInterrupts(&tec3, 2, ASCENDENT);
	/* Tecla 4 */
	configGpio(TEC4, &tec4, INPUT_GPIO);
	configTecInterrupts(&tec4, 3, ASCENDENT);

	/* Config DMA mux in the CREG */
	configDMAmux(GPDMA_CONN_DAC);

	/* Creates the control word for the channel	*/
	uint32_t ctrl_word = GPDMA_CtrlWrd(CANTIDAD_MUESTRAS,
											ONE_DBURST,
											ONE_DBURST,
											WORD_DATUM,
											WORD_DATUM,
											AHB_MASTER_0,
											AHB_MASTER_1,
											true,
											false,
											false,
											false,
											false,
											true
											);


	/*	Creates the lli for the transference */
	GPDMA_CreateLLI(&first_data_lli,
						(uint32_t) &valores_lli[0],
						(uint32_t) &(LPC_DAC->CR),
						(uint32_t) &second_data_lli,
						ctrl_word
						);

	/*	Create the second lli for the transference*/
	GPDMA_CreateLLI(&second_data_lli,
							(uint32_t) &valores_lli[1],
							(uint32_t) &(LPC_DAC->CR),
							(uint32_t) &first_data_lli,
							ctrl_word
						);

	uint32_t cfg_wrd = 1			//enables channel of DMA
						| (0<<1) 		//don't care, i gonna use the memory as the source of the transfer
						| (0x0F<<6) 	//select DAC as dest peripheral
						| (1<<11) 		//memory to peripheral (DMA control)
						| (0<<14) 		//don't care about interrupt error mask
						| (1<<15) 		//don't care about terminal count interrupt mask
						| (0<<16)		//when this bit is 1, enables locked transfers
						| (0<<18); 		//Halt, enable DMA requests

	GPDMA_configChannel( CHANNEL0,
							(uint32_t) &lista_salida[0],
							(uint32_t) &(LPC_DAC->CR),
							(uint32_t) &first_data_lli,
							ctrl_word,
							cfg_wrd);

	// Configurar el DAC para que envie la request signal al DMA controller
	LPC_DAC->CTRL = (1<<0)	//DMA request, this bit its cleared after every write to the DAC->CR register
			|	(1<<1)		//enable double buffering
			|	(1<<2)	//DMA time-out counter enabled
			|	(1<<3);	//combined DAC and DMA enable

	/*
	 * ticks => El DAC tiene un contador, cuando este contador cuenta X ticks, envia una request signal al DMA.
	 * El DAC tiene un timer que cada vez que ese timer llega a 0, tira una request signal al DMA y el DMA
	 * le inicia una transferencia. Tecnicamente, la frecuencia de este timer es como una 'frecuencia de muestreo'.
	 * Yo quiero que se muestren en pantalla todas las muestras de la lista de valores. Entonces:
	 *  fs = 204MHz / ticks
	 * La frecuencia de la señal de menor freq es 1kHz. Yo quiero que en 1/1KHz se muestren todas las muestras:
	 * 	CANTIDAD_MUESTRAS*Ts = 1/(MINOR_FREQ)
	 * 	(CANTIDAD_MUESTRAS)*ticks/(GPDMA_CLOCK) = 1/(MINOR_FREQ)
	 * 	ticks = (GPDMA_CLOCK) / (CANTIDAD_MUESTRAS * MINOR_FREQ)
	 * */
	DAC_configToSample( MINOR_FREQ, CANTIDAD_MUESTRAS );

	// Habilitar interrupcion del DMA
	NVIC_EnaIRQ(DMA_IRQn);

	while(1){

		switch (estado){
		case NUEVO_BOTON:
			Nuevo_Boton();
			estado = NADA;
			break;
		case TERMINO_DMA:
			Termino_DMA();
			estado=NADA;
			break;
		case NADA:
			break;
		default:
			estado=NADA;
			break;
		}

	}

}




//no importa cuanto tarde, se hace poco
void Escribir_Salida (void){
	float aux;
	for(int i=0;i<CANTIDAD_MUESTRAS;i++){
		aux=(flags[0]*sin(1*2*pi*i/CANTIDAD_MUESTRAS)+flags[1]*sin(2*2*pi*i/CANTIDAD_MUESTRAS)+flags[2]*sin(4*2*pi*i/CANTIDAD_MUESTRAS)+flags[3]*sin(8*2*pi*i/CANTIDAD_MUESTRAS)); //genero senoidal
		aux=(aux/(flags[0]+flags[1]+flags[2]+flags[3])); //normalizo en funcion de la cantidad de senoidales
		lista_seno[i]=(unsigned int)((aux+1)*(AMPLITUD/2)); //amplitud y offset
		lista_salida[i]= DAC_VALUE(lista_seno[i]) | DAC_BIAS_EN ; //Adapto el valor para que lo muestre el DAC (shifteo 6 el valor y activo el bit de bias)
	}
	return;
}

void Termino_DMA (void){
	for (int i = 0; i<(CANTIDAD_MUESTRAS); i++){
		valores_lli[(unsigned int) who_list][i] = lista_salida[i];
	}

	if (who_list == 0 ) {
		who_list = 1;
	} else {
		who_list = 0;
	}

	return;
}

void Nuevo_Boton ( void ){
	Escribir_Salida();
	return;
}

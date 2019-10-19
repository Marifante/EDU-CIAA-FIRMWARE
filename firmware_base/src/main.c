
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/main.h"


gpioPin_t led0_r, led0_g, led0_b, led1, led2, led3;
gpioPin_t tec1, tec2, tec3, tec4;

int main( void )
{

	InitializateAllLeds();

	/* Escribo la lista en 0 */
	WriteOutputValues();

	/*Habilito el DAC */
	enableDAC();

	/* Configuro teclas */
	ConfigAllButtons();

	/* Config DMA mux in the CREG */
	configDMAmux( GPDMA_CONN_DAC );

	/* Creates the control word for the channel	*/
	uint32_t ctrl_word = GPDMA_CtrlWrd(	SAMPLES,
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
										true );


	/*	Creates the lli for the transference */
	GPDMA_CreateLLI(	&first_data_lli,
						(uint32_t) &lliValues[0],
						(uint32_t) &(LPC_DAC->CR),
						(uint32_t) &second_data_lli,
						ctrl_word );

	/*	Create the second lli for the transference*/
	GPDMA_CreateLLI(	&second_data_lli,
						(uint32_t) &lliValues[1],
						(uint32_t) &(LPC_DAC->CR),
						(uint32_t) &first_data_lli,
						ctrl_word );

	uint32_t cfg_wrd = 		1				//enables channel of DMA
						| 	(0<<1) 			//don't care, i gonna use the memory as the source of the transfer
						| 	(0x0F<<6) 		//select DAC as dest peripheral
						| 	(1<<11) 		//memory to peripheral (DMA control)
						| 	(0<<14) 		//don't care about interrupt error mask
						| 	(1<<15) 		//don't care about terminal count interrupt mask
						| 	(0<<16)			//when this bit is 1, enables locked transfers
						| 	(0<<18); 		//Halt, enable DMA requests

	GPDMA_configChannel( 	CHANNEL0,
							(uint32_t) &outputValues[0],
							(uint32_t) &(LPC_DAC->CR),
							(uint32_t) &first_data_lli,
							ctrl_word,
							cfg_wrd);

	// Configurar el DAC para que envie la request signal al DMA controller
	LPC_DAC->CTRL = 	(1<<0)		//DMA request, this bit its cleared after every write to the DAC->CR register
					|	(1<<1)		//enable double buffering
					|	(1<<2)		//DMA time-out counter enabled
					|	(1<<3);		//combined DAC and DMA enable


	DAC_configToSample( MINORFREQ, SAMPLES );

	// Habilitar interrupcion del DMA
	NVIC_EnaIRQ( DMA_IRQn );

	while(1){

		switch (programState){
		case NEWBUTTON:
			WriteOutputValues();
			programState = NOTHING;
			break;
		case DMAEND:
			DMATransferEnds();
			programState = NOTHING;
			break;
		case NOTHING:
			break;
		default:
			programState = NOTHING;
			break;
		}

	}

}


/*===================[functions definition]==================================*/


/* @brief Calcula el valor de la senal de salida requerida.
 * Los valores son guardados a un vector => outputValues. */
void WriteOutputValues( void )
{
	float aux;
	for (int i=0; i<SAMPLES; i++)
	{
		aux =	buttonFlags[0]*sin(1*2*pi*i/SAMPLES)+
				buttonFlags[1]*sin(2*2*pi*i/SAMPLES)+
				buttonFlags[2]*sin(4*2*pi*i/SAMPLES)+
				buttonFlags[3]*sin(8*2*pi*i/SAMPLES); //genero senoidal

		aux = (aux/(buttonFlags[0]+buttonFlags[1]+buttonFlags[2]+buttonFlags[3])); //normalizo en funcion de la cantidad de senoidales

		outputValues[i] = (unsigned int)((aux+1)*(AMPLITUD/2)); //amplitud y offset

		outputValues[i] = DAC_VALUE(outputValues[i]) | DAC_BIAS_EN ; //Adapto el valor para que lo muestre el DAC (shifteo 6 el valor y activo el bit de bias)
	}
}

/* @brief Funcion que se ejecuta cuando se termina una tranferencia del DAC.
 * Cuando se termina la transferencia de un buffer, hay que escribir sobre ese
 * mismo buffer los valores de la nueva salida mientras se mandan los datos del
 * otro buffer.
 * NOTA: el programa empieza con el primer buffer, por lo cual, en el primer disparo
 * de la interrupcion del DMA se copian los valores de la lista de salida al
 * primer buffer.
 * */
void DMATransferEnds( void )
{
	// Se escribe sobre el buffer que termino recientemente
	for( int i = 0; i<SAMPLES; i++ )
	{
		lliValues[whoBufferGoes][i] = outputValues[i];
	}
	ToggleBuffer();
}

void ToggleBuffer( void )
{
	if( whoBufferGoes == FIRSTBUFFER )
	{
		whoBufferGoes = SECONDBUFFER;
	}
	else
	{
		whoBufferGoes = FIRSTBUFFER;
	}
}

/* @brief Configura los leds y los apaga. */
void InitializateAllLeds( void )
{
	//	configuro leds
	configLed(LED0_R, &led0_r);
	configLed(LED0_G, &led0_g);
	configLed(LED0_B, &led0_b);
	configLed(LED1, &led1);
	configLed(LED2, &led2);
	configLed(LED3, &led3);

	//	pongo todo en 0
	writeGpio(&led0_r, LOW);
	writeGpio(&led0_g, LOW);
	writeGpio(&led0_b, LOW);
	writeGpio(&led1, LOW);
	writeGpio(&led2, LOW);
	writeGpio(&led3, LOW);
}

/* @brief Configuro las 4 teclas.*/
void ConfigAllButtons( void )
{
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
}

/* Definicion de las funciones de los handlers de las interrupciones de las
 * teclas y el DMA. */
void GPIO0_IRQHandler( void )
{
	clearGPIOInterruptFlag( 0 );

	if ( isABounce( TEC1 ) == false )
	{
		buttonFlags[0] = !buttonFlags[0];
		programState = NEWBUTTON;
		toggleGpio(&led0_r);
	}
}

void GPIO1_IRQHandler( void )
{
	clearGPIOInterruptFlag( 1 );

	if ( isABounce( TEC2 ) == false )
	{
		buttonFlags[1] = !buttonFlags[1];
		programState = NEWBUTTON;
		toggleGpio(&led1);
	}
}

void GPIO2_IRQHandler( void )
{
	clearGPIOInterruptFlag( 2 );

	if ( isABounce( TEC3 ) == false )
	{
		buttonFlags[2] = !buttonFlags[2];
		programState = NEWBUTTON;
		toggleGpio(&led2);
	}
}

void GPIO3_IRQHandler( void )
{
	clearGPIOInterruptFlag( 3 );

	if ( isABounce( TEC4 ) == false )
	{
		buttonFlags[3] = !buttonFlags[3];
		programState = NEWBUTTON;
		toggleGpio(&led3);
	}

 }

/* @brief la interrupcion del DMA esta configurar para que se dispare cada vez
 *  que una transferencia se complete. */
void DMA_IRQHandler( void ){
	LPC_GPDMA->INTTCCLEAR |= 0x1; //clear terminal count interrupt
	programState = DMAEND;
}

/* @brief Funcion antirebote. */
bool isABounce( gpioMap_t tecla )
{
	uint8_t initialState = checkButtonState( tecla );
	delay_us( 100 );
	uint8_t finalState = checkButtonState( tecla );
	if ( finalState == initialState )
		return false;
	else
		return true;
}

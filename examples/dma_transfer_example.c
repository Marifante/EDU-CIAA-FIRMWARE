/*
===============================================================================
 Name        : TP.c
 Author      : Ezequiel Canay / Julian Rodriguez
 Version     : 1.0
 Description : main definition
===============================================================================
*/


#include "../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../libraries/board_specific/inc/edu_ciaa_hl.h"

#define CANTIDAD_MUESTRAS 2048
#define MINOR_FREQ 1
#define AMPLITUD 1023

/* Lista que contiene todos los valores de la salida */
int lista_salida[CANTIDAD_MUESTRAS];
int lista_seno[CANTIDAD_MUESTRAS];

/* counter */
int j = 0;

/* Flags for logic */
bool flags[4] = {0, 0, 0, 0};

/*	Listas enlazadas a usar	*/
lli_t first_data_lli;

/*  */
gpioPin_t led0_r, led0_g, led0_b, led1, led2, led3;
gpioPin_t tec1, tec2, tec3, tec4;

void Escribir_Salida (void);

//interrupciones pulsadores
void GPIO0_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 0);
	flags[0] = !flags[0];
	//flags[1] = !flags[1];
	Escribir_Salida();

//	for(int i = 0; i<CANTIDAD_MUESTRAS; i++){
//		//lista_salida[i] = (AMPLITUD/2)*sin(2*pi*i/CANTIDAD_MUESTRAS);
//		lista_salida[i] = (i%2 == 0) ? AMPLITUD/2 : -AMPLITUD/2;
//	}
//	for(int i = 0; i<CANTIDAD_MUESTRAS; i++){
//		lista_salida[i] = ( (lista_salida[i]+(AMPLITUD/2))<<6 )
//				| (1<<16);
//
//	}
	toggleGpio(&led0_r);
 }

void GPIO1_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 1);
	flags[1] = !flags[1];
	Escribir_Salida();
	toggleGpio(&led1);
}

void GPIO2_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 2);

	flags[2] = !flags[2];
	Escribir_Salida();
	toggleGpio(&led2);
}

void GPIO3_IRQHandler(void){
	/* Limpio el flag de la interrupcion del GPIO */
	GPIO_PIN_INT->IST = (1 << 3);

	flags[3] = !flags[3];
	Escribir_Salida();
	toggleGpio(&led3);
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

	uint32_t ctrl_word = ( (CANTIDAD_MUESTRAS)	//set size of the data to transfer
			| (0<<12)					//Source burst size = 1
			| (0<<15)					//Dest burst size = 1
			| (2<<18) 					//width of each single data to transfer for the source = 32 bits
			| (2<<21) 					//width of each single data to transfer for the destination = 32 bits
			| (0<<24) 					//select AHB Master 0 for source (memory)
			| (1<<25) 					//select AHB Master 1 for destination (DAC)
			| (1<<26) 					//source is incremented in each transfer
			| (0<<27)					//destination dont increment in each transfer
			| (0<<28)					//user mode
			| (0<<29)					//no bufferable
			| (0<<30)					//no cacheable
			| (0<<31) );*/


	/*	Creo el nodo de la lista enlazada para la transferencia	*/
	first_data_lli.src_address = (uint32_t) &lista_salida[0];
	first_data_lli.dest_address = (uint32_t) &(LPC_DAC->CR);
	first_data_lli.next_lli_address = (uint32_t) &first_data_lli;
	first_data_lli.control = ctrl_word;

	//1) Elegir un canal (elijo el canal 0, arbitrario) y habilitar el DMA
	LPC_GPDMA->CONFIG = 1;
	uint32_t channel = 0;

	//2) Limpiar interrupcion (intTCClear and INTERRCLEAR)
	LPC_GPDMA->INTTCCLEAR |= (1<<channel);

	//3) Escribir la direccion de memoria del primer elemento de una lista de datos a transmitir
	//en la estructura del canal
	(LPC_GPDMA->CH[channel]).SRCADDR = 	(uint32_t) &lista_salida[0];

	//4) Escribir la direccion de memoria del periferico al cual se llevan los datos
	(LPC_GPDMA->CH[channel]).DESTADDR = (uint32_t) &(LPC_DAC->CR);

	//5) Escribir la direccion de la siguiente lista enlazada
	(LPC_GPDMA->CH[channel]).LLI = 	(0<<0) //select AHB Master 0 to select the next lli
			| ( ((uint32_t) &(first_data_lli)) & ~0x2); //copy the [31:2] bits of the address of the next lli

	//6) Escribir la informacion de control acerca de la transferencia
	(LPC_GPDMA->CH[channel]).CONTROL =	ctrl_word;

	//7) Escribir la configuracion del canal en el registro de configuracion
	(LPC_GPDMA->CH[channel]).CONFIG = 1					//enables channel of DMA
									| (0<<1) 		//don't care, i gonna use the memory as the source of the transfer
									| (0x0F<<6) 	//select DAC as dest peripheral
									| (1<<11) 		//memory to peripheral (DMA control)
									| (0<<14) 		//don't care about interrupt error mask
									| (0<<15) 		//don't care about terminal count interrupt mask
									| (0<<16)		//when this bit is 1, enables locked transfers
									| (0<<18); 		//Halt, enable DMA requests

	//8) Configurar el DAC para que envie la request signal al DMA controller
	LPC_DAC->CTRL = (1<<0)	//DMA request, this bit its cleared after every write to the DAC->CR register
			|	(0<<1)		//disabled double buffering
			|	(1<<2)	//DMA time-out counter enabled
			|	(1<<3);	//combined DAC and DMA enable

	/*
	 * ticks => cada tick del contador del DAC el cual genera la request signal al DMA al llegar a 0
	 * Freq de operacion del DAC = 204 MHz
	 * Freq de la senal senoidal de menor freq = 1kHz
	 * La freq buscada es entonces: (ticks / 204MHz) * CANTIDAD_MUESTRAS
	 *
	 * */
	uint32_t ticks = (uint32_t) (GPDMA_CLOCK / (MINOR_FREQ * CANTIDAD_MUESTRAS));
	LPC_DAC->CNTVAL = ticks & 0xFFFF; // el and es para asegurarse de que no pase los 16 bits

	while(1){

   }

}

//no importa cuanto tarde, se hace poco
void Escribir_Salida (void){
	float aux;
	for(int i=0;i<CANTIDAD_MUESTRAS;i++){
		aux=(flags[0]*sin(1*2*pi*i/CANTIDAD_MUESTRAS)+flags[1]*sin(2*2*pi*i/CANTIDAD_MUESTRAS)+flags[2]*sin(4*2*pi*i/CANTIDAD_MUESTRAS)+flags[3]*sin(8*2*pi*i/CANTIDAD_MUESTRAS)); //genero senoidal
		aux=(aux/(flags[0]+flags[1]+flags[2]+flags[3])); //normalizo en funcion de la cantidad de senoidales
		lista_seno[i]=(int)((aux+1)*(AMPLITUD/2)); //amplitud y offset

		lista_salida[i]= DAC_VALUE(lista_seno[i]) | DAC_BIAS_EN ; //Adapto el valor para que lo muestre el DAC (shifteo 6 el valor y activo el bit de bias)
	}

}

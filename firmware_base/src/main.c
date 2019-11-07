
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/main.h"

int main( void )
{
	InitializateAllLeds();

	/* Escribo la lista en 0 */
	WriteOutputValues();

	DAC_init();

	ConfigLeds();

	ConfigAllButtons();

	ConfigDMA();

	ConfigDAC();

	DAC_configToSample( MINORFREQ, SAMPLES );

	while( 1 )
	{
		switch( programState )
		{
		case NEWBUTTON:
			if( InitialPress == true )
			{
				InitialPress == false;
				NVIC_EnaIRQ( DMA_IRQn );
			}
			WriteOutputValues();
			listsToWrite = LISTSQUANTITY;
			programState = NOTHING;
			break;

		case WRITETOLLI:
			if( listsToWrite > 0 )
			{
				updateLinkedList();
				listsToWrite--;
			}
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
 * Los valores son guardados al vecotr outputValues. */
void WriteOutputValues( void )
{
	float aux;
	for( int i=0; i<SAMPLES; i++ )
	{
		aux =	buttonFlags[0]*sin(1*2*pi*i/SAMPLES)+
				buttonFlags[1]*sin(2*2*pi*i/SAMPLES)+
				buttonFlags[2]*sin(4*2*pi*i/SAMPLES)+
				buttonFlags[3]*sin(8*2*pi*i/SAMPLES);

		// Normalizo en funcion de la cantidad de teclas presionadas
		aux = (aux/(buttonFlags[0]+buttonFlags[1]+buttonFlags[2]+buttonFlags[3]));

		sinList[i] = (unsigned int) ((aux+1)*(AMPLITUD/2));

		//Adapto el valor para que lo muestre el DAC (shifteo 6 el valor y activo el bit de bias)
		outputValues[i] = DAC_VALUE(sinList[i]) | DAC_BIAS_EN ;
	}
}

/* @brief Funcion que se ejecuta cuando se termina una tranferencia del DAC y
 * ademas se actualizo la lista de valores porque se acabo de presionar una tecla.
 * Cuando se termina la transferencia de un buffer, hay que escribir sobre ese
 * mismo buffer los valores de la nueva salida mientras se mandan los datos del
 * otro buffer. */
void updateLinkedList( void )
{
	// Se escribe sobre el buffer que termino recientemente
	for( int i = 0; i<SAMPLES; i++ )
		lliValues[whoBufferGoes][i] = outputValues[i];

	if( whoBufferGoes == FIRSTBUFFER )
		whoBufferGoes = SECONDBUFFER;
	else
		whoBufferGoes = FIRSTBUFFER;
}

/* @brief Configuro las 4 teclas.*/
void ConfigAllButtons( void )
{
	/* Tecla 1 */
	configGpio( TEC1, &tec1, INPUT_GPIO );
	configTecInterrupts( &tec1, 0, DESCENDENT );
	/* Tecla 2 */
	configGpio(TEC2, &tec2, INPUT_GPIO);
	configTecInterrupts( &tec2, 1, DESCENDENT );
	/* Tecla 3 */
	configGpio( TEC3, &tec3, INPUT_GPIO );
	configTecInterrupts( &tec3, 2, DESCENDENT );
	/* Tecla 4 */
	configGpio( TEC4, &tec4, INPUT_GPIO );
	configTecInterrupts( &tec4, 3, DESCENDENT );
}

/* @brief Configuro los leds que se van a usar. */
void ConfigLeds( void )
{
	configLed( LED0_R,	&led0_r );
	configLed( LED1,	&led1 );
	configLed( LED2,	&led2 );
	configLed( LED3,	&led3 );
}

/* @brief Configuro el DMA para usar una lista enlazada con dos
 * nodos como doble buffer. */
void ConfigDMA( void )
{
	/* Config DMA mux in the CREG */
	CREG_configDMAmux( GPDMA_CONN_DAC );

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

	/*	Creates the lli for the transference. */
	GPDMA_CreateLLI(	&firstDataLLI,
						(uint32_t) &lliValues[0],
						(uint32_t) &(LPC_DAC->CR),
						(uint32_t) &secondDataLLI,
						ctrl_word );

	/*	Create the second lli for the transference. */
	GPDMA_CreateLLI(	&secondDataLLI,
						(uint32_t) &lliValues[1],
						(uint32_t) &(LPC_DAC->CR),
						(uint32_t) &firstDataLLI,
						ctrl_word );

	/* Creates the config word for the channel. */
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
							(uint32_t) &firstDataLLI,
							ctrl_word,
							cfg_wrd );
}

/* @brief Configurar el DAC para que envie la request signal al DMA controller. */
void ConfigDAC( void )
{
	LPC_DAC->CTRL = 	(1<<0)		//DMA request, this bit its cleared after every write to the DAC->CR register
					|	(1<<1)		//enable double buffering
					|	(1<<2)		//DMA time-out counter enabled
					|	(1<<3);		//combined DAC and DMA enable
}


/*===================[interrupt handlers]====================================*/

void TIMER0_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER0, MATCH0 );
	Timer_disableMatchInterrupt( TIMER0, MATCH0 );

	programState = NEWBUTTON;
	buttonFlags[ 0 ] = !buttonFlags[ 0 ];
	toggleGpio( &led0_r );

	NVIC_EnaIRQ( PIN_INT0_IRQn ); // Enable GPIO interrupt

}

void TIMER1_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER1, MATCH0 );
	Timer_disableMatchInterrupt( TIMER1, MATCH0 );

	programState = NEWBUTTON;
	buttonFlags[ 1 ] = !buttonFlags[1];
	toggleGpio( &led1 );

	NVIC_EnaIRQ( PIN_INT1_IRQn );

}

void TIMER2_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER2, MATCH0 );
	Timer_disableMatchInterrupt( TIMER2, MATCH0 );

	programState = NEWBUTTON;
	buttonFlags[ 2 ] = !buttonFlags[2];
	toggleGpio( &led2 );

	NVIC_EnaIRQ( PIN_INT2_IRQn );

}

void TIMER3_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER3, MATCH0 );
	Timer_disableMatchInterrupt( TIMER3, MATCH0 );

	programState = NEWBUTTON;
	buttonFlags[ 3 ] = !buttonFlags[3];
	toggleGpio( &led3 );

	NVIC_EnaIRQ( PIN_INT3_IRQn );

}

void GPIO0_IRQHandler( void )
{
	clearGPIOInterruptFlag( 0 );
	// Cada vez que se presiona una tecla, se deshabilita la interrupcion
	// del GPIO correspondiente hasta que pase un cierto tiempo.
	// Esto previene los rebotes de las teclas.
	NVIC_disableIRQ( PIN_INT0_IRQn );
	Delay_initNonBlockingDelay( DEBOUNCETIME, TIMER0, MATCH0 );
}

void GPIO1_IRQHandler( void )
{
	clearGPIOInterruptFlag( 1 );
	NVIC_disableIRQ( PIN_INT1_IRQn );
	Delay_initNonBlockingDelay( DEBOUNCETIME, TIMER1, MATCH0 );
}

void GPIO2_IRQHandler( void )
{
	clearGPIOInterruptFlag( 2 );
	NVIC_disableIRQ( PIN_INT2_IRQn );
	Delay_initNonBlockingDelay( DEBOUNCETIME, TIMER2, MATCH0 );
}

void GPIO3_IRQHandler( void )
{
	clearGPIOInterruptFlag( 3 );
	NVIC_disableIRQ( PIN_INT3_IRQn );
	Delay_initNonBlockingDelay( DEBOUNCETIME, TIMER3, MATCH0 );
 }

void DMA_IRQHandler( void )
{
	GPDMA_clearTerminalCountInterrupt( 0 );
	programState = WRITETOLLI;
}




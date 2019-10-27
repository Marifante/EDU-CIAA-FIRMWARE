
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

	/* Configurar el DAC para que envie la request signal al DMA controller. */
	LPC_DAC->CTRL = 	(1<<0)		//DMA request, this bit its cleared after every write to the DAC->CR register
					|	(1<<1)		//enable double buffering
					|	(1<<2)		//DMA time-out counter enabled
					|	(1<<3);		//combined DAC and DMA enable

	//GPDMA_deInit();

	DAC_configToSample( MINORFREQ, SAMPLES );

	// Enabling DMA interrupt in the NVIC
	NVIC_EnaIRQ( DMA_IRQn );

	while( 1 )
	{
		switch( programState )
		{
		case NEWBUTTON:
//			if( InitialPress == true )
//			{
//				InitialPress = false;
//				GPDMA_init();
//			}
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
 * Los valores son guardados al vecotr outputValues. */
void WriteOutputValues( void )
{
	float aux;
	for (int i=0; i<SAMPLES; i++)
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

/* @brief Funcion que se ejecuta cuando se termina una tranferencia del DAC.
 * Cuando se termina la transferencia de un buffer, hay que escribir sobre ese
 * mismo buffer los valores de la nueva salida mientras se mandan los datos del
 * otro buffer.
 * NOTA: el programa empieza con el primer buffer, por lo cual, en el primer disparo
 * de la interrupcion del DMA se copian los valores de la lista de salida al
 * primer buffer. */
void DMATransferEnds( void )
{
	// Se escribe sobre el buffer que termino recientemente
	for( int i = 0; i<SAMPLES; i++ )
		lliValues[whoBufferGoes][i] = outputValues[i];

	ToggleBuffer();
}

/* @brief Funcion para marcar cuando termina de transferirse buffer. */
void ToggleBuffer( void )
{
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

/* @brief configuro los leds que se van a usar. */
void ConfigLeds( void )
{
	configLed( LED0_R,	&led0_r );
	configLed( LED1,	&led1 );
	configLed( LED2,	&led2 );
	configLed( LED3,	&led3 );
}

/* @brief Antirebote no bloqueante para cada una de las teclas. */
bool nonBlockingDebounce( 	gpioPin_t *buttonStruct,
							uint8_t chosenTimer,
							uint8_t matchNumber 	)
{
	bool isPressed = false;
	ButtonState_t state = buttonState[ buttonStruct->boardGpioPin - TEC1 ];

	switch( state )
	{
	case UNDEFINED:
		/* do nothing, wait for timer interrupt to check for button state. */
		break;
	case NOTPRESSED:
		Delay_initNonBlockingDelay( DEBOUNCETIME, chosenTimer, matchNumber );
		buttonState[ buttonStruct->boardGpioPin - TEC1 ] = UNDEFINED;
		isPressed = false;
		break;
	case PRESSED:
		isPressed = true;
		break;
	}

	return isPressed;
}

/*===================[interrupt handlers]====================================*/

void TIMER0_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER0, MATCH0 );

	if( checkButtonState( TEC1 ) == HIGH )
		buttonState[ TEC1 - TEC1 ] = PRESSED;
	else
		buttonState[ TEC1 - TEC1 ] = NOTPRESSED;

	Timer_deInit( TIMER0 );
}

void TIMER1_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER1, MATCH0 );

	if( checkButtonState( TEC2 ) == HIGH )
		buttonState[ TEC2 - TEC1 ] = PRESSED;
	else
		buttonState[ TEC2 - TEC1 ] = NOTPRESSED;

	Timer_deInit( TIMER1 );
}

void TIMER2_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER2, MATCH0 );

	if( checkButtonState( TEC3 ) == HIGH )
		buttonState[ TEC3 - TEC1 ] = PRESSED;
	else
		buttonState[ TEC3 - TEC1 ] = NOTPRESSED;

	Timer_deInit( TIMER2 );
}

void TIMER3_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER3, MATCH0 );

	if( checkButtonState( TEC4 ) == HIGH )
		buttonState[ TEC4 - TEC1 ] = PRESSED;
	else
		buttonState[ TEC4 - TEC1 ] = NOTPRESSED;

	Timer_deInit( TIMER3 );
}

void GPIO0_IRQHandler( void )
{
	clearGPIOInterruptFlag( 0 );
	bool buttIsPressed = nonBlockingDebounce( &tec1, TIMER0, MATCH0 );

	if( buttIsPressed == true )
	{
		buttonFlags[0] = !buttonFlags[0];
		programState = NEWBUTTON;
		toggleGpio(&led0_r);
	}
}

void GPIO1_IRQHandler( void )
{
	clearGPIOInterruptFlag( 1 );
	bool buttIsPressed = nonBlockingDebounce( &tec2, TIMER1, MATCH0 );

	if( buttIsPressed == true )
	{
		buttonFlags[1] = !buttonFlags[1];
		programState = NEWBUTTON;
		toggleGpio(&led1);
	}
}

void GPIO2_IRQHandler( void )
{
	clearGPIOInterruptFlag( 2 );
	bool buttIsPressed = nonBlockingDebounce( &tec3, TIMER2, MATCH0 );

	if( buttIsPressed == true )
	{
		buttonFlags[2] = !buttonFlags[2];
		programState = NEWBUTTON;
		toggleGpio(&led2);
	}
}

void GPIO3_IRQHandler( void )
{
	clearGPIOInterruptFlag( 3 );
	bool buttIsPressed = nonBlockingDebounce( &tec3, TIMER2, MATCH0 );

	if( buttIsPressed == true )
	{
		buttonFlags[3] = !buttonFlags[3];
		programState = NEWBUTTON;
		toggleGpio(&led3);
	}
 }

void DMA_IRQHandler( void )
{
	LPC_GPDMA->INTTCCLEAR |= 0x1; //clear terminal count interrupt
	programState = DMAEND;
}




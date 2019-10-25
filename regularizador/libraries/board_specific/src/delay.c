/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: delay
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/delay.h"

/*==================[macros and definitions]=================================*/

#define FREQ1MHZ 1000000

#define TIMER_DONT_EXIST 999

/*==================[internal functions declaration]=========================*/

/* @brief get the correspondient NVIC_IRQn. */
IRQn_Type Delay_getIRQn( uint8_t chosenTimer );

/* @brief convert time of the delay & timer frequency to match value. */
uint32_t Delay_timeToMatchValue( uint32_t us, uint32_t timerFreqMHz );

/*==================[internal functions definition]==========================*/

/* @brief get the correspondient NVIC_IRQn. */
IRQn_Type Delay_getIRQn( uint8_t chosenTimer )
{
	switch( chosenTimer )
	{
	case TIMER0:
		return TIMER0_IRQn;
		break;
	case TIMER1:
		return TIMER1_IRQn;
		break;
	case TIMER2:
		return TIMER2_IRQn;
		break;
	case TIMER3:
		return TIMER3_IRQn;
		break;
	}
}

/* @brief convert time of the delay & timer frequency to match value. */
uint32_t Delay_timeToMatchValue( uint32_t us, uint32_t timerFreq )
{
	return ( (us * timerFreq)/1000000 );
}

/*==================[external functions definition]==========================*/

/* @brief blocking delay function. */
void Delay_us( uint32_t us, uint8_t chosenTimer )
{

	uint32_t* pcount_TC = 0;

	pcount_TC = Timer_init( chosenTimer, FREQ1MHZ );

	// Como el registro TC esta seteado para avanzar 1 vez cada 1 microsegundo
	// cuando el TC llegue a X valor, habrán pasado X microsegundos
	while( (*pcount_TC)<us );

	Timer_deInit( chosenTimer );
}


/* @brief non-blocking delay function
 * When use this function, must to config the corresponding interrupt handler
 * of the desired timer to used. */
void Delay_initNonBlockingDelay( uint32_t us, uint8_t chosenTimer, uint8_t matchNumber )
{
	Timer_deInit( chosenTimer );

	uint32_t matchValue = Delay_timeToMatchValue( us, FREQ1MHZ );

	Timer_configMatchInterrupt( chosenTimer, matchNumber, matchValue );

	Timer_init( chosenTimer, FREQ1MHZ );

	NVIC_EnaIRQ( Delay_getIRQn( chosenTimer ) );
}

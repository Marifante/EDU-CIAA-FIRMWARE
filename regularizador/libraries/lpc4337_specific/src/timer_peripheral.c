/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: timer_peripheral
 *
 * NOTE: the interrupt handlers for timers are
 *
 *	void TIMER0_IRQHandler( void )
 *	void TIMER1_IRQHandler( void )
 *	void TIMER2_IRQHandler( void )
 *	void TIMER3_IRQHandler( void )
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/timer_peripheral.h"


/*==================[internal functions declaration]=========================*/

/* @brief enables timer. */
void Timer_enableTimer( LPC_TIMER_T* pTimerStruct );

/* @brief Resets the TC and PC registers on the next clock positive edge. */
void Timer_resetOnNextEdge( LPC_TIMER_T* pTimerStruct );

/* @brief Don't reset the TC and PC registers on the next clock positive edge. */
void Timer_dontResetOnNextEdge( LPC_TIMER_T* pTimerStruct );

/* @brief checks what timer is available and return one of them. */
LPC_TIMER_T* Timer_getAvailableTimer( void );

/* @brief returns a pointer to the chosen timer struct. */
LPC_TIMER_T* Timer_getPtrStruct( uint8_t chosenTimer );

/* @brief chose timer mode for the selected timer.
 * Note: Exists 2 modes for each timer: Counter mode and Timer mode. */
void Timer_setTimerMode ( LPC_TIMER_T* pTimerStruct );

/* @brief set match value. This value is continuosly compared with
 * TC register value and can trigger some events if they are configured. */
void Timer_setMatchValue( LPC_TIMER_T* timerStruct, uint8_t matchNumber, uint32_t matchValue );

/* @brief checks if a timer is counting or not. */
bool Timer_isCounting( LPC_TIMER_T* timerStruct );

/* @brief set a certain frequency on a timer.
 * The frequency of the timer gonna be the frequency of the peripheral clock
 * divided the value of the PR register minus one.
 * The maths are: PPCLK * (PR-1) = P
 * Where: PCLK = 1/PCLK_MAX_FREQ , P = 1/frequency, PR = value of PR register */
void Timer_setFrequency( LPC_TIMER_T* timerStruct, uint32_t frequency );

/* @brief enable interrupt for match. */
void Timer_enableMatchInterrupt( LPC_TIMER_T* timerStruct, uint8_t matchNumber );

/* @brief config the timer to reset for match. */
void Timer_setResetOnMatch( LPC_TIMER_T* timerStruct, uint8_t matchNumber );

/*==================[internal functions definition]==========================*/

/* @brief Resets the TC and PC registers on the next clock positive edge. */
void Timer_resetOnNextEdge( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->TCR |= 0x02;
}

/* @brief Don't reset the TC and PC registers on the next clock positive edge. */
void Timer_dontResetOnNextEdge( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->TCR &= ~(0x02);
}

/* @brief enables timer. */
void Timer_enableTimer( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->TCR |= 0x01;
}

/* @brief checks what timer is available and return one of them. */
LPC_TIMER_T* Timer_getAvailableTimer( void )
{
	LPC_TIMER_T* pTimers[4] = { LPC_TIMER0, LPC_TIMER1, LPC_TIMER2, LPC_TIMER3 };

	for( int i=0; i<4; i++ )
		if ( Timer_isCounting( pTimers[i] ) == false ) return pTimers[i];

	return NULL;
}

/* @brief returns a pointer to the chosen timer struct. */
LPC_TIMER_T* Timer_getPtrStruct( uint8_t chosenTimer )
{
	switch( chosenTimer )
	{
	case(TIMER0):
		return LPC_TIMER0;
		break;
	case(TIMER1):
		return LPC_TIMER1;
		break;
	case(TIMER2):
		return LPC_TIMER2;
		break;
	case(TIMER3):
		return LPC_TIMER3;
		break;
	case(ANYTIMER):
		return Timer_getAvailableTimer();
		break;
	default:
		return NULL;
	}
}

/* @brief chose timer mode for the selected timer.
 * Note: Exists 2 modes for each timer: Counter mode and Timer mode. */
void Timer_setTimerMode ( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->CTCR &= ~(0x1);
}


/* @brief set match value. This value is continuosly compared with
 * TC register value and can trigger some events if they are configured. */
void Timer_setMatchValue( LPC_TIMER_T* timerStruct, uint8_t matchNumber, uint32_t matchValue )
{
	timerStruct->MR[matchNumber] = matchValue;
}

/* @brief checks if a timer is counting or not. */
bool Timer_isCounting( LPC_TIMER_T* timerStruct )
{
	return ( timerStruct->TCR & 0x1 );
}

/* @brief set a certain frequency on a timer.
 * The frequency of the timer gonna be the frequency of the peripheral clock
 * divided the value of the PR register minus one.
 * The maths are: PPCLK * (PR-1) = P
 * Where: PCLK = 1/PCLK_MAX_FREQ , P = 1/frequency, PR = value of PR register */
void Timer_setFrequency( LPC_TIMER_T* timerStruct, uint32_t frequency )
{
	timerStruct->PR = ( (uint32_t) PCLK_MAX_FREQ/frequency + 1 );
}

/* @brief enable interrupt for match. */
void Timer_enableMatchInterrupt( LPC_TIMER_T* timerStruct, uint8_t matchNumber )
{
	timerStruct->MCR = (0x1 << (matchNumber*3) );
}

/* @brief config the timer to reset for match. */
void Timer_setResetOnMatch( LPC_TIMER_T* timerStruct, uint8_t matchNumber )
{
	timerStruct->MCR = (0x2 << (matchNumber*3));
}

/*==================[external functions definition]==========================*/

/* @brief	function to init timer0/1/2/3
 * @return	pointer to register TC, this registers have the actual count of the timer */
uint32_t* Timer_init( uint8_t chosenTimer, uint32_t timerFrequency )
{
	LPC_TIMER_T* pTimerStruct = Timer_getPtrStruct( chosenTimer );

	Timer_setTimerMode( pTimerStruct );

	Timer_setFrequency( pTimerStruct, timerFrequency );

	Timer_resetOnNextEdge( pTimerStruct );

	Timer_enableTimer( pTimerStruct );

	Timer_dontResetOnNextEdge( pTimerStruct );

	return (uint32_t*) &( pTimerStruct->TC );
}

/* @brief stop timer. */
void Timer_deInit( uint8_t chosenTimer )
{
	LPC_TIMER_T* timerStruct = Timer_getPtrStruct( chosenTimer );
	timerStruct->TCR &= ~(0x1);
}

/* @brief config timer match interrupts. */
void Timer_configMatchInterrupt( uint8_t chosenTimer, uint8_t matchNumber, uint32_t matchValue )
{
	LPC_TIMER_T* timerStruct = Timer_getPtrStruct( chosenTimer );
	Timer_enableMatchInterrupt( timerStruct, matchNumber );
	Timer_setResetOnMatch( timerStruct, matchNumber );
	Timer_setMatchValue( timerStruct, matchNumber, matchValue );
}

/* @brief clear match interrupt flag of a timer. */
void Timer_clearMatchIntFlag( LPC_TIMER_T* timerStruct, uint8_t matchNumber )
{
	timerStruct->IR = (0x1 << matchNumber);
}



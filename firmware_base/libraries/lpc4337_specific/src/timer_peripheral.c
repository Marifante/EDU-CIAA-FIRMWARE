/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: timer_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/timer_peripheral.h"


/*==================[internal functions declaration]=========================*/
void Timer_disableTimer( LPC_TIMER_T* pTimerStruct );
void Timer_enableTimer( LPC_TIMER_T* pTimerStruct );
/* @brief Resets the TC and PC registers on the next clock positive edge. */
void Timer_resetOnNextEdge( LPC_TIMER_T* pTimerStruct );
void Timer_dontResetOnNextEdge( LPC_TIMER_T* pTimerStruct );

/* @brief checks what timer is available and return one of them. */
LPC_TIMER_T* Timer_getAvailableTimer( void );

/* @brief returns a pointer to the chosen timer struct. */
LPC_TIMER_T* Timer_getPtrStruct( uint8_t chosenTimer );

/*==================[internal functions definition]==========================*/
/* @brief Resets the TC and PC registers on the next clock positive edge. */
void Timer_resetOnNextEdge( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->TCR |= 0x02;
}

void Timer_dontResetOnNextEdge( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->TCR &= ~(0x02);
}

void Timer_disableTimer( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->TCR &= ~(0x1);
}

void Timer_enableTimer( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->TCR |= 0x01;
}

/* @brief chose timer mode for the selected timer.
 * Note: Exists 2 modes for each timer: Counter mode and Timer mode. */
void Timer_setTimerMode ( LPC_TIMER_T* pTimerStruct )
{
	pTimerStruct->CTCR &= ~(0x1);
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

/*==================[external functions definition]==========================*/

/* @brief checks if a timer is counting or not. */
bool Timer_isCounting( LPC_TIMER_T* timerStruct )
{
	return ( timerStruct->TCR & 0x1 );
}


/* @brief set a certain frequency on a timer.
 * The frequency of the timer gonna be the frequency of the peripheral clock
 * divided the value of the PR register minus one.
 * The maths are: PPCLK * (PR-1) = P
 * Where: PCLK = 1/PCLK_MAX_FREQ , P = 1/frequency, PR = value of PR register
 * */
void Timer_setFrequency( LPC_TIMER_T* timerStruct, uint32_t frequency )
{
	timerStruct->PR = ( (uint32_t) PCLK_MAX_FREQ/frequency + 1 );
}


///* @brief config timer match interrupts */
//void Timer_configMatchInterrupt( LPC_TIMER_T* timerStruct, uint32_t matchCountValue )
//{
//
//}

/*
 * @Brief	Function to init timer0/1/2/3
 * @timer_to_choose timer to init, if no timer is chosen, the program choses one available
 * @return	pointer to register TC, this registers have the actual count of the timer
*/
uint32_t*  initTimer( uint8_t chosenTimer, uint32_t timerFrequency )
{
	LPC_TIMER_T* pTimerStruct = Timer_getPtrStruct( chosenTimer );

	Timer_setTimerMode( pTimerStruct );

	Timer_setFrequency( pTimerStruct, timerFrequency );

	Timer_resetOnNextEdge( pTimerStruct );

	Timer_enableTimer( pTimerStruct );

	Timer_dontResetOnNextEdge( pTimerStruct );

	return (uint32_t*) &( pTimerStruct->TC );
}


/*
 * @Brief	Function to stop timer0
 * @timer_to_choose timer to stop
 * @return	nothing
*/
void stopTimer( uint8_t chosenTimer )
{
	LPC_TIMER_T* pTimerStruct = Timer_getPtrStruct( chosenTimer );
	Timer_disableTimer( pTimerStruct );
}

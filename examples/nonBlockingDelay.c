
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/main.h"

/*==================[macros and definitions]=================================*/
#define DELAYTIMEUS			1000000

gpioPin_t led0_b, led1, led2, led3;

int main( void )
{

	InitializateAllLeds();

	configLed( LED0_B, &led0_b );
	configLed( LED1, &led1 );
	configLed( LED2, &led2 );
	configLed( LED3, &led3 );

	Delay_initNonBlockingDelay( DELAYTIMEUS, TIMER0, MATCH0 );
	Delay_initNonBlockingDelay( (uint32_t) (2*DELAYTIMEUS), TIMER1, MATCH0 );
	Delay_initNonBlockingDelay( (uint32_t) (3*DELAYTIMEUS), TIMER2, MATCH0 );
	Delay_initNonBlockingDelay( (uint32_t) (4*DELAYTIMEUS), TIMER3, MATCH0 );

	while(1)
	{

	}

}

/*===================[interrupt handlers]====================================*/

void TIMER0_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER0, MATCH0 );
	toggleGpio( &led0_b );
}

void TIMER1_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER1, MATCH0 );
	toggleGpio( &led1 );
}

void TIMER2_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER2, MATCH0 );
	toggleGpio( &led2 );
}

void TIMER3_IRQHandler( void )
{
	Timer_clearMatchIntFlag( TIMER3, MATCH0 );
	toggleGpio( &led3 );
}


/*****************************************************************************
 *
 * Single PWM example of AN11538 SCTimer PWM Cookbook
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../inc/main.h"
/*==================[macros & constants]=====================================*/
#define PWM_FREQUENCY	1000

/*==================[main program]===========================================*/
int main( void )
{
	InitializateAllLeds();

	gpioPin_t led1;
	configLed( LED1, &led1 );


	/*	Match 1 is used to define the duty cycle of the signal. When match event 1
		 *	occurs it will clear SCT_OUT0.	 */

	SCU_SetPinFunc(4, 2, 1);
	SCTPWM_singlePWM( 2, PWM_FREQUENCY );

	while( 1 )
	{
		for(int i = 0; i<10 ; i++)
		{
			LPC_SCT->MATCHREL[1].L = i; // match 1 used for duty cycle (in 10 steps)
			Delay_us(1000000, TIMER0);
		}
	}
}


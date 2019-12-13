
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

	SCU_SetPinFunc( 4, 3, 1 );
//	SCU->SFSP[4][3] |= (1<<4);
//	SCU->SFSP[4][3] &= ~(1<<3);
//	SCU->SFSP[4][3] &= ~(1<<6);

	SCTPWM_singlePWM( 3, PWM_FREQUENCY );
//	SCU_SetPinFunc( 2, 10, 1 );
//	SCTPWM_singlePWM( 2, PWM_FREQUENCY );
	SCTPWM_singlePWMSetDutyCycle( 95 );
	while( 1 )
	{
//		for(int i = 0; i<100 ; i+10 )
//		{
//			SCTPWM_singlePWMSetDutyCycle(i);
//			Delay_us(10000000, TIMER0);
//		}
	}
}


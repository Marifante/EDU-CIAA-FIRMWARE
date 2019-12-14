
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

	gpioPin_t RightMotorForward, RightMotorBackward;
	configGpio( GPIO0, &RightMotorForward, OUTPUT_GPIO );
	configGpio( GPIO2, &RightMotorBackward, OUTPUT_GPIO );

	writeGpio( &RightMotorForward, HIGH );
	writeGpio( &RightMotorBackward, LOW );


	SCU_SetPinFunc( 4, 3, 1 );
	SCTPWM_singlePWM( 3, PWM_FREQUENCY );

	bool change = false;
	while( 1 )
	{
		change = !change;
		for(int i = 30; i<99; i++)
		{
			SCTPWM_singlePWMSetDutyCycle( i );
			Delay_us( 1000000/10, TIMER0 );
		}
//		writeGpio( &RightMotorForward, HIGH );
//		writeGpio( &RightMotorBackward, LOW );
//		Delay_us( 1000000, TIMER0 );
		writeGpio( &RightMotorForward, change );
		writeGpio( &RightMotorBackward, !change );

	}
}


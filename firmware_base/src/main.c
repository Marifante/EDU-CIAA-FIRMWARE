/*****************************************************************************
 *

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

	MovementManager_configMotors();
	MovementManager_moveLeftMotor( MM_FORWARD, 60 );
	MovementManager_moveRightMotor( MM_FORWARD, 60 );

	while( 1 )
	{
		MovementManager_moveLeftMotor( MM_FORWARD, 70 );
		MovementManager_moveRightMotor( MM_FORWARD, 70 );
		Delay_us( 1000000, TIMER0 );

		for(int i = 50; i<99; i++)
		{
			MovementManager_moveLeftMotor( MM_FORWARD, i );
			MovementManager_moveRightMotor( MM_FORWARD, i );
			Delay_us( 1000000/10, TIMER0 );
		}

		MovementManager_moveLeftMotor( MM_BACKWARD, 70 );
		MovementManager_moveRightMotor( MM_BACKWARD, 70 );
		Delay_us( 1000000, TIMER0 );

		for(int i = 50; i<99; i++)
		{
			MovementManager_moveLeftMotor( MM_BACKWARD, i );
			MovementManager_moveRightMotor( MM_BACKWARD, i );
			Delay_us( 1000000/10, TIMER0 );
		}


	}
}


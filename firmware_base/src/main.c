/*****************************************************************************
 *

 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../inc/main.h"
/*==================[macros & constants]=====================================*/
#define PWM_FREQUENCY	1000

typedef enum
{
	NO_ACCION =	0,
	TEST_MODE = 4
} CarState_t;

CarState_t ProgramState = 0;

/*==================[main program]===========================================*/
int main( void )
{
	GPIOBoard_initializateAllLeds();
	GPIOBoard_configAllTecs();

	MovementManager_configMotors();
	MovementManager_moveLeftMotor( MM_FORWARD, 60 );
	MovementManager_moveRightMotor( MM_FORWARD, 60 );

	while( 1 )
	{
		switch( ProgramState )
		{
		case NO_ACCION:
			MovementManager_stopMotors();
			GPIOBoard_setAllLEDS( LOW );
			break;
		case TEST_MODE:
			GPIOBoard_setLED2( HIGH );
			MovementManager_moveLeftMotor( MM_FORWARD, 60 );
			MovementManager_moveRightMotor( MM_FORWARD, 60 );
			break;
		default:
			ProgramState = NO_ACCION;
			GPIOBoard_setAllLEDS( LOW );
			break;
		}
	}
}

/*==================[tec interrupt handlers]===================================*/

void GPIO0_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT0 );
}

void GPIO1_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT1 );
}

void GPIO2_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT2 );
	ProgramState = TEST_MODE;
}

void GPIO3_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT3 );
	ProgramState = NO_ACCION;
}


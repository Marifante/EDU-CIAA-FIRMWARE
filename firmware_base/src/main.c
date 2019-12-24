/*****************************************************************************
 *

 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../libraries/board_specific/inc/edu_ciaa_hl.h"
#include "../libraries/utils.h"
#include "../Projects/PerimetralFollowerCar/inc/PerimetralFollowerCar.h"

/*==================[internal data declaration]==============================*/
typedef enum
{
	NO_ACCION =				0,
	WALL_FOLLOWER_MODE =	1,
	DISTANCE_MODE =			2,
	SUMO_MODE =				3
} CarState_t;

/*==================[internal data definition]===============================*/
CarState_t ProgramState = NO_ACCION;

//p=10
//
//d=0:
//
//prom=(adc1+adc2)/2
//
//entrada=prom-20
//
//salida=entrada*p+(entrada-entradavieja)*d
//
//if(salida>25)
//	salida=25
//
//if(salida<-25)
//	salida=-25
//
//velder=75-salida
//veliz=75+salida

/*==================[main program]===========================================*/
int main( void )
{
	GPIOBoard_initializateAllLeds();
	GPIOBoard_configAllTecs();
	SerialLog_config();
	ADC0_init();
	ADC1_init();
	MovementManager_configMotors();
	MovementManager_stopMotors();
	ProgramState = NO_ACCION;
	while( 1 )
	{
		switch( ProgramState )
		{
		case NO_ACCION:
			MovementManager_stopMotors();
			GPIOBoard_setAllLEDS( LOW );
			break;
		case WALL_FOLLOWER_MODE:
			GPIOBoard_setLEDRGBGreen( HIGH );
			WallFollower();
			break;
		case DISTANCE_MODE:
			GPIOBoard_setLED1( HIGH );
			DistanceProgramPID();
			break;
		case SUMO_MODE:
			GPIOBoard_setLED2( HIGH );
			SumoProgram();
			break;
		default:
			ProgramState = NO_ACCION;
			GPIOBoard_setAllLEDS( LOW );
			break;
		}
	}
}

/*==================[tec interrupt handlers]===================================*/
// Tec1 interrupt handler ----
void GPIO0_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT0 );
	ProgramState = WALL_FOLLOWER_MODE;
}
// Tec2 interrupt handler ----
void GPIO1_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT1 );
	ProgramState = DISTANCE_MODE;
}
// Tec3 interrupt handler ----
void GPIO2_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT2 );
	ProgramState = SUMO_MODE;
}
// Tec4 interrupt handler ----
void GPIO3_IRQHandler( void )
{
	GPIO_clearGPIOInterruptFlag( GPIO_INTERRUPT3 );
	ProgramState = NO_ACCION;
}


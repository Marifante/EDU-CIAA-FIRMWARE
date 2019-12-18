/*
 * SumoProgram.c
 *
 *  Created on: Dec 17, 2019
 *      Author: Julian
 */


/*==================[inclusions]=============================================*/
#include "../../../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../../../libraries/board_specific/inc/edu_ciaa_hl.h"
#include "../inc/SumoProgram.h"
#include "../inc/MovementManager.h"
#include "../inc/ADCManager.h"

/*==================[internal data declaration]===============================*/
typedef enum
{
	START				= 0,
	OBJECT_DETECTED 	= 1,
	NO_OBJECT			= 2
} SumoStates_t;

/*==================[internal data definition]================================*/
SumoStates_t SumoState = START;

/*==================[external functions definition]==========================*/
/* @brief Sumo program function. Car keeps looking for an objective and
 * then attacks. */
void SumoProgram( void )
{
	switch( SumoState )
	{
		case START:
			GPIOBoard_setAllLEDS( HIGH );
			Delay_us(500000,TIMER1);
			GPIOBoard_setAllLEDS( LOW );
			Delay_us(500000,TIMER1);
			GPIOBoard_setAllLEDS( HIGH );
			Delay_us(500000,TIMER1);
			GPIOBoard_setAllLEDS( LOW );
			if( ADCManager_ADC0takeData(2) < 20 )
			{
				SumoState=OBJECT_DETECTED;
			}
			else
			{
				SumoState=NO_OBJECT;
			}
		break;
		case OBJECT_DETECTED:
			MovementManager_moveLeftMotor( MM_FORWARD, 70 );
			MovementManager_moveRightMotor( MM_FORWARD, 70 );
			if( ADCManager_ADC0takeData(2) > 20 )
				SumoState=NO_OBJECT;
		break;
		case NO_OBJECT:
			MovementManager_moveLeftMotor( MM_FORWARD, 70 );
			MovementManager_moveRightMotor( MM_BACKWARD, 70 );

			if( ADCManager_ADC0takeData(2) < 20 )
			{
				MovementManager_stopMotors();
				Delay_us(50000,TIMER1);
				MovementManager_moveLeftMotor( MM_BACKWARD, 70 );
				MovementManager_moveRightMotor( MM_FORWARD, 70 );
				Delay_us(50000,TIMER1);
				SumoState=OBJECT_DETECTED;
			}
		break;
		default:
			SumoState = START;
		break;
	}
}

/*
 * DistanceProgram.c
 *
 *  Created on: Dec 17, 2019
 *      Author: Julian
 */


/*==================[inclusions]=============================================*/
#include "../../../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../../../libraries/board_specific/inc/edu_ciaa_hl.h"
#include "../inc/MovementManager.h"
#include "../inc/ADCManager.h"

/*==================[macros & constants]=====================================*/
#define OLD_VALUE			1
#define NEW_VALUE			0

/*==================[internal data declaration]===============================*/
typedef enum
{
	START =				0,
	MINOR_DISTANCE =		1,
	MAYOR_DISTANCE =		2,
	CORRECT_DISTANCE = 	3,
	NO_OBJECT =			4
} DistanceProgram_t;

/*==================[internal data definition]================================*/
DistanceProgram_t DistanceState = START;
int DistanceProgram_adcValues[2];

/*==================[external functions definition]==========================*/
int p=10;
int d=0;

void DistanceProgramPID( void )
{

	DistanceProgram_adcValues[OLD_VALUE] = DistanceProgram_adcValues[NEW_VALUE] ;
	DistanceProgram_adcValues[NEW_VALUE] = ADCManager_ADC0takeData( 2 );
	DistanceProgram_adcValues[NEW_VALUE] = DistanceProgram_adcValues[NEW_VALUE] -20;

	float output = DistanceProgram_adcValues[NEW_VALUE] * p + ((DistanceProgram_adcValues[NEW_VALUE] - DistanceProgram_adcValues[OLD_VALUE]) * d);

	if( output < -75 )
			output = -75;
		if( output > 75 )
			output = 75;

	if(output>50)
	{
		MovementManager_moveLeftMotor( MM_FORWARD, output);
		MovementManager_moveRightMotor( MM_FORWARD,output);
	}else{
		if(output<-50)
			{
				MovementManager_moveLeftMotor( MM_BACKWARD, -output);
				MovementManager_moveRightMotor( MM_BACKWARD,-output);
			}else{
				MovementManager_stopMotors();
			}
	}



}

/* @brief Car keeps at a certain distance from the objective. */
void DistanceProgramStates( void )
{
	int distance = ADCManager_ADC0takeData(2);
	switch( DistanceState )
	{
		case START:
			GPIOBoard_setAllLEDS( HIGH );
			Delay_us(500000,TIMER1);
			GPIOBoard_setAllLEDS( LOW );
			Delay_us(500000,TIMER1);
			GPIOBoard_setAllLEDS( HIGH );
			Delay_us(500000,TIMER1);
			GPIOBoard_setAllLEDS( LOW );
			if( distance < 15 )
			{
				DistanceState=MINOR_DISTANCE;
			}
			else
			{
				if( distance > 55 )
				{
					DistanceState=NO_OBJECT;
				}
				else
				{
					DistanceState=MAYOR_DISTANCE;
				}
			}
		break;
		case MINOR_DISTANCE:
			GPIOBoard_setAllLEDS( LOW );
			MovementManager_moveLeftMotor( MM_BACKWARD, 70 );
			MovementManager_moveRightMotor( MM_BACKWARD, 70 );
			if( distance > 55 )
			{
				DistanceState=NO_OBJECT;
			}
			else
			if( distance > 15 )
			{
				DistanceState=CORRECT_DISTANCE;
			}
		break;
		case MAYOR_DISTANCE:
			GPIOBoard_setAllLEDS( LOW );
			MovementManager_moveLeftMotor( MM_FORWARD, 70 );
			MovementManager_moveRightMotor( MM_FORWARD, 70 );
			if( distance > 55 )
			{
				DistanceState=NO_OBJECT;
			}else
			if( distance < 15 )
			{
				DistanceState=CORRECT_DISTANCE;
			}

		break;
		case CORRECT_DISTANCE:
			MovementManager_stopMotors();
			if( distance < 12 )
			{
				DistanceState=MINOR_DISTANCE;
			}
			else
			{
				if( distance > 55 )
				{
					DistanceState=NO_OBJECT;
				}
				else
				if( distance > 18 )
				{
					DistanceState=MAYOR_DISTANCE;
				}
			}
		break;
		case NO_OBJECT:
			MovementManager_stopMotors();
			GPIOBoard_setAllLEDS( HIGH );
			if( distance < 15 )
			{
				DistanceState=MINOR_DISTANCE;
			}
			else
			{
				if( distance > 55 )
				{
					DistanceState=NO_OBJECT;
				}
				else
				{
					DistanceState=MAYOR_DISTANCE;
				}
			}
		break;
		default:
			DistanceState = START;
		break;
	}

}

/*
 * WallFollowerProgram.c
 *
 *  Created on: 19 dic. 2019
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

/*==================[internal data definition]===============================*/
float WallFollower_adcValues[2];

/*==================[external function definition]===========================*/
void WallFollower( void )
{
	int p = 10;
	int d = 0;
	WallFollower_adcValues[OLD_VALUE] = WallFollower_adcValues[NEW_VALUE];
	float adc0Val = ADCManager_ADC0takeData( 3 );
	float adc1Val = ADCManager_ADC1takeData( 1 );
	float prom = (adc0Val+adc1Val)/2;
	WallFollower_adcValues[NEW_VALUE] = prom - 20;

	float output = WallFollower_adcValues[NEW_VALUE] * p + ((WallFollower_adcValues[NEW_VALUE] - WallFollower_adcValues[OLD_VALUE]) * d);

	if( output < -10 )
		output = -10;
	if( output > 10 )
		output = 10;
	float frontAdcValue = ADCManager_ADC0takeData( 2 );
	if( frontAdcValue > 15 )
	{
		MovementManager_moveRightMotor( MM_FORWARD, 60-output );
		MovementManager_moveLeftMotor( MM_FORWARD, 60+output );
	}
	else
	{
		MovementManager_stopMotors();
		MovementManager_moveRightMotor( MM_BACKWARD, 60 );
		MovementManager_moveLeftMotor( MM_BACKWARD, 60 );
		Delay_us(100000, TIMER0);
		MovementManager_moveRightMotor( MM_FORWARD, 70 );
		MovementManager_moveLeftMotor( MM_BACKWARD, 70 );
		Delay_us(10000, TIMER0);
	}

}

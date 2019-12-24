/*
 * ADCManager.c
 * Library to manipule ADC readings with EDU-CIAA for PerimetralFollowerCar
 * project. This project uses Sharp 2Y0A21 optical sensors as distance sensors.
 *
 *  Created on: Dec 17, 2019
 *      Author: Julian
 */

/*==================[inclusions]=============================================*/
#include "../inc/ADCManager.h"
#include "../../../libraries/lpc4337_specific/inc/lpc_4337_chip.h"
#include "../../../libraries/board_specific/inc/edu_ciaa_hl.h"

/*==================[macros and constants]===================================*/
#define ADC0_SAMPLES_FOR_MEDIAN		10
#define ADC1_SAMPLES_FOR_MEDIAN		10
char ADCManager_logMsg[64];

/*==================[internal functions definition]==========================*/
/* @brief convert ADC value from sharp 2Y0A21 sensor to distance in cm. */
float ADCManager_2Y0A21ValueToDistance( int adcValue )
{
	return (pow( (3027.4 /(float) adcValue), 1.2134 ));
}

/*==================[external functions definition]==========================*/
/*@brief measure with channel N of ADC0, print value via serial and return
 * distance in cm. */
int ADCManager_ADC0takeData( uint8_t channel )
{
	int analogVal[ADC0_SAMPLES_FOR_MEDIAN];
	float adcMeasureMedian;
	float distance;
	for( int i = 0; i<ADC0_SAMPLES_FOR_MEDIAN; i++)
	{
		analogVal[i] = ADC0_read(channel);
		adcMeasureMedian += (float) analogVal[i];
		Delay_us(1000, TIMER0);
	}
	adcMeasureMedian = adcMeasureMedian / ADC0_SAMPLES_FOR_MEDIAN;
	distance =  ADCManager_2Y0A21ValueToDistance( adcMeasureMedian );
	sprintf(	ADCManager_logMsg,
				"CH %d: analogVal: %f, distance: %f cm\r\n",
				channel, adcMeasureMedian, distance);
	SerialLog_print( ADCManager_logMsg );
	ADC_disableChannel( ADC0, channel );
	return distance;
}

/* @brief measure with channel N of ADC1, print value via serial and return
 * distance in cm. */
int ADCManager_ADC1takeData( uint8_t channel )
{
	int analogVal[ADC1_SAMPLES_FOR_MEDIAN];
	float adcMeasureMedian;
	float distance;
	for( int i = 0; i<ADC1_SAMPLES_FOR_MEDIAN; i++)
	{
		analogVal[i] = ADC1_read(channel);
		adcMeasureMedian += (float) analogVal[i];
		Delay_us(1000, TIMER0);
	}
	adcMeasureMedian = adcMeasureMedian / ADC1_SAMPLES_FOR_MEDIAN;
	distance =  ADCManager_2Y0A21ValueToDistance( adcMeasureMedian );
	sprintf(	ADCManager_logMsg,
				"CH %d: analogVal: %f, distance: %f cm\r\n",
				channel, adcMeasureMedian, distance);
	SerialLog_print( ADCManager_logMsg );
	ADC_disableChannel( ADC1, channel );
	return distance;
}

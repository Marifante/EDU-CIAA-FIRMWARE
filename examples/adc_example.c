
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../inc/main.h"
/*==================[macros & constants]=====================================*/
#define MEDIAN_SIZE 50

/*==================[main program]===========================================*/
int main( void )
{
	InitializateAllLeds();
	gpioPin_t Led0_r;
	configLed(LED0_R, &Led0_r);
	toggleGpio(&Led0_r);

	SerialLog_config();

	uint16_t analogVal[MEDIAN_SIZE];
	ADC0_init();

	SerialLog_print( "Test del ADC0\r\n" );
	char msg[64];
	float adcMeasureMedian;
	uint32_t distance;
	while(1)
	{
		adcMeasureMedian = 0;
		toggleGpio(&Led0_r);
		// take MEDIAN_SIZE samples of ADC channel & calculate the median
		for( int i = 0; i<MEDIAN_SIZE; i++)
		{
			analogVal[i] = ADC0_read(1);
			adcMeasureMedian += (float) analogVal[i];
			Delay_us(10000, TIMER0);
		}
		adcMeasureMedian = adcMeasureMedian / MEDIAN_SIZE;

		distance =  pow( (3027.4 /(float) adcMeasureMedian), 1.2134 );
		Delay_us(1000000/2, TIMER0);

		sprintf(msg, "analogVal: %f, distance: %d cm\r\n", adcMeasureMedian, distance);
		SerialLog_print( msg );
	}
}


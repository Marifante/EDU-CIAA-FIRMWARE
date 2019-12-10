
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../inc/main.h"

/*==================[main program]===========================================*/
int main( void )
{
	InitializateAllLeds();
	gpioPin_t Led0_r;
	configLed(LED0_R, &Led0_r);
	toggleGpio(&Led0_r);

	SerialLog_config();

	uint16_t analogVal;
	ADC0_init();

	SerialLog_print( "Test del ADC0\r\n" );
	char msg[64];
	uint32_t distance;
	while(1)
	{
		toggleGpio(&Led0_r);
		analogVal = ADC0_read(1);
		distance = 12343.85 * pow( (float) analogVal, -1.15 );
		Delay_us(1000000, TIMER0);

		sprintf(msg, "analogVal: %d, distance: %d \r\n", analogVal, distance);
		SerialLog_print( msg );
	}
}


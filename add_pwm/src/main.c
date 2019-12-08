
/*****************************************************************************
 * Trabajo practico regularizador Electronica Digital 2
 * Generador de senales senoidales de 1kHz, 2kHz, 4kHz, 8kHz y sus sumatorias.
 *
 * Autor: Julian Rodriguez / Ezequiel Canay
 * email: jnrodriguezz@hotmail.com /
 *****************************************************************************/


/*==================[inclusions]=============================================*/

#include "../inc/main.h"

int main( void )
{
	InitializateAllLeds();

	gpioPin_t led1;
	configLed( LED1, &led1 );

	SCU_SetPinFunc( 2, 10, 1 );
	uint32_t totalDutyCycle = SCTPWM_configPWM( 1000, 0, 1 , SCT_CTOUT_2 );


	while( 1 )
	{

		for( int i = 0; i < 99; i++ )
		{
			SCTPWM_setDutyCycle( 0, i, totalDutyCycle );
			Delay_us( 2000, TIMER0 );
		}
		for( int i = 99; i > 0; i-- )
		{
			SCTPWM_setDutyCycle( 0, i, totalDutyCycle );
			Delay_us( 2000, TIMER0 );
		}
	}
}



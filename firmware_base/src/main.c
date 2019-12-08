
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

	SerialLog_print( "Test de la UART por USB\r\n" );
	char msg[64];
	int i = 0;

	while(1)
	{
		toggleGpio(&Led0_r);


		Delay_us(1000000, TIMER0);

		sprintf(msg, "count: %d\r\n", i);

		SerialLog_print( "Test de la UART por USB\r\n" );

		i++;
		if( i == 10 )
			i = 0;
	}
}


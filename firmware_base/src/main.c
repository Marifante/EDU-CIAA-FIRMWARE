
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
#define PWM_FREQ			1000
#define CTOUT_2_GROUP		2
#define CTOUT_2_PIN			10
#define CTOUT_2_FUNC		1
#define	MAIN_EVENT			0
#define DUTY_CYCLE_EVENT	1

/*==================[main program]===========================================*/
int main( void )
{
	InitializateAllLeds();

	gpioPin_t led1;
	configLed( LED1, &led1 );

	SCU_SetPinFunc( 2, 10, 1 );
	uint32_t totalDutyCycle = SCTPWM_configPWM( 1000, 0, 1 , CTOUT_2 );


	while( 1 )
	{

		for( int i = 0; i < 99; i++ )
		{
			SCTPWM_setDutyCycle( 0, i, totalDutyCycle );
			Delay_us( 20000, TIMER0 );
		}
		for( int i = 99; i > 0; i-- )
		{
			SCTPWM_setDutyCycle( 0, i, totalDutyCycle );
			Delay_us( 20000, TIMER0 );
		}
	}
}


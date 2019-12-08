/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: sct_pwm
 *
 * Biblioteca auxiliar para generar seniales PWM con el SCT.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/sct_pwm.h"


/*==================[macros and definitions]=================================*/
#ifndef SCT_DEFAULT_CLOCK
	#define SCT_DEFAULT_CLOCK 		204000000
#endif

#define ALL_STATES					0xFFFFFFFF //for setEventState
#define ONLY_MATCH_CONDITION		0x1

/*==================[internal functions definition]==========================*/
uint32_t SCTPWM_frequencyToPrescaler( uint32_t frequency )
{
	return (SCT_DEFAULT_CLOCK/frequency);
}

/*==================[external functions definition]==========================*/

/* @brief config PWM generation with two events.
 * @param mainEvent sets the freq of the pwm signal.
 * @param dutyCycleEvent sets the duty cycle of the signal. */
uint32_t SCTPWM_configPWM( uint32_t frequency, uint8_t mainEvent, uint8_t dutyCycleEvent, SCT_outputPin outputPin )
{
	SCT_setTwoTimersMode();

	uint32_t prescaler = SCTPWM_frequencyToPrescaler( frequency );
	SCT_setLowTimerPrescaler( prescaler );

	uint8_t mainMatch = mainEvent;
	SCT_setLimitLowTimer( mainEvent ); //this event sets the period of the pwm signal

	uint32_t mainMatchValue = frequency/prescaler - 1; // for now, the freq of the signal is setted with the prescaler.
	SCT_setLowTimerMatchReload( mainMatch, mainMatchValue );

	uint8_t dutyCycleMatch = dutyCycleEvent;
	SCT_setLowTimerMatchReload( dutyCycleMatch, 0 ); //the signal starts with a duty cycle of 0

	SCT_setEventState( mainEvent, ALL_STATES );
	SCT_associateMatchWithEvent( mainEvent, mainMatch );
	SCT_setEventCombMode( mainEvent, ONLY_MATCH_CONDITION );

	SCT_setEventState( dutyCycleEvent, ALL_STATES );
	SCT_associateMatchWithEvent( dutyCycleEvent, dutyCycleMatch );
	SCT_setEventCombMode( mainEvent, ONLY_MATCH_CONDITION );

	SCT_setOutputSETReg( outputPin, mainEvent ); //main event gonna put in HIGH the output
	SCT_setOutputSETReg( outputPin, dutyCycleEvent ); //duty cycle event gonna put in LOW the output

	SCT_unhalt( );
	return mainMatchValue; //This is the period of the signal

}

/* @brief sets duty cycle to a pwm.
 * @param dutyCyclePercent value between 0 and 99.*/
void SCTPWM_setDutyCycle( uint8_t dutyCycleMatch, uint8_t dutyCyclePercent, uint32_t mainMatchValue )
{
	uint8_t dutyCycleEvent = dutyCycleMatch;
	uint32_t dutyCycle = (dutyCyclePercent/100) * mainMatchValue;
	SCT_setLowTimerMatchReload( dutyCycleEvent, mainMatchValue );
}

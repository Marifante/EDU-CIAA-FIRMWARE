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
#include "../inc/ccu_peripheral.h"
#include "../inc/cgu_peripheral.h"

/*==================[macros and definitions]=================================*/
#define ALL_STATES					0xFFFFFFFF //for setEventState
#define ONLY_MATCH_CONDITION		0x1

#define SCT_CTRL_STOP_L                 (1 << 1)		// Stop low counter
#define SCT_CTRL_HALT_L                 (1 << 2)		// Halt low counter
#define SCT_CTRL_CLRCTR_L               (1 << 3)		// Clear low or unified counter
#define SCT_CONFIG_AUTOLIMIT_L			(1 << 17)		// Set autolimit, the count resets to 0 when the timer reachs the MATCH value

int SCTPWM_SinglePWMMatch0Reload	= 0;

/*==================[internal functions definition]==========================*/
uint32_t SCTPWM_frequencyToPrescaler( uint32_t baseClkFreq, uint32_t frequency )
{
	return (baseClkFreq/frequency);
}

/*==================[external functions definition]==========================*/
/* @brief config State Configurable Timer (SCT) to do a PWM signal. */
/*	PWM configuration
 *	Match used: Match 0 for PWM period & Match 1 for PWM duty cycle
 *	Event used: Event 0 & Event 1
 *	Output used: SCT_OUT0 for PWM output signal  (P4_2 on LPC4337)
 *		The SCTimer input clock is pre-scaled to 1MHz. It uses Match 0 to
 *	generate a 100kHz timer match, this will auto limit (reset) the counter
 *	and generate event 0.
 *		The event 0 will set SCT_OUT0 to a logic high level. This Match 0 defines
 *	the frequency of the PWM signal. */

void SCTPWM_singlePWM( SCT_outputPin output, int signalFrequency )
{
	CCU_initSCTClock();
	uint32_t inputClkFreq = CGU_getSCTInputClkFreq();
	int prescaler = inputClkFreq/1000000; // The frequency of the counter will be 1MHz
	SCT_setLowTimerPrescaler( prescaler ); // Configura el prescaler, SCTimer/PWM clock = 1 MHz
	SCT_setTimerMode( SCT_TWO_16BIT_TIMERS, true ); // Configura el SCT como dos timer de 16 bits, con auto limit
	SCTPWM_SinglePWMMatch0Reload = 10000000/signalFrequency;
	SCT_setLowTimerMatchReload( SCT_MATCH_0, SCTPWM_SinglePWMMatch0Reload ); // 10 / 1MHz = 0.001 sec = 1 ms = 1kHz
	SCT_setLowTimerMatchReload( SCT_MATCH_1, SCTPWM_SinglePWMMatch0Reload/2 ); // By default, set pwm with 50% duty cycle
	LPC_SCT->EVENT[0].STATE = 0xFFFFFFFF; // event 0 happens in all states
	SCT_associateMatchOnlyWithEvent( SCT_EVENT_0 , SCT_MATCH_0 );
	LPC_SCT->EVENT[1].STATE = 0xFFFFFFFF; // event 1 happens in all states
	SCT_associateMatchOnlyWithEvent( SCT_EVENT_1 , SCT_MATCH_1 );
	LPC_SCT->OUT[output].SET = (1 << 0); // event 0 will set SCTx_OUT0
	LPC_SCT->OUT[output].CLR = (1 << 1); // event 1 will clear SCTx_OUT0
	LPC_SCT->CTRL_L &= ~(1 << 2); // unhalt it by clearing bit 2 of CTRL reg
}

void SCTPWM_singlePWMSetDutyCycle( int dutyCycle )
{
	uint32_t dutyValue = (uint32_t) ((SCTPWM_SinglePWMMatch0Reload*dutyCycle)/100);
	SCT_setLowTimerMatchReload( SCT_MATCH_1, dutyValue );
}
//
///* @brief config PWM generation with two events.
// * @param mainEvent sets the freq of the pwm signal.
// * @param dutyCycleEvent sets the duty cycle of the signal. */
//uint32_t SCTPWM_configPWM(	uint32_t frequency,
//							uint8_t mainEvent,
//							uint8_t dutyCycleEvent,
//							SCT_outputPin outputPin )
//{
//	CCU_initSCTClock();
//	// Before configuration, stop SCT & clear counter
//	LPC_SCT->CTRL_U |= SCT_CTRL_HALT_L | SCT_CTRL_CLRCTR_L;
//
//	LPC_SCT->CONFIG &= ~(3 << 1); 	//Set bus clock as the clock for SCT and prescalers.
//	LPC_SCT->REGMODE_L = 0;  		//Match/Capture registers operates as Match registers
//
//	LPC_SCT->MATCH[0].U = 0; 		//Set match count in 0
//	//LPC_SCT->MATCH[0].U = ;
//
//	SCT_setTwoTimersMode();
//	LPC_SCT->CONFIG |= SCT_CONFIG_AUTOLIMIT_L;
//
//	Chip_SCT_SetMatchReload(pSCT, SCT_MATCH_0, rate);
//
//	uint32_t baseClkFreq = CGU_getClockInputHz( CLK_BASE_MX );
//	uint32_t prescaler = SCTPWM_frequencyToPrescaler( baseClkFreq, frequency );
//
//	SCT_setLowTimerPrescaler( prescaler );
//
//	uint8_t mainMatch = mainEvent;
//	SCT_setLimitLowTimer( mainEvent ); //this event sets the period of the pwm signal
//
//	uint32_t mainMatchValue = frequency/prescaler - 1; // for now, the freq of the signal is setted with the prescaler.
//	SCT_setLowTimerMatchReload( mainMatch, mainMatchValue );
//
//	uint8_t dutyCycleMatch = dutyCycleEvent;
//	SCT_setLowTimerMatchReload( dutyCycleMatch, 0 ); //the signal starts with a duty cycle of 0
//
//	SCT_setEventState( mainEvent, ALL_STATES );
//	SCT_associateMatchWithEvent( mainEvent, mainMatch );
//	SCT_setEventCombMode( mainEvent, ONLY_MATCH_CONDITION );
//
//	SCT_setEventState( dutyCycleEvent, ALL_STATES );
//	SCT_associateMatchWithEvent( dutyCycleEvent, dutyCycleMatch );
//	SCT_setEventCombMode( mainEvent, ONLY_MATCH_CONDITION );
//
//	SCT_setOutputSETReg( outputPin, mainEvent ); //main event gonna put in HIGH the output
//	SCT_setOutputSETReg( outputPin, dutyCycleEvent ); //duty cycle event gonna put in LOW the output
//
//	SCT_unhalt( );
//	return mainMatchValue; //This is the period of the signal
//
//}
//
///* @brief sets duty cycle to a pwm.
// * @param dutyCyclePercent value between 0 and 99.*/
//void SCTPWM_setDutyCycle(	uint8_t dutyCycleMatch, uint8_t dutyCyclePercent,
//							uint32_t mainMatchValue )
//{
//	uint8_t dutyCycleEvent = dutyCycleMatch;
//	uint32_t dutyCycle = (dutyCyclePercent/100) * mainMatchValue;
//	SCT_setLowTimerMatchReload( dutyCycleEvent, mainMatchValue );
//}

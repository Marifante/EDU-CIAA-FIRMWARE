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
#define ALL_STATES							0xFFFFFFFF //for setEventState
#define ONLY_MATCH_CONDITION				0x1

#define SCT_CTRL_STOP_L               		(1 << 1)		// Stop low counter
#define SCT_CTRL_HALT_L               		(1 << 2)		// Halt low counter
#define SCT_CTRL_CLRCTR_L            		(1 << 3)		// Clear low or unified counter
#define SCT_CONFIG_AUTOLIMIT_L				(1 << 17)		// Set autolimit, the count resets to 0 when the timer reachs the MATCH value

int SCTPWM_SinglePWMMatch0Reload =			0;
int SCTPWM_TwoOutputPWMMatch0Reload = 		0;
uint8_t SCTPWM_TwoOutputPWMFirstOutput =	0;
uint8_t SCTPWM_TwoOutputPWMSecondOutput =	0;

/*==================[internal functions definition]==========================*/

/*==================[external functions definition]==========================*/
/* @brief config State Configurable Timer (SCT) to do a PWM signal.
 *	PWM configuration
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
	LPC_SCT->EVENT[0].STATE = ALL_STATES; // event 0 happens in all states
	SCT_associateMatchOnlyWithEvent( SCT_EVENT_0 , SCT_MATCH_0 );
	LPC_SCT->EVENT[1].STATE = ALL_STATES; // event 1 happens in all states
	SCT_associateMatchOnlyWithEvent( SCT_EVENT_1 , SCT_MATCH_1 );
	LPC_SCT->OUT[output].SET = (1 << 0); // event 0 will set output
	LPC_SCT->OUT[output].CLR = (1 << 1); // event 1 will clear output
	LPC_SCT->CTRL_L &= ~(1 << 2); // unhalt it by clearing bit 2 of CTRL reg
}

void SCTPWM_singlePWMSetDutyCycle( int dutyCycle )
{
	uint32_t dutyValue = (uint32_t) ((SCTPWM_SinglePWMMatch0Reload*dutyCycle)/100);
	SCT_setLowTimerMatchReload( SCT_MATCH_1, dutyValue );
}

/* @brief config SCT to do two pwm signals with independent duty cycle.
 * It's similar to SinglePWM generation. In this case:
 * Event 0 will set pwm signal frequency (same as singlePWM).
 * Event 1 associated with Match 1 will set pwm signal 1 duty cycle.
 * Event 2 associated with Match 2 will set pwm signal 2 duty cycle. */
void SCTPWM_twoOutputPWM( SCT_outputPin outputOne, SCT_outputPin outputTwo, int signalFrequency )
{
	CCU_initSCTClock();
	uint32_t inputClkFreq = CGU_getSCTInputClkFreq();
	int prescaler = inputClkFreq/1000000; // The frequency of the counter will be 1MHz
	SCT_setLowTimerPrescaler( prescaler ); // Configura el prescaler, SCTimer/PWM clock = 1 MHz
	SCT_setTimerMode( SCT_TWO_16BIT_TIMERS, true ); // Configura el SCT como dos timer de 16 bits, con auto limit
	SCTPWM_TwoOutputPWMMatch0Reload = 10000000/signalFrequency;
	SCT_setLowTimerMatchReload( SCT_MATCH_0, SCTPWM_TwoOutputPWMMatch0Reload ); // 10 / 1MHz = 0.001 sec = 1 ms = 1kHz
	SCT_setLowTimerMatchReload( SCT_MATCH_1, SCTPWM_TwoOutputPWMMatch0Reload/2 ); // By default, set pwm with 50% duty cycle
	SCT_setLowTimerMatchReload( SCT_MATCH_2, SCTPWM_TwoOutputPWMMatch0Reload/2 ); // By default, set pwm with 50% duty cycle
	LPC_SCT->EVENT[0].STATE = ALL_STATES; // event 0 happens in all states
	SCT_associateMatchOnlyWithEvent( SCT_EVENT_0 , SCT_MATCH_0 );
	LPC_SCT->EVENT[1].STATE = ALL_STATES; // event 1 happens in all states
	SCT_associateMatchOnlyWithEvent( SCT_EVENT_1 , SCT_MATCH_1 );
	LPC_SCT->EVENT[2].STATE = ALL_STATES; // event 2 happens in all states
	SCT_associateMatchOnlyWithEvent( SCT_EVENT_2 , SCT_MATCH_2 );
	SCTPWM_TwoOutputPWMFirstOutput = outputOne;
	SCTPWM_TwoOutputPWMSecondOutput = outputTwo;
	LPC_SCT->OUT[SCTPWM_TwoOutputPWMFirstOutput].SET = (1 << SCT_EVENT_0); // event 0 will set outputOne
	LPC_SCT->OUT[SCTPWM_TwoOutputPWMFirstOutput].CLR = (1 << SCT_EVENT_1); // event 1 will clear outputOne
	LPC_SCT->OUT[SCTPWM_TwoOutputPWMSecondOutput].SET = (1 << SCT_EVENT_0); // event 0 will set outputTwo
	LPC_SCT->OUT[SCTPWM_TwoOutputPWMSecondOutput].CLR = (1 << SCT_EVENT_2); // event 1 will clear outputTwo
	LPC_SCT->CTRL_L &= ~(1 << 2); // unhalt it by clearing bit 2 of CTRL reg
}

/* @brief set duty cycle of one of the two pwm signals of twoOutputPWM.
 * This function see what output one want to modify duty cycle and then changes it.
 * The varaible SCTPWM_TwoOutputPWMFirstOutput is set only in SCTPWM_twoOutputPWM. */
void SCTPWM_twoOutputPWMSetDutyCycle( SCT_outputPin output, int dutyCycle )
{
	uint32_t dutyValue = (uint32_t) ((SCTPWM_TwoOutputPWMMatch0Reload*dutyCycle)/100);
	if( output == SCTPWM_TwoOutputPWMFirstOutput )
		SCT_setLowTimerMatchReload( SCT_MATCH_1, dutyValue );
	else
	if( output == SCTPWM_TwoOutputPWMSecondOutput )
		SCT_setLowTimerMatchReload( SCT_MATCH_2, dutyValue );
}

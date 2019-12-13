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

#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_SCT_PWM_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_SCT_PWM_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"
#include "../inc/sct_peripheral.h"

/*==================[macros and definitions]=================================*/

/*==================[external functions declaration]=========================*/
void SCTPWM_singlePWM( SCT_outputPin output, int signalFrequency);

/* @brief config PWM generation with two events.
 * @param mainEvent sets the freq of the pwm signal.
 * @param dutyCycleEvent sets the duty cycle of the signal. */
uint32_t SCTPWM_configPWM( uint32_t frequency, uint8_t mainEvent, uint8_t dutyCycleEvent, SCT_outputPin outputPin );

/* @brief sets duty cycle to a pwm.
 * @param dutyCyclePercent value between 0 and 99.*/
void SCTPWM_setDutyCycle( uint8_t dutyCycleMatch, uint8_t dutyCyclePercent, uint32_t mainMatchValue );


#endif /*_SCT_PWM_H_*/

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
void SCTPWM_singlePWMSetDutyCycle( int dutyCycle );

void SCTPWM_twoOutputPWM( SCT_outputPin outputOne, SCT_outputPin outputTwo, int signalFrequency );
void SCTPWM_twoOutputPWMSetDutyCycle( SCT_outputPin output, int dutyCycle );

#endif /*_SCT_PWM_H_*/

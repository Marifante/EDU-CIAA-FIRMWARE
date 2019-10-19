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

#ifndef _SCT_PWM_H_
#define _SCT_PWM_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

/*
 * Macros para aumentar la legibilidad del codigo
 * */
// Las siguientes dos son para setear el bit correspondiente a HALT_L y HALT_H
// en el registro CONTROL de la SCT
#define SCT_CTRL_HALT_L		(1 << 2)
#define SCT_CTRL_HALT_H		(1 << 18)


/*==================[internal functions declaration]=========================*/
///**
// * @brief	Get number of ticks per PWM cycle
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @return	Number ot ticks that will be counted per cycle
// * @note	Return value of this function will be vaild only
// *          after calling Chip_SCTPWM_SetRate()
// */
//uint32_t Chip_SCTPWM_GetTicksPerCycle(LPC_SCT_T *pSCT);
//
//
///*==================[external functions declaration]=========================*/
//
///**
// * @brief	Initialize the SCT/PWM clock and reset
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @return	None
// */
//void Chip_SCTPWM_Init(LPC_SCT_T *pSCT);
//
///*
// * @brief Start the SCT PWM
// * @param pSCT	: beginning of the SCT struct of the micro controller
// * Note	: puts the bits HALT_H and HALT_L HIGH. This stops the two counters of
// * SCT and no events can occur. When HALT_H/HALT_L its HIGH, then STOP_H/STOP_L
// * its cleared. To configure SCTPWM, the counters of the SCT must be
// * stopped.
// * Note 2	: this function must be called after all the
// * configuration is completed.
// * */
//void SCTPWM_Start(LPC_SCT_T* pSCT);
//
///**
// * @brief	Stop the SCT PWM
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @return	None
// */
//void Chip_SCTPWM_Stop(LPC_SCT_T *pSCT);
//
///**
// * @brief	Sets the frequency of the generated PWM wave
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	freq	: Frequency in Hz
// * @return	None
// */
//void Chip_SCTPWM_SetRate(LPC_SCT_T *pSCT, uint32_t freq);
//
///**
// * @brief	Setup the OUTPUT pin and associate it with an index
// * @param	pSCT	: The base of the SCT peripheral on the chip
// * @param	index	: Index of PWM 1 to N (see notes)
// * @param	pin		: COUT pin to be associated with the index
// * @return	None
// * @note	@a index will be 1 to N where N is the "Number of
// *          match registers available in the SCT - 1" or
// *          "Number of OUTPUT pins available in the SCT" whichever
// *          is minimum.
// */
//void Chip_SCTPWM_SetOutPin(LPC_SCT_T *pSCT, uint8_t index, uint8_t pin);

#endif /*_SCT_PWM_H_*/

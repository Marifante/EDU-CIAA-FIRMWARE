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

/*==================[internal functions definition]==========================*/
//
///**
// * @brief	Get number of ticks per PWM cycle
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @return	Number ot ticks that will be counted per cycle
// * @note	Return value of this function will be vaild only
// *          after calling Chip_SCTPWM_SetRate()
// */
//uint32_t Chip_SCTPWM_GetTicksPerCycle(LPC_SCT_T *pSCT){
//	return pSCT->MATCHREL[0].U;
//}
//
///**
// * @brief	Converts a percentage to ticks
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	percent	: Percentage to convert (0 - 100)
// * @return	Number ot ticks corresponding to given percentage
// * @note	Do not use this function when using very low
// *          pwm rate (like 100Hz or less), on a chip that has
// *          very high frequency as the calculation might
// *          cause integer overflow
// */
//uint32_t Chip_SCTPWM_PercentageToTicks(LPC_SCT_T *pSCT, uint8_t percent){
//	return (Chip_SCTPWM_GetTicksPerCycle(pSCT) * percent) / 100;
//}
//
///*==================[external functions definition]==========================*/
//
///**
// * @brief	Initialize the SCT/PWM clock and reset
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @return	None
// */
//void Chip_SCTPWM_Init(LPC_SCT_T *pSCT){
//	Chip_SCT_Init();
//}
//
///*
// * @brief Start the SCT PWM
// * @param pSCT	: beginning of the SCT struct of the micro controller
// * Note	: puts the bits HALT_H and HALT_L HIGH. This stops the two counters of
// * SCT and no events can occur. When HALT_H/HALT_L its HIGH, then STOP_H/STOP_L
// * its cleared. To configure SCTPWM, the counters of the SCT must be
// * stopped.
// * */
//void SCTPWM_Start(LPC_SCT_T* pSCT){
//	Chip_SCT_ClearControl(pSCT, SCT_CTRL_HALT_L | SCT_CTRL_HALT_H);
//}
//
//
///**
// * @brief	Stop the SCT PWM
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @return	None
// */
//void Chip_SCTPWM_Stop(LPC_SCT_T *pSCT){
//	/* Stop SCT */
//	Chip_SCT_SetControl(pSCT, SCT_CTRL_HALT_L | SCT_CTRL_HALT_H);
//
//	/* Clear the counter */
//	Chip_SCT_SetControl(pSCT, SCT_CTRL_CLRCTR_L | SCT_CTRL_CLRCTR_H);
//}
//
///**
// * @brief	Sets the frequency of the generated PWM wave
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	freq	: Frequency in Hz
// * @return	None
// */
//void Chip_SCTPWM_SetRate(LPC_SCT_T *pSCT, uint32_t freq){
//	uint32_t rate;
//
//	rate = Chip_Clock_GetRate(CLK_MX_SCT) / freq;
//
//	/* Stop the SCT before configuration */
//	Chip_SCTPWM_Stop(pSCT);
//
//	/* Set MATCH0 for max limit */
//	pSCT->REGMODE_L = 0;
//	pSCT->REGMODE_H = 0;
//	Chip_SCT_SetMatchCount(pSCT, SCT_MATCH_0, 0);
//	Chip_SCT_SetMatchReload(pSCT, SCT_MATCH_0, rate);
//	pSCT->EVENT[0].CTRL = 1 << 12;
//	pSCT->EVENT[0].STATE = 1;
//	pSCT->LIMIT_L = 1;
//
//	/* Set SCT Counter to count 32-bits and reset to 0 after reaching MATCH0 */
//	Chip_SCT_Config(pSCT, SCT_CONFIG_32BIT_COUNTER | SCT_CONFIG_AUTOLIMIT_L);
//}
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
//void Chip_SCTPWM_SetOutPin(LPC_SCT_T *pSCT, uint8_t index, uint8_t pin)
//{
//	int ix = (int) index;
//	pSCT->EVENT[ix].CTRL = index | (1 << 12);
//	pSCT->EVENT[ix].STATE = 1;
//	pSCT->OUT[pin].SET = 1;
//	pSCT->OUT[pin].CLR = 1 << ix;
//
//	/* Clear the output in-case of conflict */
//	pSCT->RES = (pSCT->RES & ~(3 << (pin << 1))) | (0x01 << (pin << 1));
//
//	/* Set and Clear do not depend on direction */
//	pSCT->OUTPUTDIRCTRL = (pSCT->OUTPUTDIRCTRL & ~(3 << (pin << 1)));
//}

/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: sct_peripheral
 *
 * El periférico State Configurable Timer sirve para generar diversos tipos
 * de seniales. Consta de hasta 2 contadores con los cuales se pueden generar
 * diversas seniales configurando eventos disparadores. Cada vez que alguno
 * de estos eventos ocurra, una salida de este periferico se pone en HIGH
 * o LOW y asi se generan varios tipos de seniales, como PWM.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/sct_peripheral.h"

/*==================[external functions definition]==========================*/

///**
// * @brief Initialize the clock of the SCT peripheral
// *  */
//void Chip_SCT_Init()
//{
//	Chip_Clock_EnableOpts(CLK_MX_SCT, true, true, 1);
//}
//
///**
// *  @brief Shutdown the SCT
// *  */
//void Chip_SCT_DeInit(LPC_SCT_T *pSCT)
//{
//	Chip_Clock_Disable(CLK_MX_SCT);
//}
//
///**
// * @brief	Configures the State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	value	: The 32-bit CONFIG register value
// * @return	Nothing
// */
//void Chip_SCT_Config(LPC_SCT_T *pSCT, uint32_t value){
//	pSCT->CONFIG = value;
//}
//
///**
// * @brief	Set control register in State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	value	: Value (ORed value of SCT_CTRL_* bits)
// * @return	Nothing
// * Note : puts in 1 the bits on 1 of "value" in the register CONTROL of the SCT struct
// * if value = 0x2, then the 2 lsb of this registers are put to 1.
// */
//void Chip_SCT_SetControl(LPC_SCT_T *pSCT, uint32_t value){
//	pSCT->CTRL_U |= value;
//}
//
//
///**
// * @brief	Clear control register in State Configurable Timer.
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	value	: Value (ORed value of SCT_CTRL_* bits)
// * @return	Nothing
// * Note : clear the bits on 1 of "value" in the register CONTROL of the SCT struct
// * if value = 0x2, then the 2 lsb of this registers are put to 0.
// */
//void Chip_SCT_ClearControl(LPC_SCT_T *pSCT, uint32_t value){
//	pSCT->CTRL_U &= ~(value);
//};
//
///**
// * @brief	Set unified match count value in State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	n		: Match register value
// * @param	value	: The 32-bit match count value
// * @return	Nothing
// */
//void Chip_SCT_SetMatchCount(LPC_SCT_T *pSCT, CHIP_SCT_MATCH_REG_T n, uint32_t value){
//	pSCT->MATCH[n].U = value;
//}
//
///**
// * @brief	Set unified match reload count value in State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	n		: Match register value
// * @param	value	: The 32-bit match count reload value
// * @return	Nothing
// */
//void Chip_SCT_SetMatchReload(LPC_SCT_T *pSCT, CHIP_SCT_MATCH_REG_T n, uint32_t value){
//	pSCT->MATCHREL[n].U = value;
//}


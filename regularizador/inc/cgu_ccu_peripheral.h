/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: cgu_ccu_peripheral
 *
 * La CGU (Clock Generation Unit) es el periferico que se encarga de generar
 * las seniales de reloj para el resto de los perifericos.
 * La CCU (Clock Control Unit) es el periferico que se encarga de controlar
 * las seniales de reloj para el resto de los perifericos.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef _CGU_CCU_PERIPHERAL_H_
#define _CGU_CCU_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "data_types.h"

/*==================[macros and definitions]=================================*/

#define LPC_CGU_BASE              0x40050000
#define LPC_CCU1_BASE             0x40051000
#define LPC_CCU2_BASE             0x40052000

#define LPC_CGU					  ((LPC_CGU_T*) LPC_CGU_BASE)
#define LPC_CCU1                  ((LPC_CCU1_T*) LPC_CCU1_BASE)
#define LPC_CCU2                  ((LPC_CCU2_T*) LPC_CCU2_BASE)

/*==================[external data declaration]==============================*/

///**
// * Audio or USB PLL selection
// */
//typedef enum CHIP_CGU_USB_AUDIO_PLL {
//	CGU_USB_PLL,
//	CGU_AUDIO_PLL
//} CHIP_CGU_USB_AUDIO_PLL_T;
//
///**
// * PLL register block
// */
//typedef struct {
//	__I  uint32_t  PLL_STAT;				/*!< PLL status register */
//	__IO uint32_t  PLL_CTRL;				/*!< PLL control register */
//	__IO uint32_t  PLL_MDIV;				/*!< PLL M-divider register */
//	__IO uint32_t  PLL_NP_DIV;				/*!< PLL N/P-divider register */
//} CGU_PLL_REG_T;
//
///**
// * @brief LPC18XX/43XX CGU register block structure
// */
//typedef struct {							/*!< (@ 0x40050000) CGU Structure          */
//	__I  uint32_t  RESERVED0[5];
//	__IO uint32_t  FREQ_MON;				/*!< (@ 0x40050014) Frequency monitor register */
//	__IO uint32_t  XTAL_OSC_CTRL;			/*!< (@ 0x40050018) Crystal oscillator control register */
//	CGU_PLL_REG_T  PLL[CGU_AUDIO_PLL + 1];	/*!< (@ 0x4005001C) USB and audio PLL blocks */
//	__IO uint32_t  PLL0AUDIO_FRAC;			/*!< (@ 0x4005003C) PLL0 (audio)           */
//	__I  uint32_t  PLL1_STAT;				/*!< (@ 0x40050040) PLL1 status register   */
//	__IO uint32_t  PLL1_CTRL;				/*!< (@ 0x40050044) PLL1 control register  */
//	__IO uint32_t  IDIV_CTRL[CLK_IDIV_LAST];/*!< (@ 0x40050048) Integer divider A-E control registers */
//	__IO uint32_t  BASE_CLK[CLK_BASE_LAST];	/*!< (@ 0x4005005C) Start of base clock registers */
//} LPC_CGU_T;
//
///**
// * @brief CCU clock config/status register pair
// */
//typedef struct {
//	__IO uint32_t  CFG;						/*!< CCU clock configuration register */
//	__I  uint32_t  STAT;					/*!< CCU clock status register */
//} CCU_CFGSTAT_T;
//
///**
// * @brief CCU1 register block structure
// */
//typedef struct {							/*!< (@ 0x40051000) CCU1 Structure         */
//	__IO uint32_t  PM;						/*!< (@ 0x40051000) CCU1 power mode register */
//	__I  uint32_t  BASE_STAT;				/*!< (@ 0x40051004) CCU1 base clocks status register */
//	__I  uint32_t  RESERVED0[62];
//	CCU_CFGSTAT_T  CLKCCU[CLK_CCU1_LAST];	/*!< (@ 0x40051100) Start of CCU1 clock registers */
//} LPC_CCU1_T;
//
///**
// * @brief CCU2 register block structure
// */
//typedef struct {							/*!< (@ 0x40052000) CCU2 Structure         */
//	__IO uint32_t  PM;						/*!< (@ 0x40052000) Power mode register    */
//	__I  uint32_t  BASE_STAT;				/*!< (@ 0x40052004) CCU base clocks status register */
//	__I  uint32_t  RESERVED0[62];
//	CCU_CFGSTAT_T  CLKCCU[CLK_CCU2_LAST - CLK_CCU1_LAST];	/*!< (@ 0x40052100) Start of CCU2 clock registers */
//} LPC_CCU2_T;

#endif /*_CGU_CCU_PERIPHERAL_H_*/

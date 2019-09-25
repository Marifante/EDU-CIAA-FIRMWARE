/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: chip_core
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _CHIP_CORE_H_
#define _CHIP_CORE_H_

/*==================[inclusions]=============================================*/

#include "data_types.h"

/*==================[macros and definitions]=================================*/

#define SCS_BASE            (0xE000E000UL)                            /*!< System Control Space Base Address  */
#define SysTick_BASE        (SCS_BASE +  0x0010UL)                    /*!< SysTick Base Address               */
#define SysTick 		((SysTick_Type*) SysTick_BASE)

#define ENA_SYSTICK_MASK	(1<<0)
#define ENA_INT_SYSTICK_MASK (1<<1)
#define CLOCK_SEL_SYSTICK_MASK (0<<2)

/*==================[external data declaration]==============================*/
typedef struct{
	  __IO uint32_t CTRL;                    /*!< Offset: 0x000 (R/W)  SysTick Control and Status Register */
	  __IO uint32_t LOAD;                    /*!< Offset: 0x004 (R/W)  SysTick Reload Value Register       */
	  __IO uint32_t VAL;                     /*!< Offset: 0x008 (R/W)  SysTick Current Value Register      */
	  __I  uint32_t CALIB;                   /*!< Offset: 0x00C (R/ )  SysTick Calibration Register        */
} SysTick_Type;

/*====================[external functions declaration]=======================*/

/*
 * @brief enable sysTick timer and generates one interrupt who launchs
 * SysTick_Handler() every time_ms
 * @time_ms interval of time between two interruptions
 * */
void enable_IntSysTick(float time_ms);



#endif /*_CHIP_CORE_*/

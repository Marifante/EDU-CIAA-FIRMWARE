/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: interrupts_peripherals
 * Contains the functions to configure and manage the interruptions of the
 * peripherals of the LPC4337
 *
 * Handler for GPIO interrupt x void GPIOx_IRQHandler(void);
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_INTERRUPTS_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_INTERRUPTS_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"
#include "lpc_4337_chip.h"

/*==================[macros and definitions]=================================*/

/*==================[external data declaration]==============================*/

/*==================[external functions declaration]==========================*/

/*==================[GPIO interrupts]=========================================*/

/**
 * @brief GPIO Interrupt Select
 * @PortNum  GPIO port number interrupt, should be: 0 to 7. Every GPIO port support up to 8 interrupts
 * @PinNum  GPIO pin number Interrupt , should be: 0 to 31
 */
void SCU_GPIOIntPinSel( uint8_t PortSel, uint8_t PortNum, uint8_t PinNum );

/*
 * @brief sets GPIO interrupt N as edge detection
 * @gpioInterruptNumber number of the gpio interrupt (lpc4337 supports up to 8 gpio interrupts)
 * */
void setEdgeDetectionGPIOInterrupt( uint8_t gpioInterruptNumber );

/* @brief sets GPIO interrupt N as rise edge detection */
void setRiseEdgeGPIOInterrupt( uint8_t gpioPinInterruptNum );

/* @brief sets GPIO interrupt N as fall edge detection */
void setFallEdgeGPIOInterrupt( uint8_t gpioPinInterruptNum );

/* @brief clear GPIO interrupt N flag */
void clearGPIOInterruptFlag( uint8_t gpioPinInterruptNum );

#endif /*_LIBRARIES_LPC4337_SPECIFIC_INC_INTERRUPTS_H_*/

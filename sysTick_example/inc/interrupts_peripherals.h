/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: interrupts_peripherals
 * Contains the functions to configure and manage the interruptions of the
 * peripherals of the LPC4337
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _INTERRUPTS_H_
#define _INTERRUPTS_H_

/*==================[inclusions]=============================================*/

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
void SCU_GPIOIntPinSel(uint8_t PortSel, uint8_t PortNum, uint8_t PinNum);

/*
 * @brief	GPIO PORT 0 Interrupt Handler Function
 * Funcion la cual se ejecuta cuando se hay una interrupcion en el puerto 0 de los GPIO
 */
void GPIO0_IRQHandler(void);



#endif /*_INTERRUPTS_H_*/

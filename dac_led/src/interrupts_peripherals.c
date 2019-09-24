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

/*==================[inclusions]=============================================*/

#include "../inc/interrupts_peripherals.h"

/*==================[external functions definition]==========================*/

/**=================[GPIO interrupts]=======================================**/

/**
 * @brief GPIO Interrupt Select
 * @PortNum  GPIO port number interrupt, should be: 0 to 7. Every GPIO port support up to 8 interrupts
 * @PinNum  GPIO pin number Interrupt , should be: 0 to 31
 */
void SCU_GPIOIntPinSel(uint8_t PortSel, uint8_t PortNum, uint8_t PinNum){
	int despl = (PortSel & 3) << 3;
	uint32_t val = (((PortNum & 0x7) << 5) | (PinNum & 0x1F)) << despl;
	SCU->PINTSEL[PortSel >> 2] = (SCU->PINTSEL[PortSel >> 2] & ~(0xFF << despl)) | val;
}


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
 * @PortSel GPIO interrupt number, should be 0 to 7
 * @PortNum  GPIO port number interrupt, should be: 0 to 7
 * @PinNum  GPIO pin number Interrupt , should be: 0 to 31
 */
void SCU_GPIOIntPinSel(uint8_t PortSel, uint8_t PortNum, uint8_t PinNum){
	int despl = (PortSel & 3) << 3;
	uint32_t val = (((PortNum & 0x7) << 5) | (PinNum & 0x1F)) << despl;
	SCU->PINTSEL[PortSel >> 2] = (SCU->PINTSEL[PortSel >> 2] & ~(0xFF << despl)) | val;
}

/*
 * @brief sets GPIO interrupt N as edge detection
 * @gpioInterruptNumber number of the gpio interrupt (lpc4337 supports up to 8 gpio interrupts)
 * */
void setEdgeDetectionGPIOInterrupt(uint8_t gpioInterruptNumber){
	/* A 0 in the bit N of the ISEL sets edge detection for the gpio interrupt N */
	GPIO_PIN_INT->ISEL &= ~(1 << gpioInterruptNumber);
}

/* @brief sets GPIO interrupt N as rise edge detection */
void setRiseEdgeGPIOInterrupt(uint8_t gpioPinInterruptNum){
	GPIO_PIN_INT->SIENR |= (1 << gpioPinInterruptNum);
}

/* @brief sets GPIO interrupt N as fall edge detection */
void setFallEdgeGPIOInterrupt( uint8_t gpioPinInterruptNum )
{
	GPIO_PIN_INT->SIENF |=  (1 << gpioPinInterruptNum);
}

/* @brief clear GPIO interrupt N flag */
void clearGPIOInterruptFlag( uint8_t gpioPinInterruptNum ){
	GPIO_PIN_INT->IST = (1 << gpioPinInterruptNum);
}


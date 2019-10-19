/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: interrupts_board
 * Contains the functions to configure and manage the interruptions for the I/O
 * of the EDU-CIAA board.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef _INTERRUPTS_BOARD_H_
#define _INTERRUPTS_BOARD_H_

/*==================[inclusions]=============================================*/

#include "../inc/interrupts_board.h"

/*==================[external functions declaration]==========================*/

/*
 * @brief Configuracion de interrupcion para las teclas
 * @gpioStruct puntero a la estructura del gpio asociada a la tecla
 * @gpioPinInterruptNum	 El lpc4337 soporta hasta 8 interrupciones para los GPIO,
 * cada una con un Handler diferente.
 * @asc_desc	Interrupcion por flanco ascendente/descendente
 */
void configTecInterrupts(gpioPin_t *gpioStruct, uint8_t gpioPinInterruptNum, edgeTypeInt_t asc_desc){
	/* Registros del periferico SCU a configurar para configurar la interrupcion */
	SCU_GPIOIntPinSel(gpioPinInterruptNum, gpioStruct->gpio_port, gpioStruct->gpio_pin);

	/* Registros del periferico GPIO para configurar la interrupcion */
	setEdgeDetectionGPIOInterrupt(gpioPinInterruptNum);

	switch (asc_desc) {
		case ASCENDENT:
			setRiseEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco asc
			break;
		case DESCENDENT:
			setFallEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco desc
			break;
		case BOTH_EDGES:
			setRiseEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco asc
			setFallEdgeGPIOInterrupt(gpioPinInterruptNum);	// Hab. de las interrupcion por flanco desc
			break;
		default:
			return;
	}

	/* Registros del NVIC a configurar para configurar la interrupcion */
	// Habilitacion de las interrupciones en el NVIC
	// _NVIC->ISER[1] = (unsigned int)(1 << boton);
	switch (gpioPinInterruptNum) {
	case 0:
		NVIC_EnaIRQ(PIN_INT0_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;
	case 1:
		NVIC_EnaIRQ(PIN_INT1_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;
	case 2:
		NVIC_EnaIRQ(PIN_INT2_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;
	case 3:
		NVIC_EnaIRQ(PIN_INT3_IRQn);// _NVIC->ISER[1] = (unsigned int)(15 << 0);
		break;

	}
}

#endif /*_INTERRUPTS_BOARD_H_*/

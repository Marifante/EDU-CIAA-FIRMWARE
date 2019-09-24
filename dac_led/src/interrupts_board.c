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

#include "interrupts_board.h"

/*==================[external functions declaration]==========================*/

/*
 * @brief Configuracion de interrupcion para las teclas
 * @boton	 Boton que se configurara
 * @modo	 Modo flanco (0) o nivel (1)
 * @asc_desc	Interrupcion por flanco ascendente/descendente
 */
void configTecInterrupts(int tecla, int modo, int asc_desc) {
	GPIO_PIN_INT->ISEL &= ~(1 << tecla);

	if (modo == 0) {
		switch (asc_desc) {
		case 0:
			GPIO_PIN_INT->SIENR |= (1 << tecla);	// Hab. de las interrupcion por flanco asc
			break;
		case 1:
			GPIO_PIN_INT->SIENF |=  (1 << tecla);	// Hab. de las interrupcion por flanco desc
			break;
		case 2:
			GPIO_PIN_INT->SIENR |=  (1 << tecla);	// Hab. de las interrupcion por flanco asc
			GPIO_PIN_INT->SIENF |=  (1 << tecla);	// Hab. de las interrupcion por flanco desc
			break;
		}
	}
	else {
		// a completar para nivel
	}

	// Habilitacion de las interrupciones en el NVIC
	// _NVIC->ISER[1] = (unsigned int)(1 << boton);
	switch (tecla) {
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

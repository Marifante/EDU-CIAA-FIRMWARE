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

/*==================[inclusions]=============================================*/

#include "lpc_4337_chip.h"

/*==================[external functions declaration]==========================*/

/*
 * @brief Configuracion de interrupcion para las teclas
 * @boton	 Boton que se configurara
 * @modo	 Modo flanco (0) o nivel (1)
 * @asc_desc	Interrupcion por flanco ascendente/descendente
 */
void configTecInterrupts(int tecla, int modo, int asc_desc);

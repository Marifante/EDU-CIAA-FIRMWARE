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

#include "../../utils.h"
#include "../../lpc4337_specific/inc/lpc_4337_chip.h"
#include "gpio_board.h"

/*==================[external data declaration]===============================*/

typedef enum{
	ASCENDENT, DESCENDENT, BOTH_EDGES
}edgeTypeInt_t;

/*==================[external functions declaration]==========================*/


/*
 * @brief Configuracion de interrupcion para las teclas
 * @gpioStruct puntero a la estructura del gpio asociada a la tecla
 * @gpioPinInterruptNum	 El lpc4337 soporta hasta 8 interrupciones para los GPIO,
 * cada una con un Handler diferente.
 * @asc_desc	Interrupcion por flanco ascendente/descendente
 */
void configTecInterrupts(gpioPin_t *gpioStruct, uint8_t gpioPinInterruptNum, edgeTypeInt_t asc_desc);

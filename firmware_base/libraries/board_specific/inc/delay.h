/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: delay
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _LIBRARIES_BOARD_SPECIFIC_INC_DELAY_H_
#define _LIBRARIES_BOARD_SPECIFIC_INC_DELAY_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"
#include "../../lpc4337_specific/inc/lpc_4337_chip.h"

/*==================[macros and definitions]=================================*/


/*==================[external functions declaration]==========================*/

/* @brief	Blocking delay function */
void Delay_us( uint32_t us, uint8_t chosenTimer );

/* @brief non-blocking delay function
 * When use this function, must to config the corresponding interrupt handler
 * of the desired timer to used. */
void Delay_initNonBlockingDelay( uint32_t us, uint8_t chosenTimer, uint8_t matchNumber );

#endif /*_LIBRARIES_BOARD_SPECIFIC_INC_DELAY_H_*/

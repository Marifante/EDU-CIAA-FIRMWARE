/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: delay
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _DELAY_H_
#define _DELAY_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"
#include "../../lpc4337_specific/inc/lpc_4337_chip.h"

/*==================[macros and definitions]=================================*/

#define CLOCK_EDU_CIAA 204000000 // Clock del micro

/*==================[external functions declaration]==========================*/

/* @brief	Blocking delay function */
void delay_us( uint32_t us );


#endif /*_DELAY_H_*/

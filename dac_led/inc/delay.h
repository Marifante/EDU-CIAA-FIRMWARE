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

#include "lpc_4337_chip.h"

#define CLOCK_EDU_CIAA 204000000 // Clock del micro

/*
 * @Brief	blocking delay function
 * @return	nothing
*/
void delay_us(uint32_t us);


#endif /*_DELAY_H_*/

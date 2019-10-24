/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: nvic_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/nvic_peripheral.h"

/*====================[external functions definition]========================*/

/* @brief enable one interrupt in the NVIC
 * @IRQn desired interrupt to enable. */
void NVIC_EnaIRQ( IRQn_Type IRQn )
{
	_NVIC->ISER[(unsigned int)((int)IRQn) >> 5] = (unsigned int)(1 << ((unsigned int)((uint32_t)IRQn) & (unsigned int)0x1F));
}

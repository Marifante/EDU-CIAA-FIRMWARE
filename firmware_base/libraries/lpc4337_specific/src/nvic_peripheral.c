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
	_NVIC->ISER[ ( uint32_t ) ( ( int ) IRQn ) >> 5 ] = ( uint32_t ) ( 1 << ( ( ( uint32_t ) IRQn ) & 0x1F) );
}

/* @brief disable one interrupt in the NVIC
 * @IRQn desired interrupt to disable. */
void NVIC_disableIRQ( IRQn_Type IRQn )
{
	_NVIC->ICER[ ( uint32_t ) ( ( int ) IRQn ) >> 5 ] = ( uint32_t ) ( 1 << ( ( ( uint32_t ) IRQn ) & 0x1F) );
}

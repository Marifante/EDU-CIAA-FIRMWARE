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

/*
 * @brief
 * @IRQn
 * */
void NVIC_EnaIRQ(IRQn_Type IRQn){
	_NVIC->ISER[(unsigned int)((int)IRQn) >> 5] = (unsigned int)(1 << ((unsigned int)((uint32_t)IRQn) & (unsigned int)0x1F));
}

/** \brief  Set Interrupt Priority

    The function sets the priority of an interrupt.

    \note The priority cannot be set for every core interrupt.

    \param [in]      IRQn  Interrupt number.
    \param [in]  priority  Priority to set.
 */
static inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    SCB->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff); } /* set Priority for Cortex-M  System Interrupts */
  else {
    _NVIC->IP[(uint32_t)(IRQn)] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xff);    }        /* set Priority for device specific Interrupts  */
}

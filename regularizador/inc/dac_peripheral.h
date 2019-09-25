/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: dac_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _DAC_PERIPHERAL_H_
#define _DAC_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "lpc_4337_chip.h"

/*==================[macros and definitions]=================================*/

#define LPC_DAC_BASE              0x400E1000
#define LPC_DAC                   ((LPC_DAC_T*) LPC_DAC_BASE)

/**
 * @brief DAC register block structure
 */
typedef struct {			/*!< DAC Structure          */
	__IO uint32_t  CR;		/*!< DAC register. Holds the conversion data. */
	__IO uint32_t  CTRL;	/*!< DAC control register.  */
	__IO uint32_t  CNTVAL;	/*!< DAC counter value register. */
} LPC_DAC_T;

/*
 * This macro is to enable the bias in the CR register of the DAC.
 * The bias allows to update the values of the dac at 400kHz at max.
 * If is unbiased (bit 16 = 0), allows to update at a 1MHz rate.
 * Trade-off relation, more frequency=>less power.
 * */
#define DAC_BIAS_EN				(uint32_t)(1<<16)

/*
 * This macro makes a word where the bits 5 to 16 defines the output value
 * of the DAC:  (n/1024)*VDDA
 * */
#define DAC_VALUE(n)        ((uint32_t) ((n & 0x3FF) << 6))
/*==================[external functions declaration]=========================*/

/**
 * @brief	Update the values of the DAC buffer
 * @param	pDAC		: pointer to struct of the DAC LPC_DAC_T
 * @param	dac_value	: value 10 bit to be converted to output
 * @return	Nothing
 */
void Chip_DAC_UpdateValue(LPC_DAC_T *pDAC, uint32_t dac_value);

#endif /*DAC_PERIPHERAL_H_*/

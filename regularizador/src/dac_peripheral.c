/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: dac_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/dac_peripheral.h"

/*===================[external functions definition]=========================*/

/**
 * @brief	Update the values of the DAC buffer
 * @param	pDAC		: pointer to struct of the DAC LPC_DAC_T
 * @param	dac_value	: value 10 bit to be converted to output
 * @return	Nothing
 */
void Chip_DAC_UpdateValue(LPC_DAC_T *pDAC, uint32_t dac_value){
	uint32_t aux_var;

	aux_var = (pDAC->CR) & DAC_BIAS_EN; //copies the actual value on the CR and set the bias on
	aux_var |= DAC_VALUE(dac_value);
	pDAC->CR = aux_var; //this line updates the DAC

	return;
}

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
#include "../inc/gpdma_peripheral.h"
#include "../inc/scu_peripheral.h"

/*===================[internal functions declaration]========================*/

/* @brief Set the CNTVAL value */
void DAC_setCNTVAL( uint32_t ticks );

/* @brief if want to sample a waveform of 'freq_to_sample' frequency and have
 * 'num_of_samples' of samples of the waveform, this function converts this
 * parameters in the correspondient ticks of the CNTVAL register. */
uint32_t DAC_ticksNeededForSampling( uint32_t freq_to_sample, uint32_t num_of_samples );


/*===================[internal functions definition]=========================*/

/* @brief Enables DMA_ENA bit in the DAC control register. This enables the DAC. */
void DAC_enable()
{
	LPC_DAC->CTRL |= (0x01)<<3;
}

/* @brief set CNTVAL value of the DAC */
void DAC_setCNTVAL( uint32_t ticks )
{
	LPC_DAC->CNTVAL = ticks & 0xFFFF;
}

/* @brief if want to sample a waveform of 'freq_to_sample' frequency and have
 * 'num_of_samples' of samples of the waveform, this function converts this
 * parameters in the correspondient ticks of the CNTVAL register. */
uint32_t DAC_ticksNeededForSampling( uint32_t freq_to_sample, uint32_t num_of_samples )
{
	return (GPDMA_CLOCK / (freq_to_sample * num_of_samples));
}

/*===================[external functions definition]=========================*/

/* @brief enables DAC on the pin P4_4. */
void DAC_init(){

	/* The pin of the DAC is the P4_4 with ANALOG SEL, select func 0 per default. */
	SCU_SetPinFunc(4, 4, 0);

	/* Enables analog func for P4_4. Analog function have priority over any other digital function. */
	SCU->ENAIO[0] |= (0x01); //enables DAC for pin P4_4

	DAC_enable();

	return;
}

/* @brief	Update the values of the DAC buffer
 * @param	pDAC		: pointer to struct of the DAC LPC_DAC_T
 * @param	dac_value	: value 10 bit to be converted to output */
void DAC_UpdateValue(LPC_DAC_T *pDAC, uint32_t dac_value)
{
	uint32_t aux_var;
	aux_var = (pDAC->CR) & DAC_BIAS_EN; //keeps the bias bit if was enabled before
	aux_var |= DAC_VALUE(dac_value); //shifts the value to print in the output 6 bits to the left
	pDAC->CR = aux_var; //this line updates the DAC

}

/* @brief config the DAC to sample a certain waveform */
void DAC_configToSample( uint32_t freq_to_sample, uint32_t num_of_samples ){
	uint32_t ticks = DAC_ticksNeededForSampling( freq_to_sample, num_of_samples );
	DAC_setCNTVAL( ticks );
}

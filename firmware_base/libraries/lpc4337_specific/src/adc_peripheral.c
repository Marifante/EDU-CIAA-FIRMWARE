/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: chip_core
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/
#include "../inc/adc_peripheral.h"
#include "../inc/ccu_peripheral.h"
#include "../inc/cgu_peripheral.h"

/*==================[macros & constants]=====================================*/
#define ADC_CR_START_MODE_SEL(SEL)  ((SEL << 24))		/* Select Start Mode */
#define NO_BURST_CLKS_NUMBER		11					/* For a full conversion with NO burst */
#define MAX_SAMPLE_RATE				400000				/* Max sampling frequency of ADC peripheral. */
#define ADC_CR_PDN					(1 << 21)
#define ADC_CR_CLKDIV(div)			((div & 0xFF) << 8)
#define ADC_CR_BITACC(bitAccuracy)	((bitAccuracy & 0x7) << 17)
#define START_MODE_BITS				(7 << 24)
#define ADC_CR_EDGE					(1 << 27)

/* Start mode, which controls the start of an A/D conversion when the BURST bit is 0. */
typedef enum
{
	ADC_NO_START = 0,		/* ADC won't start */
	ADC_START_NOW,			/* Start conversion now */
	ADC_START_ON_CTOUT15,	/* Start conversion when the edge selected by bit 27 occurs on CTOUT_15 */
	ADC_START_ON_CTOUT8,	/* Start conversion when the edge selected by bit 27 occurs on CTOUT_8 */
	ADC_START_ON_ADCTRIG0,	/* Start conversion when the edge selected by bit 27 occurs on ADCTRIG0 */
	ADC_START_ON_ADCTRIG1,	/* Start conversion when the edge selected by bit 27 occurs on ADCTRIG1 */
	ADC_START_ON_MCOA2		/* Start conversion when the edge selected by bit 27 occurs on Motocon PWM output MCOA2 */
} ADC_START_MODE_T;

/* @brief Edge configuration, which controls rising or falling edge on the selected signal for the start of a conversion */
typedef enum
{
	ADC_TRIGGERMODE_RISING = 0,		/**< Trigger event: rising edge */
	ADC_TRIGGERMODE_FALLING,		/**< Trigger event: falling edge */
} ADC_EDGE_CFG_T;

/* @brief default setup for ADC0. */
ADC_CLOCK_SETUP_T ADC0_clockSetup =
{
		.adcRate 		= MAX_SAMPLE_RATE,
		.bitsAccuracy 	= 10,
		.burstMode		= false
};

/*==================[internal functions definition]==========================*/
void ADC_disableAllInterrupts( ADC_T *pADC )
{
	pADC->INTEN = 0;
}

/* @brief get the CLKDIV necessary to produce an "adcRate" with the actual clock of the ADC.
 * Note: This function assumes that the ADC is not set in burst mode.
 * The APB clock (PCLK_ADC0) is divided by (CLKDIV+1) to produce the clock for
 * A/D converter, which should be less than or equal to 4.5MHz.
 * A fully conversion requires (bits_accuracy+1) of these clocks.
 * ADC Clock = PCLK_ADC0 / (CLKDIV + 1);
 * ADC rate = ADC clock / (the number of clocks required for each conversion)
 * ->branch clock of the ADC0 is CLK_APB3_ADC0
 * ->base clock of the ADC0 is CLK_BASE_APB3 */
uint8_t ADC0_getClkDiv( uint32_t adcRate )
{
	uint32_t adcBlockFreq = CGU_getClockInputHz(CLK_BASE_APB3);
	uint32_t fullAdcRate = adcRate * NO_BURST_CLKS_NUMBER;
	/* Get the round value by fomular: (2*A + B)/(2*B) */
	uint8_t div = ((adcBlockFreq * 2 + fullAdcRate) / (fullAdcRate * 2)) - 1;
	return div;
}

/* @brief selects start mode for ADC & starts conversion. */
void ADC_setStartMode( ADC_T *pADC, ADC_START_MODE_T startMode, ADC_EDGE_CFG_T edgeOption )
{
	if( (startMode != ADC_START_NOW) && (startMode != ADC_NO_START) )
	{
		if( edgeOption == ADC_TRIGGERMODE_FALLING )
			pADC->CR |= ADC_CR_EDGE;
		else // ADC_TRIGGERMODE_RISING
			pADC->CR &= ~ADC_CR_EDGE;
	}
	uint32_t temp = pADC->CR & (~START_MODE_BITS); // Clear actual start mode
	pADC->CR = temp | (startMode << 24);
}

/*==================[external functions definition]==========================*/
/* @brief enable channel N of the given ADC. Each ADC have 8 channel (0 to 7). */
void ADC_enableChannel( ADC_T *pADC, uint8_t channel )
{
	if( channel < 8 )
		pADC->CR |= (1 << channel);
}

/* @brief disable channel N of the given ADC. */
void ADC_disableChannel( ADC_T *pADC, uint8_t channel )
{
	if( channel < 8 )
			pADC->CR &= ~(1 << channel);
}

/* @brief enable interrupt of channel N of the given ADC. Each ADC have 8 channel (0 to 7). */
void ADC_enableChannelInterrupt( ADC_T *pADC, uint8_t channel )
{
	if( channel < 8 )
		pADC->INTEN |= (1 << channel);
}

/* @brief initializates ADC0 with default settings. */
void ADC0_init( void )
{
	CCU_initADC0Clock();
	ADC_disableAllInterrupts( ADC0 );

	uint8_t div = ADC0_getClkDiv( ADC0_clockSetup.adcRate );
	uint8_t bitAccuracy = ADC0_clockSetup.bitsAccuracy;

	ADC0->CR = 	ADC_CR_PDN 			| 		// Enables ADC operation
				ADC_CR_CLKDIV(div)	|		// Set clock divider to produce the required sampling rate.
				ADC_CR_BITACC(bitAccuracy);	// Set bit accuracy of the conversion.
}

/* @brief reads a value from a channel of the ADC0. */
uint16_t ADC0_read( uint8_t channel )
{
	ADC_enableChannel( ADC0, channel );
	ADC_setStartMode( ADC0, ADC_START_NOW, ADC_TRIGGERMODE_RISING );
	while( ((ADC0->STAT) & (1 << channel)) == 0 ){} // Wait until the adc reading finish
	uint16_t data = (ADC0->DR[channel] >> 6) & 0x3FF;

	return data;
}

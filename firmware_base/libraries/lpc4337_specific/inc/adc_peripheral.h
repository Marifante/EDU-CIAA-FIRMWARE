/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: chip_core
 * @brief Description of the ADC peripherals:
 * The LPC4337 have 2 ADC (ADC0 and ADC1), each with 8 channels
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_ADC_PERIPHERAL_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_PERIPHERAL_H_

/*==================[inclusions]=============================================*/
#include "../../utils.h"

/*==================[macros & constants]=====================================*/
#define ADC0_BASE             0x400E3000
#define ADC0                  ((ADC_T *) ADC0_BASE)

/*==================[external data declaration]==============================*/
/* @brief 10 or 12-bit ADC register block structure */
typedef struct {					/*!< ADCn Structure */
	__IO uint32_t CR;				/*!< A/D Control Register. The AD0CR register must be written to select the operating mode before A/D conversion can occur. */
	__I  uint32_t GDR;				/*!< A/D Global Data Register. Contains the result of the most recent A/D conversion. */
	__I  uint32_t RESERVED0;
	__IO uint32_t INTEN;			/*!< A/D Interrupt Enable Register. This register contains enable bits that allow the DONE flag of each A/D channel to be included or excluded from contributing to the generation of an A/D interrupt. */
	__I  uint32_t DR[8];			/*!< A/D Channel Data Register. This register contains the result of the most recent conversion completed on channel n. */
	__I  uint32_t STAT;				/*!< A/D Status Register. This register contains DONE and OVERRUN flags for all of the A/D channels, as well as the A/D interrupt flag. */
} ADC_T;


/* @brief  clock structure setup for ADC controller. */
typedef struct {
	uint32_t adcRate;		/*!< ADC rate */
	uint8_t  bitsAccuracy;	/*!< ADC bit accuracy */
	bool     burstMode;		/*!< ADC Burst Mode */
} ADC_CLOCK_SETUP_T;

/*==================[external functions definition]==========================*/
/* @brief initializates ADC0 with default settings. */
void ADC0_init( void );
/* @brief enable channel N of the given ADC. Each ADC have 8 channel (0 to 7). */
void ADC_enableChannel( ADC_T *pADC, uint8_t channel );
/* @brief disable channel N of the given ADC. */
void ADC_disableChannel( ADC_T *pADC, uint8_t channel );
/* @brief enable interrupt of channel N of the given ADC. Each ADC have 8 channel (0 to 7). */
void ADC_enableChannelInterrupt( ADC_T *pADC, uint8_t channel );
/* @brief reads a value from a channel of the ADC0. */
uint16_t ADC0_read( uint8_t channel );

#endif /*_LIBRARIES_LPC4337_SPECIFIC_INC_ADC_PERIPHERAL_H_ */

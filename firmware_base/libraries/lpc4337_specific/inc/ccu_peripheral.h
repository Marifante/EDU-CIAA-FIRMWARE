/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: ccu_peripheral
 *
 * La CCU (Clock Control Unit) es el periferico que se encarga de controlar
 * las seniales de reloj para el resto de los perifericos.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_CCU_PERIPHERAL_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_CCU_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"
#include "timer_peripheral.h"

/*==================[macros and definitions]=================================*/

#define CCU1_BASE				0x40051000
#define CCU2_BASE				0x40052000

#define CCU1					((CCU1_T*) CCU1_BASE)
#define CCU2					((CCU2_T*) CCU2_BASE)

/*==================[external data declaration]==============================*/

/* @brief Peripheral clocks
 * Peripheral clocks are individual clocks routed to peripherals. Although
 * multiple peripherals may share a same base clock, each peripheral's clock
 * can be enabled or disabled individually. Some peripheral clocks also have
 * additional dividers associated with them. */
typedef enum CHIP_CCU_CLK
{
	/* CCU1 clocks */
	CLK_APB3_BUS,		/*!< APB3 bus clock from base clock CLK_BASE_APB3 */
	CLK_APB3_I2C1,		/*!< I2C1 register/perigheral clock from base clock CLK_BASE_APB3 */
	CLK_APB3_DAC,		/*!< DAC peripheral clock from base clock CLK_BASE_APB3 */
	CLK_APB3_ADC0,		/*!< ADC0 register/perigheral clock from base clock CLK_BASE_APB3 */
	CLK_APB3_ADC1,		/*!< ADC1 register/perigheral clock from base clock CLK_BASE_APB3 */
	CLK_APB3_CAN0,		/*!< CAN0 register/perigheral clock from base clock CLK_BASE_APB3 */
	CLK_APB1_BUS = 32,	/*!< APB1 bus clock clock from base clock CLK_BASE_APB1 */
	CLK_APB1_MOTOCON,	/*!< Motor controller register/perigheral clock from base clock CLK_BASE_APB1 */
	CLK_APB1_I2C0,		/*!< I2C0 register/perigheral clock from base clock CLK_BASE_APB1 */
	CLK_APB1_I2S,		/*!< I2S register/perigheral clock from base clock CLK_BASE_APB1 */
	CLK_APB1_CAN1,		/*!< CAN1 register/perigheral clock from base clock CLK_BASE_APB1 */
	CLK_SPIFI = 64,		/*!< SPIFI SCKI input clock from base clock CLK_BASE_SPIFI */
	CLK_MX_BUS = 96,	/*!< M3/M4 BUS core clock from base clock CLK_BASE_MX */
	CLK_MX_SPIFI,		/*!< SPIFI register clock from base clock CLK_BASE_MX */
	CLK_MX_GPIO,		/*!< GPIO register clock from base clock CLK_BASE_MX */
	CLK_MX_LCD,			/*!< LCD register clock from base clock CLK_BASE_MX */
	CLK_MX_ETHERNET,	/*!< ETHERNET register clock from base clock CLK_BASE_MX */
	CLK_MX_USB0,		/*!< USB0 register clock from base clock CLK_BASE_MX */
	CLK_MX_EMC,			/*!< EMC clock from base clock CLK_BASE_MX */
	CLK_MX_SDIO,		/*!< SDIO register clock from base clock CLK_BASE_MX */
	CLK_MX_DMA,			/*!< DMA register clock from base clock CLK_BASE_MX */
	CLK_MX_MXCORE,		/*!< M3/M4 CPU core clock from base clock CLK_BASE_MX */
	RESERVED_ALIGN = CLK_MX_MXCORE + 3,
	CLK_MX_SCT,			/*!< SCT register clock from base clock CLK_BASE_MX */
	CLK_MX_USB1,		/*!< USB1 register clock from base clock CLK_BASE_MX */
	CLK_MX_EMC_DIV,		/*!< ENC divider clock from base clock CLK_BASE_MX */
	CLK_MX_FLASHA,		/*!< FLASHA bank clock from base clock CLK_BASE_MX */
	CLK_MX_FLASHB,		/*!< FLASHB bank clock from base clock CLK_BASE_MX */
	CLK_M4_M0APP,		/*!< M0 app CPU core clock from base clock CLK_BASE_MX */
	CLK_MX_ADCHS,		/*!< ADCHS clock from base clock CLK_BASE_ADCHS */
	CLK_MX_EEPROM,		/*!< EEPROM clock from base clock CLK_BASE_MX */
	CLK_MX_WWDT = 128,	/*!< WWDT register clock from base clock CLK_BASE_MX */
	CLK_MX_UART0,		/*!< UART0 register clock from base clock CLK_BASE_MX */
	CLK_MX_UART1,		/*!< UART1 register clock from base clock CLK_BASE_MX */
	CLK_MX_SSP0,		/*!< SSP0 register clock from base clock CLK_BASE_MX */
	CLK_MX_TIMER0,		/*!< TIMER0 register/perigheral clock from base clock CLK_BASE_MX */
	CLK_MX_TIMER1,		/*!< TIMER1 register/perigheral clock from base clock CLK_BASE_MX */
	CLK_MX_SCU,			/*!< SCU register/perigheral clock from base clock CLK_BASE_MX */
	CLK_MX_CREG,		/*!< CREG clock from base clock CLK_BASE_MX */
	CLK_MX_RITIMER = 160,	/*!< RITIMER register/perigheral clock from base clock CLK_BASE_MX */
	CLK_MX_UART2,		/*!< UART3 register clock from base clock CLK_BASE_MX */
	CLK_MX_UART3,		/*!< UART4 register clock from base clock CLK_BASE_MX */
	CLK_MX_TIMER2,		/*!< TIMER2 register/perigheral clock from base clock CLK_BASE_MX */
	CLK_MX_TIMER3,		/*!< TIMER3 register/perigheral clock from base clock CLK_BASE_MX */
	CLK_MX_SSP1,		/*!< SSP1 register clock from base clock CLK_BASE_MX */
	CLK_MX_QEI,			/*!< QEI register/perigheral clock from base clock CLK_BASE_MX */
	CLK_PERIPH_BUS = 192,	/*!< Peripheral bus clock from base clock CLK_BASE_PERIPH */
	CLK_RESERVED3,
	CLK_PERIPH_CORE,	/*!< Peripheral core clock from base clock CLK_BASE_PERIPH */
	CLK_PERIPH_SGPIO,	/*!< SGPIO clock from base clock CLK_BASE_PERIPH */
	CLK_USB0 = 224,			/*!< USB0 clock from base clock CLK_BASE_USB0 */
	CLK_USB1 = 256,			/*!< USB1 clock from base clock CLK_BASE_USB1 */
	CLK_SPI = 288,			/*!< SPI clock from base clock CLK_BASE_SPI */
	CLK_ADCHS = 320,		/*!< ADCHS clock from base clock CLK_BASE_ADCHS */
	CLK_CCU1_LAST,

	/* CCU2 clocks */
	CLK_CCU2_START,
	CLK_APLL = CLK_CCU2_START,	/*!< Audio PLL clock from base clock CLK_BASE_APLL */
	RESERVED_ALIGNB = CLK_CCU2_START + 31,
	CLK_APB2_UART3,			/*!< UART3 clock from base clock CLK_BASE_UART3 */
	RESERVED_ALIGNC = CLK_CCU2_START + 63,
	CLK_APB2_UART2,			/*!< UART2 clock from base clock CLK_BASE_UART2 */
	RESERVED_ALIGND = CLK_CCU2_START + 95,
	CLK_APB0_UART1,			/*!< UART1 clock from base clock CLK_BASE_UART1 */
	RESERVED_ALIGNE = CLK_CCU2_START + 127,
	CLK_APB0_UART0,			/*!< UART0 clock from base clock CLK_BASE_UART0 */
	RESERVED_ALIGNF = CLK_CCU2_START + 159,
	CLK_APB2_SSP1,			/*!< SSP1 clock from base clock CLK_BASE_SSP1 */
	RESERVED_ALIGNG = CLK_CCU2_START + 191,
	CLK_APB0_SSP0,			/*!< SSP0 clock from base clock CLK_BASE_SSP0 */
	RESERVED_ALIGNH = CLK_CCU2_START + 223,
	CLK_APB2_SDIO,			/*!< SDIO clock from base clock CLK_BASE_SDIO */
	CLK_CCU2_LAST
} CHIP_CCU_CLK_T;


// CCU clock config/status register pair
typedef struct {
	unsigned int	CFG;					// CCU clock configuration register
	unsigned		STAT;					// CCU clock status register
} _CCU_CFGSTAT_T;

// @brief CCU1 register block structure
typedef struct {
	unsigned int	PM;						// CCU1 power mode register
	unsigned int	BASE_STAT;				// CCU1 base clocks status register
	unsigned int	RESERVED0[62];
	_CCU_CFGSTAT_T	CLKCCU[CLK_CCU1_LAST];	// Start of CCU1 clock registers
} CCU1_T;

// @brief CCU2 register block structure
typedef struct {							/*!< (@ 0x40052000) CCU2 Structure         */
	__IO uint32_t  PM;						/*!< (@ 0x40052000) Power mode register    */
	__I  uint32_t  BASE_STAT;				/*!< (@ 0x40052004) CCU base clocks status register */
	__I  uint32_t  RESERVED0[62];
	_CCU_CFGSTAT_T  CLKCCU[CLK_CCU2_LAST - CLK_CCU1_LAST];	/*!< (@ 0x40052100) Start of CCU2 clock registers */
} CCU2_T;


/*==================[external functions declaration]=========================*/

/* @brief Enables a peripheral clock. */
void CCU_clockEnable( CHIP_CCU_CLK_T clk );

/* @brief enable timer clock. */
void CCU_enableTimerClock( uint8_t chosenTimer );

/* @brief enables UART2 branch clock. */
void CCU_initUART2PeripheralClk( void );

#endif /*_LIBRARIES_LPC4337_SPECIFIC_INC_CCU_PERIPHERAL_H_*/

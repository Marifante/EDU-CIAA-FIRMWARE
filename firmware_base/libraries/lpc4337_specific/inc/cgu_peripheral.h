/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: cgu_peripheral
 *
 * La CGU (Clock Generation Unit) es el periferico que se encarga de generar
 * las seniales de reloj para el resto de los perifericos.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_CGU_PERIPHERAL_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_CGU_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

#define CGU_BASE				0x40050000
#define CGU						((CGU_T*) CGU_BASE)

#define CHIP_LPC43XX
/*==================[external data declaration]==============================*/
/**
 * @brief CGU base clocks
 * CGU base clocks are clocks that are associated with a single input clock
 * and are routed out to 1 or more peripherals. For example, the CLK_BASE_PERIPH
 * clock can be configured to use the CLKIN_MAINPLL input clock, which will in
 * turn route that clock to the CLK_PERIPH_BUS, CLK_PERIPH_CORE, and
 * CLK_PERIPH_SGPIO periphral clocks.
 */
typedef enum CHIP_CGU_BASE_CLK {
	CLK_BASE_SAFE,		/*!< Base clock for WDT oscillator, IRC input only */
	CLK_BASE_USB0,		/*!< Base USB clock for USB0, USB PLL input only */
#if defined(CHIP_LPC43XX)
	CLK_BASE_PERIPH,	/*!< Base clock for SGPIO */
#else
	CLK_BASE_RESERVED1,
#endif
	CLK_BASE_USB1,		/*!< Base USB clock for USB1 */
	CLK_BASE_MX,		/*!< Base clock for CPU core */
	CLK_BASE_SPIFI,		/*!< Base clock for SPIFI */
#if defined(CHIP_LPC43XX)
	CLK_BASE_SPI,		/*!< Base clock for SPI */
#else
	CLK_BASE_RESERVED2,
#endif
	CLK_BASE_PHY_RX,	/*!< Base clock for PHY RX */
	CLK_BASE_PHY_TX,	/*!< Base clock for PHY TX */
	CLK_BASE_APB1,		/*!< Base clock for APB1 group */
	CLK_BASE_APB3,		/*!< Base clock for APB3 group */
	CLK_BASE_LCD,		/*!< Base clock for LCD pixel clock */
#if defined(CHIP_LPC43XX)
	CLK_BASE_ADCHS,		/*!< Base clock for ADCHS */
#else
	CLK_BASE_RESERVED3,
#endif
	CLK_BASE_SDIO,		/*!< Base clock for SDIO */
	CLK_BASE_SSP0,		/*!< Base clock for SSP0 */
	CLK_BASE_SSP1,		/*!< Base clock for SSP1 */
	CLK_BASE_UART0,		/*!< Base clock for UART0 */
	CLK_BASE_UART1,		/*!< Base clock for UART1 */
	CLK_BASE_UART2,		/*!< Base clock for UART2 */
	CLK_BASE_UART3,		/*!< Base clock for UART3 */
	CLK_BASE_OUT,		/*!< Base clock for CLKOUT pin */
	CLK_BASE_RESERVED4,
	CLK_BASE_RESERVED5,
	CLK_BASE_RESERVED6,
	CLK_BASE_RESERVED7,
	CLK_BASE_APLL,		/*!< Base clock for audio PLL */
	CLK_BASE_CGU_OUT0,	/*!< Base clock for CGUOUT0 pin */
	CLK_BASE_CGU_OUT1,	/*!< Base clock for CGUOUT1 pin */
	CLK_BASE_LAST,
	CLK_BASE_NONE = CLK_BASE_LAST
} CHIP_CGU_BASE_CLK_T;

/* @brief CGU dividers
 * CGU dividers provide an extra clock state where a specific clock can be
 * divided before being routed to a peripheral group. A divider accepts an
 * input clock and then divides it. To use the divided clock for a base clock
 * group, use the divider as the input clock for the base clock (for example,
 * use CLKIN_IDIVB, where CLKIN_MAINPLL might be the input into the divider). */
typedef enum CHIP_CGU_IDIV {
	CLK_IDIV_A,		/*!< CGU clock divider A */
	CLK_IDIV_B,		/*!< CGU clock divider B */
	CLK_IDIV_C,		/*!< CGU clock divider A */
	CLK_IDIV_D,		/*!< CGU clock divider D */
	CLK_IDIV_E,		/*!< CGU clock divider E */
	CLK_IDIV_LAST
} CHIP_CGU_IDIV_T;

/* Audio or USB PLL selection */
typedef enum CHIP_CGU_USB_AUDIO_PLL {
	CGU_USB_PLL,
	CGU_AUDIO_PLL
} CHIP_CGU_USB_AUDIO_PLL_T;

/* @brief PLL register block */
typedef struct {
	__I  uint32_t  PLL_STAT;				/*!< PLL status register */
	__IO uint32_t  PLL_CTRL;				/*!< PLL control register */
	__IO uint32_t  PLL_MDIV;				/*!< PLL M-divider register */
	__IO uint32_t  PLL_NP_DIV;				/*!< PLL N/P-divider register */
} CGU_PLL_REG_T;

/* @brief LPC18XX/43XX CGU register block structure */
typedef struct {							/*!< (@ 0x40050000) CGU Structure          */
	__I  uint32_t  RESERVED0[5];
	__IO uint32_t  FREQ_MON;				/*!< (@ 0x40050014) Frequency monitor register */
	__IO uint32_t  XTAL_OSC_CTRL;			/*!< (@ 0x40050018) Crystal oscillator control register */
	CGU_PLL_REG_T  PLL[CGU_AUDIO_PLL + 1];	/*!< (@ 0x4005001C) USB and audio PLL blocks */
	__IO uint32_t  PLL0AUDIO_FRAC;			/*!< (@ 0x4005003C) PLL0 (audio)           */
	__I  uint32_t  PLL1_STAT;				/*!< (@ 0x40050040) PLL1 status register   */
	__IO uint32_t  PLL1_CTRL;				/*!< (@ 0x40050044) PLL1 control register  */
	__IO uint32_t  IDIV_CTRL[CLK_IDIV_LAST];/*!< (@ 0x40050048) Integer divider A-E control registers */
	__IO uint32_t  BASE_CLK[CLK_BASE_LAST];	/*!< (@ 0x4005005C) Start of base clock registers */
} CGU_T;

/* @brief CGU clock input list
 * This enum matches the bits 28:24 of the control register
 * of the CGU of each clock. Is the input for each clock. */
typedef enum CHIP_CGU_CLKIN {
	CLKIN_32K,		/*!< External 32KHz input */
	CLKIN_IRC,		/*!< Internal IRC (12MHz) input */
	CLKIN_ENET_RX,	/*!< External ENET_RX pin input */
	CLKIN_ENET_TX,	/*!< External ENET_TX pin input */
	CLKIN_CLKIN,	/*!< External GPCLKIN pin input */
	CLKIN_RESERVED1,
	CLKIN_CRYSTAL,	/*!< External (main) crystal pin input */
	CLKIN_USBPLL,	/*!< Internal USB PLL input */
	CLKIN_AUDIOPLL,	/*!< Internal Audio PLL input */
	CLKIN_MAINPLL,	/*!< Internal Main PLL input */
	CLKIN_RESERVED2,
	CLKIN_RESERVED3,
	CLKIN_IDIVA,	/*!< Internal divider A input */
	CLKIN_IDIVB,	/*!< Internal divider B input */
	CLKIN_IDIVC,	/*!< Internal divider C input */
	CLKIN_IDIVD,	/*!< Internal divider D input */
	CLKIN_IDIVE,	/*!< Internal divider E input */
	CLKINPUT_PD		/*!< External 32KHz input */
} CHIP_CGU_CLKIN_T;

/*==================[external functions declaration]==========================*/
/* @brief get UART2 input clock frequency. */
uint32_t CGU_getUART2InputClk( void );
/* @brief get SCT input clock frequency. */
uint32_t CGU_getSCTInputClkFreq( void );

uint32_t CGU_getClockInputHz( CHIP_CGU_CLKIN_T input );

#endif /*_LIBRARIES_LPC4337_SPECIFIC_INC_CGU_PERIPHERAL_H_*/

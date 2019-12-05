/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: cgu_ccu_peripheral
 *
 * La CGU (Clock Generation Unit) es el periferico que se encarga de generar
 * las seniales de reloj para el resto de los perifericos.
 * La CCU (Clock Control Unit) es el periferico que se encarga de controlar
 * las seniales de reloj para el resto de los perifericos.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef _CGU_CCU_PERIPHERAL_H_
#define _CGU_CCU_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

#define CGU_BASE				0x40050000
#define CCU1_BASE				0x40051000
#define CCU2_BASE				0x40052000

#define CGU						((CGU_T*) CGU_BASE)
#define CCU1					((CCU1_T*) CCU1_BASE)
#define CCU2					((CCU2_T*) CCU2_BASE)


#define CLK_BASE_UART2			18
#define	CLK_CCU1_LAST			321
#define CLK_CCU2_START			322
#define CLK_APB2_UART2			386

#define CGU_IRC_FREQ			12000000
#define CRYSTAL_32K_FREQ_IN		(32*1024)


/*==================[external data declaration]==============================*/
/**
 * @brief CGU clock input list
 * This enum matches the bits 28:24 of the control register
 * of the CGU of each clock. Is the input for each clock.
 */
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

// CCU clock config/status register pair
typedef struct {
	unsigned int	CFG;					// CCU clock configuration register
	unsigned		STAT;					// CCU clock status register
} _CCU_CFGSTAT_T;

// CCU1 register block structure
typedef struct {
	unsigned int	PM;						// CCU1 power mode register
	unsigned int	BASE_STAT;				// CCU1 base clocks status register
	unsigned int	RESERVED0[62];
	_CCU_CFGSTAT_T	CLKCCU[CLK_CCU1_LAST];	// Start of CCU1 clock registers
} CCU1_T;

/*==================[external functions declaration]==========================/
/* @brief enable UART clock. */
void CCU_enableUARTClk( void );

#endif /*_CGU_CCU_PERIPHERAL_H_*/

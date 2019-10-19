/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: creg_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _CREG_PERIPHERAL_H_
#define _CREG_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

/* For CREG register	*/
#define LPC_CREG_BASE			0x40043000
#define LPC_CREG				((LPC_CREG_T*) LPC_CREG_BASE)


/*==================[external data declaration]==============================*/
/**
 * @brief CREG Register Block
 */
typedef struct {						/*!< CREG Structure         */
	__I  uint32_t  RESERVED0;
	__IO uint32_t  CREG0;				/*!< Chip configuration register 32 kHz oscillator output and BOD control register. */
	__I  uint32_t  RESERVED1[62];
	__IO uint32_t  MXMEMMAP;			/*!< ARM Cortex-M3/M4 memory mapping */
#if defined(CHIP_LPC18XX)
	__I  uint32_t  RESERVED2[5];
#else
	__I  uint32_t  RESERVED2;
	__I  uint32_t  CREG1;				/*!< Configuration Register 1 */
	__I  uint32_t  CREG2;				/*!< Configuration Register 2 */
	__I  uint32_t  CREG3;				/*!< Configuration Register 3 */
	__I  uint32_t  CREG4;				/*!< Configuration Register 4 */
#endif
	__IO uint32_t  CREG5;				/*!< Chip configuration register 5. Controls JTAG access. */
	__IO uint32_t  DMAMUX;				/*!< DMA muxing control     */
	__IO uint32_t  FLASHCFGA;			/*!< Flash accelerator configuration register for flash bank A */
	__IO uint32_t  FLASHCFGB;			/*!< Flash accelerator configuration register for flash bank B */
	__IO uint32_t  ETBCFG;				/*!< ETB RAM configuration  */
	__IO uint32_t  CREG6;				/*!< Chip configuration register 6. */
#if defined(CHIP_LPC18XX)
	__I  uint32_t  RESERVED4[52];
#else
	__IO uint32_t  M4TXEVENT;			/*!< M4 IPC event register */
	__I  uint32_t  RESERVED4[51];
#endif
	__I  uint32_t  CHIPID;				/*!< Part ID                */
#if defined(CHIP_LPC18XX)
	__I  uint32_t  RESERVED5[191];
#else
	__I  uint32_t  RESERVED5[65];
	__IO uint32_t  M0SUBMEMMAP;         /*!< M0SUB IPC Event memory mapping */
	__I  uint32_t  RESERVED6[2];
	__IO uint32_t  M0SUBTXEVENT;        /*!< M0SUB IPC Event register */
	__I  uint32_t  RESERVED7[58];
	__IO uint32_t  M0APPTXEVENT;		/*!< M0APP IPC Event register */
	__IO uint32_t  M0APPMEMMAP;			/*!< ARM Cortex M0APP memory mapping */
	__I  uint32_t  RESERVED8[62];
#endif
	__IO uint32_t  USB0FLADJ;			/*!< USB0 frame length adjust register */
	__I  uint32_t  RESERVED9[63];
	__IO uint32_t  USB1FLADJ;			/*!< USB1 frame length adjust register */
} LPC_CREG_T;

#endif /* _CREG_PERIPHERAL_H_ */

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

/**
 * @brief GPDMA request connections
 * The DMA buses are multiplexed. So must to choose what peripheral is using a certain
 * channel
 */
typedef enum{
	GPDMA_CONN_MEMORY = 			((0UL)),	/**< MEMORY             */
	GPDMA_CONN_MAT0_0 = 			((1UL)),	/**< MAT0.0             */
	GPDMA_CONN_UART0_Tx = 			((2UL)),	/**< UART0 Tx           */
	GPDMA_CONN_MAT0_1 = 			((3UL)),	/**< MAT0.1             */
	GPDMA_CONN_UART0_Rx = 			((4UL)),	/**< UART0 Rx           */
	GPDMA_CONN_MAT1_0 = 			((5UL)),	/**< MAT1.0             */
	GPDMA_CONN_UART1_Tx = 			((6UL)),	/**< UART1 Tx           */
	GPDMA_CONN_MAT1_1 = 			((7UL)),	/**< MAT1.1             */
	GPDMA_CONN_UART1_Rx = 			((8UL)),	/**< UART1 Rx           */
	GPDMA_CONN_MAT2_0 = 			((9UL)),	/**< MAT2.0             */
	GPDMA_CONN_UART2_Tx = 			((10UL)),	/**< UART2 Tx           */
	GPDMA_CONN_MAT2_1 = 			((11UL)),	/**< MAT2.1             */
	GPDMA_CONN_UART2_Rx = 			((12UL)),	/**< UART2 Rx           */
	GPDMA_CONN_MAT3_0 = 			((13UL)),	/**< MAT3.0             */
	GPDMA_CONN_UART3_Tx = 			((14UL)),	/**< UART3 Tx           */
	GPDMA_CONN_SCT_0 = 				((15UL)),	/**< SCT timer channel 0*/
	GPDMA_CONN_MAT3_1 = 			((16UL)),	/**< MAT3.1             */
	GPDMA_CONN_UART3_Rx = 			((17UL)),	/**< UART3 Rx           */
	GPDMA_CONN_SCT_1 = 				((18UL)),	/**< SCT timer channel 1*/
	GPDMA_CONN_SSP0_Rx = 			((19UL)),	/**< SSP0 Rx            */
	GPDMA_CONN_I2S_Tx_Channel_0 = 	((20UL)),	/**< I2S0 Tx on channel 0 */
	GPDMA_CONN_SSP0_Tx = 			((21UL)),	/**< SSP0 Tx            */
	GPDMA_CONN_I2S_Rx_Channel_1 = 	((22UL)),	/**< I2S0 Rx on channel 0 */
	GPDMA_CONN_SSP1_Rx =			((23UL)),	/**< SSP1 Rx            */
	GPDMA_CONN_SSP1_Tx =			((24UL)),	/**< SSP1 Tx            */
	GPDMA_CONN_ADC_0 = 				((25UL)),	/**< ADC 0              */
	GPDMA_CONN_ADC_1 = 				((26UL)),	/**< ADC 1              */
	GPDMA_CONN_DAC = 				((27UL)),	/**< DAC                */
	GPDMA_CONN_I2S1_Tx_Channel_0 = 	((28UL)),	/**< I2S1 Tx on channel 0 */
	GPDMA_CONN_I2S1_Rx_Channel_1 = 	((29UL))	/**< I2S1 Rx on channel 0 */
}gpdma_mux_peripheral;


/*====================[external functions declaration]========================*/

/*
 * @brief The peripherals connected to DMA are Multiplexed. They are multiplexed
 * in 16 groups of 4 pheripherals. Only one pheripheral of each group can be connected
 * to the DMA. With this function, we can choose one pheripheral to be connected to the
 * DMA.
 * @return Group to who belongs the desired pheripheral to connect to DMA.
 * */
uint8_t configDMAmux( gpdma_mux_peripheral peripheral_connection_number );


#endif /* _CREG_PERIPHERAL_H_ */

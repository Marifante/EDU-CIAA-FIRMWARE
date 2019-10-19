/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: gpdma_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _GPDMA_PERIPHERAL_H_
#define _GPDMA_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"
#include "creg_peripheral.h"

/*==================[macros and definitions]=================================*/

#define LPC_GPDMA_BASE            0x40002000
#define LPC_GPDMA                 ((LPC_GPDMA_T            *) LPC_GPDMA_BASE)

/*==================[internal data declaration]==============================*/
/**
 * @brief GPDMA Type of DMA controller
 */
typedef enum {
	GPDMA_TRANSFERTYPE_M2M_CONTROLLER_DMA              = ((0UL)),	/*!< Memory to memory - DMA control */
	GPDMA_TRANSFERTYPE_M2P_CONTROLLER_DMA              = ((1UL)),	/*!< Memory to peripheral - DMA control */
	GPDMA_TRANSFERTYPE_P2M_CONTROLLER_DMA              = ((2UL)),	/*!< Peripheral to memory - DMA control */
	GPDMA_TRANSFERTYPE_P2P_CONTROLLER_DMA              = ((3UL)),	/*!< Source peripheral to destination peripheral - DMA control */
	GPDMA_TRANSFERTYPE_P2P_CONTROLLER_DestPERIPHERAL   = ((4UL)),	/*!< Source peripheral to destination peripheral - destination peripheral control */
	GPDMA_TRANSFERTYPE_M2P_CONTROLLER_PERIPHERAL       = ((5UL)),	/*!< Memory to peripheral - peripheral control */
	GPDMA_TRANSFERTYPE_P2M_CONTROLLER_PERIPHERAL       = ((6UL)),	/*!< Peripheral to memory - peripheral control */
	GPDMA_TRANSFERTYPE_P2P_CONTROLLER_SrcPERIPHERAL    = ((7UL))	/*!< Source peripheral to destination peripheral - source peripheral control */
} GPDMA_FLOW_CONTROL_T;

/* @brief GPDMA structure using for DMA configuration
 */
typedef struct {
	uint32_t ChannelNum;	/*!< DMA channel number, should be in
							 *  range from 0 to 7.
							 *  Note: DMA channel 0 has the highest priority
							 *  and DMA channel 7 the lowest priority.
							 */
	uint32_t TransferSize;	/*!< Length/Size of transfer */
	uint32_t TransferWidth;	/*!< Transfer width - used for TransferType is GPDMA_TRANSFERTYPE_M2M only */
	uint32_t SrcAddr;		/*!< Physical Source Address, used in case TransferType is chosen as
							 *   GPDMA_TRANSFERTYPE_M2M or GPDMA_TRANSFERTYPE_M2P */
	uint32_t DstAddr;		/*!< Physical Destination Address, used in case TransferType is chosen as
							 *   GPDMA_TRANSFERTYPE_M2M or GPDMA_TRANSFERTYPE_P2M */
	uint32_t TransferType;	/*!< Transfer Type, should be one of the following:
							 * - GPDMA_TRANSFERTYPE_M2M: Memory to memory - DMA control
							 * - GPDMA_TRANSFERTYPE_M2P: Memory to peripheral - DMA control
							 * - GPDMA_TRANSFERTYPE_P2M: Peripheral to memory - DMA control
							 * - GPDMA_TRANSFERTYPE_P2P: Source peripheral to destination peripheral - DMA control
							 */
} GPDMA_CH_CFG_T;

/*==================[external data declaration]==============================*/

/**
 * @brief Number of channels on GPDMA
 */
#define GPDMA_NUMBER_CHANNELS 8

/**
 * @brief GPDMA Channel register block structure
 */
typedef struct {
	__IO uint32_t  SRCADDR;				/*!< DMA Channel Source Address Register */
	__IO uint32_t  DESTADDR;			/*!< DMA Channel Destination Address Register */
	__IO uint32_t  LLI;					/*!< DMA Channel Linked List Item Register */
	__IO uint32_t  CONTROL;				/*!< DMA Channel Control Register */
	__IO uint32_t  CONFIG;				/*!< DMA Channel Configuration Register */
	__I  uint32_t  RESERVED1[3];
} GPDMA_CH_T;

/**
 * @brief GPDMA register block
 */
typedef struct {						/*!< GPDMA Structure */
	__I  uint32_t  INTSTAT;				/*!< DMA Interrupt Status Register */
	__I  uint32_t  INTTCSTAT;			/*!< DMA Interrupt Terminal Count Request Status Register */
	__O  uint32_t  INTTCCLEAR;			/*!< DMA Interrupt Terminal Count Request Clear Register */
	__I  uint32_t  INTERRSTAT;			/*!< DMA Interrupt Error Status Register */
	__O  uint32_t  INTERRCLR;			/*!< DMA Interrupt Error Clear Register */
	__I  uint32_t  RAWINTTCSTAT;		/*!< DMA Raw Interrupt Terminal Count Status Register */
	__I  uint32_t  RAWINTERRSTAT;		/*!< DMA Raw Error Interrupt Status Register */
	__I  uint32_t  ENBLDCHNS;			/*!< DMA Enabled Channel Register */
	__IO uint32_t  SOFTBREQ;			/*!< DMA Software Burst Request Register */
	__IO uint32_t  SOFTSREQ;			/*!< DMA Software Single Request Register */
	__IO uint32_t  SOFTLBREQ;			/*!< DMA Software Last Burst Request Register */
	__IO uint32_t  SOFTLSREQ;			/*!< DMA Software Last Single Request Register */
	__IO uint32_t  CONFIG;				/*!< DMA Configuration Register */
	__IO uint32_t  SYNC;				/*!< DMA Synchronization Register */
	__I  uint32_t  RESERVED0[50];
	GPDMA_CH_T     CH[GPDMA_NUMBER_CHANNELS];
} LPC_GPDMA_T;

/*
 * @brief Linked list node struct
 * */
typedef struct{
	uint32_t src_address;
	uint32_t dest_address;
	uint32_t next_lli_address;
	uint32_t control;	//DMACCxControl register
}lli_node_t;

/*====================[internal data declaration]==========================*/

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
}gpdma_connected_peripheral;


/*====================[external functions declaration]=======================*/

/*
 * @brief The peripherals connected to DMA are Multiplexed. They are multiplexed
 * in 16 groups of 4 pheripherals. Only one pheripheral of each group can be connected
 * to the DMA. With this function, we can choose one pheripheral to be connected to the
 * DMA.
 * @return Group to who belongs the desired pheripheral to connect to DMA.
 * */
uint8_t configDMAmux(gpdma_connected_peripheral peripheral_connection_number);

/*
 * @brief creates linked list for data transfer
 * */
void Chip_GPDMA_CreateLLI( lli_node_t *lli_struct, uint32_t *src, uint32_t *dest, uint32_t *next_lli, uint32_t *control);


/*
 * @brief Configs the DMA channel with the settings that are in
 * */
void Chip_GPDMA_InitChannelCfg(LPC_GPDMA_T *pGPDMA,			/*	GPDMA base struct	*/
							  GPDMA_CH_CFG_T *GPDMACfg,			/*	Struct with the settings to be configured	*/
							  uint8_t  ChannelNum,				/*	Channel number, must be from 0 to 7	*/
							  uint32_t src,						/*	Memory address or peripheral connection ID of the source	*/
							  uint32_t dst,						/*	Memory address or peripheral connection ID of the source	*/
							  uint32_t Size,					/*	Number of DMA transfers	*/
							  GPDMA_FLOW_CONTROL_T TransferType	/*	Select the transfer controller and the type of transfer	*/
							  );

#endif /* _GPDMA_PERIPHERAL_H_ */

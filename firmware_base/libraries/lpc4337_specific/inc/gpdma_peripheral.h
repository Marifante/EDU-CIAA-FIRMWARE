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

/* @brief macros for the function who creates the config word for the channels */
#define GPDMA_PERIPHERAL_SPIFI 0x0
#define GPDMA_PERIPHERAL_SCT_MATCH2 0x0
#define GPDMA_PERIPHERAL_SGPIO14 0x0
#define GPDMA_PERIPHERAL_TIMER3_MATCH3 0x0
#define GPDMA_PERIPHERAL_TIMER0_MATCH0 0x1
#define GPDMA_PERIPHERAL_USART0_TX 0x1
#define GPDMA_PERIPHERAL_AES_IN 0x1
#define GPDMA_PERIPHERAL_TIMER0_MATCH1 0x2
#define GPDMA_PERIPHERAL_USART0_RX 0x2
#define GPDMA_PERIPHERAL_AES_OUT 0x2
/*
 * ... (COMPLETAR) ...
 * */
#define GPDMA_PERIPHERAL_DAC 0xF
#define GPDMA_PERIPHERAL_SCT_MATCH3 0xF
#define GPDMA_PERIPHERAL_SGPIO15 0xF
#define GPDMA_PERIPHERAL_TIMER3_MATCH0 0xF

/* Hardcodeado, pero no deberia */
#define GPDMA_CLOCK		204000000

/*==================[internal data declaration]==============================*/
/* @brief GPDMA Type of DMA controller */
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

/* @brief GPDMA structure using for DMA configuration */
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

/* @brief Number of channels on GPDMA */
#define GPDMA_NUMBER_CHANNELS 8

/* @brief GPDMA Channel register block structure */
typedef struct {
	__IO uint32_t  SRCADDR;				/*!< DMA Channel Source Address Register */
	__IO uint32_t  DESTADDR;			/*!< DMA Channel Destination Address Register */
	__IO uint32_t  LLI;					/*!< DMA Channel Linked List Item Register */
	__IO uint32_t  CONTROL;				/*!< DMA Channel Control Register */
	__IO uint32_t  CONFIG;				/*!< DMA Channel Configuration Register */
	__I  uint32_t  RESERVED1[3];
} GPDMA_CH_T;

/* @brief GPDMA register block */
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

/* @brief Linked list node struct */
typedef struct{
	uint32_t src_address;
	uint32_t dest_address;
	uint32_t next_lli_address;
	uint32_t control;	//DMACCxControl register
}lli_t;

/* @brief enum for burst size */
typedef enum{
	ONE_DBURST = 			(0x0U), //1
	FOUR_DBURST = 			(0x1U), //4
	EIGTH_DBURST = 			(0x2U),	//8
	SIXTEEN_DBURST = 		(0x3U),	//16
	THIRTYTWO_DBURST = 		(0x4U),	//32
	SIXTYFOUR_DBURST = 		(0x5U),	//64
	ONEHUNDRED_DBURST = 	(0x7U),	//128
	TWOHUNDRED_DBURST = 	(0x8U)	//256
}burst_size_t;

/* @brief enum for the size of each single datum of a transfer */
typedef enum{
	BYTE_DATUM = 			(0x0U),
	HALFWORD_DATUM = 		(0x1U),
	WORD_DATUM = 			(0x2U)
}data_transfer_size_t;

/*
 * @brief enum to selec the AHB master for dest and src
 * Solo el master 1 puede acceder a perifericos
 * */
typedef enum{
	AHB_MASTER_0 = 			(0x0U),
	AHB_MASTER_1 = 			(0x1U)
}AHB_MASTER_SEL_t;

typedef enum{
	CHANNEL0,
	CHANNEL1,
	CHANNEL2,
	CHANNEL3,
	CHANNEL4,
	CHANNEL5,
	CHANNEL6,
	CHANNEL7
}DMA_channel_t;

/*====================[external functions declaration]=======================*/

/*
 * @brief Creates linked list for data transfer
 * */
void GPDMA_CreateLLI( lli_t *lli_struct, uint32_t src, uint32_t dest, uint32_t next_lli, uint32_t control);
/*
 * @brief Creates control word for a channel
 * @param transfer_size: quantity of transfers on this channel
 * @param src_burst_size: quantity of transfers per request signal
 * @param src_width_data: size of a single transfer (0 = 1 byte, 1 = half-word, 2 = word)
 * @param src_AHB_master: AHB Master 0 if 0, AHB Master 1 if 1.
 * @param src_increment: pointer to the data of the source is incremented in each transfer
 * @param user_mode, in user mode if true, in privileged mode if false
 * @param bufferable: true if bufferable, false if not
 * @param cacheable: true if cacheable, false if not
 * @param terminal_cnt_int: true if terminal count interrupt gonna be used
 *
 * NOTE: just AHB Master 1 can access to peripherals
 * */
uint32_t GPDMA_CtrlWrd(uint32_t transfer_size,
							burst_size_t src_burst_size,
							burst_size_t dest_burst_size,
							data_transfer_size_t src_width_data,
							data_transfer_size_t dest_width_data,
							AHB_MASTER_SEL_t src_AHB_master,
							AHB_MASTER_SEL_t dest_AHB_master,
							bool src_increment,
							bool dest_increment,
							bool user_mode,
							bool bufferable,
							bool cacheable,
							bool terminal_cnt_int
							);
/* @brief inits DMA peripheral */
void GPDMA_init( void );
/* @brief configure a channel of the DMA */
void GPDMA_configChannel( DMA_channel_t channel, uint32_t src_address, uint32_t dest_address, uint32_t first_lli_address, uint32_t ctrl_word, uint32_t cfg_word );
/* @brief convert sampling frequency to ticks of the DAC count value */
uint32_t GPDMA_samplingFreq2Ticks( uint32_t freq );


#endif /* _GPDMA_PERIPHERAL_H_ */

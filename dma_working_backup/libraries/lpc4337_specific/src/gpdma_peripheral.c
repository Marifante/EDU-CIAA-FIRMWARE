/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: gpdma_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/gpdma_peripheral.h"

/*====================[external functions definition]========================*/


/*
 * @brief The peripherals connected to DMA are Multiplexed. They are multiplexed
 * in 16 groups of 4 pheripherals. Only one pheripheral of each group can be connected
 * to the DMA. With this function, we can choose one pheripheral to be connected to the
 * DMA.
 * @return Group to who belongs the desired pheripheral to connect to DMA.
 * */
uint8_t configDMAmux(gpdma_mux_peripheral gpdma_peripheral_connection_number){

	uint8_t group, function;

	switch (gpdma_peripheral_connection_number){
	case GPDMA_CONN_DAC:
		function = 0;
		group = 15;
		break;

	default:
		return 0; //in future version must to return some error
	}

	/* Set select function to dmamux register */
	if (0 != gpdma_peripheral_connection_number) {
		uint32_t temp;
		temp = LPC_CREG->DMAMUX & (~(0x03 << (2 * group))); // Clear any other peripheral configured to this channel of dma
		LPC_CREG->DMAMUX = temp | (function << (2 * group)); // Assign the selected pheriferal to the dma channel
	}

	return group;
}

/*
 * @brief creates linked list for data transfer
 * */
void Chip_GPDMA_CreateLLI( lli_t *lli_struct, uint32_t src, uint32_t dest, uint32_t next_lli, uint32_t control){
	lli_struct->src_address = src;
	lli_struct->dest_address = dest;
	lli_struct->next_lli_address = next_lli;
	lli_struct->control = control;
	return;
}

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
uint32_t Chip_GPDMA_CtrlWrd(uint32_t transfer_size,
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
							)
{

	uint32_t ctrl_word = ( (transfer_size)
				| (src_burst_size<<12)
				| (dest_burst_size<<15)
				| (src_width_data<<18)
				| (dest_width_data<<21)
				| (src_AHB_master<<24)
				| (dest_AHB_master<<25)
				| (src_increment<<26)
				| (dest_increment<<27)
				| (user_mode<<28)
				| (bufferable<<29)
				| (cacheable<<30)
				| (terminal_cnt_int<<31) );

	return ctrl_word;
}


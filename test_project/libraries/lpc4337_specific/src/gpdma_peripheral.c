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
uint8_t configDMAmux(gpdma_connected_peripheral gpdma_peripheral_connection_number){

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
void Chip_GPDMA_CreateLLI( lli_node_t *lli_struct, uint32_t *src, uint32_t *dest, uint32_t *next_lli, uint32_t *control){
	lli_struct->src_address = src;
	lli_struct->dest_address = dest;
	lli_struct->next_lli_address = next_lli;
	lli_struct->control = control;
	return;
}

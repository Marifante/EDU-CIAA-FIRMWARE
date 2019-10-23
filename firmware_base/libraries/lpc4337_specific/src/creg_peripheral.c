/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: creg_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/creg_peripheral.h"

/*====================[external functions definition]========================*/

/*
 * @brief The peripherals connected to DMA are Multiplexed. They are multiplexed
 * in 16 groups of 4 pheripherals. Only one pheripheral of each group can be connected
 * to the DMA. With this function, we can choose one pheripheral to be connected to the
 * DMA.
 * @return Group to who belongs the desired pheripheral to connect to DMA.
 * */
uint8_t CREG_configDMAmux( gpdma_mux_peripheral gpdma_peripheral_connection_number )
{
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

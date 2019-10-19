/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: gpio_board
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/dac_board.h"

/*==================[external functions declaration]==========================*/

/*
 * @brief enables DAC on the pin P4_4 of the LPC4337
 * */
void enableDAC(){
	/*
	* The pin of the DAC is the P4_4 with ANALOG SEL, select func 0 per default
	* */
	SCU_SetPinFunc(4, 4, 0);
	/*
	 * Enables analog func for P4_4. Analog function have priority over any other digital function.
	 * */
	SCU->ENAIO[0] |= (0x01); //enables DAC for pin P4_4
	/*
	 * Enables DMA_ENA bit in the DAC control register.
	 * */
	LPC_DAC->CTRL |= (0x01)<<3;
	return;
}

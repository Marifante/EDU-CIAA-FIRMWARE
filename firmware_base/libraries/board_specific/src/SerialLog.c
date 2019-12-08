/*
 * serial_USB.c
 *
 *	This library provides serial communication via the debug USB of the board.
 *	Set a terminal as follows:
 * 		Baudrate = 115200
 * 		Data = 8 bits
 * 		Parity = none
 * 		Stop bits = 1 bit.
 *
 *  Created on: Dec 8, 2019
 *      Author: Julian
 */

/*==================[inclusions]=============================================*/
#include "../inc/SerialLog.h"
#include "../../lpc4337_specific/inc/lpc_4337_chip.h"

/*==================[macros & constants]=====================================*/
#define MD_PLN					(0x2 << 3) // Disables pull-down and pull-up resistor at pad
#define MD_PDN					(0x3 << 3) // Enables pull-down resistor at pad
#define SCU_MODE_FUNC6			(0x6)
#define SCU_MODE_EZI			(1 << 6)
#define SCU_MODE_ZIF_DIS		(1 << 7)
#define SYSTEM_BAUD_RATE 		115200 // log baudrate


/*==================[functions definition]===================================*/
/* @brief config UART2 for serial logs via USB.*/
void SerialLog_config( void )
{
	//Initializate UART2
	UART2_init();

	// Set baudrate
	UART2_setBaudrate( 115200 );
	//Modify FCR (FIFO Control Register)
	// Chip_UART_SetupFIFOS(CIAA_BOARD_UART, UART_FCR_FIFO_EN | UART_FCR_TRG_LEV0);
	UART2_setupFIFOS();
	//Dummy read
	uint8_t dummyChar = (USART2->RBR & 0xFF);

	//Chip_UART_TXEnable
	UART2_enableTx();

	// Chip_SCU_PinMux(7, 1, MD_PDN, FUNC6);
	SCU->SFSP[7][1] = (	MD_PDN 				|
						SCU_MODE_FUNC6		);				/* P7_1: UART2_TXD */

	//Chip_SCU_PinMux(7, 2, MD_PLN|MD_EZI|MD_ZI, FUNC6);
	SCU->SFSP[7][2] = (	MD_PLN 				|
						SCU_MODE_EZI 		|
						SCU_MODE_ZIF_DIS 	|
						SCU_MODE_FUNC6		);				/* P7_2: UART2_RXD */


}

/* @brief prints a string via usb serial port. */
void SerialLog_print( uint8_t *str )
{
	UART2_writeString( str );
}

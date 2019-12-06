/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: usart_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/ccu_peripheral.h"
#include "../inc/cgu_peripheral.h"
#include "../inc/usart_peripheral.h"
#include "../inc/nvic_peripheral.h"
#include "../inc/scu_peripheral.h"

/*==================[macros & constants]=====================================*/
#define UART_FCR_FIFO_EN        (1 << 0)	/*!< UART FIFO enable */
#define UART_FCR_RX_RS          (1 << 1)	/*!< UART RX FIFO reset */
#define UART_FCR_TX_RS          (1 << 2)	/*!< UART TX FIFO reset */

#define UART_LCR_WLEN8			((1 << 0) | (1 << 1))
#define UART_LCR_SBS_1BIT		(0 << 2)
#define UART_LCR_PARITY_DIS		(0 << 3)

#define UART_LCR_DLAB_EN		(0 << 7)
#define UART_FCR_FIFO_EN		(1 << 0)
#define UART_FCR_TRG_LEV0		(0 << 6)
#define UART_TER2_TXEN			(1 << 0)

#define MD_PLN					(0x2 << 3) // Disables pull-down and pull-up resistor at pad
#define MD_PDN					(0x3 << 3) // Enables pull-down resistor at pad
#define SCU_MODE_FUNC6			(0x6)
#define SCU_MODE_EZI			(1 << 6)
#define SCU_MODE_ZIF_DIS		(1 << 7)
#define SYSTEM_BAUD_RATE 		115200 // log baudrate
/*==================[external data definition]===============================*/


/*==================[internal functions declaration]=========================*/

void USART_initFIFOS( void )
{
	USART2->FCR = (	UART_FCR_FIFO_EN	|	// enables UART FIFO
					UART_FCR_RX_RS		|	// reset rx FIFO
					UART_FCR_TX_RS		);	// reset tx FIFO
}

void USART_disableTx( void )
{
	USART2->TER2 = 0;
}

void USART_disableInterrupts( void )
{
	USART2->IER = 0;
}

void USART_setupToDefaultState( void )
{
	// Set LCR to default state
	USART2->LCR = 0;
	// Set ACR to default state
	USART2->ACR = 0;
	// Set RS485 control to default state
	USART2->RS485CTRL = 0;
	// Set RS485 delay timer to default state
	USART2->RS485DLY = 0;
	// Set RS485 addr match to default state/
	USART2->RS485ADRMATCH = 0;

	// Clear MCR (solo para USART1)
	// Set Modem Control to default state
	USART2->MCR = 0;
}

/* @brief configures line control to 8N1 with no parity. */
void USART_setup8N1NoParity( void )
{
	USART2->LCR = ( UART_LCR_WLEN8 |		// 8bit characters.
					UART_LCR_SBS_1BIT |		// 1 stop bit.
					UART_LCR_PARITY_DIS );	// Disables parity.
}


/*==================[external functions definition]==========================*/

void UART_init(void)
{

	CCU_initUART2Clk();

	USART_initFIFOS();

	USART_disableTx();

	USART_disableInterrupts();

	USART_setupToDefaultState();

	USART_setup8N1NoParity();

	// Disable fractional divider
	USART2->FDR = 0x10;

	// Set Baud rate
	uint32_t clkin = CGU_setUART2BaseClk();
	int div = clkin / (SYSTEM_BAUD_RATE * 16);

	// /* High and low halves of the divider */
	int divh = div / 256;
	int divl = div - (divh * 256);

	// Chip_UART_EnableDivisorAccess(CIAA_BOARD_UART);
	USART2->LCR |= UART_LCR_DLAB_EN;

	// Chip_UART_SetDivisorLatches(CIAA_BOARD_UART, divl, divh);
	USART2->DLL = (uint32_t) divl;
	USART2->DLM = (uint32_t) divh;

	// Chip_UART_DisableDivisorAccess(CIAA_BOARD_UART);
	USART2->LCR &= ~UART_LCR_DLAB_EN;

	/* Fractional FDR alreadt setup for 1 in UART init */
	// return clkin / div;

	// *****************************************************************************

	//Modify FCR (FIFO Control Register)
	// Chip_UART_SetupFIFOS(CIAA_BOARD_UART, UART_FCR_FIFO_EN | UART_FCR_TRG_LEV0);
	USART2->FCR = (UART_FCR_FIFO_EN | UART_FCR_TRG_LEV0);

	// Enable UART Transmission
	// Chip_UART_TXEnable(CIAA_BOARD_UART);
    USART2->TER2 = UART_TER2_TXEN;

	// Chip_SCU_PinMux(7, 1, MD_PDN, FUNC6);
	SCU->SFSP[7][1] = (MD_PDN | SCU_MODE_FUNC6);						/* P7_1: UART2_TXD */

	//Chip_SCU_PinMux(7, 2, MD_PLN|MD_EZI|MD_ZI, FUNC6);
	SCU->SFSP[7][2] = (MD_PLN | SCU_MODE_EZI | SCU_MODE_ZIF_DIS | SCU_MODE_FUNC6);	/* P7_2: UART2_RXD */

	// Enable UART Rx Interrupt
	// Chip_UART_IntEnable(CIAA_BOARD_UART,UART_IER_RBRINT);   //Receiver Buffer Register Interrupt
	//USART2->IER |= _UART_IER_RBRINT;

	// Enable UART line status interrupt
	//Chip_UART_IntEnable(USART2,UART_IER_RLSINT ); //LPC43xx User manual page 1118
	NVIC_SetPriority(USART2_IRQn, 6);

	// Enable Interrupt for UART channel
	// NVIC_EnableIRQ(USART2_IRQn);
	NVIC_EnaIRQ(USART2_IRQn);
}


void UART_SendByte(USART_T *pUART, unsigned char data)
{
	pUART->THR = (unsigned int) data;
}

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
#include "../../utils.h"
#include <stdbool.h>

/*==================[macros & constants]=====================================*/
#define UART_FCR_FIFO_EN        (1 << 0)	/*!< UART FIFO enable */
#define UART_FCR_RX_RS          (1 << 1)	/*!< UART RX FIFO reset */
#define UART_FCR_TX_RS          (1 << 2)	/*!< UART TX FIFO reset */

#define UART_TER2_TXEN      	(1 << 0)	/*!< Transmit enable bit  - valid for 18xx/43xx only */

#define UART_LCR_WLEN8			((1 << 0) | (1 << 1))
#define UART_LCR_SBS_1BIT		(0 << 2)
#define UART_LCR_PARITY_DIS		(0 << 3)

#define UART_LCR_DLAB_EN		(1 << 7)
#define UART_FCR_FIFO_EN		(1 << 0)
#define UART_FCR_TRG_LEV0		(0 << 6)
#define UART_TER2_TXEN			(1 << 0)
#define UART_LSR_TXRE			(1 << 5)
#define UART_LSR_RXRE			(1 << 0)

/*==================[external data definition]===============================*/


/*==================[internal functions declaration]=========================*/
void UART2_disableTx( void )
{
	USART2->TER2 = 0;
}

void UART2_disableInterrupts( void )
{
	USART2->IER = 0;
}

void UART2_setupToDefaultState( void )
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
}

/* @brief configures line control to 8N1 with no parity. */
void USART_setup8N1NoParity( void )
{
	USART2->LCR = ( UART_LCR_WLEN8 |		// 8bit characters.
					UART_LCR_SBS_1BIT |		// 1 stop bit.
					UART_LCR_PARITY_DIS );	// Disables parity.
}
void UART2_enableDivisorAccess( void )
{
	USART2->LCR |= UART_LCR_DLAB_EN;
}

void UART2_setDivisorLatches( uint32_t divl, uint32_t divh )
{
	USART2->DLL = (uint32_t) divl;
	USART2->DLM = (uint32_t) divh;
}

void UART2_disableDivisorAccess( void )
{
	USART2->LCR &= ~UART_LCR_DLAB_EN;
}

bool UART2_isTxReady( void )
{
	return (USART2->LSR & UART_LSR_TXRE);
}

bool UART2_thereIsUnreceivedData( void )
{
	return (USART2->LSR & UART_LSR_RXRE);
}


/*==================[external functions definition]==========================*/
void UART2_setupFIFOS( void )
{
	USART2->FCR = (	UART_FCR_FIFO_EN	|	// enables UART FIFO
					UART_FCR_RX_RS		|	// reset rx FIFO
					UART_FCR_TX_RS		|	// reset tx FIFO
					UART_FCR_TRG_LEV0	);
}

void UART2_enableTx( void )
{
	USART2->TER2 = UART_TER2_TXEN;
}

void UART2_setBaudrate( uint32_t baudrate )
{
	uint32_t reg = CGU_getUART2InputClk();
	uint32_t clkin = CGU_getClockInputHz(reg);

	uint32_t div = clkin / (baudrate * 16);

	uint32_t divh = div / 256;
	uint32_t divl = div - (divh * 256);

	UART2_enableDivisorAccess();
	UART2_setDivisorLatches( divl, divh );
	UART2_disableDivisorAccess();

}

void UART2_init( void )
{

	CCU_initUART2PeripheralClk();

	UART2_setupFIFOS();

	UART2_disableTx();

	/* Disable interrupts */
	UART2_disableInterrupts();
	UART2_setupToDefaultState();

	// Default 8N1, with DLAB disabled
	USART_setup8N1NoParity();

	// Disable fractional divider
	USART2->FDR = 0x10;
}


bool UART2_readByte( uint8_t *receivedByte )
{
	if( UART2_thereIsUnreceivedData() == true )
	{
		*receivedByte = (USART2->RBR & 0xFF); //takes received char from RBR register
		return true;
	}
	else
		return false;
}

void UART2_sendByte( unsigned char data )
{
	while( UART2_isTxReady() == false ); // Wait for space in FIFO (blocking code)
	USART2->THR = (unsigned int) data;
}

void UART2_writeString( char* str )
{
	while( *str != 0 )
	{
		UART2_sendByte( (uint8_t) *str );
		str++;
	}
}

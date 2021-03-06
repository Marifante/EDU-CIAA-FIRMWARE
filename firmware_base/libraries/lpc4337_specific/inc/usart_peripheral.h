/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: usart_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef LIBRARIES_LPC4337_SPECIFIC_INC_USART_PERIPHERAL_H_
#define LIBRARIES_LPC4337_SPECIFIC_INC_USART_PERIPHERAL_H_

/*==================[inclusions]=============================================*/


/*==================[macros & constants]=====================================*/
#define LPC_USART0_BASE           0x40081000
#define LPC_USART2_BASE           0x400C1000
#define LPC_USART3_BASE           0x400C2000

#define USART0                ((USART_T            *) LPC_USART0_BASE)
#define USART2                ((USART_T            *) LPC_USART2_BASE)
#define USART3                ((USART_T            *) LPC_USART3_BASE)

/*==================[external data definition]===============================*/
// USART Register
typedef struct {

	union {
		unsigned int  DLL; // Divisor Latch LSB. Least significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider (DLAB = 1).
		unsigned int  THR; // Transmit Holding Register. The next character to be transmitted is written here (DLAB = 0).
		unsigned int  RBR; // Receiver Buffer Register. Contains the next received character to be read (DLAB = 0).
	};

	union {
		unsigned int IER;	// Interrupt Enable Register. Contains individual interrupt enable bits for the 7 potential UART interrupts (DLAB = 0).
		unsigned int DLM;	// Divisor Latch MSB. Most significant byte of the baud rate divisor value. The full divisor is used to generate a baud rate from the fractional rate divider (DLAB = 1).
	};

	union {
		unsigned int FCR;	// FIFO Control Register. Controls UART FIFO usage and modes.
		unsigned int IIR;	// Interrupt ID Register. Identifies which interrupt(s) are pending.
	};

	unsigned int LCR;		// Line Control Register. Contains controls for frame formatting and break generation.
	unsigned int MCR;		// Modem Control Register. Only present on USART ports with full modem support.
	unsigned int LSR;		// Line Status Register. Contains flags for transmit and receive status, including line errors.
	unsigned int MSR;		// Modem Status Register. Only present on USART ports with full modem support.
	unsigned int SCR;		// Scratch Pad Register. Eight-bit temporary storage for software.
	unsigned int ACR;		// Auto-baud Control Register. Contains controls for the auto-baud feature.
	unsigned int ICR;		// IrDA control register (not all UARTS)
	unsigned int FDR;		// Fractional Divider Register. Generates a clock input for the baud rate divider.
	unsigned int OSR;		// Oversampling Register. Controls the degree of oversampling during each bit time. Only on some UARTS.
	unsigned int TER1;		// Transmit Enable Register. Turns off USART transmitter for use with software flow control.
	unsigned int RESERVED0[3];
    unsigned int HDEN;		// Half-duplex enable Register- only on some UARTs
	unsigned int RESERVED1[1];
	unsigned int SCICTRL;	// Smart card interface control register- only on some UARTs

	unsigned int RS485CTRL;	// RS-485/EIA-485 Control. Contains controls to configure various aspects of RS-485/EIA-485 modes.
	unsigned int RS485ADRMATCH;	// RS-485/EIA-485 address match. Contains the address match value for RS-485/EIA-485 mode.
	unsigned int RS485DLY;		// RS-485/EIA-485 direction control delay.

	union {
		unsigned int SYNCCTRL;	// Synchronous mode control register. Only on USARTs.
		unsigned int FIFOLVL;	// FIFO Level register. Provides the current fill levels of the transmit and receive FIFOs.
	};

	unsigned int TER2;			// Transmit Enable Register. Only on LPC177X_8X UART4 and LPC18XX/43XX USART0/2/3.
} USART_T;


/*==================[internal functions declaration]=========================*/

/*==================[external functions declaration]=========================*/
void UART2_enableTx( void );
void UART2_setupFIFOS( void );
void UART2_init( void );
void UART2_setBaudrate( uint32_t baudrate );
void UART2_sendByte( unsigned char data );
bool UART2_readByte( uint8_t *receivedByte );
void UART2_writeString( char *str );

#endif /* LIBRARIES_LPC4337_SPECIFIC_INC_USART_PERIPHERAL_H_ */

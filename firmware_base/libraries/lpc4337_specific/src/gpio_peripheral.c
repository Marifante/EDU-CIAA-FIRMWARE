/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: gpio_peripheral
 *
 * El bloque de puertos GPIO contiene los registros necesarios para
 * manipular los pines GPIO. En total hay 8 puertos GPIO y cada uno de ellos
 * tiene 32 pines.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


/*==================[inclusions]=============================================*/

#include "../inc/gpio_peripheral.h"

/*==================[external functions declaration]=========================*/

/* GET PORT functions. Get the values associated to all the pins in one port.*/

/* @brief get the DIR register of the gpio port */
uint32_t GPIO_GetPortDIR( uint8_t port )
{
	return pGPIO_T->DIR[port];
}

/* @brief get the SET register  of the gpio port  */
uint32_t GPIO_GetPortSET( uint8_t port )
{
	return pGPIO_T->SET[port];
}

/* @brief get the CLR register of the gpio port  */
uint32_t GPIO_GetPortCLR( uint8_t port )
{
	return pGPIO_T->CLR[port];
}

/* @brief get the NOT register of the gpio port */
uint32_t GPIO_GetPortNOT( uint8_t port )
{
	return pGPIO_T->CLR[port];
}


/* @brief get the PIN register of the gpio port */
uint32_t GPIO_GetPortPIN( uint8_t port )
{
	return pGPIO_T->PIN[port];
}

/* GET PIN functions.
 * Get the value associated to one pin of one port.
 * In the case of the BYTE and WORD registers, get the register
 * in question of the pin. */

/* @brief get the value DIR of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question */
uint8_t GPIO_GetPinDIR( uint8_t port, uint8_t pin )
{
	uint8_t value = (pGPIO_T->DIR[port]) & (1<<pin);
	return value;
}

/* @brief get the value SET of the pin x in the port n (n = port, x = pin).
 * When reads from this register, you can see the output bits of the port.
 * When you see the bit x of the register of the port n, you can see the output
 * bit of the GPIOn[x].
 * @port the port in question
 * @pin the pin in question */
uint8_t GPIO_GetPinSET( uint8_t port, uint8_t pin )
{
	uint8_t value = (pGPIO_T->SET[port]) & (1<<pin);
	return value;
}

/* @brief get the value CLR of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question */
uint8_t GPIO_GetPinCLR( uint8_t port, uint8_t pin )
{
	uint8_t value = (pGPIO_T->CLR[port]) & (1<<pin);
	return value;
}

/* @brief get the value NOT of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question */
uint8_t GPIO_GetPinNOT( uint8_t port, uint8_t pin )
{
	uint8_t value = (pGPIO_T->NOT[port]) & (1<<pin);
	return value;
}

/* @brief get the value PIN of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question */
uint8_t GPIO_GetPinPIN( uint8_t port, uint8_t pin )
{
	uint8_t value = (pGPIO_T->PIN[port]) & (1<<pin);
	return value;
}

/* @brief get the value BYTE of the pin x in the port n (n = port, x = pin).
 * Only cares the lsb bit of this register, the rest are 0 when you read the
 * register and ignored on write.
 * To read the state of the pin, the input buffer must to be activated (EZI bit in SCU register).
 * @port the port in question
 * @pin the pin in question
 * @return the value of the byte register of GPIOn[x] */
uint8_t GPIO_GetPinBYTE( uint8_t port, uint8_t pin )
{
	return pGPIO_T->B[port][pin];
}

/* @brief get the value WORD of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question
 * @return the value of the word register of GPIOn[x] */
uint32_t GPIO_GetPinWORD( uint8_t port, uint8_t pin )
{
	return pGPIO_T->W[port][pin];
}

/* SET PIN functions. */

/* @brief set the direction of the GPIOn[x] as an output */
void GPIO_SetPinDIROutput( uint8_t port, uint8_t pin )
{
	pGPIO_T->DIR[port] |= (1<<pin);
	return;
}

/* @brief set the direction of the GPIOn[x] as an input */
void GPIO_SetPinDIRInput( uint8_t port, uint8_t pin )
{
	pGPIO_T->DIR[port] &= ~(1<<pin);
}

/* @brief set the bit corresponding to GPIOn[x] (n = port, x = pin)
 * of the SET register to one. */
void GPIO_SetPinSET( uint8_t port, uint8_t pin )
{
	pGPIO_T->SET[port] |= (1<<pin);
}

/* @brief set the bit corresponding to GPIOn[x] (n = port, x = pin)
 * of the CLEAR register to one. */
void GPIO_SetPinCLR( uint8_t port, uint8_t pin )
{
	pGPIO_T->CLR[port] |= (1<<pin);
}

/* @brief set the bit corresponding to GPIOn[x] (n = port, x = pin)
 * of the NOT register to one. */
void GPIO_SetPinNOT( uint8_t port, uint8_t pin )
{
	pGPIO_T->NOT[port] |= (1<<pin);
}

// Functions for interrupts -------------------------------------------------*/

/* @brief GPIO Interrupt Select
 * @PortSel GPIO interrupt number, should be 0 to 7
 * @PortNum  GPIO port number interrupt, should be: 0 to 7
 * @PinNum  GPIO pin number Interrupt , should be: 0 to 31 */
void SCU_GPIOIntPinSel( uint8_t PortSel, uint8_t PortNum, uint8_t PinNum )
{
	int despl = (PortSel & 3) << 3;
	uint32_t val = (((PortNum & 0x7) << 5) | (PinNum & 0x1F)) << despl;
	//Correr 2 bits hacia la derecha a PortSel hace que si PortSel<4 entonces
	//se elige el registro PINTSEL0, sino, se elige el registro PINTSEL1.
	SCU->PINTSEL[PortSel >> 2] = ( SCU->PINTSEL[PortSel >> 2] & ~(0xFF << despl) ) | val;
}

/* @brief sets GPIO interrupt N as edge detection
 * @gpioInterruptNumber number of the gpio interrupt (lpc4337 supports up to 8 gpio interrupts) */
void setEdgeDetectionGPIOInterrupt( uint8_t gpioInterruptNumber )
{
	/* A 0 in the bit N of the ISEL sets edge detection for the gpio interrupt N */
	GPIO_PIN_INT->ISEL &= ~( 1 << gpioInterruptNumber );
}

/* @brief sets GPIO interrupt N as rise edge detection */
void setRiseEdgeGPIOInterrupt( uint8_t gpioPinInterruptNum )
{
	GPIO_PIN_INT->SIENR |= ( 1 << gpioPinInterruptNum );
}

/* @brief sets GPIO interrupt N as fall edge detection */
void setFallEdgeGPIOInterrupt( uint8_t gpioPinInterruptNum )
{
	GPIO_PIN_INT->SIENF |=  (1 << gpioPinInterruptNum);
}

/* @brief clear GPIO interrupt N flag */
void clearGPIOInterruptFlag( uint8_t gpioPinInterruptNum )
{
	GPIO_PIN_INT->IST = (1 << gpioPinInterruptNum);
}


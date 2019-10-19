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

#ifndef _GPIO_PERIPHERAL_H_
#define _GPIO_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

/*
 * Definicion de las estructuras que van a alojar los valores de los registros de
 * cada puerto gpio. La direccion de memoria de estas estructuras es la misma que
 * la de los perifericos del micro. Por lo tanto, es como si estuvieran creadas
 * "arriba" de los registros de los perifericos, por lo tanto, tienen constantemente,
 * los valores de los registros de los perifericos.
 * */

#define GPIO_PORT_BLOCK	0x400F4000
#define pGPIO_T			((GPIO_T *) GPIO_PORT_BLOCK)

#define PIN_INT_BASE	0x40087000		// Tabla 242, pag. 453
#define GPIO_PIN_INT	((PIN_INT_T *) PIN_INT_BASE)


/*==================[external data declaration]==============================*/

/**
 * @brief  GPIO port register block structure
 */
typedef struct {				/*!< GPIO_PORT Structure */
	__IO uint8_t B[128][32];	/*!< Offset 0x0000: Byte pin registers ports 0 to n; pins PIOn_0 to PIOn_31 */
	__IO uint32_t W[32][32];	/*!< Offset 0x1000: Word pin registers port 0 to n */
	__IO uint32_t DIR[32];		/*!< Offset 0x2000: Direction registers port n */
	__IO uint32_t MASK[32];		/*!< Offset 0x2080: Mask register port n */
	__IO uint32_t PIN[32];		/*!< Offset 0x2100: Portpin register port n */
	__IO uint32_t MPIN[32];		/*!< Offset 0x2180: Masked port register port n */
	__IO uint32_t SET[32];		/*!< Offset 0x2200: Write: Set register for port n Read: output bits for port n */
	__O uint32_t CLR[32];		/*!< Offset 0x2280: Clear port n */
	__O uint32_t NOT[32];		/*!< Offset 0x2300: Toggle port n */
} GPIO_T;

/*
* Registro byte nota:
* De la matriz B[128][32] solo se usan las primeras 8 filas B[0]-B[7], porque solo hay
* 8 puertos gpio y cada uno de ellos tiene hasta 32 pines. Hay un puerto byte para cada pin gpio.
* El resto de las filas esta puesta demás (aunque ocupe memoria al pedo) para que sea facil indexar a los valores de los registros
* si yo quiero mirar el valor del registro byte del puerto 0 solo tengo que mirar B[0]. Si quiero
* mirar el registro byte del puerto 3, pin 10 entonces voy al byte B[3][10].
* El resto de las filas esta hecha para llenar el hueco de espacios de memoria entre los registros,
* byte y los registros word. La direccion de memoria del ultimo registro byte es 0x400F40FC y la del
* primer registro word es 0x400F5000. El espacio total entre estos registros es 3840 bytes (0x400F5000-0x400F40FD = 3840).
* Para llenar el espacio de memoria entre estos dos registros, se llena de bytes con las filas restantes de la matriz B:
* (filas totales-filas usadas)*32bytes = 3840 bytes
* (128-8)*32 bytes = 3840 bytes
*/

// Pin Interrupt and Pattern Match register block structure
typedef struct {
	int ISEL;				// Pin Interrupt Mode register
	int IENR;				// Pin Interrupt Enable (Rising) register
	int SIENR;				// Set Pin Interrupt Enable (Rising) register
	int CIENR;				// Clear Pin Interrupt Enable (Rising) register
	int IENF;				// Pin Interrupt Enable Falling Edge / Active Level register
	int SIENF;				// Set Pin Interrupt Enable Falling Edge / Active Level register
	int CIENF;				// Clear Pin Interrupt Enable Falling Edge / Active Level address
	int RISE;				// Pin Interrupt Rising Edge register
	int FALL;				// Pin Interrupt Falling Edge register
	int IST;				// Pin Interrupt Status register
} PIN_INT_T;

/*==================[internal functions declaration]=========================*/

/*==================[external functions declaration]==========================*/

/* GET PORT functions. Get the values associated to all the pins in one port.*/

/**
 * @brief get the DIR register of the gpio port
 * @port the port in question
 */
uint32_t GPIO_GetPortDIR(uint8_t port);

/**
 * @brief get the SET register of the gpio port
 * @port the port in question
 */
uint32_t GPIO_GetPortSET(uint8_t port);

/**
 * @brief get the CLR register of the gpio port
 * @port the port in question
 */
uint32_t GPIO_GetPortCLR(uint8_t port);

/**
 * @brief get the NOT register of the gpio port
 * @port the port in question
 */
uint32_t GPIO_GetPortNOT(uint8_t port);

/**
 * @brief get the PIN register of the gpio port
 * @port the port in question
 */
uint32_t GPIO_GetPortPIN(uint8_t port);

/**
* GET PIN functions.
* Get the value associated to one pin of one port.
* In the case of the BYTE and WORD registers, get the register
* in question of the pin.
**/

/**
 * @brief get the value DIR of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question
 * @return 0 or 1
 */
uint8_t GPIO_GetPinDIR(uint8_t port, uint8_t pin);

/**
 * @brief get the value SET of the pin x in the port n (n = port, x = pin).
 * When reads from this register, you can see the output bits of the port.
 * When you see the bit x of the register of the port n, you can see the output
 * bit of the GPIOn[x].
 * @port the port in question
 * @pin the pin in question
 * @return 0 or 1
 */
uint8_t GPIO_GetPinSET(uint8_t port, uint8_t pin);

/**
 * @brief get the value CLR of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question
 * @return 0 or 1
 */
uint8_t GPIO_GetPinCLR(uint8_t port, uint8_t pin);

/**
 * @brief get the value NOT of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question
 * @return 0 or 1
 */
uint8_t GPIO_GetPinNOT(uint8_t port, uint8_t pin);

/**
 * @brief get the value PIN of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question
 * @return 0 or 1
 */
uint8_t GPIO_GetPinPIN(uint8_t port, uint8_t pin);

/**
 * @brief get the value BYTE of the pin x in the port n (n = port, x = pin).
 * Only cares the lsb bit of this register, the rest are 0 when you read the
 * register and ignored on write.
 * To read the state of the pin, the input buffer must to be activated (EZI bit in SCU register).
 * @port the port in question
 * @pin the pin in question
 * @return the value of the byte register of GPIOn[x]
 */
uint8_t GPIO_GetPinBYTE(uint8_t port, uint8_t pin);

/**
 * @brief get the value WORD of the pin x in the port n.
 * n = port, x = pin
 * @port the port in question
 * @pin the pin in question
 * @return the value of the word register of GPIOn[x]
 */
uint32_t GPIO_GetPinWORD(uint8_t port, uint8_t pin);

/**
 * SET PIN functions.
 */

/**
 * @brief set the direction of the GPIOn[x] as an output
 */
void GPIO_SetPinDIROutput(uint8_t port, uint8_t pin);

/**
 * @brief set the direction of the GPIOn[x] as an input
 */
void GPIO_SetPinDIRInput(uint8_t port, uint8_t pin);

/**
 * @brief set the bit corresponding to GPIOn[x] (n = port, x = pin)
 * of the SET register to one.
 */
void GPIO_SetPinSET(uint8_t port, uint8_t pin);

/**
 * @brief set the bit corresponding to GPIOn[x] (n = port, x = pin)
 * of the CLEAR register to one.
 */
void GPIO_SetPinCLR(uint8_t port, uint8_t pin);

/**
 * @brief set the bit corresponding to GPIOn[x] (n = port, x = pin)
 * of the NOT register to one.
 */
void GPIO_SetPinNOT(uint8_t port, uint8_t pin);



/*====================[external functions for interrupts]===================*/
//void GPIO0_IRQHandler(void); //function executed when an interrupt in the gpio port 0 happens




#endif /*__GPIO_PERIPHERAL_H_*/

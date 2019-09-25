/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: scu_peripheral
 *
 * Modificando estos registros se elige que senial va a haber en cada terminal de micro.
 * Las terminales del micro estan multiplexadas. El terminal de micro es la
 * salida de este multiplexor y las entradas son las senales de salida de los
 * diferentes perifericos (las diferentes funciones del terminal).
 * Modificando estos registros se elige que funcion va a tener cada pin fisico.
 * Los pines del LPC4337 estan separados en grupos: P0-PF (16 grupos en total).
 * Cada grupo tiene hasta 32 pines (pines fisicos del micro, terminales).
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef _SCU_PERIPHERAL_H_
#define _SCU_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "data_types.h"

/*==================[macros and definitions]=================================*/

/*
 * Definicion de las estructuras que van a alojar los valores de los
 * registros de la SCU.
 * */

#define SCU_BASE	0x40086000
#define SCU			((SCU_T         *) 	SCU_BASE)


/*==================[external data declaration]==============================*/

// System Control Unit Register
typedef struct {
	uint32_t  SFSP[16][32];		// Los pines digitales estan divididos en 16 grupos (P0-P9 y PA-PF)
	uint32_t  RESERVED0[256];
	uint32_t  SFSCLK[4];			// Pin configuration register for pins CLK0-3
	uint32_t  RESERVED16[28];
	uint32_t  SFSUSB;			// Pin configuration register for USB
	uint32_t  SFSI2C0;			// Pin configuration register for I2C0-bus pins
	uint32_t  ENAIO[3];			// Analog function select registers
	uint32_t  RESERVED17[27];
	uint32_t  EMCDELAYCLK;		// EMC clock delay register
	uint32_t  RESERVED18[63];
	uint32_t  PINTSEL[2];		// Pin interrupt select register for pin int 0 to 3 index 0, 4 to 7 index 1
} SCU_T;

/*==================[external functions declaration]==========================*/

/**
 * @brief set the function of one of the physical pins of the microcontroller.
 * @group group in question
 * @pin pin in question
 * @func 0-7 (FUNC0-FUNC7)
 * @return nothing
 */
void SCU_SetPinFunc(uint8_t group, uint8_t pin, uint8_t func);

/**
 * @brief activates the input buffer of the physical pin of the microcontroller
 * @group group in question
 * @pin pin in question
 * @return nothing
 * */
void SCU_activateInputBuffer(uint8_t group, uint8_t pin);


#endif /*__SCU_PERIPHERAL_*/

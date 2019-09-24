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

/*==================[inclusions]=============================================*/

#include "scu_peripheral.h"

/*==================[external functions declaration]==========================*/

/**
 * @brief set the function of one of the physical pins of the microcontroller.
 * @group group in question
 * @pin pin in question
 * @func 0-7 (FUNC0-FUNC7)
 * @return nothing
 */
void SCU_SetPinFunc(uint8_t group, uint8_t pin, uint8_t func){
	SCU->SFSP[group][pin] &= ~(0x7); //limpio 3 lsb, donde se modifica la funcion
	SCU->SFSP[group][pin] |= func;
	return;
}

/**
 * @brief activates the input buffer of the physical pin of the microcontroller
 * @group group in question
 * @pin pin in question
 * @return nothing
 * */
void SCU_activateInputBuffer(uint8_t group, uint8_t pin){
	SCU->SFSP[group][pin] = (1 << 6);
	return;
}

/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: cgu_ccu_peripheral
 *
 * La CGU (Clock Generation Unit) es el periferico que se encarga de generar
 * las seniales de reloj para el resto de los perifericos.
 * La CCU (Clock Control Unit) es el periferico que se encarga de controlar
 * las seniales de reloj para el resto de los perifericos.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_CGU_CCU_PERIPHERAL_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_CGU_CCU_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

#define LPC_CGU_BASE              0x40050000
#define LPC_CCU1_BASE             0x40051000
#define LPC_CCU2_BASE             0x40052000

#define LPC_CGU					  ((LPC_CGU_T*) LPC_CGU_BASE)
#define LPC_CCU1                  ((LPC_CCU1_T*) LPC_CCU1_BASE)
#define LPC_CCU2                  ((LPC_CCU2_T*) LPC_CCU2_BASE)

/*==================[external data declaration]==============================*/


#endif /*_LIBRARIES_LPC4337_SPECIFIC_INC_CGU_CCU_PERIPHERAL_H_*/

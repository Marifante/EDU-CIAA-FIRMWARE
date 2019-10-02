 /*****************************************************************************
 * High Level EDU-CIAA firmware
 * designed for high level programming of the board
 * 
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 * 
 * Documentacion:
 *    - UM10503 (LPC43xx ARM Cortex-M4/M0 multi-core microcontroller User
 *      Manual)
 *    - PINES UTILIZADOS DEL NXP LPC4337 JBD144 (Ing. Eric Pernia)
 *	  - firmware_structure.txt
 *****************************************************************************/


#include "../inc/main.h"

// Frequency of PCLK
#ifndef PCLK_MAX_FREQ
#define PCLK_MAX_FREQ 204000000
#endif



/** \brief  Structure type to access the System Control Block (SCB).
*/


gpioPin_t led1;


/*
* Interruption handler for SysTick
*/
void SysTick_Handler(void){
	toggleGpio(&led1);
}


int main(void) {
	int interval_time = 1000;

	configLed(LED1, &led1);
	enable_IntSysTick(interval_time);

	while (1) {

	}


	return 0;

}

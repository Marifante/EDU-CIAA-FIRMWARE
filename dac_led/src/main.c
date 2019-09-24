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


int main(void) {

	//To swtich off the leds
	gpioPin_t led0_r, led0_g, led0_b, led1, led2, led3;
	SCU_SetPinFunc(2, 0, 0);
	SCU_SetPinFunc(2, 1, 0);
	SCU_SetPinFunc(2, 2, 0);
	SCU_SetPinFunc(2, 10, 0);
	SCU_SetPinFunc(2, 11, 0);
	SCU_SetPinFunc(2, 12, 0);
	configGpio(LED0_R, &led0_r, OUTPUT_GPIO);
	configGpio(LED0_G, &led0_g, OUTPUT_GPIO);
	configGpio(LED0_B, &led0_b, OUTPUT_GPIO);
	configGpio(LED1, &led1, OUTPUT_GPIO);
	configGpio(LED2, &led2, OUTPUT_GPIO);
	configGpio(LED3, &led3, OUTPUT_GPIO);
	writeGpio(&led0_r, LOW);
	writeGpio(&led0_g, LOW);
	writeGpio(&led0_b, LOW);
	writeGpio(&led1, LOW);
	writeGpio(&led2, LOW);
	writeGpio(&led3, LOW);

	/*
	 * The pin of the DAC is the P4_4 with ANALOG SEL, select func 0 per default
	 * */
	SCU_SetPinFunc(4, 4, 0);

	/*
	 * Enables analog func for P4_4. Analog function have priority over any other digital function.
	 * */
	SCU->ENAIO[0] |= (0x01); //enables DAC for pin P4_4

	/*
	 * Enables DMA_ENA bit in the DAC control register.
	 * */
	LPC_DAC->CTRL |= (0x01)<<3;

	uint32_t output_val = 0;

	while (1) {

		for(output_val=0; output_val<1023; output_val++){
			Chip_DAC_UpdateValue(LPC_DAC, output_val);
			delay_us(5000);
		}
	}

	return 0;

}

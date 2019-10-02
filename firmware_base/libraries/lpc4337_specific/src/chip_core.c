/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: chip_core
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/


/*==================[inclusions]=============================================*/

#include "../inc/chip_core.h"


/*====================[external functions definition]========================*/

/*
 * @brief enable sysTick timer and generates one interrupt who launchs
 * SysTick_Handler() every time_ms
 * @time_ms interval of time between two interruptions
 * */
void enable_IntSysTick(float time_ms){

	SysTick->CTRL	= 0; //Deshabilitar SysTick
	SysTick->LOAD	= (int) ((SysTick->CALIB)-1)*100*time_ms ; //Si quiero 10 ms como intervalo de tiempo
	SysTick->VAL	= 0; //entre intervalos, tengo que poner time_ms = 0.01 seg
	SysTick->CTRL = ENA_SYSTICK_MASK | ENA_INT_SYSTICK_MASK | CLOCK_SEL_SYSTICK_MASK;

	return;
}

/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: delay
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#include "../inc/delay.h"

/*
 * @Brief	blocking delay function
 * @return	nothing
*/
void delay_us(uint32_t us){

	uint32_t* pcount_TC = 0;

	pcount_TC = initTimer(0);

	// Como el registro TC esta seteado para avanzar 1 vez cada 1 microsegundo
	// cuando el TC llegue a X valor, habrán pasado X microsegundos
	while( (*pcount_TC)<us );

	stopTimer(0);

	}


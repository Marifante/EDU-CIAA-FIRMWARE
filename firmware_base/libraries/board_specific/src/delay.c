/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: delay
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/delay.h"

/*==================[macros and definitions]=================================*/

#define FREQ1MHZ 1000000

/*==================[external functions definition]==========================*/

/* @brief	Blocking delay function. */
void delay_us( uint32_t us )
{

	uint32_t* pcount_TC = 0;

	pcount_TC = initTimer( ANYTIMER, FREQ1MHZ );

	// Como el registro TC esta seteado para avanzar 1 vez cada 1 microsegundo
	// cuando el TC llegue a X valor, habrán pasado X microsegundos
	while( (*pcount_TC)<us );

	stopTimer(0);
}


/*
 * @Brief	non-blocking delay function
*/
void initNonBlockingDelay( uint32_t us )
{

//	uint32_t* pcount_TC = initTimer( ANYTIMER, );

}

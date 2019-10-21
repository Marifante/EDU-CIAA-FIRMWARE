/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: timer_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/timer_peripheral.h"

/*==================[external functions definition]==========================*/

/*
 * @Brief	Function to init timer0/1/2/3
 * @timer_to_choose timer to init
 * @return	pointer to register TC
 * @comment This function is designed so that the timer TC advances once every 1 microsecond
*/
uint32_t*  initTimer(uint8_t chosenTimer){
	LPC_TIMER_T* pTimerStruct;

	switch( chosenTimer )
	{
	case(0):
		pTimerStruct = LPC_TIMER0;
		break;
	case(1):
		pTimerStruct = LPC_TIMER1;
		break;
	case(2):
		pTimerStruct = LPC_TIMER2;
		break;
	case(3):
		pTimerStruct = LPC_TIMER3;
		break;
	default:
		return 0;
	}

	/*Enable timer*/

	// Seteo el timer0 en modo timer, entonces el registro TC
	// se va a incrementar en 1 cada vez que el registro PC llegue
	// al mismo valor que hay en el registro PR
	pTimerStruct->CTCR = 0x0;

	// Seteo el registro PR. Cuando el registro PC llegue al mismo valor
	// que este registro, el TC se va a incrementar en 1.
	// Si yo quiero que el PC se incremente 1 vez cada 1 micro segundo
	// entonces:
	// Ttc = Tpclk*(PR-1)
	// PR  = (Ttc*Freq_PCLK)-1
	pTimerStruct->PR = (PCLK_MAX_FREQ/1000000)-1;

	// Resetea el timer, cuando esta en 1 el segundo bit del TCR, el
	// timer y el prescaler son reiniciados sincronicamente en el
	// siguiente flanco ascendente del PCLK
	pTimerStruct->TCR = 0x02;

	// Habilita el timer a contar
	pTimerStruct->TCR = 0x01;

	// Devuelvo un puntero hacia el registro TC, es el cual hay que
	// mirar continuamente
	return (uint32_t*) &(pTimerStruct->TC);
}


/*
 * @Brief	Function to stop timer0
 * @timer_to_choose timer to stop
 * @return	nothing
*/
void stopTimer( uint8_t chosenTimer )
{
	LPC_TIMER_T* pTimerStruct;

		switch( chosenTimer )
		{
		case(0):
			pTimerStruct = LPC_TIMER0;
			break;
		case(1):
			pTimerStruct = LPC_TIMER1;
			break;
		case(2):
			pTimerStruct = LPC_TIMER2;
			break;
		case(3):
			pTimerStruct = LPC_TIMER3;
			break;
		default:
			return;
		}
	pTimerStruct->TCR = 0x0;
}

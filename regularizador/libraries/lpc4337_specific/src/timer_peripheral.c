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
uint32_t*  initTimer(uint8_t timer_to_choose){
	LPC_TIMER_T* aux_tmr_pointer;

	switch(timer_to_choose){
	case(0):
		aux_tmr_pointer = LPC_TIMER0;
		break;
	case(1):
		aux_tmr_pointer = LPC_TIMER1;
		break;
	case(2):
		aux_tmr_pointer = LPC_TIMER2;
		break;
	case(3):
		aux_tmr_pointer = LPC_TIMER3;
		break;
	default:
		return 0;
	}

	/*Enable timer*/

	// Seteo el timer0 en modo timer, entonces el registro TC
	// se va a incrementar en 1 cada vez que el registro PC llegue
	// al mismo valor que hay en el registro PR
	aux_tmr_pointer->CTCR = 0x0;

	// Seteo el registro PR. Cuando el registro PC llegue al mismo valor
	// que este registro, el TC se va a incrementar en 1.
	// Si yo quiero que el PC se incremente 1 vez cada 1 micro segundo
	// entonces:
	// Ttc = Tpclk*(PR-1)
	// PR  = (Ttc*Freq_PCLK)-1
	aux_tmr_pointer->PR = (PCLK_MAX_FREQ/1000000)-1;

	// Resetea el timer, cuando esta en 1 el segundo bit del TCR, el
	// timer y el prescaler son reiniciados sincronicamente en el
	// siguiente flanco ascendente del PCLK
	aux_tmr_pointer->TCR = 0x02;

	// Habilita el timer a contar
	aux_tmr_pointer->TCR = 0x01;

	// Devuelvo un puntero hacia el registro TC, es el cual hay que
	// mirar continuamente
	return (uint32_t*) &(aux_tmr_pointer->TC);
}


/*
 * @Brief	Function to stop timer0
 * @timer_to_choose timer to stop
 * @return	nothing
*/
void stopTimer(uint8_t timer_to_choose){
	LPC_TIMER_T* aux_tmr_pointer;
		switch(timer_to_choose){
		case(0):
			aux_tmr_pointer = LPC_TIMER0;
			break;
		case(1):
			aux_tmr_pointer = LPC_TIMER1;
			break;
		case(2):
			aux_tmr_pointer = LPC_TIMER2;
			break;
		case(3):
			aux_tmr_pointer = LPC_TIMER3;
			break;
		default:
			return ;
		}
	aux_tmr_pointer->TCR = 0x0;
}

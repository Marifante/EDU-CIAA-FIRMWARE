/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: pwm_board
 *
 * Biblioteca para generar señales pwm en la edu-ciaa.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/pwm_board.h"




/*==================[external functions definition]==========================*/

/*
 *
 * */
void singlePWM(void){
	LPC_SCT->CONFIG |= (1 << 17); // Configura el SCT como dos timer de 16 bits, con auto limit
	LPC_SCT->CTRL_L |= (12-1) << 5; // Configura el prescaler, SCTimer/PWM clock = 1 MHz
	LPC_SCT->MATCHREL[0].L = 10-1; // match 0 @ 10/1MHz = 10 usec (100 kHz PWM freq)
	LPC_SCT->MATCHREL[1].L = 5; // match 1 used for duty cycle (in 10 steps)
	LPC_SCT->EVENT[0].STATE = 0xFFFFFFFF; // event 0 happens in all states
	LPC_SCT->EVENT[0].CTRL = (1 << 12); // match 0 condition only
	LPC_SCT->EVENT[1].STATE = 0xFFFFFFFF; // event 1 happens in all states
	LPC_SCT->EVENT[1].CTRL = (1 << 0) | (1 << 12); // match 1 condition only
	LPC_SCT->OUT[0].SET = (1 << 0); // event 0 will set SCTx_OUT0
	LPC_SCT->OUT[0].CLR = (1 << 1); // event 1 will clear SCTx_OUT0
	LPC_SCT->CTRL_L &= ~(1 << 2); // unhalt it by clearing bit 2 of CTRL reg
}

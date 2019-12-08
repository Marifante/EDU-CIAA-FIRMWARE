/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: ccu_peripheral
 *
 * La CCU (Clock Control Unit) es el periferico que se encarga de controlar
 * las seniales de reloj para el resto de los perifericos.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/ccu_peripheral.h"

/*==================[external functions definition]==========================*/

/* @brief Enables a peripheral clock. */
void CCU_clockEnable( CHIP_CCU_CLK_T clk )
{
	/* Start peripheral clock running */
	if (clk >= CLK_CCU2_START) {
		LPC_CCU2->CLKCCU[clk - CLK_CCU2_START].CFG |= 1;
	}
	else {
		LPC_CCU1->CLKCCU[clk].CFG |= 1;
	}
}

/* @brief enable timer clock. */
void CCU_enableTimerClock( uint8_t chosenTimer )
{
	CHIP_CCU_CLK_T timerClock;

	switch( chosenTimer )
	{
	case TIMER0:
		timerClock = CLK_MX_TIMER0;
		break;
	case TIMER1:
		timerClock = CLK_MX_TIMER1;
		break;
	case TIMER2:
		timerClock = CLK_MX_TIMER2;
		break;
	case TIMER3:
		timerClock = CLK_MX_TIMER3;
		break;
	}

	CCU_clockEnable( timerClock );

}

#include "../inc/ccu_peripheral.h"

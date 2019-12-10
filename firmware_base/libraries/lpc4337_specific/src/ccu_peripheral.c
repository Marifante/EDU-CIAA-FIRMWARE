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
		CCU2->CLKCCU[clk - CLK_CCU2_START].CFG |= 1;
	}
	else {
		CCU1->CLKCCU[clk].CFG |= 1;
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

/* @brief enables UART2 Peripheral clock. */
void CCU_initUART2PeripheralClk( void )
{

	// The branch clock of UART2 is : CLK_APB2_UART2
	// The peripheral clock of UART2 is : CLK_M4_UART2
	// Address of peripheral clock of UART2 registers: 0x40051608
	// Address of start of CCU1 clocks registers : 0x40051100
	// 0x40051608 - 0x40051100 = 0x508 = (8 * 161)d =
	// So, CLK_MX_UART2 = 161d is the offset of the vector CLKCCU of CCU1 struct for CLK_MX_UART2
	CCU1->CLKCCU[ CLK_MX_UART2 ].CFG =	(1 << 0) |	// Enable clock.
										(1 << 1) |	// Auto (AHB disable mechanism) enabled.
										(1 << 2);	// Wake-up mechanism enabled.
}

/* @brief enables ADC0 clock. */
void CCU_initADC0Clock( void )
{
	CCU1->CLKCCU[ CLK_APB3_ADC0 ].CFG =	(1 << 0) |	// Enable clock.
										(1 << 1) |	// Auto (AHB disable mechanism) enabled.
										(1 << 2);	// Wake-up mechanism enabled.
}


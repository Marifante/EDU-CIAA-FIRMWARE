/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: cgu_ccu_peripheral
 *
 * La CGU (Clock Generation Unit) es el periferico que se encarga de generar
 * las seniales de reloj para el resto de los perifericos.
 * La CCU (Clock Control Unit) es el periferico que se encarga de controlar
 * las seniales de reloj para el resto de los perifericos.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/cgu_peripheral.h"
#include "../inc/creg_peripheral.h"

/*==================[macros & constans]======================================*/

#define CGU_IRC_FREQ			12000000
#define CRYSTAL_32K_FREQ_IN		(32*1024)

/*==================[internal functions definition]==========================*/

/*==================[external functions definition]==========================*/
/* @brief set UART2 clock base input to 12MHz IRC. Returns freq of this clock.*/
uint32_t CGU_setUART2BaseClk( void )
{
	CGU->BASE_CLK[CLK_BASE_UART2] &= ~(0x10 << 24); // cleans bits 28:24 of clk control register
	CGU->BASE_CLK[CLK_BASE_UART2] |= (0x01 << 24); // sets the IRC as clock input for UART2 base clock
	return CGU_IRC_FREQ;
}

/* @brief gets UART clock rate. */
/*uint32_t CCU_getUART2BaseClkRate( void )
{
	// get UART2 clock CCU config register.
	uin32_t cfgReg = CCU_1->CLKCCU[ CLK_APB2_UART2-CLK_CCU2_START ]; //CLK_APB2_UART2=386> 322

	if( (cfgReg & 0x1) == true )
	{	// if the clock is enabled
		// get the rate (in Hz) of the base clock of the USART2,
		// the branch clock is CLK_APB2_UART2 & the base clock is CLK_BASE_UART2
		//CLK_BASE_UART2 = 18
		uint32_t reg = CGU->BASE_CLK[CLK_BASE_UART2];
		if( (reg & 0x1) == true ) // if base clock is powered down
			reg = CLKINPUT_PD;
		uint32_t clkSel = ((reg >> 24) & 0x1F); // takes CLK_SEL bits of CLK_BASE_UART2 control reg
		//


	}
}*/

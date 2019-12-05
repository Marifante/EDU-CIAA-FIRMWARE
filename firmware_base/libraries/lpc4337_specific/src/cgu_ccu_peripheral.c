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

#include "../inc/cgu_ccu_peripheral.h"
#include "../inc/creg_peripheral.h"

/*==================[internal functions definition]==========================*/

/*==================[external functions definition]==========================*/

/* @brief enables UART clock. */
void CCU_enablesUARTClk( void )
{
	CCU1->CLKCCU[2].CFG =	(1 << 0) |
							(1 << 1) |
							(1 << 2);
}

/* @brief gets UART clock rate. */
/*uint32_t CCU_getUSART2ClkRate( void )
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

		switch( clkSel )
		{
		case
		}
	}
}*/

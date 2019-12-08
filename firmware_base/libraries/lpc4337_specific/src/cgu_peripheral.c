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

/* Returns the frequency of the main PLL */
uint32_t CGU_getMainPLLHz(void)
{
	uint32_t PLLReg = CGU->PLL1_CTRL;
	uint32_t freq = CGU_getClockInputHz((CHIP_CGU_CLKIN_T) ((PLLReg >> 24) & 0xF));
	uint32_t msel, nsel, psel, direct, fbsel;
	uint32_t m, n, p;
	const uint8_t ptab[] = {1, 2, 4, 8};

	/* No lock? */
	if (!(CGU->PLL1_STAT & 1)) {
		return 0;
	}

	msel = (PLLReg >> 16) & 0xFF;
	nsel = (PLLReg >> 12) & 0x3;
	psel = (PLLReg >> 8) & 0x3;
	direct = (PLLReg >> 7) & 0x1;
	fbsel = (PLLReg >> 6) & 0x1;

	m = msel + 1;
	n = nsel + 1;
	p = ptab[psel];

	if (direct || fbsel) {
		return m * (freq / n);
	}

	return (m / (2 * p)) * (freq / n);
}

/*==================[external functions definition]==========================*/


/* Returns the frequency of the specified input clock source */
uint32_t CGU_getClockInputHz(CHIP_CGU_CLKIN_T input)
{
	uint32_t rate = 0;

	switch (input) {
	case CLKIN_32K:
		rate = CRYSTAL_32K_FREQ_IN;
		break;

	case CLKIN_IRC:
		rate = CGU_IRC_FREQ;
		break;
/*
	case CLKIN_ENET_RX:
		if ((LPC_CREG->CREG6 & 0x07) != 0x4) {
			// MII mode requires 25MHz clock
			rate = 25000000;
		}
		break;

	case CLKIN_ENET_TX:
		if ((LPC_CREG->CREG6 & 0x07) != 0x4) {
			rate = 25000000; // MII uses 25 MHz
		} else {
			rate = 50000000; // RMII uses 50 MHz
		}
		break;

	case CLKIN_CLKIN:
		rate = ExtRateIn;
		break;

	case CLKIN_CRYSTAL:
		rate = OscRateIn;
		break;

	case CLKIN_USBPLL:
		rate = audio_usb_pll_freq[CGU_USB_PLL];
		break;

	case CLKIN_AUDIOPLL:
		rate = audio_usb_pll_freq[CGU_AUDIO_PLL];
		break;
*/
	case CLKIN_MAINPLL:
		rate = CGU_getMainPLLHz();
		break;
/*
	case CLKIN_IDIVA:
		rate = Chip_Clock_GetDivRate(input, CLK_IDIV_A);
		break;

	case CLKIN_IDIVB:
		rate = Chip_Clock_GetDivRate(input, CLK_IDIV_B);
		break;

	case CLKIN_IDIVC:
		rate = Chip_Clock_GetDivRate(input, CLK_IDIV_C);
		break;

	case CLKIN_IDIVD:
		rate = Chip_Clock_GetDivRate(input, CLK_IDIV_D);
		break;

	case CLKIN_IDIVE:
		rate = Chip_Clock_GetDivRate(input, CLK_IDIV_E);
		break;

	case CLKINPUT_PD:
		rate = 0;
		break;
*/
	default:
		break;
	}

	return rate;
}

uint32_t CGU_getUART2InputClk( void )
{
	return ((CGU->BASE_CLK[CLK_BASE_UART2] >> 24) & 0x1F);

}



/* @brief set UART2 clock base input to 12MHz IRC. Returns freq of this clock.*/
/*uint32_t CGU_setUART2BaseClk( void )
{
	CGU->BASE_CLK[CLK_BASE_UART2] &= ~(0x10 << 24); // cleans bits 28:24 of clk control register
	CGU->BASE_CLK[CLK_BASE_UART2] |= (0x01 << 24); // sets the IRC as clock input for UART2 base clock
	return CGU_IRC_FREQ;
}*/

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

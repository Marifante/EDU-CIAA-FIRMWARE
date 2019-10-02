/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: clocks_map
 *
 * Contiene el mapeo de los clock para los distintos perifericos.
 * La numeracion esta hecha de acuerdo a las estructuras de los perifericos
 * cgu y ccu.
 * Entonces, las enumeraciones en esta biblioteca sirven para indexar a las
 * estructuras creadas en la biblioteca de la CGU/CCU.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

/*==================[inclusions]=============================================*/

#include "../inc/clocks_map.h"

/*==================[external data declaration]==============================*/

/*==================[external functions declaration]==========================*/

///**
// * @brief	Enables a peripheral clock and sets clock states
// * @param	clk			: CHIP_CCU_CLK_T value indicating which clock to enable
// * @param	autoen		: true to enable autoblocking on a clock rate change, false to disable
// * @param	wakeupen	: true to enable wakeup mechanism, false to disable
// * @param	div			: Divider for the clock, must be 1 for most clocks, 2 supported on others
// * @return	Nothing
// */
//void Chip_Clock_EnableOpts(CHIP_CCU_CLK_T clk, bool_t autoen, bool wakeupen, int div){
//
//	if (autoen) {
//		reg |= (1 << 1);
//	}
//	if (wakeupen) {
//		reg |= (1 << 2);
//	}
//
//	/* Not all clocks support a divider, but we won't check that here. Only
//	   dividers of 1 and 2 are allowed. Assume 1 if not 2 */
//	if (div == 2) {
//		reg |= (1 << 5);
//	}
//
//	/* Setup peripheral clock and start running */
//	if (clk >= CLK_CCU2_START) {
//		LPC_CCU2->CLKCCU[clk - CLK_CCU2_START].CFG = reg;
//	}
//	else {
//		LPC_CCU1->CLKCCU[clk].CFG = reg;
//	}
//}

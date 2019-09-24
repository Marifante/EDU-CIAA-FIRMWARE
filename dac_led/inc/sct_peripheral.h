/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: sct_peripheral
 *
 * El periférico State Configurable Timer sirve para generar diversos tipos
 * de seniales. Consta de hasta 2 contadores con los cuales se pueden generar
 * diversas seniales configurando eventos disparadores. Cada vez que alguno
 * de estos eventos ocurra, una salida de este periferico se pone en HIGH
 * o LOW y asi se generan varios tipos de seniales, como PWM.
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _SCT_PERIPHERAL_H_
#define _SCT_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "data_types.h"

/*==================[macros and definitions]=================================*/

#define LPC_SCT_BASE              0x40000000
#define LPC_SCT                   ((LPC_SCT_T*) LPC_SCT_BASE)

/*
 * @brief SCT Module configuration
 */
#define CONFIG_SCT_nEV   (16)			/*!< Number of events */
#define CONFIG_SCT_nRG   (16)			/*!< Number of match/compare registers */
#define CONFIG_SCT_nOU   (16)			/*!< Number of outputs */

/*==================[external data declaration]==============================*/

/**
 * @brief State Configurable Timer register block structure
 */
typedef struct {
	__IO  uint32_t CONFIG;				/*!< Configuration Register */
	union {
		__IO uint32_t CTRL_U;			/*!< Control Register */
		struct {
			__IO uint16_t CTRL_L;		/*!< Low control register */
			__IO uint16_t CTRL_H;		/*!< High control register */
		};
	};
	__IO uint16_t LIMIT_L;				/*!< limit register for counter L */
	__IO uint16_t LIMIT_H;				/*!< limit register for counter H */
	__IO uint16_t HALT_L;				/*!< halt register for counter L */
	__IO uint16_t HALT_H;				/*!< halt register for counter H */
	__IO uint16_t STOP_L;				/*!< stop register for counter L */
	__IO uint16_t STOP_H;				/*!< stop register for counter H */
	__IO uint16_t START_L;				/*!< start register for counter L */
	__IO uint16_t START_H;				/*!< start register for counter H */
	uint32_t RESERVED1[10];				/*!< 0x03C reserved */
	union {
		__IO uint32_t COUNT_U;			/*!< counter register */
		struct {
			__IO uint16_t COUNT_L;		/*!< counter register for counter L */
			__IO uint16_t COUNT_H;		/*!< counter register for counter H */
		};
	};
	__IO uint16_t STATE_L;				/*!< state register for counter L */
	__IO uint16_t STATE_H;				/*!< state register for counter H */
	__I  uint32_t INPUT;				/*!< input register */
	__IO uint16_t REGMODE_L;			/*!< match - capture registers mode register L */
	__IO uint16_t REGMODE_H;			/*!< match - capture registers mode register H */
	__IO uint32_t OUTPUT;				/*!< output register */
	__IO uint32_t OUTPUTDIRCTRL;		/*!< output counter direction Control Register */
	__IO uint32_t RES;					/*!< conflict resolution register */
	__IO uint32_t DMA0REQUEST;			/*!< DMA0 Request Register */
	__IO uint32_t DMA1REQUEST;			/*!< DMA1 Request Register */
	uint32_t RESERVED2[35];
	__IO uint32_t EVEN;					/*!< event enable register */
	__IO uint32_t EVFLAG;				/*!< event flag register */
	__IO uint32_t CONEN;				/*!< conflict enable register */
	__IO uint32_t CONFLAG;				/*!< conflict flag register */

	union {
		__IO union {					/*!< ... Match / Capture value */
			uint32_t U;					/*!<       SCTMATCH[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       SCTMATCH[i].L  Access to L value */
				uint16_t H;				/*!<       SCTMATCH[i].H  Access to H value */
			};
		} MATCH[CONFIG_SCT_nRG];

		__I union {
			uint32_t U;					/*!<       SCTCAP[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       SCTCAP[i].L  Access to L value */
				uint16_t H;				/*!<       SCTCAP[i].H  Access to H value */
			};
		} CAP[CONFIG_SCT_nRG];

	};

	uint32_t RESERVED3[32 - CONFIG_SCT_nRG];		/*!< ...-0x17C reserved */

	union {
		__IO uint16_t MATCH_L[CONFIG_SCT_nRG];		/*!< 0x180-... Match Value L counter */
		__I  uint16_t CAP_L[CONFIG_SCT_nRG];		/*!< 0x180-... Capture Value L counter */
	};

	uint16_t RESERVED4[32 - CONFIG_SCT_nRG];		/*!< ...-0x1BE reserved */

	union {
		__IO uint16_t MATCH_H[CONFIG_SCT_nRG];		/*!< 0x1C0-... Match Value H counter */
		__I  uint16_t CAP_H[CONFIG_SCT_nRG];		/*!< 0x1C0-... Capture Value H counter */
	};

	uint16_t RESERVED5[32 - CONFIG_SCT_nRG];		/*!< ...-0x1FE reserved */

	union {
		__IO union {					/*!< 0x200-... Match Reload / Capture Control value */
			uint32_t U;					/*!<       SCTMATCHREL[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       SCTMATCHREL[i].L  Access to L value */
				uint16_t H;				/*!<       SCTMATCHREL[i].H  Access to H value */
			};

		} MATCHREL[CONFIG_SCT_nRG];

		__IO union {
			uint32_t U;					/*!<       SCTCAPCTRL[i].U  Unified 32-bit register */
			struct {
				uint16_t L;				/*!<       SCTCAPCTRL[i].L  Access to L value */
				uint16_t H;				/*!<       SCTCAPCTRL[i].H  Access to H value */
			};

		} CAPCTRL[CONFIG_SCT_nRG];

	};

	uint32_t RESERVED6[32 - CONFIG_SCT_nRG];		/*!< ...-0x27C reserved */
	union {
		__IO uint16_t MATCHREL_L[CONFIG_SCT_nRG];	/*!< 0x280-... Match Reload value L counter */
		__IO uint16_t CAPCTRL_L[CONFIG_SCT_nRG];	/*!< 0x280-... Capture Control value L counter */
	};

	uint16_t RESERVED7[32 - CONFIG_SCT_nRG];		/*!< ...-0x2BE reserved */
	union {
		__IO uint16_t MATCHREL_H[CONFIG_SCT_nRG];	/*!< 0x2C0-... Match Reload value H counter */
		__IO uint16_t CAPCTRL_H[CONFIG_SCT_nRG];	/*!< 0x2C0-... Capture Control value H counter */
	};

	uint16_t RESERVED8[32 - CONFIG_SCT_nRG];		/*!< ...-0x2FE reserved */
	__IO struct {						/*!< 0x300-0x3FC  SCTEVENT[i].STATE / SCTEVENT[i].CTRL*/
		uint32_t STATE;					/*!< Event State Register */
		uint32_t CTRL;					/*!< Event Control Register */
	} EVENT[CONFIG_SCT_nEV];

	uint32_t RESERVED9[128 - 2 * CONFIG_SCT_nEV];	/*!< ...-0x4FC reserved */
	__IO struct {						/*!< 0x500-0x57C  SCTOUT[i].SET / SCTOUT[i].CLR */
		uint32_t SET;					/*!< Output n Set Register */
		uint32_t CLR;					/*!< Output n Clear Register */
	} OUT[CONFIG_SCT_nOU];

	uint32_t RESERVED10[191 - 2 * CONFIG_SCT_nOU];	/*!< ...-0x7F8 reserved */
	__I  uint32_t MODULECONTENT;		/*!< 0x7FC Module Content */
} LPC_SCT_T;


/**
 * SCT Match register values enum
 */
typedef enum{
	SCT_MATCH_0 = 0,	/*!< SCT Match register 0 */
	SCT_MATCH_1 = 1,	/*!< SCT Match register 1 */
	SCT_MATCH_2 = 2,	/*!< SCT Match register 2 */
	SCT_MATCH_3 = 3,	/*!< SCT Match register 3 */
	SCT_MATCH_4 = 4		/*!< SCT Match register 4 */
} CHIP_SCT_MATCH_REG_T;

/*==================[external functions declaration]=========================*/
//
///**
// * @brief Initialize the clock of the SCT peripheral
// *  */
//void Chip_SCT_Init();
//
///**
// *  @brief Shutdown the SCT
// *  */
//void Chip_SCT_DeInit(LPC_SCT_T *pSCT);
//
///**
// * @brief	Configures the State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	value	: The 32-bit CONFIG register value
// * @return	Nothing
// * Note : this just assign the value specified to the config register of sct
// */
//void Chip_SCT_Config(LPC_SCT_T *pSCT, uint32_t value);
//
///**
// * @brief	Set control register in State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	value	: Value (ORed value of SCT_CTRL_* bits)
// * @return	Nothing
// * Note : puts in 1 the bits on 1 of "value" in the register CONTROL of the SCT struct
// * if value = 0x2, then the 2 lsb of this registers are put to 1.
// */
//void Chip_SCT_SetControl(LPC_SCT_T *pSCT, uint32_t value);
//
//
///**
// * @brief	Clear control register in State Configurable Timer.
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	value	: Value (ORed value of SCT_CTRL_* bits)
// * @return	Nothing
// * Note : clear the bits on 1 of "value" in the register CONTROL of the SCT struct
// * if value = 0x2, then the 2 lsb of this registers are put to 0.
// */
//void Chip_SCT_ClearControl(LPC_SCT_T *pSCT, uint32_t value);
//
//
///**
// * @brief	Set unified match count value in State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	n		: Match register value
// * @param	value	: The 32-bit match count value
// * @return	Nothing
// */
//void Chip_SCT_SetMatchCount(LPC_SCT_T *pSCT, CHIP_SCT_MATCH_REG_T n, uint32_t value);
//
///**
// * @brief	Set unified match reload count value in State Configurable Timer
// * @param	pSCT	: The base of SCT peripheral on the chip
// * @param	n		: Match register value
// * @param	value	: The 32-bit match count reload value
// * @return	Nothing
// */
//void Chip_SCT_SetMatchReload(LPC_SCT_T *pSCT, CHIP_SCT_MATCH_REG_T n, uint32_t value);

#endif /*_SCT_PERIPHERAL_H_*/

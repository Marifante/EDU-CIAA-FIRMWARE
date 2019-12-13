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

#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_SCT_PERIPHERAL_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_SCT_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

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
/* @brief State Configurable Timer register block structure. */
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


/* @brief SCT Match register values enum.*/
typedef enum{
	SCT_MATCH_0 = 0,	/*!< SCT Match register 0 */
	SCT_MATCH_1 = 1,	/*!< SCT Match register 1 */
	SCT_MATCH_2 = 2,	/*!< SCT Match register 2 */
	SCT_MATCH_3 = 3,	/*!< SCT Match register 3 */
	SCT_MATCH_4 = 4		/*!< SCT Match register 4 */
} CHIP_SCT_MATCH_REG_T;

/* @brief SCT Event register values enum. */
typedef enum
{
	SCT_EVENT_0 = 0,
	SCT_EVENT_1 = 1,
	SCT_EVENT_2 = 2,
	SCT_EVENT_3 = 3,
	SCT_EVENT_4 = 4,
	SCT_EVENT_5 = 5,
	SCT_EVENT_6 = 6,
	SCT_EVENT_7 = 7
} CHIP_SCT_EVENT_REG_T;

/* @brief pin map for output of SCT. */
typedef enum{
	CTOUT_0 = 0,
	CTOUT_1,
	CTOUT_2,
	CTOUT_3,
	CTOUT_4,
	CTOUT_5,
	CTOUT_6,
	CTOUT_7,
	CTOUT_8,
	CTOUT_9,
	CTOUT_10,
	CTOUT_11,
	CTOUT_12,
	CTOUT_13,
	CTOUT_14,
	CTOUT_15
}SCT_outputPin;

/* @brief enum for timer mode of SCT. */
typedef enum
{
	SCT_TWO_16BIT_TIMERS= 0,
	SCT_ONE_32BIT_TIMER = 1
}SCT_TimerMode;


/*==================[external functions declaration]=========================*/
/* @brief choose timer mode & choose if autolimit is enabled . */
void SCT_setTimerMode( SCT_TimerMode timerMode, bool autolimitEnabled );

/* @brief set low timer prescaler. */
void SCT_setLowTimerPrescaler( uint8_t divFactor );

/* @brief sets the event who restarts the timer.
 * Setting HIGH the bit n of this registers makes the n event restarts the timer.*/
void SCT_setLimitLowTimer( uint8_t eventNumber );

/* @brief set the match reload value of the low timer.
 * When BIDIR is 0, this value is copied to MATCH value of the MATCH register.
 * The MATCH registers of the SCT cannot be writed directly. */
void SCT_setLowTimerMatchReload( uint8_t matchNumber, uint32_t matchValue );

/* @brief associate a match with a determinated event. */
void SCT_associateMatchOnlyWithEvent( uint8_t event, uint8_t match );

/* @brief set how the event occurs.
 * If combmode = 1, the event occurs only when the match associated occurs. */
void SCT_setEventCombMode( uint8_t event, uint8_t combMode );

/* @brief set in what state happens a desired event.
 * Each bit of statesMask corresponds to a single state.
 * If 0xFFFFFFFF happens in all states. */
void SCT_setEventState( uint8_t event, uint32_t statesMask );

/* @brief set if a event gonna set a determinated output. */
void SCT_setOutputSETReg( SCT_outputPin sctOutput, uint8_t event );

/* @brief set if a event gonna clear a determinated output. */
void SCT_setOutputCLEARReg( SCT_outputPin sctOutput, uint8_t event );

/* @brief unhalt sct peripheral. */
void SCT_unhalt( void );

#endif /*_LIBRARIES_LPC4337_SPECIFIC_INC_SCT_PERIPHERAL_H_*/

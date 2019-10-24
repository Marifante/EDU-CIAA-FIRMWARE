/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: timer_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _LIBRARIES_LPC4337_SPECIFIC_INC_TIMER_PERIPHERAL_H_
#define _LIBRARIES_LPC4337_SPECIFIC_INC_TIMER_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

// Frequency of PCLK
#ifndef PCLK_MAX_FREQ
#define PCLK_MAX_FREQ 204000000
#endif


// Initialization of the struct  LPC_TIMER, this struct gonna have all the values
// of the registers of the timer
#define LPC_TIMER0_BASE 0x40084000
#define LPC_TIMER0	((LPC_TIMER_T*) LPC_TIMER0_BASE)

#define LPC_TIMER1_BASE	0x40085000
#define LPC_TIMER1	((LPC_TIMER_T*) LPC_TIMER1_BASE)

#define LPC_TIMER2_BASE	0x400C3000
#define LPC_TIMER2	((LPC_TIMER_T*) LPC_TIMER2_BASE)

#define LPC_TIMER3_BASE	0x400C4000
#define LPC_TIMER3	((LPC_TIMER_T*) LPC_TIMER3_BASE)

#define TCR0_OFFSET 0x004
#define TC0_OFFSET 0x008
#define PR0_OFFSET 0x00C
#define PC0_OFFSET 0x010
#define MCR0_OFFSET 0x014
#define MR0_OFFSET 0x018
#define EMR0_OFFSET 0x03C
#define CTCR0_OFFSET 0x070

// Clock address for Timer 0
#define CCU1_BASE 					0x40051000
#define CLK_M4_TIMER0_CFG_OFFSET 	0x520
#define CLK_M4_TIMER0_STAT_OFFSET 	0x524

// Macros to chose a timer with the diferent functions
#define ANYTIMER	99
#define TIMER0		0
#define TIMER1		1
#define TIMER2		2
#define TIMER3		3

// Macros to chose a match of each timer
#define MATCH0		0
#define MATCH1		1
#define MATCH2		2
#define MATCH3		3

/*==================[external data declaration]==============================*/

/**
 * @brief 32-bit Standard timer register block structure
 * this structure have the values of the registers of the timers
 */

typedef struct {					/*!< TIMERn Structure       */
	__IO uint32_t IR;				/*!< Interrupt Register. The IR can be written to clear interrupts. The IR can be read to identify which of eight possible interrupt sources are pending. */
	__IO uint32_t TCR;				/*!< Timer Control Register. The TCR is used to control the Timer Counter functions. The Timer Counter can be disabled or reset through the TCR. */
	__IO uint32_t TC;				/*!< Timer Counter. The 32 bit TC is incremented every PR+1 cycles of PCLK. The TC is controlled through the TCR. */
	__IO uint32_t PR;				/*!< Prescale Register. The Prescale Counter (below) is equal to this value, the next clock increments the TC and clears the PC. */
	__IO uint32_t PC;				/*!< Prescale Counter. The 32 bit PC is a counter which is incremented to the value stored in PR. When the value in PR is reached, the TC is incremented and the PC is cleared. The PC is observable and controllable through the bus interface. */
	__IO uint32_t MCR;				/*!< Match Control Register. The MCR is used to control if an interrupt is generated and if the TC is reset when a Match occurs. */
	__IO uint32_t MR[4];			/*!< Match Register. MR can be enabled through the MCR to reset the TC, stop both the TC and PC, and/or generate an interrupt every time MR matches the TC. */
	__IO uint32_t CCR;				/*!< Capture Control Register. The CCR controls which edges of the capture inputs are used to load the Capture Registers and whether or not an interrupt is generated when a capture takes place. */
	__IO uint32_t CR[4];			/*!< Capture Register. CR is loaded with the value of TC when there is an event on the CAPn.0 input. */
	__IO uint32_t EMR;				/*!< External Match Register. The EMR controls the external match pins MATn.0-3 (MAT0.0-3 and MAT1.0-3 respectively). */
	__I  uint32_t RESERVED0[12];
	__IO uint32_t CTCR;				/*!< Count Control Register. The CTCR selects between Timer and Counter mode, and in Counter mode selects the signal and edge(s) for counting. */
} LPC_TIMER_T;

/*==================[external functions declaration]==========================*/

/* @brief	Function to init timer0/1/2/3
 * @return	pointer to register TC, this registers have the actual count of the timer. */
uint32_t* Timer_init( uint8_t chosenTimer, uint32_t timerFrequency );

/* @brief stop timer. */
void Timer_deInit( uint8_t chosenTimer );

/* @brief config timer match interrupts */
void Timer_configMatchInterrupt( uint8_t chosenTimer, uint8_t matchNumber, uint32_t matchValue);

/* @brief clear match interrupt flag of a timer. */
void Timer_clearMatchIntFlag( LPC_TIMER_T* timerStruct, uint8_t matchNumber );

/* @brief config timer match interrupts. */
void Timer_configMatchInterrupt( uint8_t chosenTimer, uint8_t matchNumber, uint32_t matchValue );

#endif /*_TIMER_PERIPHERAL_H_*/

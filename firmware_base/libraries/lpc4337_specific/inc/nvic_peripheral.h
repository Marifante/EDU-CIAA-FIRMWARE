/*****************************************************************************
 * High Level EDU-CIAA firmware
 *
 * Library: nvic_peripheral
 *
 * Autor: Julian Rodriguez
 * email: jnrodriguezz@hotmail.com
 *****************************************************************************/

#ifndef _NVIC_PERIPHERAL_H_
#define _NVIC_PERIPHERAL_H_

/*==================[inclusions]=============================================*/

#include "../../utils.h"

/*==================[macros and definitions]=================================*/

/*
 * Nester Vector Interrupt Controller (NVIC)
 * */
#define _NVIC_BASE			0xE000E100		// NVIC Base Address (Tabla 81, pag. 115)
#define _NVIC				((_NVIC_Type *)  _NVIC_BASE)

#define SCS_BASE            (0xE000E000UL)                          	//< System Control Space Base Address
#define SCB_BASE            (SCS_BASE +  0x0D00UL)                   	//!< System Control Block Base Address

#define SCB                 ((SCB_Type *) SCB_BASE) 	//SCB configuration struct

#define __NVIC_PRIO_BITS          3			/*!< Number of Bits used for Priority Levels */
/*==================[external data declaration]==============================*/

typedef struct
{
  __I  uint32_t CPUID;                   /*!< Offset: 0x000 (R/ )  CPUID Base Register                                   */
  __IO uint32_t ICSR;                    /*!< Offset: 0x004 (R/W)  Interrupt Control and State Register                  */
  __IO uint32_t VTOR;                    /*!< Offset: 0x008 (R/W)  Vector Table Offset Register                          */
  __IO uint32_t AIRCR;                   /*!< Offset: 0x00C (R/W)  Application Interrupt and Reset Control Register      */
  __IO uint32_t SCR;                     /*!< Offset: 0x010 (R/W)  System Control Register                               */
  __IO uint32_t CCR;                     /*!< Offset: 0x014 (R/W)  Configuration Control Register                        */
  __IO uint8_t  SHP[12];                 /*!< Offset: 0x018 (R/W)  System Handlers Priority Registers (4-7, 8-11, 12-15) */
  __IO uint32_t SHCSR;                   /*!< Offset: 0x024 (R/W)  System Handler Control and State Register             */
  __IO uint32_t CFSR;                    /*!< Offset: 0x028 (R/W)  Configurable Fault Status Register                    */
  __IO uint32_t HFSR;                    /*!< Offset: 0x02C (R/W)  HardFault Status Register                             */
  __IO uint32_t DFSR;                    /*!< Offset: 0x030 (R/W)  Debug Fault Status Register                           */
  __IO uint32_t MMFAR;                   /*!< Offset: 0x034 (R/W)  MemManage Fault Address Register                      */
  __IO uint32_t BFAR;                    /*!< Offset: 0x038 (R/W)  BusFault Address Register                             */
  __IO uint32_t AFSR;                    /*!< Offset: 0x03C (R/W)  Auxiliary Fault Status Register                       */
  __I  uint32_t PFR[2];                  /*!< Offset: 0x040 (R/ )  Processor Feature Register                            */
  __I  uint32_t DFR;                     /*!< Offset: 0x048 (R/ )  Debug Feature Register                                */
  __I  uint32_t ADR;                     /*!< Offset: 0x04C (R/ )  Auxiliary Feature Register                            */
  __I  uint32_t MMFR[4];                 /*!< Offset: 0x050 (R/ )  Memory Model Feature Register                         */
  __I  uint32_t ISAR[5];                 /*!< Offset: 0x060 (R/ )  Instruction Set Attributes Register                   */
       uint32_t RESERVED0[5];
  __IO uint32_t CPACR;                   /*!< Offset: 0x088 (R/W)  Coprocessor Access Control Register                   */
} SCB_Type;

// Nested Vector Interrupt Controller (NVIC)
typedef struct {
	int ISER[8];			// Offset: 0x000 (R/W)  Interrupt Set Enable Register
	int RESERVED0[24];
	int ICER[8];			// Offset: 0x080 (R/W)  Interrupt Clear Enable Register
	int RSERVED1[24];
	int ISPR[8];			// Offset: 0x100 (R/W)  Interrupt Set Pending Register
	int RESERVED2[24];
	int ICPR[8];			// Offset: 0x180 (R/W)  Interrupt Clear Pending Register
	int RESERVED3[24];
	int IABR[8];			// Offset: 0x200 (R/W)  Interrupt Active bit Register
	int RESERVED4[56];
	unsigned char IP[240];	// Offset: 0x300 (R/W)  Interrupt Priority Register (8Bit wide)
    int RESERVED5[644];
	int STIR;				// Offset: 0xE00 ( /W)  Software Trigger Interrupt Register
} _NVIC_Type;


typedef enum {
	/* -------------------------  Cortex-M4 Processor Exceptions Numbers  ----------------------------- */
	Reset_IRQn                = -15, //  1  Reset Vector, invoked on Power up and warm reset
	NonMaskableInt_IRQn       = -14, //  2  Non maskable Interrupt, cannot be stopped or preempted
	HardFault_IRQn            = -13, //  3  Hard Fault, all classes of Fault
	MemoryManagement_IRQn     = -12, //  4  Memory Management, MPU mismatch, including Access Violation and No Match
	BusFault_IRQn             = -11, //  5  Bus Fault, Pre-Fetch-, Memory Access Fault, other address/memory related Fault
	UsageFault_IRQn           = -10, //  6  Usage Fault, i.e. Undef Instruction, Illegal State Transition
	SVCall_IRQn               =  -5, // 11  System Service Call via SVC instruction
	DebugMonitor_IRQn         =  -4, // 12  Debug Monitor
	PendSV_IRQn               =  -2, // 14  Pendable request for system service
	SysTick_IRQn              =  -1, // 15  System Tick Timer

	/* ----------------------  Numero de interrupciones especificas del LPC4337  ---------------------- */
	DAC_IRQn                  =   0, //  0  DAC
	M0APP_IRQn                =   1, //  1  M0APP Core interrupt
	DMA_IRQn                  =   2, //  2  DMA
	RESERVED1_IRQn            =   3, //  3  EZH/EDM
	RESERVED2_IRQn            =   4,
	ETHERNET_IRQn             =   5, //  5  ETHERNET
	SDIO_IRQn                 =   6, //  6  SDIO
	LCD_IRQn                  =   7, //  7  LCD
	USB0_IRQn                 =   8, //  8  USB0
	USB1_IRQn                 =   9, //  9  USB1
	SCT_IRQn                  =  10, // 10  SCT
	RITIMER_IRQn              =  11, // 11  RITIMER
	TIMER0_IRQn               =  12, // 12  TIMER0
	TIMER1_IRQn               =  13, // 13  TIMER1
	TIMER2_IRQn               =  14, // 14  TIMER2
	TIMER3_IRQn               =  15, // 15  TIMER3
	MCPWM_IRQn                =  16, // 16  MCPWM
	ADC0_IRQn                 =  17, // 17  ADC0
	I2C0_IRQn                 =  18, // 18  I2C0
	I2C1_IRQn                 =  19, // 19  I2C1
	SPI_INT_IRQn              =  20, // 20  SPI_INT
	ADC1_IRQn                 =  21, // 21  ADC1
	SSP0_IRQn                 =  22, // 22  SSP0
	SSP1_IRQn                 =  23, // 23  SSP1
	USART0_IRQn               =  24, // 24  USART0
	UART1_IRQn                =  25, // 25  UART1
	USART2_IRQn               =  26, // 26  USART2
	USART3_IRQn               =  27, // 27  USART3
	I2S0_IRQn                 =  28, // 28  I2S0
	I2S1_IRQn                 =  29, // 29  I2S1
	RESERVED4_IRQn            =  30,
	SGPIO_INT_IRQn            =  31, // 31  SGPIO_IINT
	PIN_INT0_IRQn             =  32, // 32  PIN_INT0
	PIN_INT1_IRQn             =  33, // 33  PIN_INT1
	PIN_INT2_IRQn             =  34, // 34  PIN_INT2
	PIN_INT3_IRQn             =  35, // 35  PIN_INT3
	PIN_INT4_IRQn             =  36, // 36  PIN_INT4
	PIN_INT5_IRQn             =  37, // 37  PIN_INT5
	PIN_INT6_IRQn             =  38, // 38  PIN_INT6
	PIN_INT7_IRQn             =  39, // 39  PIN_INT7
	GINT0_IRQn                =  40, // 40  GINT0
	GINT1_IRQn                =  41, // 41  GINT1
	EVENTROUTER_IRQn          =  42, // 42  EVENTROUTER
	C_CAN1_IRQn               =  43, // 43  C_CAN1
	RESERVED6_IRQn            =  44,
	ADCHS_IRQn                =  45, // 45  ADCHS interrupt
	ATIMER_IRQn               =  46, // 46  ATIMER
	RTC_IRQn                  =  47, // 47  RTC
	RESERVED8_IRQn            =  48,
	WWDT_IRQn                 =  49, // 49  WWDT
	M0SUB_IRQn                =  50, // 50  M0SUB core interrupt
	C_CAN0_IRQn               =  51, // 51  C_CAN0
	QEI_IRQn                  =  52, // 52  QEI
} IRQn_Type;

/*====================[external functions declaration]=======================*/

/*
 * @brief
 * @IRQn
 * */
void NVIC_EnaIRQ(IRQn_Type IRQn);

/** \brief  Set Interrupt Priority

    The function sets the priority of an interrupt.

    \note The priority cannot be set for every core interrupt.

    \param [in]      IRQn  Interrupt number.
    \param [in]  priority  Priority to set.
 */
void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority);

#endif /*_NVIC_PERIPHERAL_H_*/

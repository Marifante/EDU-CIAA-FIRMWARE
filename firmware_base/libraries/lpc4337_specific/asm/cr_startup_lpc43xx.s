	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"cr_startup_lpc43xx.c"
	.text
	.section	.after_vectors,"ax",%progbits
	.align	1
	.p2align 2,,3
	.weak	NMI_Handler
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	NMI_Handler, %function
NMI_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L2:
	b	.L2
	.size	NMI_Handler, .-NMI_Handler
	.align	1
	.p2align 2,,3
	.weak	HardFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	HardFault_Handler, %function
HardFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L5:
	b	.L5
	.size	HardFault_Handler, .-HardFault_Handler
	.align	1
	.p2align 2,,3
	.weak	MemManage_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	MemManage_Handler, %function
MemManage_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L7:
	b	.L7
	.size	MemManage_Handler, .-MemManage_Handler
	.align	1
	.p2align 2,,3
	.weak	BusFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	BusFault_Handler, %function
BusFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L9:
	b	.L9
	.size	BusFault_Handler, .-BusFault_Handler
	.align	1
	.p2align 2,,3
	.weak	UsageFault_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	UsageFault_Handler, %function
UsageFault_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L11:
	b	.L11
	.size	UsageFault_Handler, .-UsageFault_Handler
	.align	1
	.p2align 2,,3
	.weak	SVC_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SVC_Handler, %function
SVC_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L13:
	b	.L13
	.size	SVC_Handler, .-SVC_Handler
	.align	1
	.p2align 2,,3
	.weak	DebugMon_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DebugMon_Handler, %function
DebugMon_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L15:
	b	.L15
	.size	DebugMon_Handler, .-DebugMon_Handler
	.align	1
	.p2align 2,,3
	.weak	PendSV_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	PendSV_Handler, %function
PendSV_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L17:
	b	.L17
	.size	PendSV_Handler, .-PendSV_Handler
	.align	1
	.p2align 2,,3
	.weak	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SysTick_Handler, %function
SysTick_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L19:
	b	.L19
	.size	SysTick_Handler, .-SysTick_Handler
	.align	1
	.p2align 2,,3
	.weak	IntDefaultHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	IntDefaultHandler, %function
IntDefaultHandler:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L21:
	b	.L21
	.size	IntDefaultHandler, .-IntDefaultHandler
	.weak	QEI_IRQHandler
	.thumb_set QEI_IRQHandler,IntDefaultHandler
	.weak	CAN0_IRQHandler
	.thumb_set CAN0_IRQHandler,IntDefaultHandler
	.weak	M0SUB_IRQHandler
	.thumb_set M0SUB_IRQHandler,IntDefaultHandler
	.weak	WDT_IRQHandler
	.thumb_set WDT_IRQHandler,IntDefaultHandler
	.weak	RTC_IRQHandler
	.thumb_set RTC_IRQHandler,IntDefaultHandler
	.weak	ATIMER_IRQHandler
	.thumb_set ATIMER_IRQHandler,IntDefaultHandler
	.weak	VADC_IRQHandler
	.thumb_set VADC_IRQHandler,IntDefaultHandler
	.weak	CAN1_IRQHandler
	.thumb_set CAN1_IRQHandler,IntDefaultHandler
	.weak	EVRT_IRQHandler
	.thumb_set EVRT_IRQHandler,IntDefaultHandler
	.weak	GINT1_IRQHandler
	.thumb_set GINT1_IRQHandler,IntDefaultHandler
	.weak	GINT0_IRQHandler
	.thumb_set GINT0_IRQHandler,IntDefaultHandler
	.weak	GPIO7_IRQHandler
	.thumb_set GPIO7_IRQHandler,IntDefaultHandler
	.weak	GPIO6_IRQHandler
	.thumb_set GPIO6_IRQHandler,IntDefaultHandler
	.weak	GPIO5_IRQHandler
	.thumb_set GPIO5_IRQHandler,IntDefaultHandler
	.weak	GPIO4_IRQHandler
	.thumb_set GPIO4_IRQHandler,IntDefaultHandler
	.weak	GPIO3_IRQHandler
	.thumb_set GPIO3_IRQHandler,IntDefaultHandler
	.weak	GPIO2_IRQHandler
	.thumb_set GPIO2_IRQHandler,IntDefaultHandler
	.weak	GPIO1_IRQHandler
	.thumb_set GPIO1_IRQHandler,IntDefaultHandler
	.weak	GPIO0_IRQHandler
	.thumb_set GPIO0_IRQHandler,IntDefaultHandler
	.weak	SGPIO_IRQHandler
	.thumb_set SGPIO_IRQHandler,IntDefaultHandler
	.weak	SPIFI_IRQHandler
	.thumb_set SPIFI_IRQHandler,IntDefaultHandler
	.weak	I2S1_IRQHandler
	.thumb_set I2S1_IRQHandler,IntDefaultHandler
	.weak	I2S0_IRQHandler
	.thumb_set I2S0_IRQHandler,IntDefaultHandler
	.weak	UART3_IRQHandler
	.thumb_set UART3_IRQHandler,IntDefaultHandler
	.weak	UART2_IRQHandler
	.thumb_set UART2_IRQHandler,IntDefaultHandler
	.weak	UART1_IRQHandler
	.thumb_set UART1_IRQHandler,IntDefaultHandler
	.weak	UART0_IRQHandler
	.thumb_set UART0_IRQHandler,IntDefaultHandler
	.weak	SSP1_IRQHandler
	.thumb_set SSP1_IRQHandler,IntDefaultHandler
	.weak	SSP0_IRQHandler
	.thumb_set SSP0_IRQHandler,IntDefaultHandler
	.weak	ADC1_IRQHandler
	.thumb_set ADC1_IRQHandler,IntDefaultHandler
	.weak	I2C1_IRQHandler
	.thumb_set I2C1_IRQHandler,IntDefaultHandler
	.weak	SPI_IRQHandler
	.thumb_set SPI_IRQHandler,IntDefaultHandler
	.weak	I2C0_IRQHandler
	.thumb_set I2C0_IRQHandler,IntDefaultHandler
	.weak	ADC0_IRQHandler
	.thumb_set ADC0_IRQHandler,IntDefaultHandler
	.weak	MCPWM_IRQHandler
	.thumb_set MCPWM_IRQHandler,IntDefaultHandler
	.weak	TIMER3_IRQHandler
	.thumb_set TIMER3_IRQHandler,IntDefaultHandler
	.weak	TIMER2_IRQHandler
	.thumb_set TIMER2_IRQHandler,IntDefaultHandler
	.weak	TIMER1_IRQHandler
	.thumb_set TIMER1_IRQHandler,IntDefaultHandler
	.weak	TIMER0_IRQHandler
	.thumb_set TIMER0_IRQHandler,IntDefaultHandler
	.weak	RIT_IRQHandler
	.thumb_set RIT_IRQHandler,IntDefaultHandler
	.weak	SCT_IRQHandler
	.thumb_set SCT_IRQHandler,IntDefaultHandler
	.weak	USB1_IRQHandler
	.thumb_set USB1_IRQHandler,IntDefaultHandler
	.weak	USB0_IRQHandler
	.thumb_set USB0_IRQHandler,IntDefaultHandler
	.weak	LCD_IRQHandler
	.thumb_set LCD_IRQHandler,IntDefaultHandler
	.weak	SDIO_IRQHandler
	.thumb_set SDIO_IRQHandler,IntDefaultHandler
	.weak	ETH_IRQHandler
	.thumb_set ETH_IRQHandler,IntDefaultHandler
	.weak	FLASH_EEPROM_IRQHandler
	.thumb_set FLASH_EEPROM_IRQHandler,IntDefaultHandler
	.weak	DMA_IRQHandler
	.thumb_set DMA_IRQHandler,IntDefaultHandler
	.weak	M0CORE_IRQHandler
	.thumb_set M0CORE_IRQHandler,IntDefaultHandler
	.weak	DAC_IRQHandler
	.thumb_set DAC_IRQHandler,IntDefaultHandler
	.section	.text.ResetISR,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	ResetISR
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ResetISR, %function
ResetISR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.syntax unified
@ 326 ".\src/cr_startup_lpc43xx.c" 1
	cpsid i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L46
	ldr	r7, .L46+4
	ldr	r6, .L46+8
	ldr	r0, .L46+12
	ldr	r2, .L46+16
	ldr	r4, .L46+20
	ldr	r1, .L46+24
	mov	r3, #-1
	str	r3, [r7]
	str	r3, [r6]
	str	r3, [r5]
	str	r3, [r0]
	str	r3, [r2]
	ldr	r0, .L46+28
	ldr	r2, .L46+32
	str	r3, [r4]
	str	r3, [r1]
	ldr	r4, .L46+36
	ldr	r1, .L46+40
	str	r3, [r5, #20]
	str	r4, [r0]
	str	r1, [r2]
	.syntax unified
@ 356 ".\src/cr_startup_lpc43xx.c" 1
	cpsie i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L46+44
	ldr	r6, .L46+48
.L44:
	cmp	r2, r6
	bcs	.L23
.L45:
	ldrd	r4, r5, [r2]
	adds	r2, r2, #12
	ldr	r0, [r2, #-4]
	cmp	r0, #0
	beq	.L44
	movs	r3, #0
.L25:
	ldr	r1, [r4, r3]
	str	r1, [r5, r3]
	adds	r3, r3, #4
	cmp	r0, r3
	bhi	.L25
	cmp	r2, r6
	bcc	.L45
.L23:
	ldr	r1, .L46+52
	cmp	r2, r1
	bcs	.L27
	subs	r1, r1, #1
	subs	r1, r1, r2
	add	r3, r2, #16
	bic	r1, r1, #7
	add	r1, r1, r3
	adds	r2, r2, #8
	movs	r4, #0
.L30:
	ldrd	r5, r0, [r2, #-8]
	cbz	r0, .L28
	movs	r3, #0
.L29:
	str	r4, [r5, r3]
	adds	r3, r3, #4
	cmp	r0, r3
	bhi	.L29
.L28:
	adds	r2, r2, #8
	cmp	r2, r1
	bne	.L30
.L27:
	.syntax unified
@ 399 ".\src/cr_startup_lpc43xx.c" 1
	LDR.W R0, =0xE000ED88
@ 0 "" 2
@ 401 ".\src/cr_startup_lpc43xx.c" 1
	LDR R1, [R0]
@ 0 "" 2
@ 403 ".\src/cr_startup_lpc43xx.c" 1
	 ORR R1, R1, #(0xF << 20)
@ 0 "" 2
@ 405 ".\src/cr_startup_lpc43xx.c" 1
	STR R1, [R0]
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L46+56
	ldr	r2, .L46+60
	str	r2, [r3]
	bl	main
.L31:
	b	.L31
.L47:
	.align	2
.L46:
	.word	-536812920
	.word	-536812928
	.word	-536812924
	.word	-536812916
	.word	-536812912
	.word	-536812908
	.word	-536812904
	.word	1074082048
	.word	1074082052
	.word	283054080
	.word	31455231
	.word	__data_section_table
	.word	__data_section_table_end
	.word	__bss_section_table_end
	.word	-536810232
	.word	.LANCHOR0
	.size	ResetISR, .-ResetISR
	.section	.after_vectors
	.align	1
	.p2align 2,,3
	.global	data_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	data_init, %function
data_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r2, .L56
	push	{r4}
	movs	r3, #0
.L50:
	ldr	r4, [r0, r3]
	str	r4, [r1, r3]
	adds	r3, r3, #4
	cmp	r2, r3
	bhi	.L50
	ldr	r4, [sp], #4
	bx	lr
.L56:
	bx	lr
	.size	data_init, .-data_init
	.align	1
	.p2align 2,,3
	.global	bss_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	bss_init, %function
bss_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r1, .L59
	movs	r3, #0
	mov	r2, r3
.L61:
	str	r2, [r0, r3]
	adds	r3, r3, #4
	cmp	r1, r3
	bhi	.L61
.L59:
	bx	lr
	.size	bss_init, .-bss_init
	.global	g_pfnVectors
	.section	.isr_vector,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_pfnVectors, %object
	.size	g_pfnVectors, 276
g_pfnVectors:
	.word	_vStackTop
	.word	ResetISR
	.word	NMI_Handler
	.word	HardFault_Handler
	.word	MemManage_Handler
	.word	BusFault_Handler
	.word	UsageFault_Handler
	.word	__valid_user_code_checksum
	.word	0
	.word	0
	.word	0
	.word	SVC_Handler
	.word	DebugMon_Handler
	.word	0
	.word	PendSV_Handler
	.word	SysTick_Handler
	.word	DAC_IRQHandler
	.word	M0CORE_IRQHandler
	.word	DMA_IRQHandler
	.word	0
	.word	FLASH_EEPROM_IRQHandler
	.word	ETH_IRQHandler
	.word	SDIO_IRQHandler
	.word	LCD_IRQHandler
	.word	USB0_IRQHandler
	.word	USB1_IRQHandler
	.word	SCT_IRQHandler
	.word	RIT_IRQHandler
	.word	TIMER0_IRQHandler
	.word	TIMER1_IRQHandler
	.word	TIMER2_IRQHandler
	.word	TIMER3_IRQHandler
	.word	MCPWM_IRQHandler
	.word	ADC0_IRQHandler
	.word	I2C0_IRQHandler
	.word	I2C1_IRQHandler
	.word	SPI_IRQHandler
	.word	ADC1_IRQHandler
	.word	SSP0_IRQHandler
	.word	SSP1_IRQHandler
	.word	UART0_IRQHandler
	.word	UART1_IRQHandler
	.word	UART2_IRQHandler
	.word	UART3_IRQHandler
	.word	I2S0_IRQHandler
	.word	I2S1_IRQHandler
	.word	SPIFI_IRQHandler
	.word	SGPIO_IRQHandler
	.word	GPIO0_IRQHandler
	.word	GPIO1_IRQHandler
	.word	GPIO2_IRQHandler
	.word	GPIO3_IRQHandler
	.word	GPIO4_IRQHandler
	.word	GPIO5_IRQHandler
	.word	GPIO6_IRQHandler
	.word	GPIO7_IRQHandler
	.word	GINT0_IRQHandler
	.word	GINT1_IRQHandler
	.word	EVRT_IRQHandler
	.word	CAN1_IRQHandler
	.word	0
	.word	VADC_IRQHandler
	.word	ATIMER_IRQHandler
	.word	RTC_IRQHandler
	.word	0
	.word	WDT_IRQHandler
	.word	M0SUB_IRQHandler
	.word	CAN0_IRQHandler
	.word	QEI_IRQHandler
	.weak	__valid_user_code_checksum
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

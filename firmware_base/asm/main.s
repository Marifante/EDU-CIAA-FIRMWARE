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
	.file	"main.c"
	.text
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.section	.text.WriteOutputValues,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	WriteOutputValues
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	WriteOutputValues, %function
WriteOutputValues:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L7+40
	ldr	r6, .L7+44
	ldrb	r4, [r5]	@ zero_extendqisi2
	ldr	r8, .L7+52
	ldr	fp, .L7+56
	vpush.64	{d8, d9}
	mov	r0, r4
	sub	sp, sp, #68
	bl	__aeabi_i2d
	ldrb	r9, [r5, #1]	@ zero_extendqisi2
	vldr.32	s18, .L7+48
	strd	r0, [sp, #32]
	mov	r0, r9
	bl	__aeabi_i2d
	ldrb	r7, [r5, #2]	@ zero_extendqisi2
	strd	r0, [sp, #40]
	mov	r0, r7
	bl	__aeabi_i2d
	ldrb	r5, [r5, #3]	@ zero_extendqisi2
	strd	r0, [sp, #48]
	mov	r0, r5
	bl	__aeabi_i2d
	add	r4, r4, r9
	vldr.64	d7, .L7
	add	r7, r7, r4
	add	r7, r7, r5
	vstr.64	d7, [sp, #24]
	vmov	s15, r7	@ int
	vcvt.f32.s32	s16, s15
	vldr.64	d7, .L7
	strd	r0, [sp, #56]
	mov	r10, #0
	vstr.64	d7, [sp, #16]
	vstr.64	d7, [sp, #8]
	vstr.64	d7, [sp]
	add	r9, r6, #2048
	movs	r7, #0
	vmov.f32	s17, #1.0e+0
	b	.L3
.L6:
	bl	__aeabi_i2d
	adr	r3, .L7+8
	ldrd	r2, [r3]
	mov	r4, r0
	mov	r5, r1
	bl	__aeabi_dmul
	mov	r2, r10
	mov	r3, fp
	bl	__aeabi_dmul
	bl	sin
	adr	r3, .L7+16
	ldrd	r2, [r3]
	strd	r0, [sp]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r10
	mov	r3, fp
	bl	__aeabi_dmul
	bl	sin
	adr	r3, .L7+24
	ldrd	r2, [r3]
	strd	r0, [sp, #8]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r10
	mov	r3, fp
	bl	__aeabi_dmul
	bl	sin
	adr	r3, .L7+32
	ldrd	r2, [r3]
	strd	r0, [sp, #16]
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r10
	mov	r3, fp
	bl	__aeabi_dmul
	bl	sin
	strd	r0, [sp, #24]
.L3:
	ldrd	r2, [sp]
	ldrd	r0, [sp, #32]
	bl	__aeabi_dmul
	ldrd	r2, [sp, #8]
	mov	r4, r0
	mov	r5, r1
	ldrd	r0, [sp, #40]
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	ldrd	r2, [sp, #16]
	mov	r4, r0
	mov	r5, r1
	ldrd	r0, [sp, #48]
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	ldrd	r2, [sp, #24]
	mov	r4, r0
	mov	r5, r1
	ldrd	r0, [sp, #56]
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	bl	__aeabi_d2f
	vmov	s15, r0
	vdiv.f32	s15, s15, s16
	adds	r7, r7, #1
	mov	r0, r7
	vadd.f32	s15, s15, s17
	vmul.f32	s15, s15, s18
	vcvt.u32.f32	s15, s15
	vmov	r2, s15	@ int
	lsls	r3, r2, #6
	str	r2, [r6, #4]!
	uxth	r3, r3
	orr	r3, r3, #65536
	cmp	r6, r9
	str	r3, [r8, #4]!
	bne	.L6
	add	sp, sp, #68
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L8:
	.align	3
.L7:
	.word	0
	.word	0
	.word	1405670641
	.word	1075388923
	.word	1405670641
	.word	1076437499
	.word	1405670641
	.word	1077486075
	.word	1405670641
	.word	1078534651
	.word	.LANCHOR0
	.word	sinList-4
	.word	1140817920
	.word	outputValues-4
	.word	1063256064
	.size	WriteOutputValues, .-WriteOutputValues
	.section	.text.updateLinkedList,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	updateLinkedList
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	updateLinkedList, %function
updateLinkedList:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	ldr	r5, .L13
	ldr	r2, .L13+4
	ldrb	r4, [r5]	@ zero_extendqisi2
	ldr	r3, .L13+8
	add	r2, r2, r4, lsl #11
	add	r0, r3, #2048
.L10:
	ldr	r1, [r3, #4]!
	str	r1, [r2, #4]!
	cmp	r3, r0
	bne	.L10
	clz	r3, r4
	lsrs	r3, r3, #5
	strb	r3, [r5]
	pop	{r4, r5}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR1
	.word	lliValues-4
	.word	outputValues-4
	.size	updateLinkedList, .-updateLinkedList
	.section	.text.ConfigAllButtons,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	ConfigAllButtons
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ConfigAllButtons, %function
ConfigAllButtons:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L17
	ldr	r4, .L17+4
	ldr	r5, .L17+8
	mov	r1, r6
	movs	r2, #0
	movs	r0, #6
	bl	configGpio
	mov	r0, r6
	movs	r2, #1
	movs	r1, #0
	bl	configTecInterrupts
	mov	r1, r4
	movs	r2, #0
	movs	r0, #7
	bl	configGpio
	movs	r2, #1
	mov	r0, r4
	mov	r1, r2
	bl	configTecInterrupts
	ldr	r4, .L17+12
	mov	r1, r5
	movs	r2, #0
	movs	r0, #8
	bl	configGpio
	mov	r0, r5
	movs	r2, #1
	movs	r1, #2
	bl	configTecInterrupts
	mov	r1, r4
	movs	r2, #0
	movs	r0, #9
	bl	configGpio
	mov	r0, r4
	movs	r2, #1
	movs	r1, #3
	pop	{r4, r5, r6, lr}
	b	configTecInterrupts
.L18:
	.align	2
.L17:
	.word	tec1
	.word	tec2
	.word	tec3
	.word	tec4
	.size	ConfigAllButtons, .-ConfigAllButtons
	.section	.text.ConfigLeds,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	ConfigLeds
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ConfigLeds, %function
ConfigLeds:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r1, .L21
	movs	r0, #0
	bl	configLed
	ldr	r1, .L21+4
	movs	r0, #3
	bl	configLed
	ldr	r1, .L21+8
	movs	r0, #4
	bl	configLed
	ldr	r1, .L21+12
	movs	r0, #5
	pop	{r3, lr}
	b	configLed
.L22:
	.align	2
.L21:
	.word	led0_r
	.word	led1
	.word	led2
	.word	led3
	.size	ConfigLeds, .-ConfigLeds
	.section	.text.ConfigDMA,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	ConfigDMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ConfigDMA, %function
ConfigDMA:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	movs	r0, #27
	sub	sp, sp, #44
	bl	CREG_configDMAmux
	movs	r4, #0
	movs	r2, #1
	movs	r3, #2
	str	r2, [sp, #32]
	strd	r2, r2, [sp, #8]
	mov	r1, r4
	mov	r2, r4
	str	r3, [sp]
	strd	r4, r4, [sp, #24]
	strd	r4, r4, [sp, #16]
	str	r4, [sp, #4]
	mov	r0, #512
	bl	GPDMA_CtrlWrd
	ldr	r5, .L25
	ldr	r6, .L25+4
	ldr	r8, .L25+12
	ldr	r9, .L25+16
	str	r0, [sp]
	mov	r7, r0
	mov	r3, r8
	mov	r2, r5
	mov	r1, r9
	mov	r0, r6
	bl	GPDMA_CreateLLI
	add	r1, r9, #2048
	mov	r0, r8
	mov	r3, r6
	mov	r2, r5
	str	r7, [sp]
	bl	GPDMA_CreateLLI
	movw	r1, #35777
	str	r1, [sp, #4]
	str	r7, [sp]
	mov	r3, r6
	mov	r2, r5
	mov	r0, r4
	ldr	r1, .L25+8
	bl	GPDMA_configChannel
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L26:
	.align	2
.L25:
	.word	1074663424
	.word	firstDataLLI
	.word	outputValues
	.word	secondDataLLI
	.word	lliValues
	.size	ConfigDMA, .-ConfigDMA
	.section	.text.startup.main,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	main, %function
main:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r7, fp, lr}
	bl	InitializateAllLeds
	bl	WriteOutputValues
	bl	DAC_init
	bl	ConfigLeds
	bl	ConfigAllButtons
	bl	ConfigDMA
	ldr	r3, .L51
	ldr	r10, .L51+20
	ldr	r6, .L51+4
	ldr	r4, .L51+8
	ldr	r7, .L51+12
	ldr	r8, .L51+24
	ldr	r9, .L51+28
	movs	r2, #15
	str	r2, [r3, #4]
	mov	r1, #512
	mov	r0, #1000
	bl	DAC_configToSample
	movs	r5, #2
	ldrb	r3, [r10]	@ zero_extendqisi2
	mov	fp, #0
	b	.L28
.L49:
	cbz	r2, .L30
	cmp	r3, #2
	bne	.L46
	ldr	r0, [r4]
	cbnz	r0, .L48
.L46:
	strb	fp, [r10]
.L34:
	movs	r3, #0
.L28:
	sxtb	r2, r3
.L30:
	cmp	r3, #1
	bne	.L49
	ldrb	r3, [r6]	@ zero_extendqisi2
	cbnz	r3, .L50
.L33:
	bl	WriteOutputValues
	str	r5, [r4]
	strb	fp, [r10]
	b	.L34
.L50:
	movs	r0, #2
	bl	NVIC_EnaIRQ
	b	.L33
.L48:
	ldrb	ip, [r7]	@ zero_extendqisi2
	ldr	r3, .L51+16
	add	r2, r8, ip, lsl #11
	subs	r2, r2, #4
.L36:
	ldr	r1, [r3, #4]!
	str	r1, [r2, #4]!
	cmp	r3, r9
	bne	.L36
	clz	r3, ip
	lsrs	r3, r3, #5
	subs	r0, r0, #1
	strb	r3, [r7]
	str	r0, [r4]
	b	.L46
.L52:
	.align	2
.L51:
	.word	1074663424
	.word	.LANCHOR3
	.word	.LANCHOR4
	.word	.LANCHOR1
	.word	outputValues-4
	.word	.LANCHOR2
	.word	lliValues
	.word	outputValues+2044
	.size	main, .-main
	.section	.text.ConfigDAC,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	ConfigDAC
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	ConfigDAC, %function
ConfigDAC:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	movs	r2, #15
	str	r2, [r3, #4]
	bx	lr
.L55:
	.align	2
.L54:
	.word	1074663424
	.size	ConfigDAC, .-ConfigDAC
	.section	.text.TIMER0_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	TIMER0_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIMER0_IRQHandler, %function
TIMER0_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r1, #0
	push	{r4, lr}
	mov	r0, r1
	bl	Timer_clearMatchIntFlag
	movs	r1, #0
	mov	r0, r1
	bl	Timer_disableMatchInterrupt
	ldr	r2, .L58
	ldr	r1, .L58+4
	ldrb	r3, [r2]	@ zero_extendqisi2
	ldr	r0, .L58+8
	eor	r3, r3, #1
	movs	r4, #1
	strb	r4, [r1]
	strb	r3, [r2]
	bl	toggleGpio
	movs	r0, #32
	pop	{r4, lr}
	b	NVIC_EnaIRQ
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	led0_r
	.size	TIMER0_IRQHandler, .-TIMER0_IRQHandler
	.section	.text.TIMER1_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	TIMER1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIMER1_IRQHandler, %function
TIMER1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r1, #0
	movs	r0, #1
	bl	Timer_clearMatchIntFlag
	movs	r1, #0
	movs	r0, #1
	bl	Timer_disableMatchInterrupt
	ldr	r2, .L62
	ldr	r1, .L62+4
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	ldr	r0, .L62+8
	eor	r3, r3, #1
	movs	r4, #1
	strb	r4, [r1]
	strb	r3, [r2, #1]
	bl	toggleGpio
	movs	r0, #33
	pop	{r4, lr}
	b	NVIC_EnaIRQ
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	led1
	.size	TIMER1_IRQHandler, .-TIMER1_IRQHandler
	.section	.text.TIMER2_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	TIMER2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIMER2_IRQHandler, %function
TIMER2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r1, #0
	movs	r0, #2
	bl	Timer_clearMatchIntFlag
	movs	r1, #0
	movs	r0, #2
	bl	Timer_disableMatchInterrupt
	ldr	r2, .L66
	ldr	r1, .L66+4
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	ldr	r0, .L66+8
	eor	r3, r3, #1
	movs	r4, #1
	strb	r4, [r1]
	strb	r3, [r2, #2]
	bl	toggleGpio
	movs	r0, #34
	pop	{r4, lr}
	b	NVIC_EnaIRQ
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	led2
	.size	TIMER2_IRQHandler, .-TIMER2_IRQHandler
	.section	.text.TIMER3_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	TIMER3_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	TIMER3_IRQHandler, %function
TIMER3_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r1, #0
	movs	r0, #3
	bl	Timer_clearMatchIntFlag
	movs	r1, #0
	movs	r0, #3
	bl	Timer_disableMatchInterrupt
	ldr	r2, .L70
	ldr	r1, .L70+4
	ldrb	r3, [r2, #3]	@ zero_extendqisi2
	ldr	r0, .L70+8
	eor	r3, r3, #1
	movs	r4, #1
	strb	r4, [r1]
	strb	r3, [r2, #3]
	bl	toggleGpio
	movs	r0, #35
	pop	{r4, lr}
	b	NVIC_EnaIRQ
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	led3
	.size	TIMER3_IRQHandler, .-TIMER3_IRQHandler
	.section	.text.GPIO0_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO0_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO0_IRQHandler, %function
GPIO0_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #0
	bl	clearGPIOInterruptFlag
	movs	r0, #32
	bl	NVIC_disableIRQ
	movs	r2, #0
	mov	r1, r2
	movw	r0, #10000
	pop	{r3, lr}
	b	Delay_initNonBlockingDelay
	.size	GPIO0_IRQHandler, .-GPIO0_IRQHandler
	.section	.text.GPIO1_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO1_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO1_IRQHandler, %function
GPIO1_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #1
	bl	clearGPIOInterruptFlag
	movs	r0, #33
	bl	NVIC_disableIRQ
	movs	r2, #0
	movs	r1, #1
	movw	r0, #10000
	pop	{r3, lr}
	b	Delay_initNonBlockingDelay
	.size	GPIO1_IRQHandler, .-GPIO1_IRQHandler
	.section	.text.GPIO2_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO2_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO2_IRQHandler, %function
GPIO2_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #2
	bl	clearGPIOInterruptFlag
	movs	r0, #34
	bl	NVIC_disableIRQ
	movs	r2, #0
	movs	r1, #2
	movw	r0, #10000
	pop	{r3, lr}
	b	Delay_initNonBlockingDelay
	.size	GPIO2_IRQHandler, .-GPIO2_IRQHandler
	.section	.text.GPIO3_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO3_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO3_IRQHandler, %function
GPIO3_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #3
	bl	clearGPIOInterruptFlag
	movs	r0, #35
	bl	NVIC_disableIRQ
	movs	r2, #0
	movs	r1, #3
	movw	r0, #10000
	pop	{r3, lr}
	b	Delay_initNonBlockingDelay
	.size	GPIO3_IRQHandler, .-GPIO3_IRQHandler
	.section	.text.DMA_IRQHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	DMA_IRQHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DMA_IRQHandler, %function
DMA_IRQHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #0
	bl	GPDMA_clearTerminalCountInterrupt
	ldr	r3, .L82
	movs	r2, #2
	strb	r2, [r3]
	pop	{r3, pc}
.L83:
	.align	2
.L82:
	.word	.LANCHOR2
	.size	DMA_IRQHandler, .-DMA_IRQHandler
	.global	listsToWrite
	.global	InitialPress
	.comm	secondDataLLI,16,4
	.comm	firstDataLLI,16,4
	.global	buttonFlags
	.global	programState
	.global	whoBufferGoes
	.comm	lliValues,4096,4
	.comm	sinList,2048,4
	.comm	outputValues,2048,4
	.comm	tec4,6,4
	.comm	tec3,6,4
	.comm	tec2,6,4
	.comm	tec1,6,4
	.comm	led3,6,4
	.comm	led2,6,4
	.comm	led1,6,4
	.comm	led0_b,6,4
	.comm	led0_g,6,4
	.comm	led0_r,6,4
	.section	.bss.buttonFlags,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	buttonFlags, %object
	.size	buttonFlags, 4
buttonFlags:
	.space	4
	.section	.bss.programState,"aw",%nobits
	.set	.LANCHOR2,. + 0
	.type	programState, %object
	.size	programState, 1
programState:
	.space	1
	.section	.bss.whoBufferGoes,"aw",%nobits
	.set	.LANCHOR1,. + 0
	.type	whoBufferGoes, %object
	.size	whoBufferGoes, 1
whoBufferGoes:
	.space	1
	.section	.data.InitialPress,"aw"
	.set	.LANCHOR3,. + 0
	.type	InitialPress, %object
	.size	InitialPress, 1
InitialPress:
	.byte	1
	.section	.data.listsToWrite,"aw"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	listsToWrite, %object
	.size	listsToWrite, 4
listsToWrite:
	.word	2
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

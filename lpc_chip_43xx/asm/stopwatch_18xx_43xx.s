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
	.file	"stopwatch_18xx_43xx.c"
	.text
	.section	.text.StopWatch_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	StopWatch_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	StopWatch_Init, %function
StopWatch_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r4, .L4
	ldr	r5, .L4+4
	mov	r0, r4
	bl	Chip_TIMER_Init
	movs	r3, #7
	str	r3, [r4, #12]
	ldr	r3, [r4, #4]
	orr	r3, r3, #1
	str	r3, [r4, #4]
	movs	r0, #132
	bl	Chip_Clock_GetRate
	ldr	r2, .L4+8
	ldr	r3, .L4+12
	ldr	r4, .L4+16
	ldr	r1, .L4+20
	umull	ip, r2, r2, r0
	umull	ip, r3, r3, r0
	lsrs	r2, r2, #9
	lsrs	r3, r3, #21
	lsrs	r0, r0, #3
	str	r2, [r5]
	str	r3, [r4]
	str	r0, [r1]
	pop	{r3, r4, r5, pc}
.L5:
	.align	2
.L4:
	.word	1074282496
	.word	.LANCHOR1
	.word	274877907
	.word	1125899907
	.word	.LANCHOR2
	.word	.LANCHOR0
	.size	StopWatch_Init, .-StopWatch_Init
	.section	.text.StopWatch_Start,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	StopWatch_Start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	StopWatch_Start, %function
StopWatch_Start:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	ldr	r0, [r3, #8]
	bx	lr
.L8:
	.align	2
.L7:
	.word	1074282496
	.size	StopWatch_Start, .-StopWatch_Start
	.section	.text.StopWatch_TicksPerSecond,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	StopWatch_TicksPerSecond
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	StopWatch_TicksPerSecond, %function
StopWatch_TicksPerSecond:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldr	r0, [r3]
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	StopWatch_TicksPerSecond, .-StopWatch_TicksPerSecond
	.section	.text.StopWatch_TicksToMs,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	StopWatch_TicksToMs
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	StopWatch_TicksToMs, %function
StopWatch_TicksToMs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldr	r3, [r3]
	udiv	r0, r0, r3
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR1
	.size	StopWatch_TicksToMs, .-StopWatch_TicksToMs
	.section	.text.StopWatch_TicksToUs,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	StopWatch_TicksToUs
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	StopWatch_TicksToUs, %function
StopWatch_TicksToUs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	ldr	r3, [r3]
	udiv	r0, r0, r3
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR2
	.size	StopWatch_TicksToUs, .-StopWatch_TicksToUs
	.section	.text.StopWatch_MsToTicks,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	StopWatch_MsToTicks
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	StopWatch_MsToTicks, %function
StopWatch_MsToTicks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldr	r3, [r3]
	mul	r0, r3, r0
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR1
	.size	StopWatch_MsToTicks, .-StopWatch_MsToTicks
	.section	.text.StopWatch_UsToTicks,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	StopWatch_UsToTicks
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	StopWatch_UsToTicks, %function
StopWatch_UsToTicks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L22
	ldr	r3, [r3]
	mul	r0, r3, r0
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR2
	.size	StopWatch_UsToTicks, .-StopWatch_UsToTicks
	.section	.bss.ticksPerMs,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ticksPerMs, %object
	.size	ticksPerMs, 4
ticksPerMs:
	.space	4
	.section	.bss.ticksPerSecond,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ticksPerSecond, %object
	.size	ticksPerSecond, 4
ticksPerSecond:
	.space	4
	.section	.bss.ticksPerUs,"aw",%nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	ticksPerUs, %object
	.size	ticksPerUs, 4
ticksPerUs:
	.space	4
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"timer_18xx_43xx.c"
	.text
	.section	.text.Chip_TIMER_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_TIMER_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_TIMER_Init, %function
Chip_TIMER_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	cmp	r0, r3
	beq	.L3
	sub	r3, r3, #4096
	cmp	r0, r3
	beq	.L4
	sub	r3, r3, #253952
	cmp	r0, r3
	ite	eq
	moveq	r0, #133
	movne	r0, #132
	b	Chip_Clock_Enable
.L4:
	movs	r0, #163
	b	Chip_Clock_Enable
.L3:
	movs	r0, #164
	b	Chip_Clock_Enable
.L8:
	.align	2
.L7:
	.word	1074544640
	.size	Chip_TIMER_Init, .-Chip_TIMER_Init
	.section	.text.Chip_TIMER_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_TIMER_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_TIMER_DeInit, %function
Chip_TIMER_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	cmp	r0, r3
	beq	.L11
	sub	r3, r3, #4096
	cmp	r0, r3
	beq	.L12
	sub	r3, r3, #253952
	cmp	r0, r3
	ite	eq
	moveq	r0, #133
	movne	r0, #132
	b	Chip_Clock_Disable
.L12:
	movs	r0, #163
	b	Chip_Clock_Disable
.L11:
	movs	r0, #164
	b	Chip_Clock_Disable
.L15:
	.align	2
.L14:
	.word	1074544640
	.size	Chip_TIMER_DeInit, .-Chip_TIMER_DeInit
	.section	.text.Chip_TIMER_Reset,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_TIMER_Reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_TIMER_Reset, %function
Chip_TIMER_Reset:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	movs	r1, #1
	movs	r4, #0
	movs	r3, #2
	ldr	r2, [r0, #4]
	str	r4, [r0, #4]
	str	r1, [r0, #8]
	str	r3, [r0, #4]
.L17:
	ldr	r3, [r0, #8]
	cmp	r3, #0
	bne	.L17
	str	r2, [r0, #4]
	ldr	r4, [sp], #4
	bx	lr
	.size	Chip_TIMER_Reset, .-Chip_TIMER_Reset
	.section	.text.Chip_TIMER_ExtMatchControlSet,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_TIMER_ExtMatchControlSet
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_TIMER_ExtMatchControlSet, %function
Chip_TIMER_ExtMatchControlSet:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	adds	r4, r3, #2
	lsls	r4, r4, #1
	movs	r5, #3
	lsls	r5, r5, r4
	lsls	r2, r2, r4
	movs	r4, #1
	lsls	r1, r1, r3
	lsls	r4, r4, r3
	ldr	r3, [r0, #60]
	orrs	r4, r4, r5
	bic	r4, r3, r4
	orrs	r2, r2, r1
	orrs	r2, r2, r4
	str	r4, [r0, #60]
	str	r2, [r0, #60]
	pop	{r4, r5}
	bx	lr
	.size	Chip_TIMER_ExtMatchControlSet, .-Chip_TIMER_ExtMatchControlSet
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

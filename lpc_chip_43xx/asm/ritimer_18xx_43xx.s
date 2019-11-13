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
	.file	"ritimer_18xx_43xx.c"
	.text
	.section	.text.Chip_RIT_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RIT_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RIT_Init, %function
Chip_RIT_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r3, #1
	mov	r4, r0
	mov	r2, r3
	mov	r1, r3
	movs	r0, #160
	bl	Chip_Clock_EnableOpts
	movs	r3, #0
	mov	r1, #-1
	movs	r2, #12
	str	r1, [r4]
	str	r3, [r4, #4]
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	pop	{r4, pc}
	.size	Chip_RIT_Init, .-Chip_RIT_Init
	.section	.text.Chip_RIT_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RIT_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RIT_DeInit, %function
Chip_RIT_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r3, #1
	mov	r4, r0
	mov	r2, r3
	mov	r1, r3
	movs	r0, #160
	bl	Chip_Clock_EnableOpts
	movs	r3, #0
	mov	r1, #-1
	movs	r2, #12
	str	r1, [r4]
	movs	r0, #160
	str	r3, [r4, #4]
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	pop	{r4, lr}
	b	Chip_Clock_Disable
	.size	Chip_RIT_DeInit, .-Chip_RIT_DeInit
	.section	.text.Chip_RIT_SetTimerInterval,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RIT_SetTimerInterval
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RIT_SetTimerInterval, %function
Chip_RIT_SetTimerInterval:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	movs	r0, #160
	mov	r5, r1
	bl	Chip_Clock_GetRate
	ldr	r1, .L8
	umull	r3, r0, r1, r0
	lsrs	r0, r0, #6
	mul	r0, r5, r0
	str	r0, [r4]
	ldr	r3, [r4, #8]
	orr	r3, r3, #2
	str	r3, [r4, #8]
	pop	{r3, r4, r5, pc}
.L9:
	.align	2
.L8:
	.word	274877907
	.size	Chip_RIT_SetTimerInterval, .-Chip_RIT_SetTimerInterval
	.section	.text.Chip_RIT_GetIntStatus,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RIT_GetIntStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RIT_GetIntStatus, %function
Chip_RIT_GetIntStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #8]
	and	r0, r0, #1
	bx	lr
	.size	Chip_RIT_GetIntStatus, .-Chip_RIT_GetIntStatus
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

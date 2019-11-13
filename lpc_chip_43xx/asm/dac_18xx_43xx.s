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
	.file	"dac_18xx_43xx.c"
	.text
	.section	.text.Chip_DAC_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_DAC_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_DAC_Init, %function
Chip_DAC_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #1
	push	{r4, lr}
	mov	r4, r0
	mov	r2, r3
	mov	r1, r3
	movs	r0, #2
	bl	Chip_Clock_EnableOpts
	ldr	r3, [r4]
	bic	r3, r3, #65536
	str	r3, [r4]
	pop	{r4, pc}
	.size	Chip_DAC_Init, .-Chip_DAC_Init
	.section	.text.Chip_DAC_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_DAC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_DAC_DeInit, %function
Chip_DAC_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #2
	b	Chip_Clock_Disable
	.size	Chip_DAC_DeInit, .-Chip_DAC_DeInit
	.section	.text.Chip_DAC_UpdateValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_DAC_UpdateValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_DAC_UpdateValue, %function
Chip_DAC_UpdateValue:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	lsls	r1, r1, #6
	uxth	r1, r1
	and	r3, r3, #65536
	orrs	r1, r1, r3
	str	r1, [r0]
	bx	lr
	.size	Chip_DAC_UpdateValue, .-Chip_DAC_UpdateValue
	.section	.text.Chip_DAC_SetBias,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_DAC_SetBias
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_DAC_SetBias, %function
Chip_DAC_SetBias:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	cmp	r1, #1
	bic	r3, r3, #65536
	str	r3, [r0]
	bne	.L6
	ldr	r3, [r0]
	orr	r3, r3, #65536
	str	r3, [r0]
.L6:
	bx	lr
	.size	Chip_DAC_SetBias, .-Chip_DAC_SetBias
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"atimer_18xx_43xx.c"
	.text
	.section	.text.Chip_ATIMER_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ATIMER_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ATIMER_Init, %function
Chip_ATIMER_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	str	r1, [r0, #4]
	str	r3, [r0, #4072]
	bx	lr
	.size	Chip_ATIMER_Init, .-Chip_ATIMER_Init
	.section	.text.Chip_ATIMER_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ATIMER_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ATIMER_DeInit, %function
Chip_ATIMER_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	str	r3, [r0, #4072]
	str	r3, [r0, #4056]
	bx	lr
	.size	Chip_ATIMER_DeInit, .-Chip_ATIMER_DeInit
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

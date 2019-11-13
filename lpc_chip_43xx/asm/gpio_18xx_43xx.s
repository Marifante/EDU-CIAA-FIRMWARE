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
	.file	"gpio_18xx_43xx.c"
	.text
	.section	.text.Chip_GPIO_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPIO_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPIO_Init, %function
Chip_GPIO_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	Chip_GPIO_Init, .-Chip_GPIO_Init
	.section	.text.Chip_GPIO_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPIO_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPIO_DeInit, %function
Chip_GPIO_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	Chip_GPIO_DeInit, .-Chip_GPIO_DeInit
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

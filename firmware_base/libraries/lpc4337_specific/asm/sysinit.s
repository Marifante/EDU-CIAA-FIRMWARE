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
	.file	"sysinit.c"
	.text
	.section	.text.SystemInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SystemInit
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SystemInit, %function
SystemInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	fpuInit
	pop	{r3, lr}
	b	Chip_SystemInit
	.size	SystemInit, .-SystemInit
	.global	OscRateIn
	.global	ExtRateIn
	.section	.rodata.ExtRateIn,"a"
	.align	2
	.type	ExtRateIn, %object
	.size	ExtRateIn, 4
ExtRateIn:
	.space	4
	.section	.rodata.OscRateIn,"a"
	.align	2
	.type	OscRateIn, %object
	.size	OscRateIn, 4
OscRateIn:
	.word	12000000
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

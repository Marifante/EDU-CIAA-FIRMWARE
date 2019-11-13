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
	.file	"scu_peripheral.c"
	.text
	.section	.text.SCU_SetPinFunc,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCU_SetPinFunc
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCU_SetPinFunc, %function
SCU_SetPinFunc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	add	r1, r1, r0, lsl #5
	ldr	r4, .L4
	ldr	r3, [r4, r1, lsl #2]
	bic	r3, r3, #7
	orrs	r3, r3, r2
	str	r3, [r4, r1, lsl #2]
	ldr	r4, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	1074290688
	.size	SCU_SetPinFunc, .-SCU_SetPinFunc
	.section	.text.SCU_activateInputBuffer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCU_activateInputBuffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCU_activateInputBuffer, %function
SCU_activateInputBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r1, r0, lsl #5
	ldr	r3, .L7
	movs	r2, #64
	str	r2, [r3, r1, lsl #2]
	bx	lr
.L8:
	.align	2
.L7:
	.word	1074290688
	.size	SCU_activateInputBuffer, .-SCU_activateInputBuffer
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

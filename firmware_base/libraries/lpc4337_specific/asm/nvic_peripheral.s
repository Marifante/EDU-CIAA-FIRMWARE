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
	.file	"nvic_peripheral.c"
	.text
	.section	.text.NVIC_EnaIRQ,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	NVIC_EnaIRQ
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	NVIC_EnaIRQ, %function
NVIC_EnaIRQ:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	and	r1, r0, #31
	movs	r3, #1
	lsrs	r0, r0, #5
	ldr	r2, .L3
	lsls	r3, r3, r1
	str	r3, [r2, r0, lsl #2]
	bx	lr
.L4:
	.align	2
.L3:
	.word	-536813312
	.size	NVIC_EnaIRQ, .-NVIC_EnaIRQ
	.section	.text.NVIC_disableIRQ,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	NVIC_disableIRQ
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	NVIC_disableIRQ, %function
NVIC_disableIRQ:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsrs	r3, r0, #5
	adds	r3, r3, #32
	and	r0, r0, #31
	movs	r2, #1
	ldr	r1, .L6
	lsl	r0, r2, r0
	str	r0, [r1, r3, lsl #2]
	bx	lr
.L7:
	.align	2
.L6:
	.word	-536813312
	.size	NVIC_disableIRQ, .-NVIC_disableIRQ
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

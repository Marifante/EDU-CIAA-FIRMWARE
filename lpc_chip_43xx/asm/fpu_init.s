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
	.file	"fpu_init.c"
	.text
	.section	.text.fpuInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	fpuInit
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	fpuInit, %function
fpuInit:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L7
	ldr	r3, .L7+4
	ldr	r2, [r2]
	sub	sp, sp, #16
	str	r2, [sp, #8]
	ldr	r3, [r3]
	str	r3, [sp, #12]
	ldr	r2, [sp, #8]
	ldr	r3, .L7+8
	cmp	r2, r3
	beq	.L6
.L1:
	add	sp, sp, #16
	@ sp needed
	bx	lr
.L6:
	ldr	r2, [sp, #12]
	ldr	r3, .L7+12
	cmp	r2, r3
	bne	.L1
	ldr	r2, .L7+16
	ldr	r3, [r2]
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	orr	r3, r3, #15728640
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	str	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	bx	lr
.L8:
	.align	2
.L7:
	.word	-536809664
	.word	-536809660
	.word	269549601
	.word	285212689
	.word	-536810104
	.size	fpuInit, .-fpuInit
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

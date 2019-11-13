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
	.file	"evrt_18xx_43xx.c"
	.text
	.section	.text.Chip_EVRT_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EVRT_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EVRT_Init, %function
Chip_EVRT_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L10
	ldr	r0, .L10+4
	push	{r4}
	movs	r3, #0
	movw	r4, #65535
	str	r3, [r1]
	mov	r2, r1
	str	r3, [r1, #4]
	movs	r3, #10
	str	r4, [r1, #4056]
.L3:
	str	r0, [r2, #4072]
	ldr	r1, [r2, #4064]
	subs	r3, r3, #1
	cbz	r1, .L1
	ands	r3, r3, #255
	bne	.L3
.L1:
	ldr	r4, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	1074020352
	.word	1048575
	.size	Chip_EVRT_Init, .-Chip_EVRT_Init
	.section	.text.Chip_EVRT_ConfigIntSrcActiveType,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EVRT_ConfigIntSrcActiveType
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EVRT_ConfigIntSrcActiveType, %function
Chip_EVRT_ConfigIntSrcActiveType:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #3
	bhi	.L12
	tbb	[pc, r1]
.L15:
	.byte	(.L18-.L15)/2
	.byte	(.L17-.L15)/2
	.byte	(.L16-.L15)/2
	.byte	(.L14-.L15)/2
	.p2align 1
.L14:
	ldr	r2, .L19
	movs	r3, #1
	ldr	r1, [r2]
	lsl	r0, r3, r0
	orrs	r1, r1, r0
	str	r1, [r2]
	ldr	r3, [r2, #4]
	orrs	r0, r0, r3
	str	r0, [r2, #4]
.L12:
	bx	lr
.L16:
	ldr	r2, .L19
	movs	r3, #1
	ldr	r1, [r2]
	lsl	r0, r3, r0
	bic	r1, r1, r0
	str	r1, [r2]
	ldr	r3, [r2, #4]
	orrs	r0, r0, r3
	str	r0, [r2, #4]
	bx	lr
.L17:
	ldr	r3, .L19
	movs	r2, #1
	ldr	r1, [r3]
	lsl	r0, r2, r0
	orrs	r1, r1, r0
	str	r1, [r3]
	ldr	r2, [r3, #4]
	bic	r0, r2, r0
	str	r0, [r3, #4]
	bx	lr
.L18:
	ldr	r2, .L19
	movs	r3, #1
	lsl	r0, r3, r0
	ldr	r3, [r2]
	mvns	r0, r0
	ands	r3, r3, r0
	str	r3, [r2]
	ldr	r3, [r2, #4]
	ands	r0, r0, r3
	str	r0, [r2, #4]
	bx	lr
.L20:
	.align	2
.L19:
	.word	1074020352
	.size	Chip_EVRT_ConfigIntSrcActiveType, .-Chip_EVRT_ConfigIntSrcActiveType
	.section	.text.Chip_EVRT_SetUpIntSrc,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EVRT_SetUpIntSrc
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EVRT_SetUpIntSrc, %function
Chip_EVRT_SetUpIntSrc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	lsl	r0, r3, r0
	cmp	r1, r3
	ldr	r3, .L24
	ite	eq
	streq	r0, [r3, #4060]
	strne	r0, [r3, #4056]
	bx	lr
.L25:
	.align	2
.L24:
	.word	1074020352
	.size	Chip_EVRT_SetUpIntSrc, .-Chip_EVRT_SetUpIntSrc
	.section	.text.Chip_EVRT_IsSourceInterrupting,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EVRT_IsSourceInterrupting
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EVRT_IsSourceInterrupting, %function
Chip_EVRT_IsSourceInterrupting:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L27
	movs	r3, #1
	ldr	r2, [r2, #4064]
	lsl	r0, r3, r0
	tst	r0, r2
	ite	ne
	movne	r0, r3
	moveq	r0, #0
	bx	lr
.L28:
	.align	2
.L27:
	.word	1074020352
	.size	Chip_EVRT_IsSourceInterrupting, .-Chip_EVRT_IsSourceInterrupting
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

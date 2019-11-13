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
	.file	"wwdt_18xx_43xx.c"
	.text
	.section	.text.Chip_WWDT_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_WWDT_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_WWDT_Init, %function
Chip_WWDT_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	movs	r1, #255
	movs	r4, #0
	movw	r2, #65535
	mvn	r3, #-16777216
	str	r4, [r0]
	str	r1, [r0, #4]
	ldr	r4, [sp], #4
	str	r2, [r0, #20]
	str	r3, [r0, #24]
	bx	lr
	.size	Chip_WWDT_Init, .-Chip_WWDT_Init
	.section	.text.Chip_WWDT_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_WWDT_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_WWDT_DeInit, %function
Chip_WWDT_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	Chip_WWDT_DeInit, .-Chip_WWDT_DeInit
	.section	.text.Chip_WWDT_ClearStatusFlag,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_WWDT_ClearStatusFlag
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_WWDT_ClearStatusFlag, %function
Chip_WWDT_ClearStatusFlag:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r2, r1, #29
	bpl	.L6
	ldr	r3, [r0]
	and	r3, r3, #27
	str	r3, [r0]
.L6:
	lsls	r3, r1, #28
	bpl	.L5
	ldr	r3, [r0]
	orr	r3, r3, #8
	str	r3, [r0]
.L5:
	bx	lr
	.size	Chip_WWDT_ClearStatusFlag, .-Chip_WWDT_ClearStatusFlag
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"sct_18xx_43xx.c"
	.text
	.section	.text.Chip_SCT_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SCT_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SCT_Init, %function
Chip_SCT_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	mov	r2, r3
	mov	r1, r3
	movs	r0, #109
	b	Chip_Clock_EnableOpts
	.size	Chip_SCT_Init, .-Chip_SCT_Init
	.section	.text.Chip_SCT_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SCT_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SCT_DeInit, %function
Chip_SCT_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #109
	b	Chip_Clock_Disable
	.size	Chip_SCT_DeInit, .-Chip_SCT_DeInit
	.section	.text.Chip_SCT_SetClrControl,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SCT_SetClrControl
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SCT_SetClrControl, %function
Chip_SCT_SetClrControl:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	cmp	r2, #1
	ite	eq
	orreq	r3, r3, r1
	bicne	r3, r3, r1
	str	r3, [r0, #4]
	bx	lr
	.size	Chip_SCT_SetClrControl, .-Chip_SCT_SetClrControl
	.section	.text.Chip_SCT_SetConflictResolution,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SCT_SetConflictResolution
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SCT_SetConflictResolution, %function
Chip_SCT_SetConflictResolution:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	lsls	r1, r1, #1
	ldr	r3, [r0, #88]
	movs	r4, #3
	lsls	r4, r4, r1
	bic	r3, r3, r4
	lsls	r2, r2, r1
	orrs	r2, r2, r3
	str	r2, [r0, #88]
	ldr	r4, [sp], #4
	bx	lr
	.size	Chip_SCT_SetConflictResolution, .-Chip_SCT_SetConflictResolution
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

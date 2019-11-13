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
	.file	"dac_peripheral.c"
	.text
	.section	.text.DAC_enable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	DAC_enable
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DAC_enable, %function
DAC_enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L3
	ldr	r3, [r2, #4]
	orr	r3, r3, #8
	str	r3, [r2, #4]
	bx	lr
.L4:
	.align	2
.L3:
	.word	1074663424
	.size	DAC_enable, .-DAC_enable
	.section	.text.DAC_setCNTVAL,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	DAC_setCNTVAL
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DAC_setCNTVAL, %function
DAC_setCNTVAL:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	uxth	r0, r0
	str	r0, [r3, #8]
	bx	lr
.L7:
	.align	2
.L6:
	.word	1074663424
	.size	DAC_setCNTVAL, .-DAC_setCNTVAL
	.section	.text.DAC_ticksNeededForSampling,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	DAC_ticksNeededForSampling
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DAC_ticksNeededForSampling, %function
DAC_ticksNeededForSampling:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mul	r1, r1, r0
	ldr	r0, .L9
	udiv	r0, r0, r1
	bx	lr
.L10:
	.align	2
.L9:
	.word	204000000
	.size	DAC_ticksNeededForSampling, .-DAC_ticksNeededForSampling
	.section	.text.DAC_init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	DAC_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DAC_init, %function
DAC_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r1, #4
	mov	r0, r1
	push	{r3, lr}
	movs	r2, #0
	bl	SCU_SetPinFunc
	ldr	r0, .L13
	ldr	r1, .L13+4
	ldr	r2, [r0, #3208]
	ldr	r3, [r1, #4]
	orr	r2, r2, #1
	orr	r3, r3, #8
	str	r2, [r0, #3208]
	str	r3, [r1, #4]
	pop	{r3, pc}
.L14:
	.align	2
.L13:
	.word	1074290688
	.word	1074663424
	.size	DAC_init, .-DAC_init
	.section	.text.DAC_UpdateValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	DAC_UpdateValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DAC_UpdateValue, %function
DAC_UpdateValue:
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
	.size	DAC_UpdateValue, .-DAC_UpdateValue
	.section	.text.DAC_configToSample,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	DAC_configToSample
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	DAC_configToSample, %function
DAC_configToSample:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L17
	ldr	r3, .L17+4
	mul	r0, r1, r0
	udiv	r3, r3, r0
	uxth	r3, r3
	str	r3, [r2, #8]
	bx	lr
.L18:
	.align	2
.L17:
	.word	1074663424
	.word	204000000
	.size	DAC_configToSample, .-DAC_configToSample
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"sct_peripheral.c"
	.text
	.section	.text.SCT_setTwoTimersMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setTwoTimersMode
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setTwoTimersMode, %function
SCT_setTwoTimersMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1073741824
	ldr	r3, [r2]
	orr	r3, r3, #131072
	str	r3, [r2]
	bx	lr
	.size	SCT_setTwoTimersMode, .-SCT_setTwoTimersMode
	.section	.text.SCT_setLowTimerPrescaler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setLowTimerPrescaler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setLowTimerPrescaler, %function
SCT_setLowTimerPrescaler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1073741824
	subs	r0, r0, #1
	ldrh	r2, [r3, #4]
	lsls	r0, r0, #5
	and	r0, r0, #992
	orrs	r0, r0, r2
	strh	r0, [r3, #4]	@ movhi
	bx	lr
	.size	SCT_setLowTimerPrescaler, .-SCT_setLowTimerPrescaler
	.section	.text.SCT_setLimitLowTimer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setLimitLowTimer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setLimitLowTimer, %function
SCT_setLimitLowTimer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1073741824
	ldrh	r3, [r2, #8]
	orrs	r0, r0, r3
	strh	r0, [r2, #8]	@ movhi
	bx	lr
	.size	SCT_setLimitLowTimer, .-SCT_setLimitLowTimer
	.section	.text.SCT_setLowTimerMatchReload,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setLowTimerMatchReload
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setLowTimerMatchReload, %function
SCT_setLowTimerMatchReload:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r0, r0, #128
	mov	r3, #1073741824
	uxth	r1, r1
	strh	r1, [r3, r0, lsl #2]	@ movhi
	bx	lr
	.size	SCT_setLowTimerMatchReload, .-SCT_setLowTimerMatchReload
	.section	.text.SCT_associateMatchWithEvent,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_associateMatchWithEvent
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_associateMatchWithEvent, %function
SCT_associateMatchWithEvent:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #3
	add	r0, r0, #1073741824
	movs	r3, #1
	ldr	r2, [r0, #772]
	lsl	r1, r3, r1
	orrs	r1, r1, r2
	str	r1, [r0, #772]
	bx	lr
	.size	SCT_associateMatchWithEvent, .-SCT_associateMatchWithEvent
	.section	.text.SCT_setEventCombMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setEventCombMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setEventCombMode, %function
SCT_setEventCombMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #3
	add	r0, r0, #1073741824
	lsls	r1, r1, #12
	ldr	r3, [r0, #772]
	and	r1, r1, #12288
	orrs	r1, r1, r3
	str	r1, [r0, #772]
	bx	lr
	.size	SCT_setEventCombMode, .-SCT_setEventCombMode
	.section	.text.SCT_setEventState,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setEventState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setEventState, %function
SCT_setEventState:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r0, r0, #96
	mov	r3, #1073741824
	str	r1, [r3, r0, lsl #3]
	bx	lr
	.size	SCT_setEventState, .-SCT_setEventState
	.section	.text.SCT_setOutputSETReg,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setOutputSETReg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setOutputSETReg, %function
SCT_setOutputSETReg:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r0, r0, #160
	movs	r3, #1
	mov	r2, #1073741824
	lsl	r1, r3, r1
	str	r1, [r2, r0, lsl #3]
	bx	lr
	.size	SCT_setOutputSETReg, .-SCT_setOutputSETReg
	.section	.text.SCT_setOutputCLEARReg,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_setOutputCLEARReg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_setOutputCLEARReg, %function
SCT_setOutputCLEARReg:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #3
	add	r0, r0, #1073741824
	movs	r3, #1
	lsl	r1, r3, r1
	str	r1, [r0, #1284]
	bx	lr
	.size	SCT_setOutputCLEARReg, .-SCT_setOutputCLEARReg
	.section	.text.SCT_unhalt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCT_unhalt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCT_unhalt, %function
SCT_unhalt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1073741824
	ldrh	r3, [r2, #4]
	bic	r3, r3, #4
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	strh	r3, [r2, #4]	@ movhi
	bx	lr
	.size	SCT_unhalt, .-SCT_unhalt
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

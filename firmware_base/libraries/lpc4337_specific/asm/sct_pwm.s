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
	.file	"sct_pwm.c"
	.text
	.section	.text.SCTPWM_frequencyToPrescaler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCTPWM_frequencyToPrescaler
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCTPWM_frequencyToPrescaler, %function
SCTPWM_frequencyToPrescaler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	udiv	r0, r3, r0
	bx	lr
.L4:
	.align	2
.L3:
	.word	204000000
	.size	SCTPWM_frequencyToPrescaler, .-SCTPWM_frequencyToPrescaler
	.section	.text.SCTPWM_configPWM,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCTPWM_configPWM
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCTPWM_configPWM, %function
SCTPWM_configPWM:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r2
	mov	r8, r3
	mov	r4, r1
	mov	r5, r0
	ldr	r7, .L7
	bl	SCT_setTwoTimersMode
	udiv	r7, r7, r5
	uxtb	r0, r7
	bl	SCT_setLowTimerPrescaler
	mov	r0, r4
	bl	SCT_setLimitLowTimer
	udiv	r5, r5, r7
	subs	r5, r5, #1
	mov	r1, r5
	mov	r0, r4
	bl	SCT_setLowTimerMatchReload
	mov	r0, r6
	movs	r1, #0
	bl	SCT_setLowTimerMatchReload
	mov	r0, r4
	mov	r1, #-1
	bl	SCT_setEventState
	mov	r1, r4
	mov	r0, r4
	bl	SCT_associateMatchWithEvent
	mov	r0, r4
	movs	r1, #1
	bl	SCT_setEventCombMode
	mov	r0, r6
	mov	r1, #-1
	bl	SCT_setEventState
	mov	r1, r6
	mov	r0, r6
	bl	SCT_associateMatchWithEvent
	mov	r0, r4
	movs	r1, #1
	bl	SCT_setEventCombMode
	mov	r1, r4
	mov	r0, r8
	bl	SCT_setOutputSETReg
	mov	r0, r8
	mov	r1, r6
	bl	SCT_setOutputSETReg
	bl	SCT_unhalt
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L8:
	.align	2
.L7:
	.word	204000000
	.size	SCTPWM_configPWM, .-SCTPWM_configPWM
	.section	.text.SCTPWM_setDutyCycle,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCTPWM_setDutyCycle
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCTPWM_setDutyCycle, %function
SCTPWM_setDutyCycle:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r2
	b	SCT_setLowTimerMatchReload
	.size	SCTPWM_setDutyCycle, .-SCTPWM_setDutyCycle
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

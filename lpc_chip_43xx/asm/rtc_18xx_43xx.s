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
	.file	"rtc_18xx_43xx.c"
	.text
	.section	.text.Chip_RTC_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_Init, %function
Chip_RTC_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	Chip_Clock_RTCEnable
	ldr	r2, .L13
	mov	r3, #2048
	str	r3, [r2]
.L2:
	ldr	r3, [r2]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [r4, #8]
	and	r3, r3, #18
	str	r3, [r4, #8]
	ldr	r3, [r4, #8]
	orr	r3, r3, #16
	str	r3, [r4, #8]
	ldr	r3, [r4, #8]
	orr	r3, r3, #2
	str	r3, [r4, #8]
.L3:
	ldr	r3, [r4, #8]
	lsls	r2, r3, #30
	bpl	.L3
	ldr	r3, [r4, #8]
	and	r3, r3, #17
	str	r3, [r4, #8]
.L4:
	ldr	r3, [r4, #8]
	lsls	r3, r3, #30
	bmi	.L4
	movs	r3, #3
	str	r3, [r4]
.L5:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L5
	movs	r2, #255
	str	r3, [r4, #12]
	str	r2, [r4, #16]
	str	r3, [r4, #64]
	pop	{r4, pc}
.L14:
	.align	2
.L13:
	.word	1074003968
	.size	Chip_RTC_Init, .-Chip_RTC_Init
	.section	.text.Chip_RTC_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_DeInit, %function
Chip_RTC_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #0
	str	r3, [r0, #8]
	bx	lr
	.size	Chip_RTC_DeInit, .-Chip_RTC_DeInit
	.section	.text.Chip_RTC_ResetClockTickCounter,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_ResetClockTickCounter
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_ResetClockTickCounter, %function
Chip_RTC_ResetClockTickCounter:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	orr	r3, r3, #2
	str	r3, [r0, #8]
.L17:
	ldr	r3, [r0, #8]
	lsls	r2, r3, #30
	bpl	.L17
	ldr	r3, [r0, #8]
	and	r3, r3, #17
	str	r3, [r0, #8]
.L18:
	ldr	r3, [r0, #8]
	lsls	r3, r3, #30
	bmi	.L18
	bx	lr
	.size	Chip_RTC_ResetClockTickCounter, .-Chip_RTC_ResetClockTickCounter
	.section	.text.Chip_RTC_Enable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_Enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_Enable, %function
Chip_RTC_Enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	cmp	r1, #1
	ite	eq
	orreq	r3, r3, #1
	andne	r3, r3, #18
	str	r3, [r0, #8]
	bx	lr
	.size	Chip_RTC_Enable, .-Chip_RTC_Enable
	.section	.text.Chip_RTC_CntIncrIntConfig,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_CntIncrIntConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_CntIncrIntConfig, %function
Chip_RTC_CntIncrIntConfig:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #1
	ldr	r3, [r0, #12]
	beq	.L30
	bic	r3, r3, r1
	uxtb	r3, r3
	str	r3, [r0, #12]
.L28:
	ldr	r3, [r0, #12]
	tst	r3, r1
	bne	.L28
	bx	lr
.L30:
	orrs	r1, r1, r3
	str	r1, [r0, #12]
	bx	lr
	.size	Chip_RTC_CntIncrIntConfig, .-Chip_RTC_CntIncrIntConfig
	.section	.text.Chip_RTC_AlarmIntConfig,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_AlarmIntConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_AlarmIntConfig, %function
Chip_RTC_AlarmIntConfig:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #1
	ldr	r3, [r0, #16]
	beq	.L37
	orrs	r3, r3, r1
	str	r3, [r0, #16]
.L34:
	ldr	r3, [r0, #16]
	tst	r3, r1
	beq	.L34
	bx	lr
.L37:
	bic	r3, r3, r1
	uxtb	r3, r3
	str	r3, [r0, #16]
	bx	lr
	.size	Chip_RTC_AlarmIntConfig, .-Chip_RTC_AlarmIntConfig
	.section	.text.Chip_RTC_SetFullTime,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_SetFullTime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_SetFullTime, %function
Chip_RTC_SetFullTime:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	ldr	r5, [r0, #8]
	lsls	r3, r5, #31
	itt	mi
	andmi	r3, r5, #18
	strmi	r3, [r0, #8]
	subs	r1, r1, #4
	movs	r3, #0
.L40:
	add	r2, r3, #8
	adds	r3, r3, #1
	ldr	r4, [r1, #4]!
	str	r4, [r0, r2, lsl #2]
	cmp	r3, #8
	bne	.L40
	str	r5, [r0, #8]
	pop	{r4, r5}
	bx	lr
	.size	Chip_RTC_SetFullTime, .-Chip_RTC_SetFullTime
	.section	.text.Chip_RTC_GetFullTime,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_GetFullTime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_GetFullTime, %function
Chip_RTC_GetFullTime:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	push	{r4, r5}
	movs	r5, #255
	cmp	r3, r5
	beq	.L52
.L49:
	mov	r2, r1
	ldr	r5, [r0, #32]
	str	r5, [r2], #4
	movs	r3, #1
.L48:
	add	r4, r3, #8
	adds	r3, r3, #1
	ldr	r4, [r0, r4, lsl #2]
	str	r4, [r2], #4
	cmp	r3, #8
	bne	.L48
	ldr	r3, [r0, #32]
	cmp	r3, r5
	bne	.L49
.L52:
	pop	{r4, r5}
	bx	lr
	.size	Chip_RTC_GetFullTime, .-Chip_RTC_GetFullTime
	.section	.text.Chip_RTC_SetFullAlarmTime,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_SetFullAlarmTime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_SetFullAlarmTime, %function
Chip_RTC_SetFullAlarmTime:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	subs	r1, r1, #4
	movs	r3, #0
.L54:
	add	r2, r3, #24
	adds	r3, r3, #1
	ldr	r4, [r1, #4]!
	str	r4, [r0, r2, lsl #2]
	cmp	r3, #8
	bne	.L54
	ldr	r4, [sp], #4
	bx	lr
	.size	Chip_RTC_SetFullAlarmTime, .-Chip_RTC_SetFullAlarmTime
	.section	.text.Chip_RTC_GetFullAlarmTime,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_GetFullAlarmTime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_GetFullAlarmTime, %function
Chip_RTC_GetFullAlarmTime:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r1, r1, #4
	movs	r3, #0
.L58:
	add	r2, r3, #24
	adds	r3, r3, #1
	ldr	r2, [r0, r2, lsl #2]
	str	r2, [r1, #4]!
	cmp	r3, #8
	bne	.L58
	bx	lr
	.size	Chip_RTC_GetFullAlarmTime, .-Chip_RTC_GetFullAlarmTime
	.section	.text.Chip_RTC_CalibCounterCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_CalibCounterCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_CalibCounterCmd, %function
Chip_RTC_CalibCounterCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #1
	beq	.L62
	ldr	r3, [r0, #8]
	orr	r3, r3, #16
	str	r3, [r0, #8]
	bx	lr
.L62:
	ldr	r3, [r0, #8]
	and	r3, r3, #3
	str	r3, [r0, #8]
	ldr	r3, [r0, #8]
	lsls	r3, r3, #27
	bmi	.L62
	bx	lr
	.size	Chip_RTC_CalibCounterCmd, .-Chip_RTC_CalibCounterCmd
	.section	.text.Chip_RTC_EV_GetFirstTimeStamp,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_EV_GetFirstTimeStamp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_EV_GetFirstTimeStamp, %function
Chip_RTC_EV_GetFirstTimeStamp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r0, r1, lsl #2
	ldr	r3, [r1, #144]
	and	r3, r3, #63
	strb	r3, [r2]
	ldr	r3, [r1, #144]
	ubfx	r3, r3, #6, #6
	strb	r3, [r2, #1]
	ldr	r3, [r1, #144]
	ubfx	r3, r3, #12, #5
	strb	r3, [r2, #2]
	ldr	r3, [r1, #144]
	ubfx	r3, r3, #17, #9
	strh	r3, [r2, #4]	@ movhi
	bx	lr
	.size	Chip_RTC_EV_GetFirstTimeStamp, .-Chip_RTC_EV_GetFirstTimeStamp
	.section	.text.Chip_RTC_EV_GetLastTimeStamp,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_RTC_EV_GetLastTimeStamp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_RTC_EV_GetLastTimeStamp, %function
Chip_RTC_EV_GetLastTimeStamp:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r0, r1, lsl #2
	ldr	r3, [r1, #160]
	and	r3, r3, #63
	strb	r3, [r2]
	ldr	r3, [r1, #160]
	ubfx	r3, r3, #6, #6
	strb	r3, [r2, #1]
	ldr	r3, [r1, #160]
	ubfx	r3, r3, #12, #5
	strb	r3, [r2, #2]
	ldr	r3, [r1, #160]
	ubfx	r3, r3, #17, #9
	strh	r3, [r2, #4]	@ movhi
	bx	lr
	.size	Chip_RTC_EV_GetLastTimeStamp, .-Chip_RTC_EV_GetLastTimeStamp
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

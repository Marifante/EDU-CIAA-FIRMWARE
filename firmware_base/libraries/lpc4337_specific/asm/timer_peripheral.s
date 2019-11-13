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
	.file	"timer_peripheral.c"
	.text
	.section	.text.Timer_resetOnNextEdge,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_resetOnNextEdge
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_resetOnNextEdge, %function
Timer_resetOnNextEdge:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	orr	r3, r3, #2
	str	r3, [r0, #4]
	bx	lr
	.size	Timer_resetOnNextEdge, .-Timer_resetOnNextEdge
	.section	.text.Timer_dontResetOnNextEdge,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_dontResetOnNextEdge
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_dontResetOnNextEdge, %function
Timer_dontResetOnNextEdge:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	bic	r3, r3, #2
	str	r3, [r0, #4]
	bx	lr
	.size	Timer_dontResetOnNextEdge, .-Timer_dontResetOnNextEdge
	.section	.text.Timer_enableTimer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_enableTimer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_enableTimer, %function
Timer_enableTimer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	orr	r3, r3, #1
	str	r3, [r0, #4]
	bx	lr
	.size	Timer_enableTimer, .-Timer_enableTimer
	.section	.text.Timer_getAvailableTimer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_getAvailableTimer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_getAvailableTimer, %function
Timer_getAvailableTimer:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	ldr	r3, .L13
	ldm	r3, {r0, r1, r2, r3}
	sub	sp, sp, #20
	mov	r4, sp
	stm	r4, {r0, r1, r2, r3}
	mov	r3, r4
	add	r1, sp, #16
.L7:
	ldr	r0, [r3], #4
	ldr	r2, [r0, #4]
	lsls	r2, r2, #31
	bpl	.L5
	cmp	r3, r1
	bne	.L7
	movs	r0, #0
.L5:
	add	sp, sp, #20
	@ sp needed
	ldr	r4, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	Timer_getAvailableTimer, .-Timer_getAvailableTimer
	.section	.text.Timer_getPtrStruct,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_getPtrStruct
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_getPtrStruct, %function
Timer_getPtrStruct:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #2
	beq	.L20
	bls	.L33
	cmp	r0, #3
	beq	.L23
	cmp	r0, #99
	bne	.L24
	push	{r4}
	ldr	r3, .L34
	ldm	r3, {r0, r1, r2, r3}
	sub	sp, sp, #20
	mov	r4, sp
	stm	r4, {r0, r1, r2, r3}
	mov	r3, r4
	add	r1, sp, #16
.L19:
	ldr	r0, [r3], #4
	ldr	r2, [r0, #4]
	lsls	r2, r2, #31
	bpl	.L15
	cmp	r3, r1
	bne	.L19
	movs	r0, #0
.L15:
	add	sp, sp, #20
	@ sp needed
	ldr	r4, [sp], #4
	bx	lr
.L33:
	cbz	r0, .L21
	ldr	r3, .L34+4
	cmp	r0, #1
	ite	eq
	moveq	r0, r3
	movne	r0, #0
	bx	lr
.L23:
	ldr	r0, .L34+8
	bx	lr
.L21:
	ldr	r0, .L34+12
	bx	lr
.L24:
	movs	r0, #0
	bx	lr
.L20:
	ldr	r0, .L34+16
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	1074286592
	.word	1074544640
	.word	1074282496
	.word	1074540544
	.size	Timer_getPtrStruct, .-Timer_getPtrStruct
	.section	.text.Timer_setTimerMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_setTimerMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_setTimerMode, %function
Timer_setTimerMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #112]
	bic	r3, r3, #1
	str	r3, [r0, #112]
	bx	lr
	.size	Timer_setTimerMode, .-Timer_setTimerMode
	.section	.text.Timer_setMatchValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_setMatchValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_setMatchValue, %function
Timer_setMatchValue:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r1, r1, #6
	str	r2, [r0, r1, lsl #2]
	bx	lr
	.size	Timer_setMatchValue, .-Timer_setMatchValue
	.section	.text.Timer_isCounting,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_isCounting
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_isCounting, %function
Timer_isCounting:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #4]
	and	r0, r0, #1
	bx	lr
	.size	Timer_isCounting, .-Timer_isCounting
	.section	.text.Timer_setFrequency,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_setFrequency
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_setFrequency, %function
Timer_setFrequency:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	udiv	r1, r3, r1
	subs	r1, r1, #1
	str	r1, [r0, #12]
	bx	lr
.L41:
	.align	2
.L40:
	.word	204000000
	.size	Timer_setFrequency, .-Timer_setFrequency
	.section	.text.Timer_setResetOnMatch,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_setResetOnMatch
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_setResetOnMatch, %function
Timer_setResetOnMatch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #20]
	add	r1, r1, r1, lsl #1
	movs	r3, #2
	lsls	r3, r3, r1
	orrs	r3, r3, r2
	str	r3, [r0, #20]
	bx	lr
	.size	Timer_setResetOnMatch, .-Timer_setResetOnMatch
	.section	.text.Timer_init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_init, %function
Timer_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r1
	mov	r6, r0
	bl	Timer_getPtrStruct
	mov	r4, r0
	mov	r0, r6
	bl	CCU_enableTimerClock
	ldr	r2, [r4, #112]
	ldr	r3, .L45
	udiv	r3, r3, r5
	bic	r2, r2, #1
	subs	r3, r3, #1
	str	r2, [r4, #112]
	str	r3, [r4, #12]
	ldr	r3, [r4, #4]
	orr	r3, r3, #2
	str	r3, [r4, #4]
	ldr	r3, [r4, #4]
	orr	r3, r3, #1
	str	r3, [r4, #4]
	ldr	r3, [r4, #4]
	bic	r3, r3, #2
	str	r3, [r4, #4]
	add	r0, r4, #8
	pop	{r4, r5, r6, pc}
.L46:
	.align	2
.L45:
	.word	204000000
	.size	Timer_init, .-Timer_init
	.section	.text.Timer_deInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_deInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_deInit, %function
Timer_deInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	Timer_getPtrStruct
	ldr	r3, [r0, #4]
	bic	r3, r3, #1
	str	r3, [r0, #4]
	pop	{r3, pc}
	.size	Timer_deInit, .-Timer_deInit
	.section	.text.Timer_clearMatchIntFlag,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_clearMatchIntFlag
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_clearMatchIntFlag, %function
Timer_clearMatchIntFlag:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r1
	bl	Timer_getPtrStruct
	movs	r3, #1
	lsls	r3, r3, r4
	str	r3, [r0]
	pop	{r4, pc}
	.size	Timer_clearMatchIntFlag, .-Timer_clearMatchIntFlag
	.section	.text.Timer_disableMatchInterrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_disableMatchInterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_disableMatchInterrupt, %function
Timer_disableMatchInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r1
	bl	Timer_getPtrStruct
	add	r4, r4, r4, lsl #1
	ldr	r3, [r0, #20]
	movs	r1, #1
	lsl	r4, r1, r4
	bic	r4, r3, r4
	str	r4, [r0, #20]
	pop	{r4, pc}
	.size	Timer_disableMatchInterrupt, .-Timer_disableMatchInterrupt
	.section	.text.Timer_enableMatchInterrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_enableMatchInterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_enableMatchInterrupt, %function
Timer_enableMatchInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r1
	bl	Timer_getPtrStruct
	add	r4, r4, r4, lsl #1
	ldr	r3, [r0, #20]
	movs	r1, #1
	lsls	r1, r1, r4
	orrs	r1, r1, r3
	str	r1, [r0, #20]
	pop	{r4, pc}
	.size	Timer_enableMatchInterrupt, .-Timer_enableMatchInterrupt
	.section	.text.Timer_configMatchInterrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Timer_configMatchInterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Timer_configMatchInterrupt, %function
Timer_configMatchInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	mov	r6, r2
	mov	r7, r3
	mov	r8, r0
	bl	Timer_getPtrStruct
	mov	r5, r0
	mov	r0, r8
	bl	Timer_getPtrStruct
	add	r2, r4, r4, lsl #1
	ldr	r3, [r0, #20]
	movs	r1, #1
	lsls	r1, r1, r2
	orrs	r1, r1, r3
	str	r1, [r0, #20]
	cbz	r7, .L56
	ldr	r1, [r5, #20]
	movs	r3, #2
	lsls	r3, r3, r2
	orrs	r3, r3, r1
	str	r3, [r5, #20]
.L56:
	adds	r4, r4, #6
	str	r6, [r5, r4, lsl #2]
	pop	{r4, r5, r6, r7, r8, pc}
	.size	Timer_configMatchInterrupt, .-Timer_configMatchInterrupt
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	1074282496
	.word	1074286592
	.word	1074540544
	.word	1074544640
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"delay.c"
	.text
	.section	.text.Delay_getIRQn,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Delay_getIRQn
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Delay_getIRQn, %function
Delay_getIRQn:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #3
	bhi	.L2
	ldr	r3, .L4
	ldrsb	r0, [r3, r0]
	bx	lr
.L2:
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.size	Delay_getIRQn, .-Delay_getIRQn
	.section	.text.Delay_timeToMatchValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Delay_timeToMatchValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Delay_timeToMatchValue, %function
Delay_timeToMatchValue:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	cmp	r0, r3
	bls	.L7
	add	r3, r3, #1124073472
	add	r3, r3, #823296
	addw	r3, r3, #3139
	umull	r3, r0, r3, r0
	lsrs	r0, r0, #18
	mul	r0, r1, r0
	bx	lr
.L7:
	ldr	r3, .L9+4
	mul	r1, r1, r0
	umull	r3, r1, r3, r1
	lsrs	r0, r1, #18
	bx	lr
.L10:
	.align	2
.L9:
	.word	1000000
	.word	1125899907
	.size	Delay_timeToMatchValue, .-Delay_timeToMatchValue
	.section	.text.Delay_us,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Delay_us
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Delay_us, %function
Delay_us:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r1
	mov	r4, r0
	ldr	r1, .L15
	mov	r0, r5
	bl	Timer_init
	ldr	r3, [r0]
.L12:
	cmp	r3, r4
	bcc	.L12
	mov	r0, r5
	pop	{r3, r4, r5, lr}
	b	Timer_deInit
.L16:
	.align	2
.L15:
	.word	1000000
	.size	Delay_us, .-Delay_us
	.section	.text.Delay_initNonBlockingDelay,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Delay_initNonBlockingDelay
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Delay_initNonBlockingDelay, %function
Delay_initNonBlockingDelay:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	mov	r0, r1
	mov	r7, r2
	mov	r4, r1
	bl	Timer_deInit
	ldr	r2, .L22
	ldr	r3, .L22+4
	cmp	r5, r2
	mov	r6, #0
	bls	.L18
	umull	r3, r5, r3, r5
	lsrs	r5, r5, #18
	mul	r2, r2, r5
.L19:
	movs	r3, #0
	mov	r1, r7
	mov	r0, r4
	bl	Timer_configMatchInterrupt
	mov	r0, r4
	ldr	r1, .L22
	bl	Timer_init
	cmp	r4, #3
	itt	ls
	ldrls	r3, .L22+8
	ldrsbls	r6, [r3, r4]
	mov	r0, r6
	pop	{r3, r4, r5, r6, r7, lr}
	b	NVIC_EnaIRQ
.L18:
	mul	r2, r2, r5
	umull	r3, r2, r3, r2
	lsrs	r2, r2, #18
	b	.L19
.L23:
	.align	2
.L22:
	.word	1000000
	.word	1125899907
	.word	.LANCHOR0
	.size	Delay_initNonBlockingDelay, .-Delay_initNonBlockingDelay
	.section	.rodata.CSWTCH.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.0, %object
	.size	CSWTCH.0, 4
CSWTCH.0:
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

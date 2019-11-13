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
	.file	"adc_18xx_43xx.c"
	.text
	.section	.text.setStartMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	setStartMode
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setStartMode, %function
setStartMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	bic	r3, r3, #117440512
	orr	r1, r3, r1, lsl #24
	str	r1, [r0]
	bx	lr
	.size	setStartMode, .-setStartMode
	.section	.text.readAdcVal,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	readAdcVal
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	readAdcVal, %function
readAdcVal:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r1, r1, #4
	ldr	r3, [r0, r1, lsl #2]
	cmp	r3, #0
	ittte	lt
	ubfxlt	r3, r3, #6, #10
	movlt	r0, #1
	strhlt	r3, [r2]	@ movhi
	movge	r0, #0
	bx	lr
	.size	readAdcVal, .-readAdcVal
	.section	.text.Chip_ADC_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_Init, %function
Chip_ADC_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L10
	movs	r3, #1
	cmp	r0, r5
	ite	eq
	moveq	r5, #4
	movne	r5, #3
	mov	r6, r1
	mov	r4, r0
	mov	r2, r3
	mov	r1, r3
	mov	r0, r5
	bl	Chip_Clock_EnableOpts
	movs	r3, #0
	ldr	r2, .L10+4
	str	r3, [r4, #12]
	mov	r0, r5
	strh	r3, [r6, #4]	@ movhi
	str	r2, [r6]
	bl	Chip_Clock_GetRate
	lsls	r0, r0, #1
	add	r0, r0, #4390912
	ldr	r2, .L10+8
	ldrb	r3, [r6, #4]	@ zero_extendqisi2
	add	r0, r0, #9088
	umull	r2, r0, r2, r0
	lsrs	r0, r0, #20
	lsls	r3, r3, #17
	subs	r0, r0, #1
	and	r3, r3, #917504
	uxtb	r0, r0
	orr	r0, r3, r0, lsl #8
	orr	r0, r0, #2097152
	str	r0, [r4]
	pop	{r4, r5, r6, pc}
.L11:
	.align	2
.L10:
	.word	1074675712
	.word	400000
	.word	511772685
	.size	Chip_ADC_Init, .-Chip_ADC_Init
	.section	.text.Chip_ADC_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_DeInit, %function
Chip_ADC_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	ldr	r0, .L15
	mov	r1, #256
	movs	r2, #0
	str	r1, [r3, #12]
	cmp	r3, r0
	ite	eq
	moveq	r0, #4
	movne	r0, #3
	str	r2, [r3]
	b	Chip_Clock_Disable
.L16:
	.align	2
.L15:
	.word	1074675712
	.size	Chip_ADC_DeInit, .-Chip_ADC_DeInit
	.section	.text.Chip_ADC_ReadValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_ReadValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_ReadValue, %function
Chip_ADC_ReadValue:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r1, r1, #4
	ldr	r3, [r0, r1, lsl #2]
	cmp	r3, #0
	ittte	lt
	ubfxlt	r3, r3, #6, #10
	movlt	r0, #1
	strhlt	r3, [r2]	@ movhi
	movge	r0, #0
	bx	lr
	.size	Chip_ADC_ReadValue, .-Chip_ADC_ReadValue
	.section	.text.Chip_ADC_ReadStatus,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_ReadStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_ReadStatus, %function
Chip_ADC_ReadStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #1
	beq	.L21
	cbz	r2, .L22
	cmp	r2, #2
	bne	.L25
	ldr	r3, [r0, #48]
	lsrs	r3, r3, #16
	ite	ne
	movne	r0, #1
	moveq	r0, #0
	bx	lr
.L25:
	movs	r0, #0
	bx	lr
.L21:
	ldr	r0, [r0, #48]
	adds	r1, r1, #8
	uxtb	r1, r1
	lsrs	r0, r0, r1
	and	r0, r0, #1
	bx	lr
.L22:
	ldr	r0, [r0, #48]
	lsrs	r0, r0, r1
	and	r0, r0, #1
	bx	lr
	.size	Chip_ADC_ReadStatus, .-Chip_ADC_ReadStatus
	.section	.text.Chip_ADC_Int_SetChannelCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_Int_SetChannelCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_Int_SetChannelCmd, %function
Chip_ADC_Int_SetChannelCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	lsl	r1, r3, r1
	cmp	r2, r3
	ldr	r3, [r0, #12]
	ite	eq
	orreq	r3, r3, r1
	bicne	r3, r3, r1
	str	r3, [r0, #12]
	bx	lr
	.size	Chip_ADC_Int_SetChannelCmd, .-Chip_ADC_Int_SetChannelCmd
	.section	.text.Chip_ADC_SetStartMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_SetStartMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_SetStartMode, %function
Chip_ADC_SetStartMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #1
	bls	.L30
	ldr	r3, [r0]
	cbz	r2, .L31
	orr	r3, r3, #134217728
	str	r3, [r0]
.L30:
	ldr	r3, [r0]
	bic	r3, r3, #117440512
	orr	r3, r3, r1, lsl #24
	str	r3, [r0]
	bx	lr
.L31:
	bic	r3, r3, #134217728
	str	r3, [r0]
	b	.L30
	.size	Chip_ADC_SetStartMode, .-Chip_ADC_SetStartMode
	.section	.text.Chip_ADC_SetSampleRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_SetSampleRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_SetSampleRate, %function
Chip_ADC_SetSampleRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, [r0]
	ldrb	r9, [r1, #5]	@ zero_extendqisi2
	str	r2, [r1]
	mov	r4, r0
	ldr	r0, .L38
	ldrb	r8, [r1, #4]	@ zero_extendqisi2
	bic	r6, r6, #978944
	cmp	r4, r0
	ite	eq
	moveq	r0, #4
	movne	r0, #3
	mov	r7, r1
	mov	r5, r2
	bic	r6, r6, #3840
	bl	Chip_Clock_GetRate
	cmp	r9, #0
	beq	.L34
	rsb	r8, r8, #11
	uxtb	r2, r8
	mul	r5, r5, r2
.L35:
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	lsls	r3, r3, #17
	add	r0, r5, r0, lsl #1
	and	r3, r3, #917504
	lsls	r5, r5, #1
	udiv	r0, r0, r5
	subs	r0, r0, #1
	orrs	r3, r3, r6
	uxtb	r0, r0
	orr	r3, r3, r0, lsl #8
	str	r3, [r4]
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L34:
	add	r2, r5, r5, lsl #2
	add	r5, r5, r2, lsl #1
	b	.L35
.L39:
	.align	2
.L38:
	.word	1074675712
	.size	Chip_ADC_SetSampleRate, .-Chip_ADC_SetSampleRate
	.section	.text.Chip_ADC_SetResolution,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_SetResolution
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_SetResolution, %function
Chip_ADC_SetResolution:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	strb	r2, [r1, #4]
	ldr	r2, [r1]
	b	Chip_ADC_SetSampleRate
	.size	Chip_ADC_SetResolution, .-Chip_ADC_SetResolution
	.section	.text.Chip_ADC_EnableChannel,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_EnableChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_EnableChannel, %function
Chip_ADC_EnableChannel:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	cmp	r2, r3
	lsl	r1, r3, r1
	ldr	r3, [r0]
	beq	.L44
	bic	r3, r3, #117440512
	str	r3, [r0]
	ldr	r3, [r0]
	bic	r3, r3, r1
	str	r3, [r0]
	bx	lr
.L44:
	orrs	r3, r3, r1
	str	r3, [r0]
	bx	lr
	.size	Chip_ADC_EnableChannel, .-Chip_ADC_EnableChannel
	.section	.text.Chip_ADC_SetBurstCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_SetBurstCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_SetBurstCmd, %function
Chip_ADC_SetBurstCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	bic	r3, r3, #117440512
	str	r3, [r0]
	ldr	r3, [r0]
	cbnz	r1, .L46
	bic	r3, r3, #65536
	str	r3, [r0]
	bx	lr
.L46:
	orr	r3, r3, #65536
	str	r3, [r0]
	bx	lr
	.size	Chip_ADC_SetBurstCmd, .-Chip_ADC_SetBurstCmd
	.section	.text.Chip_ADC_ReadByte,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ADC_ReadByte
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ADC_ReadByte, %function
Chip_ADC_ReadByte:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r1, r1, #4
	movs	r3, #0
	ldr	r1, [r0, r1, lsl #2]
	cmp	r1, r3
	itte	lt
	ubfxlt	r3, r1, #6, #10
	movlt	r0, #1
	movge	r0, r3
	strb	r3, [r2]
	bx	lr
	.size	Chip_ADC_ReadByte, .-Chip_ADC_ReadByte
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

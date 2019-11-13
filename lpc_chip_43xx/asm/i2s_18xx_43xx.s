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
	.file	"i2s_18xx_43xx.c"
	.text
	.global	__aeabi_uldivmod
	.global	__aeabi_ldivmod
	.section	.text.getClkDiv.isra.0,"ax",%progbits
	.align	1
	.p2align 2,,3
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	getClkDiv.isra.0, %function
getClkDiv.isra.0:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	sub	sp, sp, #20
	movs	r0, #35
	mov	r5, r1
	strd	r2, r3, [sp, #8]
	bl	Chip_Clock_GetRate
	ldr	r3, [r4]
	str	r0, [sp, #4]
	mov	r2, r0
	ldrb	r0, [r5]	@ zero_extendqisi2
	umull	r3, r4, r0, r3
	lsl	r9, r4, #2
	orr	r9, r9, r3, lsr #30
	lsl	r10, r3, #2
	lsl	r1, r9, #16
	lsls	r0, r3, #18
	orr	r1, r1, r10, lsr #16
	movs	r3, #0
	bl	__aeabi_uldivmod
	lsls	r3, r1, #6
	orr	r3, r3, r0, lsr #26
	lsls	r2, r0, #6
	movs	r4, #64
	movs	r5, #0
	movw	r6, #65535
	movs	r7, #0
	b	.L3
.L17:
	adds	r4, r4, #-1
	adc	r5, r5, #-1
	subs	r2, r2, r0
	sbc	r3, r3, r1
	orrs	ip, r4, r5
	beq	.L16
.L3:
	cmp	r7, r3
	it	eq
	cmpeq	r6, r2
	mov	r8, r4
	bcc	.L17
	uxth	ip, r2
	sub	r0, ip, ip, lsl #8
	mov	lr, r2
	uxth	r0, r0
	rsb	r2, r2, r2, lsl #8
	movs	r6, #0
	movw	fp, #65535
	movs	r3, #255
	b	.L8
.L19:
	cbz	r1, .L18
.L6:
	cmp	r1, fp
	itt	cc
	movcc	fp, r1
	uxthcc	r6, r3
.L5:
	subs	r3, r3, #1
	uxth	r0, r7
	beq	.L7
.L8:
	tst	r2, #-16777216
	uxth	r1, r2
	add	r7, ip, r0
	sub	r2, r2, lr
	bne	.L5
	cmp	r1, #32768
	bls	.L19
	mov	r1, r0
	b	.L6
.L18:
	uxth	r6, r3
.L7:
	mul	r3, r10, r5
	mla	r9, r9, r4, r3
	uxth	r2, r6
	umull	r4, r5, r10, r4
	umull	r0, r1, r4, r2
	add	r5, r5, r9
	mla	r1, r2, r5, r1
	movs	r3, #0
	ldr	r2, [sp, #4]
	bl	__aeabi_uldivmod
	uxth	r0, r0
	cmp	r0, #255
	bhi	.L11
	cmp	r0, #0
	it	eq
	moveq	r0, #1
.L9:
	ldr	r3, [sp, #8]
	strh	r0, [r3]	@ movhi
	ldr	r3, [sp, #12]
	strh	r6, [r3]	@ movhi
	ldr	r3, [sp, #56]
	movs	r0, #1
	str	r8, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L11:
	movs	r0, #255
	b	.L9
.L16:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	getClkDiv.isra.0, .-getClkDiv.isra.0
	.section	.text.Chip_I2S_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_Init, %function
Chip_I2S_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #35
	b	Chip_Clock_Enable
	.size	Chip_I2S_Init, .-Chip_I2S_Init
	.section	.text.Chip_I2S_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_DeInit, %function
Chip_I2S_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	movs	r2, #0
	movw	r0, #2017
	movw	r1, #34785
	str	r0, [r3, #4]
	str	r1, [r3]
	movs	r0, #35
	str	r2, [r3, #28]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	b	Chip_Clock_Disable
	.size	Chip_I2S_DeInit, .-Chip_I2S_DeInit
	.section	.text.Chip_I2S_TxConfig,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_TxConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_TxConfig, %function
Chip_I2S_TxConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #16
	mov	r4, r1
	add	r3, sp, #12
	mov	r5, r0
	str	r3, [sp]
	adds	r1, r1, #5
	mov	r0, r4
	add	r3, sp, #10
	add	r2, sp, #8
	bl	getClkDiv.isra.0
	cbz	r0, .L23
	ldr	r3, [r5]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	bic	r3, r3, #32640
	cmp	r2, #8
	bic	r3, r3, #103
	bhi	.L32
.L24:
	ldrb	r4, [r4, #4]	@ zero_extendqisi2
	ldr	r0, [sp, #12]
	ldrh	r6, [sp, #8]
	subs	r1, r2, #1
	movw	r2, #32704
	cmp	r4, #1
	and	r2, r2, r1, lsl #6
	ldrh	r1, [sp, #10]
	ite	eq
	moveq	r4, #4
	movne	r4, #0
	orrs	r3, r3, r2
	orrs	r3, r3, r4
	orr	r6, r1, r6, lsl #8
	subs	r4, r0, #1
	movs	r1, #0
	str	r3, [r5]
	movs	r0, #1
	str	r1, [r5, #48]
	str	r4, [r5, #40]
	str	r6, [r5, #32]
.L23:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L32:
	cmp	r2, #16
	ite	ls
	orrls	r3, r3, #1
	orrhi	r3, r3, #3
	b	.L24
	.size	Chip_I2S_TxConfig, .-Chip_I2S_TxConfig
	.section	.text.Chip_I2S_RxConfig,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_RxConfig
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_RxConfig, %function
Chip_I2S_RxConfig:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #16
	mov	r4, r1
	add	r3, sp, #12
	mov	r5, r0
	str	r3, [sp]
	adds	r1, r1, #5
	mov	r0, r4
	add	r3, sp, #10
	add	r2, sp, #8
	bl	getClkDiv.isra.0
	cbz	r0, .L34
	ldr	r3, [r5, #4]
	ldrb	r2, [r4, #5]	@ zero_extendqisi2
	bic	r3, r3, #32640
	cmp	r2, #8
	bic	r3, r3, #103
	bhi	.L43
.L35:
	ldrb	r4, [r4, #4]	@ zero_extendqisi2
	ldr	r0, [sp, #12]
	ldrh	r6, [sp, #8]
	subs	r1, r2, #1
	movw	r2, #32704
	cmp	r4, #1
	and	r2, r2, r1, lsl #6
	ldrh	r1, [sp, #10]
	ite	eq
	moveq	r4, #4
	movne	r4, #0
	orrs	r3, r3, r2
	orrs	r3, r3, r4
	orr	r6, r1, r6, lsl #8
	subs	r4, r0, #1
	movs	r1, #0
	str	r3, [r5, #4]
	movs	r0, #1
	str	r1, [r5, #52]
	str	r4, [r5, #44]
	str	r6, [r5, #36]
.L34:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L43:
	cmp	r2, #16
	ite	ls
	orrls	r3, r3, #1
	orrhi	r3, r3, #3
	b	.L35
	.size	Chip_I2S_RxConfig, .-Chip_I2S_RxConfig
	.section	.text.Chip_I2S_Int_TxCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_Int_TxCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_Int_TxCmd, %function
Chip_I2S_Int_TxCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #1
	ldr	r3, [r0, #28]
	beq	.L47
	bic	r3, r3, #2
	str	r3, [r0, #28]
	bx	lr
.L47:
	and	r2, r2, #15
	bic	r3, r3, #983040
	orr	r3, r3, r2, lsl #16
	str	r3, [r0, #28]
	ldr	r3, [r0, #28]
	orr	r3, r3, #2
	str	r3, [r0, #28]
	bx	lr
	.size	Chip_I2S_Int_TxCmd, .-Chip_I2S_Int_TxCmd
	.section	.text.Chip_I2S_Int_RxCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_Int_RxCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_Int_RxCmd, %function
Chip_I2S_Int_RxCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #1
	ldr	r3, [r0, #28]
	beq	.L51
	bic	r3, r3, #1
	str	r3, [r0, #28]
	bx	lr
.L51:
	and	r2, r2, #15
	bic	r3, r3, #3840
	orr	r3, r3, r2, lsl #8
	str	r3, [r0, #28]
	ldr	r3, [r0, #28]
	orr	r3, r3, #1
	str	r3, [r0, #28]
	bx	lr
	.size	Chip_I2S_Int_RxCmd, .-Chip_I2S_Int_RxCmd
	.section	.text.Chip_I2S_DMA_TxCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_DMA_TxCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_DMA_TxCmd, %function
Chip_I2S_DMA_TxCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #1
	beq	.L55
	ldr	r3, [r0, #20]
	bic	r3, r3, #2
	str	r3, [r0, #20]
	bx	lr
.L55:
	ldr	r2, [r0, #20]
	bic	r2, r2, #983040
	str	r2, [r0, #20]
	ldr	r2, [r0, #20]
	orr	r2, r2, r3, lsl #16
	str	r2, [r0, #20]
	ldr	r3, [r0, #20]
	orr	r3, r3, #2
	str	r3, [r0, #20]
	bx	lr
	.size	Chip_I2S_DMA_TxCmd, .-Chip_I2S_DMA_TxCmd
	.section	.text.Chip_I2S_DMA_RxCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2S_DMA_RxCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2S_DMA_RxCmd, %function
Chip_I2S_DMA_RxCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #1
	beq	.L59
	ldr	r3, [r0, #24]
	bic	r3, r3, #1
	str	r3, [r0, #24]
	bx	lr
.L59:
	ldr	r2, [r0, #24]
	bic	r2, r2, #3840
	str	r2, [r0, #24]
	ldr	r2, [r0, #24]
	orr	r2, r2, r3, lsl #8
	str	r2, [r0, #24]
	ldr	r3, [r0, #24]
	orr	r3, r3, #1
	str	r3, [r0, #24]
	bx	lr
	.size	Chip_I2S_DMA_RxCmd, .-Chip_I2S_DMA_RxCmd
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

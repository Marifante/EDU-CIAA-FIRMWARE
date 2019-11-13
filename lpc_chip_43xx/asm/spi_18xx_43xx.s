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
	.file	"spi_18xx_43xx.c"
	.text
	.section	.text.Chip_SPI_RWFrames_Blocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_RWFrames_Blocking
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_RWFrames_Blocking, %function
Chip_SPI_RWFrames_Blocking:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #4]
	ldr	r3, [r0, #8]
	sub	sp, sp, #8
	uxth	r3, r3
	movs	r6, #1
	str	r3, [sp, #4]
	str	r6, [r0, #28]
	ldr	r3, [r0]
	lsls	r2, r3, #29
	mov	r4, r0
	mov	r5, r1
	bpl	.L2
	ldr	r3, [r0]
	and	r3, r3, #3840
	cmp	r3, #2048
	it	ne
	movne	r6, #2
.L2:
	ldr	r3, [r5, #24]
	cbz	r3, .L3
	blx	r3
.L3:
	ldrd	r2, r3, [r5, #8]
	cmp	r2, r3
	bcs	.L10
.L15:
	ldr	r3, [r5, #16]
	cbz	r3, .L7
	blx	r3
.L7:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L18
	ldr	r1, [r5, #8]
	cmp	r6, #2
	ldrb	r2, [r3, r1]	@ zero_extendqisi2
	bne	.L8
	add	r3, r3, r1
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	orr	r2, r2, r3, lsl #8
.L8:
	str	r2, [r4, #8]
	b	.L11
.L38:
	lsls	r3, r3, #24
	bmi	.L37
.L11:
	ldr	r3, [r4, #4]
	tst	r3, #120
	beq	.L38
.L10:
	ldr	r3, [r5, #28]
	cbz	r3, .L6
	blx	r3
.L6:
	ldr	r0, [r5, #8]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L37:
	ldr	r3, [r5, #20]
	cbz	r3, .L12
	blx	r3
.L12:
	ldr	r2, [r5, #4]
	ldr	r1, [r4, #8]
	ldr	r3, [r5, #8]
	cbz	r2, .L13
	strb	r1, [r2, r3]
	cmp	r6, #2
	itttt	eq
	ldrdeq	r3, r2, [r5, #4]
	addeq	r3, r3, r2
	ubfxeq	r1, r1, #8, #8
	strbeq	r1, [r3, #1]
	ldr	r3, [r5, #8]
.L13:
	ldr	r2, [r5, #12]
	add	r3, r3, r6
	cmp	r3, r2
	str	r3, [r5, #8]
	bcc	.L15
	b	.L10
.L18:
	movw	r2, #65535
	b	.L8
	.size	Chip_SPI_RWFrames_Blocking, .-Chip_SPI_RWFrames_Blocking
	.section	.text.Chip_SPI_Int_FlushData,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_Int_FlushData
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_Int_FlushData, %function
Chip_SPI_Int_FlushData:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	ldr	r3, [r0, #8]
	sub	sp, sp, #8
	movs	r2, #1
	uxth	r3, r3
	str	r3, [sp, #4]
	str	r2, [r0, #28]
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	Chip_SPI_Int_FlushData, .-Chip_SPI_Int_FlushData
	.section	.text.Chip_SPI_Int_RWFrames,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_Int_RWFrames
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_Int_RWFrames, %function
Chip_SPI_Int_RWFrames:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	tst	r3, #120
	bne	.L52
	push	{r4, r5, r6, lr}
	lsls	r3, r3, #24
	mov	r6, r2
	mov	r2, #1
	mov	r4, r1
	mov	r5, r0
	str	r2, [r0, #28]
	bmi	.L43
	ldrd	r3, r2, [r1, #8]
	cmp	r3, r2
	bcs	.L46
.L70:
	ldr	r3, [r4, #16]
	cbz	r3, .L49
	blx	r3
.L49:
	ldr	r3, [r4]
	cbz	r3, .L53
	ldr	r1, [r4, #8]
	cmp	r6, #2
	ldrb	r2, [r3, r1]	@ zero_extendqisi2
	beq	.L69
.L50:
	str	r2, [r5, #8]
	movs	r0, #1
	pop	{r4, r5, r6, pc}
.L43:
	ldr	r3, [r1, #20]
	cbz	r3, .L45
	blx	r3
.L45:
	ldrd	r3, r2, [r4, #8]
	cmp	r3, r2
	bcs	.L46
	ldr	r1, [r4, #4]
	ldr	r0, [r5, #8]
	cbz	r1, .L47
	strb	r0, [r1, r3]
	cmp	r6, #2
	itttt	eq
	ldrdeq	r3, r2, [r4, #4]
	addeq	r3, r3, r2
	ubfxeq	r0, r0, #8, #8
	strbeq	r0, [r3, #1]
	ldrd	r3, r2, [r4, #8]
.L47:
	add	r3, r3, r6
	cmp	r3, r2
	str	r3, [r4, #8]
	bcc	.L70
.L46:
	ldr	r3, [r4, #28]
	cbz	r3, .L54
	blx	r3
	movs	r0, #1
	pop	{r4, r5, r6, pc}
.L52:
	movs	r0, #0
	bx	lr
.L69:
	add	r3, r3, r1
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	orr	r2, r2, r3, lsl #8
	b	.L50
.L53:
	movw	r2, #65535
	b	.L50
.L54:
	movs	r0, #1
	pop	{r4, r5, r6, pc}
	.size	Chip_SPI_Int_RWFrames, .-Chip_SPI_Int_RWFrames
	.section	.text.Chip_SPI_Int_RWFrames8Bits,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_Int_RWFrames8Bits
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_Int_RWFrames8Bits, %function
Chip_SPI_Int_RWFrames8Bits:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #1
	b	Chip_SPI_Int_RWFrames
	.size	Chip_SPI_Int_RWFrames8Bits, .-Chip_SPI_Int_RWFrames8Bits
	.section	.text.Chip_SPI_Int_RWFrames16Bits,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_Int_RWFrames16Bits
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_Int_RWFrames16Bits, %function
Chip_SPI_Int_RWFrames16Bits:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #2
	b	Chip_SPI_Int_RWFrames
	.size	Chip_SPI_Int_RWFrames16Bits, .-Chip_SPI_Int_RWFrames16Bits
	.section	.text.Chip_SPI_SetBitRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_SetBitRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_SetBitRate, %function
Chip_SPI_SetBitRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r0
	mov	r0, #288
	mov	r4, r1
	bl	Chip_Clock_GetRate
	udiv	r0, r0, r4
	cmp	r0, #7
	bls	.L75
	adds	r0, r0, #1
	bic	r0, r0, #1
	cmp	r0, #254
	it	cs
	movcs	r0, #254
	str	r0, [r5, #12]
	pop	{r3, r4, r5, pc}
.L75:
	movs	r0, #8
	str	r0, [r5, #12]
	pop	{r3, r4, r5, pc}
	.size	Chip_SPI_SetBitRate, .-Chip_SPI_SetBitRate
	.section	.text.Chip_SPI_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_Init, %function
Chip_SPI_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	mov	r0, #288
	bl	Chip_Clock_Enable
	ldr	r3, [r4]
	ldr	r1, .L79
	orr	r3, r3, #32
	str	r3, [r4]
	ldr	r3, [r4]
	bic	r3, r3, #3856
	bic	r3, r3, #12
	orr	r3, r3, #2048
	orr	r3, r3, #4
	str	r3, [r4]
	mov	r0, r4
	pop	{r4, lr}
	b	Chip_SPI_SetBitRate
.L80:
	.align	2
.L79:
	.word	400000
	.size	Chip_SPI_Init, .-Chip_SPI_Init
	.section	.text.Chip_SPI_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SPI_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SPI_DeInit, %function
Chip_SPI_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #288
	b	Chip_Clock_Disable
	.size	Chip_SPI_DeInit, .-Chip_SPI_DeInit
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

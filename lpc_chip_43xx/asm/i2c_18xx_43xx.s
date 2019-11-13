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
	.file	"i2c_18xx_43xx.c"
	.text
	.section	.text.Chip_I2C_EventHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_EventHandler
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_EventHandler, %function
Chip_I2C_EventHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #1
	bne	.L1
	ldr	r3, .L7
	rsb	r0, r0, r0, lsl #3
	add	r0, r3, r0, lsl #2
	ldr	r2, [r0, #16]
.L3:
	ldrb	r3, [r2, #20]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L3
.L1:
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	Chip_I2C_EventHandler, .-Chip_I2C_EventHandler
	.section	.text.handleMasterXferState,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	handleMasterXferState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	handleMasterXferState, %function
handleMasterXferState:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	ldr	r0, [r0, #4]
	and	r0, r0, #248
	push	{r4, r5}
	cmp	r0, #88
	bhi	.L10
	tbb	[pc, r0]
.L12:
	.byte	(.L20-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L19-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L19-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L18-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L14-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L18-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L17-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L16-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L15-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L14-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L31-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L10-.L12)/2
	.byte	(.L11-.L12)/2
	.p2align 1
.L31:
	movs	r3, #60
.L13:
	ldr	r0, [r1, #12]
	ldr	r4, [r2, #8]
	adds	r5, r0, #1
	str	r5, [r1, #12]
	strb	r4, [r0]
	ldr	r0, [r1, #16]
	subs	r0, r0, #1
	cmp	r0, #1
	str	r0, [r1, #16]
	ble	.L38
.L27:
	bic	r4, r3, #4
	eor	r4, r4, #60
	bic	r5, r3, #20
	and	r0, r3, #16
.L28:
	str	r4, [r2]
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	str	r5, [r2, #24]
	cmp	r0, #0
	beq	.L25
.L26:
	subs	r0, r3, #2
	it	ne
	movne	r0, #1
.L9:
	pop	{r4, r5}
	bx	lr
.L11:
	movs	r3, #44
	b	.L13
.L14:
	movs	r0, #5
.L37:
	movs	r4, #16
	movs	r3, #44
	strb	r0, [r1, #20]
	str	r4, [r2]
	movs	r0, #0
	str	r3, [r2, #24]
	pop	{r4, r5}
	bx	lr
.L17:
	movs	r0, #1
	b	.L37
.L16:
	movs	r3, #2
	strb	r3, [r1, #20]
	movs	r0, #0
.L22:
	movs	r1, #0
	movs	r3, #44
	str	r1, [r2]
	str	r3, [r2, #24]
	pop	{r4, r5}
	bx	lr
.L15:
	ldr	r0, [r1, #16]
	cmp	r0, #1
	mov	r3, #60
	bgt	.L27
.L38:
	eor	r4, r3, #60
	bic	r5, r3, #16
	and	r0, r3, #16
	b	.L28
.L19:
	ldr	r0, [r1, #8]
	ldrb	r4, [r1]	@ zero_extendqisi2
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	clz	r1, r0
	lsrs	r1, r1, #5
	orr	r1, r1, r4, lsl #1
	subs	r0, r3, #2
	str	r1, [r2, #8]
	it	ne
	movne	r0, #1
	b	.L22
.L18:
	ldr	r0, [r1, #8]
	cbnz	r0, .L23
	ldr	r3, [r1, #16]
	cbnz	r3, .L24
	movs	r3, #16
	movs	r0, #44
	str	r3, [r2]
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	str	r0, [r2, #24]
.L25:
	cmp	r3, #4
	mov	r0, #0
	bne	.L9
	strb	r0, [r1, #20]
	pop	{r4, r5}
	bx	lr
.L20:
	movs	r5, #3
	movs	r4, #16
	movs	r3, #44
	strb	r5, [r1, #20]
	str	r4, [r2]
	str	r3, [r2, #24]
	b	.L9
.L10:
	movs	r4, #0
	movs	r0, #44
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	str	r4, [r2]
	str	r0, [r2, #24]
	b	.L26
.L23:
	ldr	r5, [r1, #4]
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	adds	r4, r5, #1
	str	r4, [r1, #4]
	subs	r4, r0, #1
	ldrb	r0, [r5]	@ zero_extendqisi2
	str	r0, [r2, #8]
	subs	r0, r3, #2
	it	ne
	movne	r0, #1
	str	r4, [r1, #8]
	b	.L22
.L24:
	movs	r4, #32
	movs	r0, #12
	ldrb	r3, [r1, #20]	@ zero_extendqisi2
	str	r4, [r2]
	str	r0, [r2, #24]
	b	.L26
	.size	handleMasterXferState, .-handleMasterXferState
	.section	.text.getSlaveIndex,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	getSlaveIndex
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	getSlaveIndex, %function
getSlaveIndex:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	and	r3, r3, #248
	cmp	r3, #112
	mov	r2, r0
	beq	.L40
	ble	.L66
	cmp	r3, #168
	beq	.L40
	cmp	r3, #176
	beq	.L40
	cmp	r3, #120
	beq	.L40
.L43:
	movs	r0, #0
	bx	lr
.L66:
	cmp	r3, #96
	beq	.L40
	cmp	r3, #104
	bne	.L43
.L40:
	ldr	r3, [r2, #8]
	uxtb	r3, r3
	lsrs	r0, r3, #1
	beq	.L42
	ldr	r1, [r2, #12]
	ldr	r0, [r2, #48]
	eors	r1, r1, r3
	orr	r0, r0, #1
	bic	r1, r1, r0
	tst	r1, #255
	beq	.L44
	ldr	r1, [r2, #32]
	ldr	r0, [r2, #52]
	eors	r1, r1, r3
	orr	r0, r0, #1
	bic	r1, r1, r0
	tst	r1, #255
	beq	.L45
	ldr	r1, [r2, #36]
	ldr	r0, [r2, #56]
	eors	r1, r1, r3
	orr	r0, r0, #1
	bic	r1, r1, r0
	tst	r1, #255
	beq	.L46
	ldr	r1, [r2, #40]
	ldr	r2, [r2, #60]
	eors	r3, r3, r1
	orr	r2, r2, #1
	bic	r3, r3, r2
	and	r3, r3, #255
	cmp	r3, #0
	ite	ne
	movne	r0, #0
	moveq	r0, #4
	bx	lr
.L46:
	movs	r0, #3
.L42:
	bx	lr
.L44:
	movs	r0, #1
	bx	lr
.L45:
	movs	r0, #2
	bx	lr
	.size	getSlaveIndex, .-getSlaveIndex
	.section	.text.handleSlaveXferState,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	handleSlaveXferState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	handleSlaveXferState, %function
handleSlaveXferState:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	and	r3, r3, #248
	mov	r2, r0
	subs	r3, r3, #96
	movs	r0, #4
	push	{r4}
	strb	r0, [r1, #20]
	cmp	r3, #104
	bhi	.L77
	tbb	[pc, r3]
.L70:
	.byte	(.L74-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L74-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L74-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L74-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L73-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L69-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L73-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L69-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L69-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L72-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L72-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L71-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L69-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L77-.L70)/2
	.byte	(.L69-.L70)/2
	.p2align 1
.L72:
	ldr	r3, [r2, #8]
	bic	r3, r3, #1
	strb	r3, [r1]
.L71:
	ldrd	r0, r3, [r1, #4]
	adds	r4, r0, #1
	str	r4, [r1, #4]
	subs	r3, r3, #1
	cmp	r3, #0
	ldrb	r0, [r0]	@ zero_extendqisi2
	str	r0, [r2, #8]
	it	le
	movle	r4, #44
	str	r3, [r1, #8]
	itet	gt
	movgt	r4, #40
	movle	r3, #0
	movgt	r3, #4
	movs	r0, #6
.L68:
	str	r3, [r2]
	str	r4, [r2, #24]
	ldr	r4, [sp], #4
	bx	lr
.L74:
	ldr	r3, [r2, #8]
	ldr	r0, [r1, #16]
	bic	r3, r3, #1
	cmp	r0, #1
	strb	r3, [r1]
	ble	.L77
	movs	r4, #40
	movs	r3, #4
	movs	r0, #0
	b	.L68
.L73:
	ldr	r3, [r1, #12]
	ldr	r0, [r2, #8]
	adds	r4, r3, #1
	str	r4, [r1, #12]
	strb	r0, [r3]
	ldr	r3, [r1, #16]
	subs	r3, r3, #1
	cmp	r3, #2
	str	r3, [r1, #16]
	itete	lt
	movlt	r4, #44
	movge	r4, #40
	movlt	r3, #0
	movge	r3, #4
	movs	r0, #5
	str	r3, [r2]
	str	r4, [r2, #24]
	ldr	r4, [sp], #4
	bx	lr
.L69:
	ldrb	r3, [r1]	@ zero_extendqisi2
	and	r3, r3, #1
	cmp	r3, #0
	mov	r0, #0
	itete	eq
	moveq	r4, #40
	movne	r4, #8
	moveq	r3, #4
	movne	r3, #36
	strb	r0, [r1, #20]
	movs	r0, #2
	str	r3, [r2]
	str	r4, [r2, #24]
	ldr	r4, [sp], #4
	bx	lr
.L77:
	movs	r3, #0
	movs	r4, #44
	mov	r0, r3
	str	r3, [r2]
	str	r4, [r2, #24]
	ldr	r4, [sp], #4
	bx	lr
	.size	handleSlaveXferState, .-handleSlaveXferState
	.section	.text.Chip_I2C_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_Init, %function
Chip_I2C_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	rsb	r0, r0, r0, lsl #3
	ldr	r5, .L83
	lsls	r4, r0, #2
	adds	r3, r5, r4
	ldrh	r0, [r3, #4]
	bl	Chip_Clock_Enable
	ldr	r3, [r5, r4]
	movs	r2, #108
	str	r2, [r3, #24]
	pop	{r3, r4, r5, pc}
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.size	Chip_I2C_Init, .-Chip_I2C_Init
	.section	.text.Chip_I2C_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_DeInit, %function
Chip_I2C_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, lsl #3
	lsls	r0, r0, #2
	ldr	r3, .L86
	ldr	r2, [r3, r0]
	add	r3, r3, r0
	movs	r1, #108
	ldrh	r0, [r3, #4]
	str	r1, [r2, #24]
	b	Chip_Clock_Disable
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	.size	Chip_I2C_DeInit, .-Chip_I2C_DeInit
	.section	.text.Chip_I2C_SetClockRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_SetClockRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_SetClockRate, %function
Chip_I2C_SetClockRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	rsb	r0, r0, r0, lsl #3
	ldr	r6, .L90
	lsls	r5, r0, #2
	adds	r3, r6, r5
	mov	r4, r1
	ldrh	r0, [r3, #4]
	bl	Chip_Clock_GetRate
	ldr	r3, [r6, r5]
	udiv	r0, r0, r4
	lsrs	r2, r0, #1
	str	r2, [r3, #16]
	ldr	r1, [r3, #16]
	subs	r0, r0, r1
	str	r0, [r3, #20]
	pop	{r4, r5, r6, pc}
.L91:
	.align	2
.L90:
	.word	.LANCHOR0
	.size	Chip_I2C_SetClockRate, .-Chip_I2C_SetClockRate
	.section	.text.Chip_I2C_GetClockRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_GetClockRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_GetClockRate, %function
Chip_I2C_GetClockRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	rsb	r0, r0, r0, lsl #3
	ldr	r5, .L94
	lsls	r4, r0, #2
	adds	r3, r5, r4
	ldrh	r0, [r3, #4]
	bl	Chip_Clock_GetRate
	ldr	r2, [r5, r4]
	ldr	r3, [r2, #16]
	ldr	r2, [r2, #20]
	add	r3, r3, r2
	udiv	r0, r0, r3
	pop	{r3, r4, r5, pc}
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.size	Chip_I2C_GetClockRate, .-Chip_I2C_GetClockRate
	.section	.text.Chip_I2C_SetMasterEventHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_SetMasterEventHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_SetMasterEventHandler, %function
Chip_I2C_SetMasterEventHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L99
	rsb	r0, r0, r0, lsl #3
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #16]
	cbz	r3, .L97
	ldr	r0, [r0, #8]
	subs	r0, r0, r1
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
.L97:
	str	r1, [r0, #8]
	movs	r0, #1
	bx	lr
.L100:
	.align	2
.L99:
	.word	.LANCHOR0
	.size	Chip_I2C_SetMasterEventHandler, .-Chip_I2C_SetMasterEventHandler
	.section	.text.Chip_I2C_GetMasterEventHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_GetMasterEventHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_GetMasterEventHandler, %function
Chip_I2C_GetMasterEventHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L102
	rsb	r0, r0, r0, lsl #3
	add	r3, r3, r0, lsl #2
	ldr	r0, [r3, #8]
	bx	lr
.L103:
	.align	2
.L102:
	.word	.LANCHOR0
	.size	Chip_I2C_GetMasterEventHandler, .-Chip_I2C_GetMasterEventHandler
	.section	.text.Chip_I2C_MasterTransfer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_MasterTransfer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_MasterTransfer, %function
Chip_I2C_MasterTransfer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	lsls	r6, r0, #3
	sub	r8, r6, r0
	ldr	r4, .L114
	lsl	r8, r8, #2
	add	r9, r4, r8
	mov	r7, r1
	ldr	r3, [r9, #8]
	movs	r1, #3
	mov	r5, r0
	blx	r3
	ldr	r3, [r9, #20]
	str	r7, [r9, #16]
	movs	r2, #4
	strb	r2, [r7, #20]
	cbz	r3, .L113
.L105:
	sub	r8, r6, r5
	lsl	r8, r8, #2
	add	r9, r4, r8
	movs	r1, #1
	ldr	r3, [r9, #8]
	mov	r0, r5
	blx	r3
	movs	r3, #0
	ldr	r2, [r4, r8]
	str	r3, [r9, #16]
.L106:
	ldr	r3, [r2]
	lsls	r3, r3, #27
	bmi	.L106
	subs	r3, r6, r5
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #24]
	tst	r3, #65280
	beq	.L107
	movs	r1, #40
	movs	r3, #68
	str	r1, [r2, #24]
	str	r3, [r2]
.L107:
	subs	r6, r6, r5
	add	r4, r4, r6, lsl #2
	mov	r0, r5
	ldr	r3, [r4, #8]
	movs	r1, #4
	blx	r3
	ldrb	r0, [r7, #20]	@ zero_extendqisi2
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L113:
	ldr	r3, [r4, r8]
	movs	r1, #44
	movs	r2, #96
	str	r1, [r3, #24]
	str	r2, [r3]
	b	.L105
.L115:
	.align	2
.L114:
	.word	.LANCHOR0
	.size	Chip_I2C_MasterTransfer, .-Chip_I2C_MasterTransfer
	.section	.text.Chip_I2C_MasterSend,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_MasterSend
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_MasterSend, %function
Chip_I2C_MasterSend:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, r3
	sub	sp, sp, #28
	movs	r3, #0
	strd	r3, r3, [sp, #16]
	strd	r3, r2, [sp]
	str	r5, [sp, #8]
	mov	r4, r0
	str	r3, [sp, #12]
	strb	r1, [sp]
.L117:
	mov	r1, sp
	mov	r0, r4
	bl	Chip_I2C_MasterTransfer
	cmp	r0, #2
	beq	.L117
	ldr	r0, [sp, #8]
	subs	r0, r5, r0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
	.size	Chip_I2C_MasterSend, .-Chip_I2C_MasterSend
	.section	.text.Chip_I2C_MasterCmdRead,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_MasterCmdRead
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_MasterCmdRead, %function
Chip_I2C_MasterCmdRead:
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #32
	movs	r6, #0
	strb	r2, [sp, #7]
	str	r3, [sp, #20]
	add	r2, sp, #7
	movs	r3, #1
	strd	r2, r3, [sp, #12]
	ldr	r5, [sp, #48]
	str	r6, [sp, #8]
	mov	r4, r0
	str	r6, [sp, #28]
	strb	r1, [sp, #8]
	str	r5, [sp, #24]
.L122:
	add	r1, sp, #8
	mov	r0, r4
	bl	Chip_I2C_MasterTransfer
	cmp	r0, #2
	beq	.L122
	ldr	r0, [sp, #24]
	subs	r0, r5, r0
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
	.size	Chip_I2C_MasterCmdRead, .-Chip_I2C_MasterCmdRead
	.section	.text.Chip_I2C_MasterRead,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_MasterRead
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_MasterRead, %function
Chip_I2C_MasterRead:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #28
	mov	r5, r3
	movs	r3, #0
	strd	r3, r3, [sp]
	str	r5, [sp, #16]
	mov	r4, r0
	str	r2, [sp, #12]
	strb	r1, [sp]
	str	r3, [sp, #8]
	str	r3, [sp, #20]
.L127:
	mov	r1, sp
	mov	r0, r4
	bl	Chip_I2C_MasterTransfer
	cmp	r0, #2
	beq	.L127
	ldr	r0, [sp, #16]
	subs	r0, r5, r0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
	.size	Chip_I2C_MasterRead, .-Chip_I2C_MasterRead
	.section	.text.Chip_I2C_IsMasterActive,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_IsMasterActive
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_IsMasterActive, %function
Chip_I2C_IsMasterActive:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, lsl #3
	ldr	r3, .L132
	ldr	r3, [r3, r0, lsl #2]
	ldr	r0, [r3, #4]
	and	r0, r0, #248
	cmp	r0, #95
	ite	gt
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L133:
	.align	2
.L132:
	.word	.LANCHOR0
	.size	Chip_I2C_IsMasterActive, .-Chip_I2C_IsMasterActive
	.section	.text.Chip_I2C_MasterStateHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_MasterStateHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_MasterStateHandler, %function
Chip_I2C_MasterStateHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r3, r0, r0, lsl #3
	ldr	r2, .L137
	lsls	r3, r3, #2
	push	{r4, r5, r6, lr}
	adds	r5, r2, r3
	mov	r4, r0
	ldr	r1, [r5, #16]
	ldr	r0, [r2, r3]
	bl	handleMasterXferState
	cbnz	r0, .L134
	ldr	r3, [r5, #8]
	mov	r0, r4
	movs	r1, #2
	pop	{r4, r5, r6, lr}
	bx	r3	@ indirect register sibling call
.L134:
	pop	{r4, r5, r6, pc}
.L138:
	.align	2
.L137:
	.word	.LANCHOR0
	.size	Chip_I2C_MasterStateHandler, .-Chip_I2C_MasterStateHandler
	.section	.text.Chip_I2C_EventHandlerPolling,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_EventHandlerPolling
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_EventHandlerPolling, %function
Chip_I2C_EventHandlerPolling:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	bne	.L148
	ldr	r3, .L152
	rsb	r2, r0, r0, lsl #3
	add	r3, r3, r2, lsl #2
	push	{r4, r5, r6, lr}
	mov	r6, r0
	mov	r5, r3
	ldr	r4, [r3, #16]
	b	.L142
.L143:
	ldr	r3, [r5]
	ldr	r3, [r3]
	lsls	r3, r3, #28
	bmi	.L151
.L142:
	ldrb	r3, [r4, #20]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L143
	pop	{r4, r5, r6, pc}
.L148:
	bx	lr
.L151:
	mov	r0, r6
	bl	Chip_I2C_MasterStateHandler
	b	.L142
.L153:
	.align	2
.L152:
	.word	.LANCHOR0
	.size	Chip_I2C_EventHandlerPolling, .-Chip_I2C_EventHandlerPolling
	.section	.text.Chip_I2C_SlaveSetup,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_SlaveSetup
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_SlaveSetup, %function
Chip_I2C_SlaveSetup:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	ldr	r5, .L164
	ldrb	r7, [sp, #16]	@ zero_extendqisi2
	add	r4, r0, r0, lsl #2
	add	r4, r4, r1
	add	r6, r5, r4, lsl #3
	str	r2, [r5, r4, lsl #3]
	str	r3, [r6, #4]
	cbnz	r1, .L160
	ldr	r4, .L164+4
	lsls	r3, r0, #3
.L155:
	subs	r2, r3, r0
	lsls	r2, r2, #2
	adds	r6, r4, r2
	ldr	r5, [r6, #24]
	tst	r5, #65280
	bne	.L157
	ldr	r6, [r6, #16]
	cbz	r6, .L162
.L157:
	subs	r0, r3, r0
	adds	r1, r1, #8
	movs	r3, #1
	add	r4, r4, r0, lsl #2
	lsl	r1, r3, r1
	orrs	r1, r1, r5
	str	r1, [r4, #24]
	pop	{r4, r5, r6, r7}
	bx	lr
.L160:
	lsls	r3, r0, #3
	subs	r5, r3, r0
	ldr	r4, .L164+4
	ldrb	r6, [r2]	@ zero_extendqisi2
	ldr	r2, [r4, r5, lsl #2]
	add	r5, r1, #11
	cmp	r1, #1
	str	r7, [r2, r5, lsl #2]
	beq	.L163
	add	r5, r1, #1073741824
	adds	r2, r2, #32
	subs	r5, r5, #2
	str	r6, [r2, r5, lsl #2]
	b	.L155
.L162:
	ldr	r2, [r4, r2]
	movs	r7, #40
	movs	r6, #68
	str	r7, [r2, #24]
	str	r6, [r2]
	b	.L157
.L163:
	str	r6, [r2, #12]
	b	.L155
.L165:
	.align	2
.L164:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.size	Chip_I2C_SlaveSetup, .-Chip_I2C_SlaveSetup
	.section	.text.Chip_I2C_SlaveStateHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_SlaveStateHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_SlaveStateHandler, %function
Chip_I2C_SlaveStateHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	lsls	r7, r0, #3
	subs	r3, r7, r0
	ldr	r5, .L172
	lsls	r3, r3, #2
	add	r8, r5, r3
	mov	r6, r0
	ldr	r4, [r8, #20]
	cbz	r4, .L171
.L167:
	subs	r3, r7, r6
	lsls	r3, r3, #2
	add	r8, r5, r3
	ldrb	r2, [r4]	@ zero_extendqisi2
	ldr	r1, [r8, #16]
	ldr	r0, [r5, r3]
	cmp	r1, #0
	ite	eq
	moveq	r3, r2
	orrne	r3, r2, #1
	strb	r3, [r4]
	mov	r1, r4
	bl	handleSlaveXferState
	cbz	r0, .L166
	ldrb	r3, [r4, #20]	@ zero_extendqisi2
	cbnz	r3, .L169
	str	r3, [r8, #20]
.L169:
	subs	r7, r7, r6
	add	r5, r5, r7, lsl #2
	uxtb	r1, r0
	ldr	r3, [r5, #12]
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, lr}
	bx	r3	@ indirect register sibling call
.L166:
	pop	{r4, r5, r6, r7, r8, pc}
.L171:
	ldr	r0, [r5, r3]
	bl	getSlaveIndex
	add	r3, r6, r6, lsl #2
	ldr	r2, .L172+4
	add	r0, r0, r3
	add	r3, r2, r0, lsl #3
	ldr	r4, [r2, r0, lsl #3]
	ldr	r3, [r3, #4]
	str	r3, [r8, #12]
	str	r4, [r8, #20]
	b	.L167
.L173:
	.align	2
.L172:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	Chip_I2C_SlaveStateHandler, .-Chip_I2C_SlaveStateHandler
	.section	.text.Chip_I2C_Disable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_Disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_Disable, %function
Chip_I2C_Disable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, lsl #3
	ldr	r3, .L175
	ldr	r3, [r3, r0, lsl #2]
	movs	r2, #64
	str	r2, [r3, #24]
	bx	lr
.L176:
	.align	2
.L175:
	.word	.LANCHOR0
	.size	Chip_I2C_Disable, .-Chip_I2C_Disable
	.section	.text.Chip_I2C_IsStateChanged,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2C_IsStateChanged
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2C_IsStateChanged, %function
Chip_I2C_IsStateChanged:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, lsl #3
	ldr	r3, .L178
	ldr	r3, [r3, r0, lsl #2]
	ldr	r0, [r3]
	ubfx	r0, r0, #3, #1
	bx	lr
.L179:
	.align	2
.L178:
	.word	.LANCHOR0
	.size	Chip_I2C_IsStateChanged, .-Chip_I2C_IsStateChanged
	.section	.bss.i2c_slave,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	i2c_slave, %object
	.size	i2c_slave, 80
i2c_slave:
	.space	80
	.section	.data.i2c,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	i2c, %object
	.size	i2c, 56
i2c:
	.word	1074401280
	.short	34
	.space	2
	.word	Chip_I2C_EventHandler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1074659328
	.short	1
	.space	2
	.word	Chip_I2C_EventHandler
	.word	0
	.word	0
	.word	0
	.word	0
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"i2cm_18xx_43xx.c"
	.text
	.section	.text.Chip_I2CM_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_Init, %function
Chip_I2CM_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L6
	mov	r4, r0
	cmp	r0, r3
	ite	eq
	moveq	r0, #34
	movne	r0, #1
	bl	Chip_Clock_Enable
	movs	r3, #44
	str	r3, [r4, #24]
	pop	{r4, pc}
.L7:
	.align	2
.L6:
	.word	1074401280
	.size	Chip_I2CM_Init, .-Chip_I2CM_Init
	.section	.text.Chip_I2CM_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_DeInit, %function
Chip_I2CM_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	movs	r2, #44
	str	r2, [r0, #24]
	cmp	r0, r3
	ite	eq
	moveq	r0, #34
	movne	r0, #1
	b	Chip_Clock_Disable
.L12:
	.align	2
.L11:
	.word	1074401280
	.size	Chip_I2CM_DeInit, .-Chip_I2CM_DeInit
	.section	.text.Chip_I2CM_SetBusSpeed,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_SetBusSpeed
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_SetBusSpeed, %function
Chip_I2CM_SetBusSpeed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r3, .L17
	mov	r5, r0
	cmp	r0, r3
	ite	eq
	moveq	r0, #34
	movne	r0, #1
	mov	r4, r1
	bl	Chip_Clock_GetRate
	udiv	r0, r0, r4
	lsrs	r3, r0, #1
	subs	r0, r0, r3
	uxth	r0, r0
	uxth	r3, r3
	str	r3, [r5, #16]
	str	r0, [r5, #20]
	pop	{r3, r4, r5, pc}
.L18:
	.align	2
.L17:
	.word	1074401280
	.size	Chip_I2CM_SetBusSpeed, .-Chip_I2CM_SetBusSpeed
	.section	.text.Chip_I2CM_XferHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_XferHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_XferHandler, %function
Chip_I2CM_XferHandler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	and	r3, r3, #248
	cmp	r3, #48
	push	{r4, r5}
	mov	r2, r0
	beq	.L20
	bls	.L69
	cmp	r3, #72
	beq	.L27
	bls	.L70
	cmp	r3, #88
	beq	.L31
	cmp	r3, #248
	bne	.L71
	movs	r0, #0
	pop	{r4, r5}
	bx	lr
.L69:
	cmp	r3, #16
	beq	.L22
	bls	.L72
	cmp	r3, #32
	beq	.L20
	cmp	r3, #40
	beq	.L26
	cmp	r3, #24
	beq	.L26
.L25:
	movs	r0, #1
	strh	r0, [r1, #2]	@ movhi
	movs	r3, #44
	movs	r1, #16
.L34:
	str	r1, [r2]
	str	r3, [r2, #24]
.L75:
	pop	{r4, r5}
	bx	lr
.L72:
	cbnz	r3, .L73
	movs	r3, #3
	strh	r3, [r1, #2]	@ movhi
	movs	r0, #1
	movs	r3, #44
	movs	r1, #16
	b	.L34
.L71:
	cmp	r3, #80
	bne	.L25
.L31:
	ldr	r3, [r1, #12]
	ldr	r0, [r2, #8]
	adds	r4, r3, #1
	str	r4, [r1, #12]
	strb	r0, [r3]
	ldrh	r0, [r1, #6]
	subs	r0, r0, #1
	uxth	r0, r0
	cmp	r0, #1
	strh	r0, [r1, #6]	@ movhi
	bls	.L74
.L41:
	movs	r3, #56
.L37:
	ldrh	r0, [r1, #2]
	eor	r1, r3, #60
	subs	r0, r0, #255
	and	r3, r3, #44
	str	r1, [r2]
	it	ne
	movne	r0, #1
	str	r3, [r2, #24]
	b	.L75
.L70:
	cmp	r3, #56
	beq	.L29
	cmp	r3, #64
	bne	.L25
	ldrh	r0, [r1, #6]
	cmp	r0, #1
	bhi	.L41
	b	.L74
.L73:
	cmp	r3, #8
	bne	.L25
.L22:
	ldrh	r3, [r1, #4]
	ldrb	r4, [r1]	@ zero_extendqisi2
	ldrh	r0, [r1, #2]
	clz	r3, r3
	lsrs	r3, r3, #5
	orr	r3, r3, r4, lsl #1
	subs	r0, r0, #255
	str	r3, [r2, #8]
	it	ne
	movne	r0, #1
	movs	r3, #44
	movs	r1, #0
	b	.L34
.L74:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	tst	r3, #2
	ite	eq
	moveq	r3, #60
	movne	r3, #56
	cmp	r0, #0
	bne	.L37
	bic	r3, r3, #16
	strh	r0, [r1, #2]	@ movhi
	eor	r1, r3, #60
	movs	r0, #1
	b	.L34
.L26:
	ldrh	r3, [r1, #4]
	cbnz	r3, .L35
	ldrh	r3, [r1, #6]
	cbz	r3, .L68
	ldrh	r0, [r1, #2]
	subs	r0, r0, #255
	mov	r3, #12
	it	ne
	movne	r0, #1
	movs	r1, #32
	b	.L34
.L27:
	movs	r3, #4
.L68:
	strh	r3, [r1, #2]	@ movhi
	movs	r3, #44
	movs	r1, #16
	str	r1, [r2]
	movs	r0, #1
	str	r3, [r2, #24]
	b	.L75
.L29:
	movs	r3, #5
	strh	r3, [r1, #2]	@ movhi
	movs	r0, #1
	movs	r3, #44
	movs	r1, #0
	b	.L34
.L20:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bmi	.L26
	movs	r3, #2
	strh	r3, [r1, #2]	@ movhi
	movs	r0, #1
	movs	r3, #44
	movs	r1, #16
	b	.L34
.L35:
	ldr	r4, [r1, #8]
	ldrh	r0, [r1, #2]
	adds	r5, r4, #1
	str	r5, [r1, #8]
	subs	r3, r3, #1
	ldrb	r4, [r4]	@ zero_extendqisi2
	str	r4, [r2, #8]
	subs	r0, r0, #255
	strh	r3, [r1, #4]	@ movhi
	it	ne
	movne	r0, #1
	movs	r3, #44
	movs	r1, #0
	b	.L34
	.size	Chip_I2CM_XferHandler, .-Chip_I2CM_XferHandler
	.section	.text.Chip_I2CM_Xfer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_Xfer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_Xfer, %function
Chip_I2CM_Xfer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	movs	r2, #44
	movs	r4, #255
	movs	r3, #96
	strh	r4, [r1, #2]	@ movhi
	str	r2, [r0, #24]
	ldr	r4, [sp], #4
	str	r3, [r0]
	bx	lr
	.size	Chip_I2CM_Xfer, .-Chip_I2CM_Xfer
	.section	.text.Chip_I2CM_XferBlocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_XferBlocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_XferBlocking, %function
Chip_I2CM_XferBlocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r1
	movs	r2, #44
	movs	r1, #255
	movs	r3, #96
	strh	r1, [r5, #2]	@ movhi
	mov	r4, r0
	str	r2, [r0, #24]
	str	r3, [r0]
.L79:
	ldr	r3, [r4]
	lsls	r3, r3, #28
	bpl	.L79
	mov	r1, r5
	mov	r0, r4
	bl	Chip_I2CM_XferHandler
	cmp	r0, #0
	beq	.L79
	pop	{r3, r4, r5, pc}
	.size	Chip_I2CM_XferBlocking, .-Chip_I2CM_XferBlocking
	.section	.text.Chip_I2CM_Write,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_Write
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_Write, %function
Chip_I2CM_Write:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	movs	r3, #96
	movs	r6, #40
	str	r6, [r0, #24]
	mov	r4, r2
	str	r3, [r0]
	cmp	r2, #0
	beq	.L86
	movs	r4, #0
.L89:
	ldr	r3, [r0]
	lsls	r3, r3, #28
	bpl	.L89
	ldr	r3, [r0, #4]
	and	r3, r3, #248
	subs	r3, r3, #8
	adds	r5, r4, #1
	cmp	r3, #48
	bhi	.L90
	tbb	[pc, r3]
.L92:
	.byte	(.L93-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L93-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L93-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L93-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L90-.L92)/2
	.byte	(.L91-.L92)/2
	.p2align 1
.L91:
	cmp	r2, r4
	str	r6, [r0, #24]
	bhi	.L89
	mov	r0, r4
	pop	{r4, r5, r6}
	bx	lr
.L93:
	ldrb	r3, [r1, r4]	@ zero_extendqisi2
	str	r3, [r0, #8]
	cmp	r2, r5
	str	r6, [r0, #24]
	mov	r4, r5
	bhi	.L89
	mov	r0, r4
	pop	{r4, r5, r6}
	bx	lr
.L90:
	movs	r3, #40
	str	r3, [r0, #24]
.L86:
	mov	r0, r4
	pop	{r4, r5, r6}
	bx	lr
	.size	Chip_I2CM_Write, .-Chip_I2CM_Write
	.section	.text.Chip_I2CM_Read,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_I2CM_Read
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_I2CM_Read, %function
Chip_I2CM_Read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	movs	r3, #36
	movs	r5, #40
	str	r5, [r0, #24]
	str	r3, [r0]
	cbz	r2, .L123
	mov	r4, r0
	movs	r0, #0
.L103:
	ldr	r3, [r4]
	lsls	r3, r3, #28
	bpl	.L103
	ldr	r3, [r4, #4]
	and	r3, r3, #248
	cmp	r3, #56
	beq	.L104
	bhi	.L105
	cmp	r3, #8
	beq	.L106
	cmp	r3, #16
	beq	.L106
.L107:
	movs	r3, #40
	str	r3, [r4, #24]
.L100:
	pop	{r4, r5}
	bx	lr
.L105:
	cmp	r3, #64
	beq	.L106
	cmp	r3, #80
	bne	.L107
.L106:
	ldr	r3, [r4, #8]
	strb	r3, [r1, r0]
	adds	r0, r0, #1
	cmp	r2, r0
	str	r5, [r4, #24]
	bhi	.L103
	pop	{r4, r5}
	bx	lr
.L104:
	cmp	r2, r0
	str	r5, [r4, #24]
	bhi	.L103
	pop	{r4, r5}
	bx	lr
.L123:
	mov	r0, r2
	b	.L100
	.size	Chip_I2CM_Read, .-Chip_I2CM_Read
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

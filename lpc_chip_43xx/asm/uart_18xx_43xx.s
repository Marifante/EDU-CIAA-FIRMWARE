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
	.file	"uart_18xx_43xx.c"
	.text
	.section	.text.Chip_UART_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_Init, %function
Chip_UART_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L10
	cmp	r0, r3
	sub	sp, sp, #8
	mov	r4, r0
	beq	.L4
	add	r3, r3, #4096
	cmp	r0, r3
	beq	.L5
	ldr	r0, .L10+4
	cmp	r4, r0
	ite	eq
	moveq	r0, #130
	movne	r0, #129
.L2:
	movs	r3, #1
	mov	r2, r3
	mov	r1, r3
	bl	Chip_Clock_EnableOpts
	ldr	r2, .L10+4
	movs	r3, #0
	movs	r1, #7
	cmp	r4, r2
	str	r1, [r4, #8]
	str	r3, [r4, #92]
	str	r3, [r4, #4]
	str	r3, [r4, #12]
	str	r3, [r4, #32]
	str	r3, [r4, #76]
	str	r3, [r4, #84]
	str	r3, [r4, #80]
	beq	.L9
.L3:
	movs	r2, #3
	movs	r3, #16
	str	r2, [r4, #12]
	str	r3, [r4, #40]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L5:
	movs	r0, #162
	b	.L2
.L9:
	str	r3, [r4, #16]
	ldr	r3, [r4, #24]
	str	r3, [sp, #4]
	b	.L3
.L4:
	movs	r0, #161
	b	.L2
.L11:
	.align	2
.L10:
	.word	1074532352
	.word	1074274304
	.size	Chip_UART_Init, .-Chip_UART_Init
	.section	.text.Chip_UART_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_DeInit, %function
Chip_UART_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	movs	r2, #0
	cmp	r0, r3
	str	r2, [r0, #92]
	beq	.L14
	add	r3, r3, #4096
	cmp	r0, r3
	beq	.L15
	sub	r3, r3, #262144
	cmp	r0, r3
	ite	eq
	moveq	r0, #130
	movne	r0, #129
	b	Chip_Clock_Disable
.L15:
	movs	r0, #162
	b	Chip_Clock_Disable
.L14:
	movs	r0, #161
	b	Chip_Clock_Disable
.L18:
	.align	2
.L17:
	.word	1074532352
	.size	Chip_UART_DeInit, .-Chip_UART_DeInit
	.section	.text.Chip_UART_Send,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_Send
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_Send, %function
Chip_UART_Send:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	ble	.L22
	ldr	r3, [r0, #20]
	ands	r3, r3, #32
	beq	.L27
	push	{r4}
	add	r2, r2, r1
	movs	r3, #0
	b	.L21
.L30:
	ldr	r4, [r0, #20]
	lsls	r4, r4, #26
	bpl	.L19
.L21:
	ldrb	r4, [r1], #1	@ zero_extendqisi2
	str	r4, [r0]
	cmp	r1, r2
	add	r3, r3, #1
	bne	.L30
.L19:
	mov	r0, r3
	ldr	r4, [sp], #4
	bx	lr
.L22:
	movs	r3, #0
.L27:
	mov	r0, r3
	bx	lr
	.size	Chip_UART_Send, .-Chip_UART_Send
	.section	.text.Chip_UART_CheckBusy,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_CheckBusy
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_CheckBusy, %function
Chip_UART_CheckBusy:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #20]
	eor	r0, r0, #64
	ubfx	r0, r0, #6, #1
	bx	lr
	.size	Chip_UART_CheckBusy, .-Chip_UART_CheckBusy
	.section	.text.Chip_UART_SendBlocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_SendBlocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_SendBlocking, %function
Chip_UART_SendBlocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	push	{r4, r5, r6}
	mov	r6, #0
	ble	.L32
.L33:
	mov	r4, r1
	movs	r3, #0
.L35:
	ldr	r5, [r0, #20]
	lsls	r5, r5, #26
	bpl	.L42
	adds	r3, r3, #1
	ldrb	r5, [r4], #1	@ zero_extendqisi2
	str	r5, [r0]
	cmp	r3, r2
	blt	.L35
	add	r6, r6, r3
.L32:
	mov	r0, r6
	pop	{r4, r5, r6}
	bx	lr
.L42:
	subs	r2, r2, r3
	cmp	r2, #0
	add	r6, r6, r3
	add	r1, r1, r3
	bgt	.L33
	b	.L32
	.size	Chip_UART_SendBlocking, .-Chip_UART_SendBlocking
	.section	.text.Chip_UART_Read,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_Read
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_Read, %function
Chip_UART_Read:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	ble	.L46
	ldr	r3, [r0, #20]
	ands	r3, r3, #1
	beq	.L51
	push	{r4}
	add	r2, r2, r1
	movs	r3, #0
	b	.L45
.L54:
	ldr	r4, [r0, #20]
	lsls	r4, r4, #31
	bpl	.L43
.L45:
	ldr	r4, [r0]
	strb	r4, [r1], #1
	cmp	r1, r2
	add	r3, r3, #1
	bne	.L54
.L43:
	mov	r0, r3
	ldr	r4, [sp], #4
	bx	lr
.L46:
	movs	r3, #0
.L51:
	mov	r0, r3
	bx	lr
	.size	Chip_UART_Read, .-Chip_UART_Read
	.section	.text.Chip_UART_ReadBlocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_ReadBlocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_ReadBlocking, %function
Chip_UART_ReadBlocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	push	{r4, r5, r6}
	mov	r6, #0
	ble	.L55
.L56:
	mov	r4, r1
	movs	r3, #0
.L60:
	ldr	r5, [r0, #20]
	lsls	r5, r5, #31
	bpl	.L58
	adds	r3, r3, #1
	ldr	r5, [r0]
	strb	r5, [r4], #1
	cmp	r3, r2
	blt	.L60
.L58:
	subs	r2, r2, r3
	add	r6, r6, r3
	cmp	r2, r6
	add	r1, r1, r3
	bgt	.L56
.L55:
	mov	r0, r6
	pop	{r4, r5, r6}
	bx	lr
	.size	Chip_UART_ReadBlocking, .-Chip_UART_ReadBlocking
	.section	.text.Chip_UART_SetBaud,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_SetBaud
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_SetBaud, %function
Chip_UART_SetBaud:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r3, .L70
	cmp	r0, r3
	mov	r4, r0
	mov	r5, r1
	beq	.L66
	add	r3, r3, #4096
	cmp	r0, r3
	beq	.L67
	ldr	r0, .L70+4
	cmp	r4, r0
	ite	eq
	moveq	r0, #418
	movne	r0, #450
.L65:
	bl	Chip_Clock_GetRate
	ldr	r3, [r4, #12]
	lsls	r1, r5, #4
	orr	r3, r3, #128
	udiv	r1, r0, r1
	uxtb	r5, r1
	ubfx	r2, r1, #8, #8
	str	r3, [r4, #12]
	str	r5, [r4]
	str	r2, [r4, #4]
	ldr	r3, [r4, #12]
	udiv	r0, r0, r1
	bic	r3, r3, #128
	str	r3, [r4, #12]
	pop	{r3, r4, r5, pc}
.L67:
	mov	r0, #354
	b	.L65
.L66:
	mov	r0, #386
	b	.L65
.L71:
	.align	2
.L70:
	.word	1074532352
	.word	1074274304
	.size	Chip_UART_SetBaud, .-Chip_UART_SetBaud
	.section	.text.Chip_UART_RXIntHandlerRB,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_RXIntHandlerRB
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_RXIntHandlerRB, %function
Chip_UART_RXIntHandlerRB:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	lsls	r2, r3, #31
	bpl	.L80
	push	{r4, r5, lr}
	mov	r5, r1
	sub	sp, sp, #12
	mov	r4, r0
.L74:
	ldr	r3, [r4]
	strb	r3, [sp, #7]
	add	r1, sp, #7
	mov	r0, r5
	bl	RingBuffer_Insert
	ldr	r3, [r4, #20]
	lsls	r3, r3, #31
	bmi	.L74
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L80:
	bx	lr
	.size	Chip_UART_RXIntHandlerRB, .-Chip_UART_RXIntHandlerRB
	.section	.text.Chip_UART_TXIntHandlerRB,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_TXIntHandlerRB
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_TXIntHandlerRB, %function
Chip_UART_TXIntHandlerRB:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #20]
	lsls	r2, r3, #26
	sub	sp, sp, #12
	mov	r4, r0
	mov	r5, r1
	bmi	.L84
	b	.L87
.L88:
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	str	r3, [r4]
	ldr	r3, [r4, #20]
	lsls	r3, r3, #26
	bpl	.L87
.L84:
	add	r1, sp, #7
	mov	r0, r5
	bl	RingBuffer_Pop
	cmp	r0, #0
	bne	.L88
.L87:
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #16]
	cmp	r2, r3
	bne	.L83
	ldr	r3, [r4, #4]
	bic	r3, r3, #2
	str	r3, [r4, #4]
.L83:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
	.size	Chip_UART_TXIntHandlerRB, .-Chip_UART_TXIntHandlerRB
	.section	.text.Chip_UART_SendRB,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_SendRB
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_SendRB, %function
Chip_UART_SendRB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	ldr	r1, [r0, #4]
	mov	r7, r2
	bic	r1, r1, #2
	mov	r4, r0
	mov	r2, r3
	str	r1, [r0, #4]
	mov	r1, r7
	mov	r0, r6
	mov	r8, r3
	bl	RingBuffer_InsertMult
	mov	r1, r6
	mov	r5, r0
	mov	r0, r4
	bl	Chip_UART_TXIntHandlerRB
	sub	r2, r8, r5
	adds	r1, r7, r5
	mov	r0, r6
	bl	RingBuffer_InsertMult
	ldr	r3, [r4, #4]
	orr	r3, r3, #2
	add	r0, r0, r5
	str	r3, [r4, #4]
	pop	{r4, r5, r6, r7, r8, pc}
	.size	Chip_UART_SendRB, .-Chip_UART_SendRB
	.section	.text.Chip_UART_ReadRB,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_ReadRB
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_ReadRB, %function
Chip_UART_ReadRB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	b	RingBuffer_PopMult
	.size	Chip_UART_ReadRB, .-Chip_UART_ReadRB
	.section	.text.Chip_UART_IRQRBHandler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_IRQRBHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_IRQRBHandler, %function
Chip_UART_IRQRBHandler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #4]
	lsls	r6, r3, #30
	sub	sp, sp, #8
	mov	r4, r0
	mov	r5, r1
	bpl	.L115
	b	.L116
.L102:
	ldr	r3, [r4]
	strb	r3, [sp, #7]
	add	r1, sp, #7
	mov	r0, r5
	bl	RingBuffer_Insert
.L115:
	ldr	r3, [r4, #20]
	lsls	r1, r3, #31
	bmi	.L102
	ldr	r3, [r4, #8]
	lsls	r2, r3, #23
	bpl	.L104
	ldr	r3, [r4, #32]
	ldr	r2, .L118
	orr	r3, r3, #256
	str	r3, [r4, #32]
	ldr	r3, [r4, #4]
	bic	r3, r3, #256
	str	r3, [r4, #4]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cbz	r3, .L117
.L104:
	ldr	r3, [r4, #8]
	lsls	r3, r3, #22
	bpl	.L97
	ldr	r3, [r4, #32]
	orr	r3, r3, #512
	str	r3, [r4, #32]
	ldr	r3, [r4, #4]
	bic	r3, r3, #512
	str	r3, [r4, #4]
.L97:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L117:
	movs	r3, #1
	strb	r3, [r2]
	b	.L104
.L116:
	mov	r6, r2
	mov	r1, r2
	bl	Chip_UART_TXIntHandlerRB
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #16]
	cmp	r2, r3
	bne	.L115
	ldr	r3, [r4, #4]
	bic	r3, r3, #2
	str	r3, [r4, #4]
	b	.L115
.L119:
	.align	2
.L118:
	.word	.LANCHOR0
	.size	Chip_UART_IRQRBHandler, .-Chip_UART_IRQRBHandler
	.global	__aeabi_uldivmod
	.section	.text.Chip_UART_SetBaudFDR,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_SetBaudFDR
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_SetBaudFDR, %function
Chip_UART_SetBaudFDR:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L144
	sub	sp, sp, #36
	cmp	r0, r3
	str	r0, [sp, #28]
	mov	fp, r1
	beq	.L130
	add	r3, r3, #4096
	cmp	r0, r3
	mov	r1, r0
	beq	.L131
	ldr	r0, .L144+4
	cmp	r1, r0
	ite	eq
	moveq	r0, #418
	movne	r0, #450
.L121:
	bl	Chip_Clock_GetRate
	movs	r7, #1
	lsrs	r3, r0, #4
	lsls	r2, r0, #28
	movs	r6, #0
	str	r0, [sp, #24]
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	str	r6, [sp, #8]
	mov	r10, r3
	mov	r8, r2
	str	r7, [sp, #4]
	str	fp, [sp, #12]
	mov	r9, #-1
.L128:
	ldr	r5, [sp, #12]
	movs	r4, #0
	b	.L127
.L122:
	cmp	r0, r9
	bhi	.L123
	cbnz	r1, .L124
.L123:
	adds	r4, r4, #1
	cmp	r7, r4
	add	r5, r5, fp
	beq	.L143
.L127:
	mov	r2, r5
	movs	r3, #0
	mov	r0, r8
	mov	r1, r10
	bl	__aeabi_uldivmod
	cmp	r0, #0
	mov	r3, r0
	mov	r2, r1
	bge	.L122
	rsbs	r3, r0, #0
	cmp	r3, r9
	bhi	.L123
	adds	r2, r1, #1
.L124:
	lsrs	r1, r2, #16
	bne	.L123
	cmp	r2, #2
	bhi	.L125
	cmp	r4, #0
	bne	.L123
.L125:
	cbz	r3, .L126
	strd	r7, r4, [sp, #4]
	adds	r4, r4, #1
	cmp	r7, r4
	mov	r9, r3
	mov	r6, r2
	add	r5, r5, fp
	bne	.L127
.L143:
	ldr	r3, [sp, #16]
	adds	r8, r8, r3
	ldr	r3, [sp, #20]
	adc	r10, r10, r3
	ldr	r3, [sp, #12]
	adds	r7, r7, #1
	add	r3, r3, fp
	cmp	r7, #16
	str	r3, [sp, #12]
	bne	.L128
	cbz	r6, .L120
	ldrd	r7, r4, [sp, #4]
	mov	r2, r6
.L126:
	ldr	r1, [sp, #28]
	ldr	r5, [sp, #24]
	ldr	r3, [r1, #12]
	orr	r3, r3, #128
	str	r3, [r1, #12]
	uxtb	r3, r2
	str	r3, [r1]
	lsrs	r3, r2, #8
	str	r3, [r1, #4]
	mov	r0, r1
	lsls	r3, r7, #4
	ldr	r1, [r1, #12]
	uxtb	r3, r3
	orrs	r3, r3, r4
	bic	r1, r1, #128
	lsrs	r6, r5, #4
	add	r4, r4, r7
	str	r1, [r0, #12]
	str	r3, [r0, #40]
	mul	r6, r7, r6
	mul	r4, r2, r4
	udiv	r6, r6, r4
.L120:
	mov	r0, r6
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L131:
	mov	r0, #354
	b	.L121
.L130:
	mov	r0, #386
	b	.L121
.L145:
	.align	2
.L144:
	.word	1074532352
	.word	1074274304
	.size	Chip_UART_SetBaudFDR, .-Chip_UART_SetBaudFDR
	.section	.text.Chip_UART_GetABEOStatus,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_GetABEOStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_GetABEOStatus, %function
Chip_UART_GetABEOStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L147
	ldrb	r0, [r3]	@ zero_extendqisi2
	bx	lr
.L148:
	.align	2
.L147:
	.word	.LANCHOR0
	.size	Chip_UART_GetABEOStatus, .-Chip_UART_GetABEOStatus
	.section	.text.Chip_UART_ABCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_UART_ABCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_UART_ABCmd, %function
Chip_UART_ABCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r3, #1
	beq	.L162
	movs	r3, #0
	str	r3, [r0, #32]
	bx	lr
.L162:
	ldr	r3, [r0, #12]
	push	{r4}
	orr	r3, r3, #128
	movs	r4, #0
	str	r3, [r0, #12]
	str	r4, [r0]
	str	r4, [r0, #4]
	ldr	r3, [r0, #12]
	cmp	r1, #1
	bic	r3, r3, #128
	mov	r1, #16
	str	r3, [r0, #12]
	ite	eq
	moveq	r3, #3
	movne	r3, #1
	str	r1, [r0, #40]
	cbz	r2, .L152
	orr	r3, r3, #4
.L152:
	str	r3, [r0, #32]
	ldr	r4, [sp], #4
	bx	lr
	.size	Chip_UART_ABCmd, .-Chip_UART_ABCmd
	.section	.bss.ABsyncSts,"aw",%nobits
	.set	.LANCHOR0,. + 0
	.type	ABsyncSts, %object
	.size	ABsyncSts, 1
ABsyncSts:
	.space	1
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

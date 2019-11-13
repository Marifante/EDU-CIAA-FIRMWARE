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
	.file	"sdio_18xx_43xx.c"
	.text
	.section	.text.SDIO_WriteRead_Direct.part.1,"ax",%progbits
	.align	1
	.p2align 2,,3
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_WriteRead_Direct.part.1, %function
SDIO_WriteRead_Direct.part.1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	ldr	r3, [r3, #12]
	ands	r2, r3, #51968
	ittte	eq
	uxtbeq	r3, r3
	streq	r3, [r0]
	moveq	r0, r2
	mvnne	r0, #2
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.size	SDIO_WriteRead_Direct.part.1, .-SDIO_WriteRead_Direct.part.1
	.thumb_set SDIO_Read_Direct.part.3,SDIO_WriteRead_Direct.part.1
	.section	.text.SDIO_Card_GetBlockSize,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Card_GetBlockSize
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_GetBlockSize, %function
SDIO_Card_GetBlockSize:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldr	r2, [r3, #28]
	cmp	r2, r1
	itte	cs
	addcs	r1, r1, #16
	ldrhcs	r0, [r3, r1, lsl #1]
	movcc	r0, #0
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.size	SDIO_Card_GetBlockSize, .-SDIO_Card_GetBlockSize
	.section	.text.SDIO_Setup_Callback,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Setup_Callback
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Setup_Callback, %function
SDIO_Setup_Callback:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	strd	r1, r2, [r3]
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	SDIO_Setup_Callback, .-SDIO_Setup_Callback
	.section	.text.SDIO_Send_Command,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Send_Command
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Send_Command, %function
SDIO_Send_Command:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L26
	ldr	r7, [r0, #36]
	ldr	r3, [r6, #4]
	mov	r5, r1
	mov	r8, r2
	and	r2, r1, #63
	movs	r1, #0
	mov	r4, r0
	blx	r3
	movw	r3, #41286
	lsls	r2, r5, #22
	bic	r0, r3, r0
	bpl	.L16
	movw	r3, #48776
	orrs	r0, r0, r3
	orrs	r7, r7, r3
.L16:
	str	r0, [r4, #36]
	mov	r2, r8
	mov	r1, r5
	mov	r0, r4
	bl	Chip_SDIF_SendCmd
	ldr	r3, [r6, #4]
	movs	r2, #0
	movs	r1, #3
	mov	r0, r4
	blx	r3
	mov	r6, r0
	cbnz	r0, .L17
	lsls	r3, r5, #25
	bmi	.L25
.L17:
	str	r7, [r4, #36]
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, pc}
.L25:
	mov	r0, r4
	ldr	r1, .L26+4
	bl	Chip_SDIF_GetResponse
	str	r7, [r4, #36]
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, pc}
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	.LANCHOR0+12
	.size	SDIO_Send_Command, .-SDIO_Send_Command
	.section	.text.SDIO_Card_WriteData,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Card_WriteData
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_WriteData, %function
SDIO_Card_WriteData:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L38
	ldr	r5, [r7, #28]
	sub	sp, sp, #4
	cmp	r5, r1
	ldrd	r4, r8, [sp, #40]
	bcc	.L31
	subs	r6, r4, #1
	cmp	r6, #512
	bcs	.L34
	tst	r8, #134217728
	bne	.L37
	mov	fp, r4
.L30:
	mov	r5, r0
	str	r4, [r0, #28]
	mov	r10, r3
	mov	r9, r2
	mov	r6, r1
	movs	r2, #0
	movs	r1, #1
	ldr	r3, [r7, #4]
	str	fp, [r0, #32]
	blx	r3
	ubfx	r4, r4, #0, #9
	mov	r2, r10
	ldr	r1, .L38+4
	mov	r0, r5
	mov	r3, fp
	bl	Chip_SDIF_DmaSetup
	and	r8, r8, #201326592
	orr	r2, r4, r9, lsl #9
	orr	r2, r2, r8
	orr	r2, r2, r6, lsl #28
	orr	r2, r2, #-2147483648
	movw	r1, #1909
	mov	r0, r5
	bl	SDIO_Send_Command
	cbnz	r0, .L28
	ldr	r2, [r7, #12]
	ands	r2, r2, #51968
	bne	.L35
	ldr	r3, [r7, #4]
	mov	r0, r5
	movs	r1, #4
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	r3
.L37:
	add	r5, r1, #16
	ldrh	r5, [r7, r5, lsl #1]
	cbz	r5, .L34
	mul	fp, r5, r4
	b	.L30
.L35:
	mvn	r0, #2
.L28:
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L34:
	mvn	r0, #6
	b	.L28
.L31:
	mvn	r0, #5
	b	.L28
.L39:
	.align	2
.L38:
	.word	.LANCHOR0
	.word	.LANCHOR0+48
	.size	SDIO_Card_WriteData, .-SDIO_Card_WriteData
	.section	.text.SDIO_Card_ReadData,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Card_ReadData
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_ReadData, %function
SDIO_Card_ReadData:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L50
	ldr	r5, [r7, #28]
	sub	sp, sp, #4
	cmp	r5, r1
	ldrd	r6, r4, [sp, #40]
	bcc	.L43
	add	ip, r6, #-1
	cmp	ip, #512
	bcs	.L46
	lsls	r5, r4, #4
	bmi	.L49
	mov	ip, r6
	mov	fp, r6
.L42:
	mov	r5, r0
	str	ip, [r0, #28]
	mov	r9, r3
	mov	r10, r2
	mov	r8, r1
	movs	r2, #0
	movs	r1, #1
	ldr	r3, [r7, #4]
	str	fp, [r0, #32]
	blx	r3
	and	r4, r4, #201326592
	mov	r3, fp
	mov	r2, r10
	ldr	r1, .L50+4
	mov	r0, r5
	bl	Chip_SDIF_DmaSetup
	orr	r3, r4, r9, lsl #9
	orr	r3, r3, r8, lsl #28
	ubfx	r2, r6, #0, #9
	orrs	r2, r2, r3
	movw	r1, #9077
	mov	r0, r5
	bl	SDIO_Send_Command
	cbnz	r0, .L40
	ldr	r2, [r7, #12]
	ands	r2, r2, #51968
	bne	.L47
	ldr	r3, [r7, #4]
	mov	r0, r5
	movs	r1, #4
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	r3
.L49:
	add	r5, r1, #16
	ldrh	ip, [r7, r5, lsl #1]
	cmp	ip, #0
	beq	.L46
	mul	fp, ip, r6
	b	.L42
.L47:
	mvn	r0, #2
.L40:
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L46:
	mvn	r0, #6
	b	.L40
.L43:
	mvn	r0, #5
	b	.L40
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.word	.LANCHOR0+48
	.size	SDIO_Card_ReadData, .-SDIO_Card_ReadData
	.section	.text.SDIO_Write_Direct,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Write_Direct
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Write_Direct, %function
SDIO_Write_Direct:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	uxtb	r4, r3
	orr	r1, r4, r1, lsl #28
	orr	r2, r1, r2, lsl #9
	orr	r2, r2, #-2147483648
	mov	r1, #372
	mov	r5, r3
	bl	SDIO_Send_Command
	cbnz	r0, .L52
	ldr	r3, .L56
	ldr	r0, [r3, #12]
	tst	r0, #51968
	bne	.L54
	uxtb	r0, r0
	subs	r0, r0, r5
	it	ne
	movne	r0, #1
.L52:
	pop	{r3, r4, r5, pc}
.L54:
	mvn	r0, #2
	pop	{r3, r4, r5, pc}
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.size	SDIO_Write_Direct, .-SDIO_Write_Direct
	.section	.text.SDIO_WriteRead_Direct,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_WriteRead_Direct
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_WriteRead_Direct, %function
SDIO_WriteRead_Direct:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldrb	r4, [r3]	@ zero_extendqisi2
	orr	r1, r4, r1, lsl #28
	orr	r2, r1, r2, lsl #9
	orr	r2, r2, #-2013265920
	mov	r1, #372
	mov	r5, r3
	bl	SDIO_Send_Command
	cbnz	r0, .L58
	mov	r0, r5
	pop	{r3, r4, r5, lr}
	b	SDIO_WriteRead_Direct.part.1
.L58:
	pop	{r3, r4, r5, pc}
	.size	SDIO_WriteRead_Direct, .-SDIO_WriteRead_Direct
	.section	.text.SDIO_Card_SetBlockSize,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Card_SetBlockSize
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_SetBlockSize, %function
SDIO_Card_SetBlockSize:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L67
	ldr	r3, [r6, #28]
	cmp	r3, r1
	sub	sp, sp, #8
	bcc	.L63
	cmp	r2, #2048
	bhi	.L64
	mov	r4, r2
	lsl	r8, r1, #8
	mov	r5, r1
	uxtb	ip, r4
	add	r2, r8, #16
	add	r3, sp, #4
	movs	r1, #0
	mov	r7, r0
	str	ip, [sp, #4]
	bl	SDIO_WriteRead_Direct
	cbz	r0, .L66
.L61:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L66:
	lsrs	r4, r4, #8
	mov	r1, r0
	add	r3, sp, #4
	mov	r0, r7
	add	r2, r8, #17
	ldr	r7, [sp, #4]
	str	r4, [sp, #4]
	bl	SDIO_WriteRead_Direct
	cmp	r0, #0
	bne	.L61
	ldr	r3, [sp, #4]
	add	r1, r5, #16
	orr	r7, r7, r3, lsl #8
	strh	r7, [r6, r1, lsl #1]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L64:
	mvn	r0, #6
	b	.L61
.L63:
	mvn	r0, #5
	b	.L61
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.size	SDIO_Card_SetBlockSize, .-SDIO_Card_SetBlockSize
	.section	.text.SDIO_Card_SetMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_SetMode, %function
SDIO_Card_SetMode:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	sub	sp, sp, #8
	movs	r0, #13
	mov	r6, r1
	mov	r4, r2
	bl	Chip_Clock_GetBaseClocktHz
	mov	r2, r6
	mov	r1, r0
	mov	r0, r5
	bl	Chip_SDIF_SetClock
	cbnz	r4, .L79
.L70:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L79:
	movs	r4, #2
	add	r3, sp, #4
	movs	r2, #7
	movs	r1, #0
	mov	r0, r5
	str	r4, [sp, #4]
	bl	SDIO_WriteRead_Direct
	mov	r4, r0
	cmp	r0, #0
	bne	.L70
	ldr	r3, [sp, #4]
	lsls	r3, r3, #30
	it	mi
	movmi	r3, #1
	mov	r0, r4
	it	mi
	strmi	r3, [r5, #24]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
	.size	SDIO_Card_SetMode, .-SDIO_Card_SetMode
	.section	.text.SDIO_Read_Direct,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Read_Direct
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Read_Direct, %function
SDIO_Read_Direct:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L83
	lsls	r1, r1, #28
	and	r1, r1, #1879048192
	and	r2, r4, r2, lsl #9
	orrs	r2, r2, r1
	mov	r1, #372
	mov	r4, r3
	bl	SDIO_Send_Command
	cbnz	r0, .L80
	mov	r0, r4
	pop	{r4, lr}
	b	SDIO_Read_Direct.part.3
.L80:
	pop	{r4, pc}
.L84:
	.align	2
.L83:
	.word	67108352
	.size	SDIO_Read_Direct, .-SDIO_Read_Direct
	.section	.text.SDIO_Card_EnableInt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Card_EnableInt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_EnableInt, %function
SDIO_Card_EnableInt:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L92
	ldr	r3, [r3, #28]
	cmp	r3, r1
	bcc	.L87
	push	{r4, r5, lr}
	mov	r2, #2048
	sub	sp, sp, #12
	mov	r4, r1
	mov	r1, #372
	mov	r5, r0
	bl	SDIO_Send_Command
	cbnz	r0, .L85
	add	r0, sp, #4
	bl	SDIO_Read_Direct.part.3
	cbnz	r0, .L85
	movs	r1, #1
	ldr	r3, [sp, #4]
	lsl	r4, r1, r4
	orrs	r4, r4, r3
	orrs	r4, r4, r1
	mov	r3, r4
	mov	r1, r0
	movs	r2, #4
	mov	r0, r5
	str	r4, [sp, #4]
	bl	SDIO_Write_Direct
	cbnz	r0, .L85
	ldr	r3, [r5, #36]
	orr	r3, r3, #65536
	str	r3, [r5, #36]
.L85:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L87:
	mvn	r0, #5
	bx	lr
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.size	SDIO_Card_EnableInt, .-SDIO_Card_EnableInt
	.section	.text.SDIO_Card_DisableInt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Card_DisableInt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_DisableInt, %function
SDIO_Card_DisableInt:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L103
	ldr	r3, [r3, #28]
	cmp	r3, r1
	bcc	.L98
	push	{r4, r5, lr}
	mov	r2, #2048
	sub	sp, sp, #12
	mov	r4, r1
	mov	r1, #372
	mov	r5, r0
	bl	SDIO_Send_Command
	cbnz	r0, .L94
	add	r0, sp, #4
	bl	SDIO_Read_Direct.part.3
	cbnz	r0, .L94
	ldr	r3, [sp, #4]
	movs	r1, #1
	lsls	r1, r1, r4
	bic	r3, r3, r1
	cmp	r3, #1
	itt	eq
	streq	r0, [sp, #4]
	moveq	r3, r0
	mov	r2, #4
	mov	r1, #0
	mov	r0, r5
	it	ne
	strne	r3, [sp, #4]
	bl	SDIO_Write_Direct
	cbnz	r0, .L94
	ldr	r3, [sp, #4]
	cbnz	r3, .L94
	ldr	r3, [r5, #36]
	bic	r3, r3, #65536
	str	r3, [r5, #36]
.L94:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L98:
	mvn	r0, #5
	bx	lr
.L104:
	.align	2
.L103:
	.word	.LANCHOR0
	.size	SDIO_Card_DisableInt, .-SDIO_Card_DisableInt
	.section	.text.SDIO_Card_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Card_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Card_Init, %function
SDIO_Card_Init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	sub	sp, sp, #12
	movs	r0, #13
	mov	r5, r1
	bl	Chip_Clock_GetBaseClocktHz
	mov	r2, r5
	mov	r1, r0
	ldr	r5, .L129
	mov	r0, r4
	bl	Chip_SDIF_SetClock
	movs	r3, #0
	str	r3, [r4, #24]
	movs	r1, #2
	ldr	r3, [r5, #4]
	mov	r0, r4
	movs	r2, #100
	blx	r3
	ldr	r3, [r5, #8]
	lsls	r1, r3, #31
	bpl	.L109
	ldr	r2, .L129+4
	mov	r1, #372
	mov	r0, r4
	bl	SDIO_Send_Command
	mov	r3, r0
	cbnz	r0, .L105
	ldr	r3, [r5, #12]
	tst	r3, #51968
	bne	.L116
	uxtb	r3, r3
	cmp	r3, #8
	bne	.L125
.L109:
	movs	r2, #0
	movs	r1, #69
	mov	r0, r4
	bl	SDIO_Send_Command
	mov	r3, r0
	cbnz	r0, .L105
	ldr	r2, [r5, #12]
	ubfx	r3, r2, #28, #3
	str	r3, [r5, #28]
	cmp	r3, #0
	beq	.L118
	lsls	r2, r2, #11
	it	mi
	movmi	r6, #100
	bmi	.L110
	b	.L112
.L126:
	ldr	r7, [r5, #12]
	cmp	r7, #0
	mov	r0, r4
	blt	.L111
	ldr	r3, [r5, #4]
	blx	r3
	subs	r6, r6, #1
	beq	.L112
.L110:
	mov	r2, #1048576
	movs	r1, #69
	mov	r0, r4
	bl	SDIO_Send_Command
	movs	r2, #10
	mov	r3, r0
	movs	r1, #2
	cmp	r0, #0
	beq	.L126
.L105:
	mov	r0, r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L111:
	mov	r2, r3
	movs	r1, #67
	bl	SDIO_Send_Command
	mov	r3, r0
	cmp	r0, #0
	bne	.L105
	ldr	r3, [r5, #12]
	tst	r3, #57344
	bne	.L120
	ldr	r1, [r5, #8]
	lsrs	r3, r3, #16
	lsls	r3, r3, #16
	mov	r2, r3
	orr	r6, r1, #1
	mov	r0, r4
	movs	r1, #71
	str	r3, [r5, #12]
	str	r6, [r5, #8]
	bl	SDIO_Send_Command
	mov	r3, r0
	cmp	r0, #0
	bne	.L105
	mov	r1, r0
	add	r3, sp, #4
	movs	r5, #2
	movs	r2, #19
	mov	r0, r4
	str	r5, [sp, #4]
	bl	SDIO_WriteRead_Direct
	mov	r3, r0
	cmp	r0, #0
	bne	.L105
	ldr	r3, [sp, #4]
	and	r3, r3, #3
	movs	r2, #1
	movs	r1, #128
	cmp	r3, #3
	str	r2, [r4, #76]
	str	r1, [r4, #128]
	beq	.L127
	mov	r2, #4096
	mov	r1, #372
	mov	r0, r4
	bl	SDIO_Send_Command
	mov	r3, r0
	cmp	r0, #0
	bne	.L105
	add	r0, sp, #4
	bl	SDIO_Read_Direct.part.3
	mov	r3, r0
	cmp	r0, #0
	bne	.L105
	ldr	r2, [sp, #4]
	lsls	r3, r2, #25
	bmi	.L128
	and	r2, r2, #128
	mov	r0, r4
	ldr	r1, .L129+8
	bl	SDIO_Card_SetMode
	mov	r3, r0
	b	.L105
.L112:
	mvn	r3, #3
	b	.L105
.L128:
	mov	r0, r4
	movs	r2, #1
	ldr	r1, .L129+12
	bl	SDIO_Card_SetMode
	mov	r3, r0
	b	.L105
.L127:
	mov	r0, r4
	ldr	r1, .L129+16
	bl	SDIO_Card_SetMode
	mov	r3, r0
	b	.L105
.L118:
	mvn	r3, #1
	b	.L105
.L120:
	mvn	r3, #4
	b	.L105
.L116:
	mvn	r3, #2
	b	.L105
.L125:
	movs	r3, #1
	b	.L105
.L130:
	.align	2
.L129:
	.word	.LANCHOR0
	.word	-2147480568
	.word	400000
	.word	16000000
	.word	33000000
	.size	SDIO_Card_Init, .-SDIO_Card_Init
	.section	.text.SDIO_Handler,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SDIO_Handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SDIO_Handler, %function
SDIO_Handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, [r0, #64]
	ands	r5, r4, #1
	mov	r6, r0
	beq	.L132
	ldr	r3, .L153
	movs	r2, #0
	ldr	r3, [r3]
	movs	r1, #5
	blx	r3
.L132:
	movw	r2, #41282
	ands	r2, r4, r2
	beq	.L133
	ldr	r3, .L153
	ldr	r3, [r3]
	movs	r1, #6
.L151:
	mov	r0, r6
	blx	r3
	movw	r3, #41286
	ands	r3, r3, r4
	orrs	r5, r5, r3
.L134:
	movw	r2, #48768
	ands	r2, r4, r2
	beq	.L135
	ldr	r3, .L153
	ldr	r3, [r3]
	movs	r1, #8
.L152:
	mov	r0, r6
	blx	r3
	movw	r3, #48776
	ands	r3, r3, r4
	orrs	r5, r5, r3
	orr	r5, r5, #48
.L136:
	ands	r4, r4, #65536
	beq	.L137
	ldr	r3, .L153
	movs	r2, #0
	ldr	r3, [r3]
	movs	r1, #10
	mov	r0, r6
	blx	r3
	orrs	r5, r5, r4
.L137:
	str	r5, [r6, #68]
	pop	{r4, r5, r6, pc}
.L135:
	lsls	r3, r4, #28
	bpl	.L136
	ldr	r3, .L153
	mov	r2, r4
	ldr	r3, [r3]
	movs	r1, #9
	b	.L152
.L133:
	lsls	r2, r4, #29
	bpl	.L134
	ldr	r3, .L153
	mov	r2, r4
	ldr	r3, [r3]
	movs	r1, #7
	b	.L151
.L154:
	.align	2
.L153:
	.word	.LANCHOR0
	.size	SDIO_Handler, .-SDIO_Handler
	.section	.bss.sdio_context,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sdio_context, %object
	.size	sdio_context, 320
sdio_context:
	.space	320
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

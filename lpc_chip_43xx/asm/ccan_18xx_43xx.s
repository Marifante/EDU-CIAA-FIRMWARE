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
	.file	"ccan_18xx_43xx.c"
	.text
	.section	.text.Chip_CCAN_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_Init, %function
Chip_CCAN_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L10
	movs	r3, #1
	push	{r4, lr}
	mov	r1, r3
	mov	r4, r0
	cmp	r0, r2
	ite	eq
	moveq	r0, #36
	movne	r0, #5
	movs	r2, #0
	bl	Chip_Clock_EnableOpts
	movs	r2, #1
	movs	r1, #160
.L4:
	ldr	r3, [r4, #52]
	bic	r3, r3, #32768
	str	r3, [r4, #52]
	str	r1, [r4, #36]
	str	r2, [r4, #32]
.L3:
	ldr	r3, [r4, #32]
	lsls	r3, r3, #16
	bmi	.L3
	adds	r2, r2, #1
	cmp	r2, #33
	bne	.L4
	ldr	r3, [r4, #4]
	and	r3, r3, #7
	str	r3, [r4, #4]
	pop	{r4, pc}
.L11:
	.align	2
.L10:
	.word	1074413568
	.size	Chip_CCAN_Init, .-Chip_CCAN_Init
	.section	.text.Chip_CCAN_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_DeInit, %function
Chip_CCAN_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	cmp	r0, r3
	ite	eq
	moveq	r0, #36
	movne	r0, #5
	b	Chip_Clock_Disable
.L16:
	.align	2
.L15:
	.word	1074413568
	.size	Chip_CCAN_DeInit, .-Chip_CCAN_DeInit
	.section	.text.Chip_CCAN_SetBitRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_SetBitRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_SetBitRate, %function
Chip_CCAN_SetBitRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r3, .L35
	mov	r5, r0
	cmp	r0, r3
	ite	eq
	moveq	r0, #36
	movne	r0, #5
	mov	r4, r1
	bl	Chip_Clock_GetRate
	movs	r7, #0
	udiv	r0, r0, r4
.L19:
	adds	r6, r7, #1
	mov	r4, r6
	movs	r1, #1
.L26:
	add	r2, r4, r4, lsl #1
	movs	r3, #3
.L24:
	cmp	r0, r2
	add	r2, r2, r4
	beq	.L32
	adds	r3, r3, #1
	cmp	r3, #18
	bne	.L24
	adds	r1, r1, #1
	cmp	r1, #33
	add	r4, r4, r6
	bne	.L26
	cmp	r6, #16
	bne	.L33
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L32:
	subs	r3, r3, #3
	lsrs	r0, r3, #1
	ldr	r6, [r5]
	cmp	r0, #3
	add	r2, r1, #-1
	mov	r4, r0
	it	cs
	movcs	r4, #3
	lsls	r1, r6, #31
	sub	r3, r3, r0
	bpl	.L34
.L21:
	str	r7, [r5, #384]
	ldr	r1, [r5]
	orr	r2, r2, r0, lsl #8
	lsls	r3, r3, #12
	orr	r2, r2, r4, lsl #6
	and	r3, r3, #28672
	orrs	r3, r3, r2
	orr	r2, r1, #64
	movs	r1, #0
	str	r2, [r5]
	str	r3, [r5, #12]
	str	r1, [r5, #24]
	ldr	r3, [r5]
	bic	r3, r3, #64
	str	r3, [r5]
	ldr	r3, [r5]
	bic	r3, r3, #1
	str	r3, [r5]
.L22:
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bmi	.L22
	movs	r0, #1
	pop	{r3, r4, r5, r6, r7, pc}
.L34:
	ldr	r1, [r5]
	orr	r1, r1, #1
	str	r1, [r5]
	b	.L21
.L33:
	mov	r7, r6
	b	.L19
.L36:
	.align	2
.L35:
	.word	1074413568
	.size	Chip_CCAN_SetBitRate, .-Chip_CCAN_SetBitRate
	.section	.text.Chip_CCAN_ClearStatus,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_ClearStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_ClearStatus, %function
Chip_CCAN_ClearStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	bic	r1, r3, r1
	and	r1, r1, #31
	str	r1, [r0, #4]
	bx	lr
	.size	Chip_CCAN_ClearStatus, .-Chip_CCAN_ClearStatus
	.section	.text.Chip_CCAN_SetMsgObject,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_SetMsgObject
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_SetMsgObject, %function
Chip_CCAN_SetMsgObject:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, [sp, #28]
	ldrb	r5, [sp, #24]	@ zero_extendqisi2
	cmp	r4, #0
	beq	.L38
	ldr	r6, [r4, #4]
	cmp	r2, #1
	and	r6, r6, #15
	orr	r6, r6, r3, lsl #9
	beq	.L49
	orr	ip, r6, #5248
.L42:
	lsls	r6, r1, #1
	adds	r3, r6, r1
	add	r3, r0, r3, lsl #5
	ldr	r7, [r4]
	ldrh	lr, [r4, #8]
	ldrh	r8, [r4, #10]
	str	ip, [r3, #56]
	ldrh	ip, [r4, #14]
	str	lr, [r3, #60]
	ldrh	lr, [r4, #12]
	str	r8, [r3, #64]
	lsls	r4, r2, #14
	str	lr, [r3, #68]
	lsls	r2, r2, #13
	str	ip, [r3, #72]
	ands	ip, r7, #1073741824
	and	r4, r4, #16384
	and	r2, r2, #8192
	beq	.L50
	orr	r2, r2, r7, lsr #16
	orr	r4, r4, #40704
	orr	r4, r4, #255
	orr	r2, r2, #49152
	uxth	r7, r7
	movw	ip, #65535
	str	r4, [r3, #44]
	str	ip, [r3, #40]
	str	r2, [r3, #52]
	str	r7, [r3, #48]
.L44:
	add	r1, r1, r6
	add	r0, r0, r1, lsl #5
	and	r5, r5, #63
	movs	r3, #243
	str	r3, [r0, #36]
	mov	r2, r0
	str	r5, [r0, #32]
.L45:
	ldr	r3, [r2, #32]
	lsls	r3, r3, #16
	bmi	.L45
.L38:
	pop	{r4, r5, r6, r7, r8, pc}
.L50:
	orr	r4, r4, #8160
	orr	r2, r2, r7, lsl #2
	orr	r4, r4, #28
	orr	r2, r2, #32768
	str	r4, [r3, #44]
	str	ip, [r3, #40]
	str	r2, [r3, #52]
	str	ip, [r3, #48]
	b	.L44
.L49:
	cbnz	r3, .L51
	orr	ip, r6, #6528
	b	.L42
.L51:
	orr	ip, r6, #6272
	b	.L42
	.size	Chip_CCAN_SetMsgObject, .-Chip_CCAN_SetMsgObject
	.section	.text.Chip_CCAN_GetMsgObject,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_GetMsgObject
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_GetMsgObject, %function
Chip_CCAN_GetMsgObject:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r3, #0
	beq	.L63
	add	r1, r1, r1, lsl #1
	push	{r4, r5, r6, r7}
	add	r5, r0, r1, lsl #5
	movs	r4, #123
	and	r2, r2, #63
	str	r4, [r5, #36]
	mov	r4, r5
	str	r2, [r5, #32]
.L55:
	ldr	r2, [r4, #32]
	lsls	r6, r2, #16
	bmi	.L55
	ldr	r2, [r4, #56]
	lsls	r5, r2, #16
	bpl	.L52
	ldr	r2, [r4, #48]
	ldr	r7, [r4, #52]
	ldr	r5, [r4, #56]
	ldr	ip, [r4, #64]
	ldr	r6, [r4, #60]
	add	r1, r0, r1, lsl #5
	orr	r6, r6, ip, lsl #16
	str	r6, [r3, #8]
	ldr	r0, [r4, #72]
	ldr	r1, [r1, #68]
	orr	r2, r2, r7, lsl #16
	orr	r1, r1, r0, lsl #16
	and	r5, r5, #15
	str	r1, [r3, #12]
	lsls	r1, r2, #1
	strd	r2, r5, [r3]
	ite	mi
	bicmi	r2, r2, #-536870912
	ubfxpl	r2, r2, #18, #11
	str	r2, [r3]
.L52:
	pop	{r4, r5, r6, r7}
	bx	lr
.L63:
	bx	lr
	.size	Chip_CCAN_GetMsgObject, .-Chip_CCAN_GetMsgObject
	.section	.text.Chip_CCAN_TransferMsgObject,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_TransferMsgObject
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_TransferMsgObject, %function
Chip_CCAN_TransferMsgObject:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r1, r1, lsl #1
	add	r0, r0, r1, lsl #5
	and	r3, r3, #63
	str	r2, [r0, #36]
	mov	r2, r0
	str	r3, [r0, #32]
.L67:
	ldr	r3, [r2, #32]
	lsls	r3, r3, #16
	bmi	.L67
	bx	lr
	.size	Chip_CCAN_TransferMsgObject, .-Chip_CCAN_TransferMsgObject
	.section	.text.Chip_CCAN_SetValidMsg,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_SetValidMsg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_SetValidMsg, %function
Chip_CCAN_SetValidMsg:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	lsls	r4, r1, #1
	adds	r5, r4, r1
	add	r5, r0, r5, lsl #5
	ldr	r6, [r5, #52]
	cbnz	r3, .L70
	bic	r6, r6, #32768
	str	r6, [r5, #52]
.L71:
	add	r4, r4, r1
	add	r0, r0, r4, lsl #5
	and	r2, r2, #63
	movs	r3, #160
	str	r3, [r0, #36]
	mov	r1, r0
	str	r2, [r0, #32]
.L72:
	ldr	r3, [r1, #32]
	lsls	r3, r3, #16
	bmi	.L72
	pop	{r4, r5, r6}
	bx	lr
.L70:
	orr	r6, r6, #32768
	str	r6, [r5, #52]
	b	.L71
	.size	Chip_CCAN_SetValidMsg, .-Chip_CCAN_SetValidMsg
	.section	.text.Chip_CCAN_Send,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_Send
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_Send, %function
Chip_CCAN_Send:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, [r0, #352]
	ldr	r5, [r0, #356]
	sub	sp, sp, #8
	orr	r7, r7, r5, lsl #16
	movs	r4, #0
	b	.L78
.L76:
	cmp	r4, #32
	beq	.L75
.L78:
	lsr	r6, r7, r4
	adds	r5, r4, #1
	lsls	r6, r6, #31
	mov	r4, r5
	uxtb	r5, r5
	bmi	.L76
	strd	r5, r3, [sp]
	mov	r8, r2
	mov	r3, r2
	movs	r2, #1
	mov	r7, r1
	mov	r4, r0
	bl	Chip_CCAN_SetMsgObject
	subs	r6, r5, #1
.L77:
	ldr	r3, [r4, #256]
	ldr	r0, [r4, #260]
	orr	r3, r3, r0, lsl #16
	lsrs	r3, r3, r6
	bne	.L77
	cmp	r8, #0
	bne	.L75
	add	r7, r7, r7, lsl #1
	add	r4, r4, r7, lsl #5
	movs	r1, #160
	ldr	r3, [r4, #52]
	bic	r3, r3, #32768
	str	r3, [r4, #52]
	mov	r2, r4
	str	r1, [r4, #36]
	str	r5, [r4, #32]
.L80:
	ldr	r3, [r2, #32]
	lsls	r3, r3, #16
	bmi	.L80
.L75:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
	.size	Chip_CCAN_Send, .-Chip_CCAN_Send
	.section	.text.Chip_CCAN_AddReceiveID,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_AddReceiveID
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_AddReceiveID, %function
Chip_CCAN_AddReceiveID:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, [r0, #352]
	ldr	r3, [r0, #356]
	sub	sp, sp, #24
	orr	r6, r6, r3, lsl #16
	movs	r5, #0
	b	.L88
.L86:
	cmp	r5, #32
	beq	.L85
.L88:
	lsr	r3, r6, r5
	adds	r4, r5, #1
	ands	r3, r3, #1
	mov	r5, r4
	uxtb	r4, r4
	bne	.L86
	mov	r5, r2
	add	r2, sp, #8
	strd	r4, r2, [sp]
	mov	r2, r3
	str	r5, [sp, #8]
	bl	Chip_CCAN_SetMsgObject
.L85:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
	.size	Chip_CCAN_AddReceiveID, .-Chip_CCAN_AddReceiveID
	.section	.text.Chip_CCAN_DeleteReceiveID,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_CCAN_DeleteReceiveID
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_CCAN_DeleteReceiveID, %function
Chip_CCAN_DeleteReceiveID:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	add	r8, r1, r1, lsl #1
	sub	sp, sp, #16
	mov	r6, r1
	mov	r5, r0
	mov	r7, r2
	lsl	r8, r8, #5
	movs	r4, #1
	b	.L95
.L93:
	adds	r4, r4, #1
	cmp	r4, #33
	beq	.L99
.L95:
	mov	r3, sp
	uxtb	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	Chip_CCAN_GetMsgObject
	ldr	r3, [sp]
	cmp	r3, r7
	bne	.L93
	add	r3, r5, r8
	movs	r1, #160
	ldr	r2, [r3, #52]
	bic	r2, r2, #32768
	str	r2, [r3, #52]
	str	r1, [r3, #36]
	mov	r2, r3
	str	r4, [r3, #32]
.L94:
	ldr	r3, [r2, #32]
	lsls	r3, r3, #16
	bmi	.L94
	adds	r4, r4, #1
	cmp	r4, #33
	bne	.L95
.L99:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
	.size	Chip_CCAN_DeleteReceiveID, .-Chip_CCAN_DeleteReceiveID
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

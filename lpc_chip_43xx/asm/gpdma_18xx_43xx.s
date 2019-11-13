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
	.file	"gpdma_18xx_43xx.c"
	.text
	.section	.text.makeCtrlWord,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	makeCtrlWord
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	makeCtrlWord, %function
makeCtrlWord:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	ldr	r4, [r0, #20]
	cmp	r4, #7
	bhi	.L8
	tbb	[pc, r4]
.L4:
	.byte	(.L7-.L4)/2
	.byte	(.L6-.L4)/2
	.byte	(.L5-.L4)/2
	.byte	(.L3-.L4)/2
	.byte	(.L3-.L4)/2
	.byte	(.L6-.L4)/2
	.byte	(.L5-.L4)/2
	.byte	(.L3-.L4)/2
	.p2align 1
.L3:
	ldr	r0, [r0, #4]
	lsls	r3, r3, #18
	and	r3, r3, #1835008
	ubfx	r0, r0, #0, #12
	orrs	r0, r0, r3
	ldr	r3, [sp, #4]
	lsls	r1, r1, #12
	and	r1, r1, #28672
	lsls	r3, r3, #21
	orrs	r0, r0, r1
	lsls	r2, r2, #15
	and	r3, r3, #14680064
	and	r2, r2, #229376
	orrs	r0, r0, r3
	orrs	r0, r0, r2
	orr	r0, r0, #-2097152000
.L1:
	ldr	r4, [sp], #4
	bx	lr
.L5:
	ldr	r4, [r0, #4]
	lsls	r2, r3, #18
	lsls	r3, r3, #21
	and	r2, r2, #1835008
	and	r3, r3, #14680064
	ubfx	r4, r4, #0, #12
	lsls	r0, r1, #12
	orrs	r2, r2, r3
	orrs	r2, r2, r4
	and	r0, r0, #28672
	lsls	r1, r1, #15
	orrs	r0, r0, r2
	and	r2, r1, #229376
	orrs	r0, r0, r2
	orr	r0, r0, #-1996488704
	ldr	r4, [sp], #4
	bx	lr
.L6:
	ldr	r1, [r0, #4]
	ldr	r3, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r4, [sp], #4
	lsls	r3, r3, #18
	lsls	r0, r0, #21
	and	r0, r0, #14680064
	and	r3, r3, #1835008
	orrs	r3, r3, r0
	ubfx	r1, r1, #0, #12
	lsls	r0, r2, #12
	orrs	r3, r3, r1
	and	r0, r0, #28672
	lsls	r2, r2, #15
	orrs	r0, r0, r3
	and	r3, r2, #229376
	orrs	r0, r0, r3
	orr	r0, r0, #-2046820352
	bx	lr
.L7:
	ldrd	r2, r3, [r0, #4]
	lsls	r0, r3, #18
	lsls	r3, r3, #21
	and	r0, r0, #1835008
	and	r3, r3, #14680064
	ubfx	r2, r2, #0, #12
	orrs	r0, r0, r3
	orrs	r0, r0, r2
	orr	r0, r0, #-1946157056
	orr	r0, r0, #147456
	ldr	r4, [sp], #4
	bx	lr
.L8:
	movs	r0, #0
	b	.L1
	.size	makeCtrlWord, .-makeCtrlWord
	.section	.text.setupChannel,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	setupChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setupChannel, %function
setupChannel:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, [r1]
	ldr	r4, [r0, #28]
	ldrb	r7, [sp, #20]	@ zero_extendqisi2
	ldrb	ip, [sp, #24]	@ zero_extendqisi2
	mov	lr, #1
	lsl	r6, lr, r5
	ands	r4, r4, r6
	tst	r4, #255
	bne	.L14
	lsls	r5, r5, #5
	adds	r4, r0, r5
	uxtb	r6, r6
	str	r6, [r0, #8]
	str	r6, [r0, #16]
	str	r3, [r4, #264]
	str	lr, [r0, #48]
.L13:
	ldr	r4, [r0, #48]
	lsls	r3, r4, #31
	bpl	.L13
	ldr	r4, [r1, #20]
	lsl	ip, ip, #6
	lsls	r4, r4, #11
	and	ip, ip, #1984
	lsls	r7, r7, #1
	and	r4, r4, #14336
	adds	r3, r0, r5
	and	r7, r7, #62
	ldrd	r0, r1, [r1, #12]
	orr	r4, r4, ip
	orrs	r4, r4, r7
	orr	r4, r4, #49152
	str	r0, [r3, #256]
	str	r1, [r3, #260]
	movs	r0, #1
	str	r4, [r3, #272]
	str	r2, [r3, #268]
	pop	{r4, r5, r6, r7, pc}
.L14:
	movs	r0, #0
	pop	{r4, r5, r6, r7, pc}
	.size	setupChannel, .-setupChannel
	.section	.text.Chip_GPDMA_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_Init, %function
Chip_GPDMA_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r3, #1
	mov	r4, r0
	mov	r2, r3
	mov	r1, r3
	movs	r0, #104
	bl	Chip_Clock_EnableOpts
	ldr	r1, .L20
	movs	r3, #0
	movs	r2, #255
	str	r3, [r4, #496]
	str	r3, [r1]
	str	r3, [r4, #464]
	str	r3, [r1, #4]
	str	r3, [r4, #432]
	str	r3, [r4, #400]
	str	r3, [r4, #368]
	str	r3, [r4, #336]
	str	r3, [r4, #304]
	str	r3, [r4, #272]
	str	r2, [r4, #8]
	str	r2, [r4, #16]
	pop	{r4, pc}
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	Chip_GPDMA_Init, .-Chip_GPDMA_Init
	.section	.text.Chip_GPDMA_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_DeInit, %function
Chip_GPDMA_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #104
	b	Chip_Clock_Disable
	.size	Chip_GPDMA_DeInit, .-Chip_GPDMA_DeInit
	.section	.text.Chip_GPDMA_Stop,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_Stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_Stop, %function
Chip_GPDMA_Stop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	add	r4, r0, r1, lsl #5
	movs	r3, #1
	ldr	r2, [r4, #272]
	bic	r2, r2, #1
	str	r2, [r4, #272]
	ldr	r2, [r0, #4]
	ldr	r4, [sp], #4
	lsls	r3, r3, r1
	uxtb	r3, r3
	tst	r3, r2
	it	ne
	strne	r3, [r0, #8]
	ldr	r2, [r0, #12]
	tst	r3, r2
	it	ne
	strne	r3, [r0, #16]
	ldr	r3, .L33
	movs	r2, #0
	strb	r2, [r3, r1]
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	Chip_GPDMA_Stop, .-Chip_GPDMA_Stop
	.section	.text.Chip_GPDMA_Interrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_Interrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_Interrupt, %function
Chip_GPDMA_Interrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #1
	lsl	r1, r2, r1
	ldr	r3, [r0]
	uxtb	r1, r1
	ands	r3, r1, r3
	beq	.L45
	push	{r4}
	ldr	r4, [r0, #4]
	ands	r4, r1, r4
	bne	.L48
	ldr	r3, [r0, #12]
	ands	r3, r1, r3
	itt	ne
	movne	r3, r4
	strne	r1, [r0, #16]
	ldr	r4, [sp], #4
	mov	r0, r3
	bx	lr
.L45:
	mov	r0, r3
	bx	lr
.L48:
	mov	r3, r2
	str	r1, [r0, #8]
	ldr	r4, [sp], #4
	mov	r0, r3
	bx	lr
	.size	Chip_GPDMA_Interrupt, .-Chip_GPDMA_Interrupt
	.section	.text.Chip_GPDMA_InitChannelCfg,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_InitChannelCfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_InitChannelCfg, %function
Chip_GPDMA_InitChannelCfg:
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	ldrb	r0, [sp, #12]	@ zero_extendqisi2
	ldr	r4, [sp, #8]
	str	r2, [r1]
	str	r0, [r1, #20]
	str	r4, [r1, #4]
	cmp	r0, #7
	bhi	.L56
	tbb	[pc, r0]
.L52:
	.byte	(.L55-.L52)/2
	.byte	(.L54-.L52)/2
	.byte	(.L53-.L52)/2
	.byte	(.L51-.L52)/2
	.byte	(.L51-.L52)/2
	.byte	(.L54-.L52)/2
	.byte	(.L53-.L52)/2
	.byte	(.L51-.L52)/2
	.p2align 1
.L51:
	ldr	r2, .L58
	ldr	r0, [r2, r3, lsl #2]
	ldr	r3, [sp, #4]
	ldr	r3, [r2, r3, lsl #2]
	strd	r0, r3, [r1, #12]
	movs	r0, #0
.L49:
	ldr	r4, [sp], #4
	bx	lr
.L53:
	ldr	r2, .L58
	ldr	r0, [sp, #4]
	ldr	r3, [r2, r3, lsl #2]
	str	r0, [r1, #16]
	str	r3, [r1, #12]
	movs	r0, #2
	ldr	r4, [sp], #4
	bx	lr
.L54:
	ldr	r2, .L58
	str	r3, [r1, #12]
	ldr	r3, [sp, #4]
	ldr	r4, [sp], #4
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [r1, #16]
	movs	r0, #1
	bx	lr
.L55:
	lsrs	r4, r4, #2
	movs	r2, #2
	str	r3, [r1, #12]
	ldr	r3, [sp, #4]
	str	r4, [r1, #4]
	movs	r0, #3
	str	r3, [r1, #16]
	str	r2, [r1, #8]
	ldr	r4, [sp], #4
	bx	lr
.L56:
	mov	r0, #-1
	b	.L49
.L59:
	.align	2
.L58:
	.word	.LANCHOR1
	.size	Chip_GPDMA_InitChannelCfg, .-Chip_GPDMA_InitChannelCfg
	.section	.text.Chip_GPDMA_IntGetStatus,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_IntGetStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_IntGetStatus, %function
Chip_GPDMA_IntGetStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	lsl	r2, r3, r2
	uxtb	r2, r2
	cmp	r1, #4
	bhi	.L61
	tbb	[pc, r1]
.L63:
	.byte	(.L67-.L63)/2
	.byte	(.L66-.L63)/2
	.byte	(.L65-.L63)/2
	.byte	(.L64-.L63)/2
	.byte	(.L62-.L63)/2
	.p2align 1
.L62:
	ldr	r0, [r0, #24]
	ands	r0, r0, r2
	bx	lr
.L67:
	ldr	r0, [r0]
	ands	r0, r0, r2
	bx	lr
.L66:
	ldr	r0, [r0, #4]
	ands	r0, r0, r2
	bx	lr
.L65:
	ldr	r0, [r0, #12]
	ands	r0, r0, r2
	bx	lr
.L64:
	ldr	r0, [r0, #20]
	ands	r0, r0, r2
	bx	lr
.L61:
	ldr	r0, [r0, #28]
	ands	r0, r0, r2
	bx	lr
	.size	Chip_GPDMA_IntGetStatus, .-Chip_GPDMA_IntGetStatus
	.section	.text.Chip_GPDMA_ClearIntPending,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_ClearIntPending
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_ClearIntPending, %function
Chip_GPDMA_ClearIntPending:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	lsl	r2, r3, r2
	uxtb	r2, r2
	cbnz	r1, .L70
	str	r2, [r0, #8]
	bx	lr
.L70:
	str	r2, [r0, #16]
	bx	lr
	.size	Chip_GPDMA_ClearIntPending, .-Chip_GPDMA_ClearIntPending
	.section	.text.Chip_GPDMA_ChannelCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_ChannelCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_ChannelCmd, %function
Chip_GPDMA_ChannelCmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r1, lsl #5
	cmp	r2, #1
	ldr	r3, [r0, #272]
	ite	eq
	orreq	r3, r3, #1
	bicne	r3, r3, #1
	str	r3, [r0, #272]
	bx	lr
	.size	Chip_GPDMA_ChannelCmd, .-Chip_GPDMA_ChannelCmd
	.section	.text.Chip_GPDMA_Transfer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_Transfer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_Transfer, %function
Chip_GPDMA_Transfer:
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	sub	sp, sp, #40
	mov	r7, r1
	ldrb	r4, [sp, #72]	@ zero_extendqisi2
	ldr	r1, [sp, #76]
	str	r3, [sp]
	strd	r1, r4, [sp, #4]
	mov	r6, r2
	mov	r5, r3
	add	r1, sp, #16
	mov	r3, r2
	mov	r2, r7
	mov	r4, r0
	bl	Chip_GPDMA_InitChannelCfg
	cmp	r0, #0
	blt	.L84
	lsls	r1, r0, #31
	bpl	.L93
	movs	r3, #2
	movs	r1, #1
	mov	r8, #0
.L78:
	lsls	r2, r0, #30
	bmi	.L87
.L98:
	subs	r2, r5, #1
	cmp	r2, #28
	bls	.L94
	cmp	r5, #0
	bne	.L95
	movs	r0, #2
	movs	r2, #1
	movs	r6, #15
	b	.L81
.L84:
	movs	r0, #0
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L93:
	subs	r2, r6, #1
	cmp	r2, #28
	bls	.L96
	cmp	r6, #0
	bne	.L97
	lsls	r2, r0, #30
	mov	r3, #2
	mov	r1, #1
	mov	r8, #15
	bpl	.L98
.L87:
	movs	r0, #2
	movs	r2, #1
	movs	r6, #0
.L81:
	str	r0, [sp]
	add	r0, sp, #16
	bl	makeCtrlWord
	str	r6, [sp, #4]
	mov	r2, r0
	str	r8, [sp]
	add	r1, sp, #16
	movs	r3, #0
	mov	r0, r4
	bl	setupChannel
	cmp	r0, #0
	beq	.L84
	add	r4, r4, r7, lsl #5
	movs	r0, #1
	ldr	r3, [r4, #272]
	orrs	r3, r3, r0
	str	r3, [r4, #272]
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L94:
	ldr	r6, .L99
	ldr	r0, .L99+4
	ldrb	ip, [r6, r2]	@ zero_extendqisi2
	ldrb	r6, [r0, r2]	@ zero_extendqisi2
.L83:
	ldr	lr, .L99+16
	ldr	r2, .L99+8
	ldr	r0, [lr, #284]
	ldrb	r2, [r2, r5]	@ zero_extendqisi2
	lsl	r10, r6, #1
	mov	r9, #3
	lsl	r9, r9, r10
	bic	r0, r0, r9
	lsl	ip, ip, r10
	ldr	r9, .L99+12
	orr	r0, r0, ip
	str	r0, [lr, #284]
	ldrb	r0, [r9, r5]	@ zero_extendqisi2
	b	.L81
.L96:
	ldr	r1, .L99
	ldr	r3, .L99+4
	ldrb	ip, [r1, r2]	@ zero_extendqisi2
	ldrb	r8, [r3, r2]	@ zero_extendqisi2
.L80:
	ldr	lr, .L99+16
	ldr	r2, .L99+8
	ldr	r3, [lr, #284]
	ldrb	r1, [r2, r6]	@ zero_extendqisi2
	lsl	r9, r8, #1
	movs	r2, #3
	lsl	r2, r2, r9
	bic	r3, r3, r2
	lsl	ip, ip, r9
	ldr	r2, .L99+12
	orr	r3, r3, ip
	str	r3, [lr, #284]
	ldrb	r3, [r2, r6]	@ zero_extendqisi2
	b	.L78
.L95:
	mov	ip, #3
	movs	r6, #15
	b	.L83
.L97:
	mov	ip, #3
	mov	r8, #15
	b	.L80
.L100:
	.align	2
.L99:
	.word	.LANCHOR2
	.word	.LANCHOR3
	.word	.LANCHOR4
	.word	.LANCHOR5
	.word	1074016256
	.size	Chip_GPDMA_Transfer, .-Chip_GPDMA_Transfer
	.section	.text.Chip_GPDMA_PrepareDescriptor,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_PrepareDescriptor
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_PrepareDescriptor, %function
Chip_GPDMA_PrepareDescriptor:
	@ args = 12, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #44
	mov	r6, r2
	ldr	r7, [sp, #64]
	ldrb	r2, [sp, #68]	@ zero_extendqisi2
	str	r3, [sp]
	strd	r7, r2, [sp, #4]
	mov	r5, r3
	mov	r4, r1
	mov	r3, r6
	add	r1, sp, #16
	movs	r2, #0
	ldr	r7, [sp, #72]
	bl	Chip_GPDMA_InitChannelCfg
	cmp	r0, #0
	blt	.L106
	lsls	r1, r0, #31
	bmi	.L107
	ldr	r2, .L112
	ldr	r3, .L112+4
	ldrb	r1, [r2, r6]	@ zero_extendqisi2
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	lsls	r2, r0, #30
	bmi	.L108
.L111:
	ldr	r2, .L112
	ldr	r0, .L112+4
	ldrb	r2, [r2, r5]	@ zero_extendqisi2
	ldrb	r5, [r0, r5]	@ zero_extendqisi2
.L104:
	ldr	r0, [sp, #28]
	str	r7, [r4, #8]
	str	r5, [sp]
	ldr	r5, [sp, #32]
	str	r0, [r4]
	str	r5, [r4, #4]
	add	r0, sp, #16
	bl	makeCtrlWord
	cbz	r7, .L110
	bic	r0, r0, #-2147483648
.L110:
	str	r0, [r4, #12]
	movs	r0, #1
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L107:
	lsls	r2, r0, #30
	mov	r3, #2
	mov	r1, #1
	bpl	.L111
.L108:
	movs	r5, #2
	movs	r2, #1
	b	.L104
.L106:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L113:
	.align	2
.L112:
	.word	.LANCHOR4
	.word	.LANCHOR5
	.size	Chip_GPDMA_PrepareDescriptor, .-Chip_GPDMA_PrepareDescriptor
	.section	.text.Chip_GPDMA_SGTransfer,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_SGTransfer
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_SGTransfer, %function
Chip_GPDMA_SGTransfer:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldrd	r5, r8, [r2]
	sub	sp, sp, #44
	movs	r6, #0
	str	r3, [sp, #8]
	mov	r4, r2
	mov	r9, r1
	mov	r2, r1
	mov	r3, r5
	str	r8, [sp]
	add	r1, sp, #16
	str	r6, [sp, #4]
	mov	r7, r0
	bl	Chip_GPDMA_InitChannelCfg
	cmp	r0, #0
	blt	.L123
	lsls	r2, r0, #31
	bpl	.L132
.L117:
	lsls	r3, r0, #30
	bpl	.L133
.L126:
	movs	r3, #0
.L120:
	strd	r6, r3, [sp]
	add	r1, sp, #16
	ldrd	r3, r2, [r4, #8]
	mov	r0, r7
	bl	setupChannel
	cbz	r0, .L123
	add	r1, r7, r9, lsl #5
	movs	r0, #1
	ldr	r3, [r1, #272]
	orrs	r3, r3, r0
	str	r3, [r1, #272]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L123:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L133:
	add	r3, r8, #-1
	cmp	r3, #28
	bhi	.L121
	ldr	r1, .L134
	ldr	r2, .L134+4
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
.L122:
	ldr	r5, .L134+8
	lsl	ip, r3, #1
	ldr	r2, [r5, #284]
	movs	r0, #3
	lsl	r0, r0, ip
	lsl	r1, r1, ip
	bic	r2, r2, r0
	orrs	r2, r2, r1
	str	r2, [r5, #284]
	b	.L120
.L132:
	subs	r2, r5, #1
	cmp	r2, #28
	bhi	.L118
	ldr	r1, .L134
	ldr	r3, .L134+4
	ldrb	r1, [r1, r2]	@ zero_extendqisi2
	ldrb	r6, [r3, r2]	@ zero_extendqisi2
.L119:
	ldr	r5, .L134+8
	lsl	ip, r6, #1
	ldr	r3, [r5, #284]
	movs	r2, #3
	lsl	r2, r2, ip
	lsl	r1, r1, ip
	bic	r3, r3, r2
	orrs	r3, r3, r1
	str	r3, [r5, #284]
	lsls	r3, r0, #30
	bmi	.L126
	b	.L133
.L118:
	movs	r6, #15
	cmp	r5, #0
	beq	.L117
	movs	r1, #3
	movs	r6, #15
	b	.L119
.L121:
	movs	r3, #15
	cmp	r8, #0
	beq	.L120
	movs	r1, #3
	movs	r3, #15
	b	.L122
.L135:
	.align	2
.L134:
	.word	.LANCHOR2
	.word	.LANCHOR3
	.word	1074016256
	.size	Chip_GPDMA_SGTransfer, .-Chip_GPDMA_SGTransfer
	.section	.text.Chip_GPDMA_GetFreeChannel,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_GPDMA_GetFreeChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_GPDMA_GetFreeChannel, %function
Chip_GPDMA_GetFreeChannel:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	ldr	r5, .L143
	movs	r3, #0
	movs	r4, #1
.L139:
	ldr	r1, [r0, #28]
	lsl	r2, r4, r3
	ands	r2, r2, r1
	tst	r2, #255
	uxtb	r1, r3
	bne	.L137
	ldrb	r2, [r3, r5]	@ zero_extendqisi2
	cbz	r2, .L142
.L137:
	adds	r3, r3, #1
	cmp	r3, #8
	bne	.L139
	movs	r1, #0
	mov	r0, r1
	pop	{r4, r5}
	bx	lr
.L142:
	strb	r4, [r5, r3]
	mov	r0, r1
	pop	{r4, r5}
	bx	lr
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.size	Chip_GPDMA_GetFreeChannel, .-Chip_GPDMA_GetFreeChannel
	.section	.bss.ChannelHandlerArray,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ChannelHandlerArray, %object
	.size	ChannelHandlerArray, 8
ChannelHandlerArray:
	.space	8
	.section	.rodata.CSWTCH.4,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	CSWTCH.4, %object
	.size	CSWTCH.4, 29
CSWTCH.4:
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.section	.rodata.CSWTCH.5,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	CSWTCH.5, %object
	.size	CSWTCH.5, 29
CSWTCH.5:
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	3
	.byte	4
	.section	.rodata.GPDMA_LUTPerAddr,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	GPDMA_LUTPerAddr, %object
	.size	GPDMA_LUTPerAddr, 120
GPDMA_LUTPerAddr:
	.word	0
	.word	1074282520
	.word	1074270208
	.word	1074282524
	.word	1074270208
	.word	1074286616
	.word	1074274304
	.word	1074286620
	.word	1074274304
	.word	1074540568
	.word	1074532352
	.word	1074540572
	.word	1074532352
	.word	1074544664
	.word	1074536448
	.word	0
	.word	1074544668
	.word	1074536448
	.word	0
	.word	1074278408
	.word	1074405384
	.word	1074278408
	.word	1074405388
	.word	1074548744
	.word	1074548744
	.word	1074671620
	.word	1074675716
	.word	1074663424
	.word	1074409480
	.word	1074409484
	.section	.rodata.GPDMA_LUTPerBurst,"a"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	GPDMA_LUTPerBurst, %object
	.size	GPDMA_LUTPerBurst, 30
GPDMA_LUTPerBurst:
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	4
	.byte	1
	.byte	4
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	4
	.byte	4
	.section	.rodata.GPDMA_LUTPerWid,"a"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	GPDMA_LUTPerWid, %object
	.size	GPDMA_LUTPerWid, 30
GPDMA_LUTPerWid:
	.byte	2
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

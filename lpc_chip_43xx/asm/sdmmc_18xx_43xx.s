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
	.file	"sdmmc_18xx_43xx.c"
	.text
	.section	.text.sdmmc_execute_command,"ax",%progbits
	.align	1
	.p2align 2,,3
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sdmmc_execute_command, %function
sdmmc_execute_command:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	tst	r1, #8388608
	mov	r6, r1
	mov	r8, r0
	str	r2, [sp]
	str	r3, [sp, #12]
	ite	ne
	movne	r7, #2
	moveq	r7, #1
	cbnz	r3, .L3
	tst	r1, #805306368
	ite	ne
	movne	r3, #4
	moveq	r3, #8
	str	r3, [sp, #12]
.L3:
	ands	r4, r6, #524288
	bne	.L37
.L5:
	ldr	r3, [sp, #12]
	lsls	r2, r3, #28
	itete	pl
	orrpl	r3, r3, #45312
	orrmi	r3, r3, #48896
	orrpl	r3, r3, #66
	orrmi	r3, r3, #194
	lsrs	r5, r6, #7
	cmp	r4, #0
	and	r5, r5, #32768
	ite	ne
	movne	r9, #8704
	moveq	r9, #0
	orr	r9, r9, r5
	str	r3, [sp, #12]
	uxtb	fp, r6
	lsrs	r2, r6, #8
	lsrs	r3, r6, #12
	orr	r9, r9, fp
	and	r2, r2, #1024
	and	r3, r3, #4096
	orr	r5, r5, #-2147483648
	orr	r1, r9, #128
	orrs	r3, r3, r2
	ldr	r4, .L41
	str	r1, [sp, #8]
	orr	r5, r5, #119
	str	r3, [sp, #4]
	mov	r10, #-1
.L17:
	movs	r0, #13
	bl	Chip_Clock_GetBaseClocktHz
	ldr	r3, [r4]
	mov	r1, r0
	ldr	r2, [r3, #840]
	mov	r0, r8
	bl	Chip_SDIF_SetClock
	ldr	r3, [r4]
	str	r10, [r8, #68]
	ldr	r3, [r3, #864]
	add	r0, sp, #12
	blx	r3
	cmp	r7, #2
	bne	.L38
	ldr	r3, [r4]
	ldrh	r2, [r3, #836]
	mov	r1, r5
	lsls	r2, r2, #16
	mov	r0, r8
	bl	Chip_SDIF_SendCmd
	cmp	r0, #0
	it	eq
	moveq	r7, #1
.L13:
	ldr	r3, [r4]
	ldr	r3, [r3, #868]
	blx	r3
	movw	r3, #49090
	tst	r0, r3
	bne	.L21
	lsls	r3, r0, #29
	bpl	.L15
	and	r3, r6, #805306368
	cmp	r3, #536870912
	beq	.L16
	cmp	r3, #805306368
	beq	.L16
	cmp	r3, #268435456
	beq	.L16
.L15:
	cmp	r7, #0
	bne	.L17
.L1:
	mov	r0, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L38:
	and	r3, r6, #805306368
	cmp	r3, #536870912
	beq	.L39
	cbnz	r3, .L40
	ldr	r1, [sp, #4]
	mov	r3, r9
.L10:
	orrs	r1, r1, r3
	cmp	fp, #7
	orr	r1, r1, #-2147483648
	it	eq
	orreq	r1, r1, #8192
	ldr	r2, [sp]
	mov	r0, r8
	bl	Chip_SDIF_SendCmd
	adds	r7, r0, #0
	it	ne
	movne	r7, #1
	b	.L13
.L16:
	ldr	r1, [r4]
	mov	r0, r8
	add	r1, r1, #272
	bl	Chip_SDIF_GetResponse
	cmp	r7, #0
	bne	.L17
	b	.L1
.L37:
	mov	r0, r8
	bl	Chip_SDIF_SetClearIntFifo
	b	.L5
.L39:
	ldr	r3, [sp, #4]
	orr	r1, r3, #64
	ldr	r3, [sp, #8]
	b	.L10
.L40:
	ldr	r3, [sp, #4]
	orr	r1, r3, #64
	mov	r3, r9
	b	.L10
.L21:
	mov	r7, r0
	b	.L1
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	sdmmc_execute_command, .-sdmmc_execute_command
	.section	.text.prv_set_trans_state,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	prv_set_trans_state, %function
prv_set_trans_state:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r4, .L49
	ldr	r1, .L49+4
	ldr	r3, [r4]
	ldrh	r2, [r3, #836]
	movs	r3, #0
	lsls	r2, r2, #16
	mov	r5, r0
	bl	sdmmc_execute_command
	ands	r3, r0, #256
	bne	.L46
	ldr	r1, [r4]
	ldr	r2, [r1, #272]
	ubfx	r2, r2, #9, #4
	cmp	r2, #3
	beq	.L45
	cmp	r2, #4
	ite	eq
	moveq	r0, #0
	movne	r0, #-1
	pop	{r3, r4, r5, pc}
.L45:
	ldrh	r2, [r1, #836]
	ldr	r1, .L49+8
	lsls	r2, r2, #16
	mov	r0, r5
	bl	sdmmc_execute_command
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	rsbs	r0, r0, #0
	pop	{r3, r4, r5, pc}
.L46:
	mov	r0, #-1
	pop	{r3, r4, r5, pc}
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	268435469
	.word	268435463
	.size	prv_set_trans_state, .-prv_set_trans_state
	.section	.text.Chip_SDMMC_GetState,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDMMC_GetState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDMMC_GetState, %function
Chip_SDMMC_GetState:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L55
	ldr	r1, .L55+4
	ldr	r3, [r4]
	ldrh	r2, [r3, #836]
	movs	r3, #0
	lsls	r2, r2, #16
	bl	sdmmc_execute_command
	lsls	r3, r0, #23
	ittet	pl
	ldrpl	r3, [r4]
	ldrpl	r0, [r3, #272]
	movmi	r0, #-1
	ubfxpl	r0, r0, #9, #4
	pop	{r4, pc}
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.word	268435469
	.size	Chip_SDMMC_GetState, .-Chip_SDMMC_GetState
	.section	.text.Chip_SDMMC_Acquire,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDMMC_Acquire
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDMMC_Acquire, %function
Chip_SDMMC_Acquire:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movs	r7, #0
	ldr	r4, .L126
	ldr	r6, .L126+4
	str	r7, [r0, #24]
	mov	r5, r1
	str	r4, [r1, #840]
	mov	r2, r7
	movs	r3, #4
	mov	r1, #5242880
	str	r5, [r6]
	mov	r8, r0
	bl	sdmmc_execute_command
	ldr	r5, .L126+8
	ldr	fp, .L126+48
	mov	r10, r4
	mov	r9, r7
	mov	r4, r7
.L84:
	cmp	r9, #17
	bhi	.L58
	tbh	[pc, r9, lsl #1]
.L60:
	.2byte	(.L70-.L60)/2
	.2byte	(.L66-.L60)/2
	.2byte	(.L65-.L60)/2
	.2byte	(.L64-.L60)/2
	.2byte	(.L69-.L60)/2
	.2byte	(.L62-.L60)/2
	.2byte	(.L68-.L60)/2
	.2byte	(.L59-.L60)/2
	.2byte	(.L58-.L60)/2
	.2byte	(.L58-.L60)/2
	.2byte	(.L67-.L60)/2
	.2byte	(.L66-.L60)/2
	.2byte	(.L65-.L60)/2
	.2byte	(.L64-.L60)/2
	.2byte	(.L63-.L60)/2
	.2byte	(.L62-.L60)/2
	.2byte	(.L61-.L60)/2
	.2byte	(.L59-.L60)/2
	.p2align 1
.L63:
	orr	r5, r5, #1073741824
.L69:
	bic	r5, r5, #-1090519040
	bic	r5, r5, #32640
	ldr	r3, [r6]
	bic	r5, r5, #127
	mov	r4, #1000
	b	.L81
.L121:
	subs	r4, r4, #1
	beq	.L120
.L81:
	ldr	r3, [r3, #872]
	movs	r0, #10
	blx	r3
	movs	r3, #0
	mov	r2, r5
	mov	r1, r7
	mov	r0, r8
	bl	sdmmc_execute_command
	ldr	r3, [r6]
	ldr	r2, [r3, #272]
	cmp	r2, #0
	bge	.L121
	ldr	r1, [r3, #832]
	and	r2, r2, #1073741824
	orrs	r2, r2, r1
	add	r9, r9, #1
	str	r2, [r3, #832]
.L99:
	cmp	r9, #99
	ble	.L84
.L58:
	ldr	r3, [r6]
	ldr	r0, [r3, #288]
	cmp	r0, #0
	beq	.L85
.L124:
	ldr	r5, [r3, #312]
	ldr	r4, [r3, #832]
	ldr	r1, .L126+12
	ldr	r2, [r3, #308]
	ubfx	r0, r5, #16, #4
	movs	r7, #1
	lsl	r0, r7, r0
	bics	r1, r1, r4
	str	r0, [r3, #844]
	beq	.L122
	lsrs	r1, r2, #30
	orr	r1, r1, r5, lsl #2
	ubfx	r1, r1, #0, #12
	ubfx	r2, r2, #15, #3
	cmp	r0, #512
	add	r1, r1, #1
	add	r2, r2, #2
	lsl	r2, r1, r2
	itt	gt
	lsrgt	r0, r0, #9
	mulgt	r2, r2, r0
	ands	r4, r4, #1
	str	r2, [r3, #856]
	beq	.L90
.L119:
	ldr	r2, [r3, #856]
.L87:
	lsrs	r1, r2, #23
	lsls	r2, r2, #9
	strd	r2, r1, [r3, #848]
	mov	r0, r8
	bl	prv_set_trans_state
	cmp	r0, #0
	beq	.L95
.L98:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L64:
	cmp	r5, #0
	bge	.L71
	subs	r4, r4, #1
	cmp	r4, #0
	ble	.L73
	ldr	r3, [r6]
	b	.L79
.L123:
	subs	r4, r4, #1
	beq	.L73
.L79:
	ldr	r3, [r3, #872]
	movs	r0, #10
	blx	r3
	movs	r3, #0
	mov	r2, r3
	mov	r1, r7
	mov	r0, r8
	bl	sdmmc_execute_command
	ldr	r3, [r6]
	ldr	r2, [r3, #272]
	and	r5, r5, #1073741824
	orrs	r5, r5, r2
	bmi	.L123
.L71:
	add	r9, r9, #1
	b	.L84
.L65:
	ldr	r3, [r6]
	ldr	r3, [r3, #272]
	and	r5, r5, #1073741824
	orrs	r5, r5, r3
	bmi	.L71
	add	r9, r9, #2
	b	.L84
.L70:
	movs	r3, #0
	ldr	r1, .L126+16
	mov	r2, #426
	mov	r0, r8
	bl	sdmmc_execute_command
	lsls	r1, r0, #23
	ldr	r3, [r6]
	bmi	.L75
	ldrb	r2, [r3, #272]	@ zero_extendqisi2
	cmp	r2, #170
	it	eq
	orreq	r5, r5, #1073741824
.L75:
	ldr	r2, [r3, #832]
	ldr	r1, .L126+20
	str	r1, [r3, #840]
	orr	r2, r2, #1
	str	r2, [r3, #832]
	ldr	r7, .L126+24
	mov	r9, #1
	movs	r4, #50
	b	.L66
.L61:
	ldr	r3, [r6]
	ldr	r1, .L126+28
	movs	r2, #1
	strh	r2, [r3, #836]	@ movhi
	mov	r0, r8
	movs	r3, #0
	mov	r2, #65536
	bl	sdmmc_execute_command
.L59:
	ldr	r3, [r6]
	ldr	r1, .L126+32
	ldrh	r2, [r3, #836]
	mov	r0, r8
	movs	r3, #0
	lsls	r2, r2, #16
	bl	sdmmc_execute_command
	ldr	r3, [r6]
	ldr	r0, [r3, #280]	@ unaligned
	str	r0, [r3, #312]	@ unaligned
	ldr	r0, [r3, #288]
	ldr	r5, [r3, #272]	@ unaligned
	ldr	r4, [r3, #276]	@ unaligned
	ldr	r2, [r3, #284]	@ unaligned
	str	r5, [r3, #304]	@ unaligned
	str	r4, [r3, #308]	@ unaligned
	str	r2, [r3, #316]	@ unaligned
	cmp	r0, #0
	bne	.L124
.L85:
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L67:
	ldr	r2, [r6]
	ldr	r7, .L126+36
	ldr	r3, [r2, #832]
	bic	r3, r3, #1
	str	r3, [r2, #832]
	mov	r1, #5242880
	movs	r3, #4
	movs	r2, #0
	mov	r0, r8
	bl	sdmmc_execute_command
	ldr	r3, [r6]
	orr	r5, r5, #1073741824
	str	r10, [r3, #840]
	mov	r9, #11
	movs	r4, #50
.L66:
	movs	r3, #0
	mov	r2, r3
	mov	r1, r7
	mov	r0, r8
	bl	sdmmc_execute_command
	lsls	r2, r0, #23
	bpl	.L71
	add	r9, r9, #9
	b	.L84
.L68:
	movs	r3, #0
	mov	r2, r3
	ldr	r1, .L126+28
	mov	r0, r8
	bl	sdmmc_execute_command
	ldr	r3, [r6]
	ldrh	r2, [r3, #274]
	strh	r2, [r3, #836]	@ movhi
	b	.L59
.L62:
	movs	r3, #0
	mov	r2, r3
	mov	r1, fp
	mov	r0, r8
	bl	sdmmc_execute_command
	ldr	r1, [r6]
	ldr	lr, [r1, #272]	@ unaligned
	ldr	ip, [r1, #276]	@ unaligned
	ldr	r0, [r1, #280]	@ unaligned
	ldr	r3, [r1, #284]	@ unaligned
	str	lr, [r1, #288]	@ unaligned
	add	r9, r9, #1
	str	ip, [r1, #292]	@ unaligned
	str	r0, [r1, #296]	@ unaligned
	str	r3, [r1, #300]	@ unaligned
	b	.L84
.L120:
	add	r9, r9, #6
	b	.L99
.L73:
	add	r9, r9, #7
	b	.L84
.L95:
	ldr	r3, [r6]
	ldr	r3, [r3, #832]
	lsls	r3, r3, #31
	bpl	.L97
	mov	r3, r0
	movs	r2, #2
	ldr	r1, .L126+40
	mov	r0, r8
	bl	sdmmc_execute_command
	cmp	r0, #0
	bne	.L98
	movs	r3, #1
	str	r3, [r8, #24]
.L97:
	mov	r2, #512
	str	r2, [r8, #28]
	mov	r0, r8
	movs	r3, #0
	ldr	r1, .L126+44
	bl	sdmmc_execute_command
	cmp	r0, #0
	bne	.L98
	ldr	r3, [r6]
	ldr	r0, [r3, #288]
	b	.L85
.L127:
	.align	2
.L126:
	.word	20000000
	.word	.LANCHOR0
	.word	16744448
	.word	1073741825
	.word	269484040
	.word	25000000
	.word	277872681
	.word	269484035
	.word	537919497
	.word	810549249
	.word	276824070
	.word	268435472
	.word	537919490
.L90:
	ldr	r2, [r3, #316]
	lsrs	r2, r2, #26
	tst	r2, #12
	beq	.L119
	ldrh	r2, [r3, #836]
	ldr	r1, .L128
	lsls	r2, r2, #16
	mov	r3, r4
	mov	r0, r8
	bl	sdmmc_execute_command
	ldr	r1, [r6]
	mov	r2, #512
	str	r2, [r8, #28]
	mov	r3, r2
	str	r2, [r8, #32]
	mov	r0, r8
	add	r2, r1, #320
	bl	Chip_SDIF_DmaSetup
	movs	r3, #8
	mov	r2, r4
	ldr	r1, .L128+4
	mov	r0, r8
	bl	sdmmc_execute_command
	movw	r3, #49090
	tst	r0, r3
	ldr	r3, [r6]
	bne	.L119
	ldr	r2, [r3, #512]
	tst	r2, #254
	itt	ne
	ldrne	r2, [r3, #532]
	strne	r2, [r3, #856]
	ldrb	r2, [r3, #516]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L125
	ldr	r1, .L128+8
	ldr	r2, [r3, #856]
	str	r1, [r3, #840]
	b	.L87
.L122:
	lsrs	r2, r2, #16
	orr	r2, r2, r5, lsl #16
	lsls	r2, r2, #10
	add	r2, r2, #1024
	str	r2, [r3, #856]
	b	.L87
.L125:
	ldr	r2, .L128+12
	str	r2, [r3, #840]
	b	.L119
.L129:
	.align	2
.L128:
	.word	268435463
	.word	270008328
	.word	26000000
	.word	52000000
	.size	Chip_SDMMC_Acquire, .-Chip_SDMMC_Acquire
	.section	.text.Chip_SDMMC_GetDeviceSize,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDMMC_GetDeviceSize
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDMMC_GetDeviceSize, %function
Chip_SDMMC_GetDeviceSize:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L131
	ldr	r3, [r3]
	ldrd	r0, [r3, #848]
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LANCHOR0
	.size	Chip_SDMMC_GetDeviceSize, .-Chip_SDMMC_GetDeviceSize
	.section	.text.Chip_SDMMC_GetDeviceBlocks,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDMMC_GetDeviceBlocks
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDMMC_GetDeviceBlocks, %function
Chip_SDMMC_GetDeviceBlocks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L134
	ldr	r3, [r3]
	ldr	r0, [r3, #856]
	bx	lr
.L135:
	.align	2
.L134:
	.word	.LANCHOR0
	.size	Chip_SDMMC_GetDeviceBlocks, .-Chip_SDMMC_GetDeviceBlocks
	.section	.text.Chip_SDMMC_ReadBlocks,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDMMC_ReadBlocks
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDMMC_ReadBlocks, %function
Chip_SDMMC_ReadBlocks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	subs	r7, r2, #0
	blt	.L139
	ldr	r5, .L150
	mov	r6, r3
	ldr	r3, [r5]
	ldr	r3, [r3, #856]
	adds	r2, r6, r7
	cmp	r2, r3
	bls	.L149
.L139:
	movs	r5, #0
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L149:
	mov	r8, r1
	mov	r4, r0
	bl	prv_set_trans_state
	cmp	r0, #0
	bne	.L139
	ldr	r1, [r5]
	ldr	r3, [r1, #832]
	lsls	r5, r6, #9
	lsls	r3, r3, #1
	str	r5, [r4, #32]
	mov	r3, r5
	mov	r2, r8
	mov	r0, r4
	it	pl
	lslpl	r7, r7, #9
	bl	Chip_SDIF_DmaSetup
	cmp	r6, #1
	ite	eq
	ldreq	r1, .L150+4
	ldrne	r1, .L150+8
	mov	r2, r7
	movs	r3, #8
	mov	r0, r4
	bl	sdmmc_execute_command
	cmp	r0, #0
	it	ne
	movne	r5, #0
.L144:
	mov	r0, r4
	bl	Chip_SDMMC_GetState
	cmp	r0, #4
	bne	.L144
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L151:
	.align	2
.L150:
	.word	.LANCHOR0
	.word	268959761
	.word	285736978
	.size	Chip_SDMMC_ReadBlocks, .-Chip_SDMMC_ReadBlocks
	.section	.text.Chip_SDMMC_WriteBlocks,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDMMC_WriteBlocks
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDMMC_WriteBlocks, %function
Chip_SDMMC_WriteBlocks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	subs	r7, r2, #0
	blt	.L155
	ldr	r5, .L164
	mov	r6, r3
	ldr	r3, [r5]
	ldr	r3, [r3, #856]
	adds	r2, r6, r7
	cmp	r2, r3
	mov	r4, r0
	mov	r8, r1
	bhi	.L155
.L156:
	mov	r0, r4
	bl	Chip_SDMMC_GetState
	cmp	r0, #4
	bne	.L156
	mov	r0, r4
	bl	prv_set_trans_state
	cbnz	r0, .L155
	ldr	r1, [r5]
	ldr	r3, [r1, #832]
	lsls	r5, r6, #9
	lsls	r3, r3, #1
	mov	r2, r8
	mov	r3, r5
	mov	r0, r4
	str	r5, [r4, #32]
	it	pl
	lslpl	r7, r7, #9
	bl	Chip_SDIF_DmaSetup
	cmp	r6, #1
	mov	r2, r7
	mov	r3, #8
	ite	eq
	ldreq	r1, .L164+4
	ldrne	r1, .L164+8
	mov	r0, r4
	bl	sdmmc_execute_command
	mov	r6, r0
.L160:
	mov	r0, r4
	bl	Chip_SDMMC_GetState
	cmp	r0, #4
	bne	.L160
	cbz	r6, .L152
.L155:
	movs	r5, #0
.L152:
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L165:
	.align	2
.L164:
	.word	.LANCHOR0
	.word	269221912
	.word	285999129
	.size	Chip_SDMMC_WriteBlocks, .-Chip_SDMMC_WriteBlocks
	.section	.bss.g_card_info,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_card_info, %object
	.size	g_card_info, 4
g_card_info:
	.space	4
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

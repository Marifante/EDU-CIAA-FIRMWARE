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
	.file	"clock_18xx_43xx.c"
	.text
	.section	.text.pll_calc_divs,"ax",%progbits
	.align	1
	.p2align 2,,3
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	pll_calc_divs, %function
pll_calc_divs:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r1]
	sub	sp, sp, #12
	ands	r2, r3, #128
	str	r0, [sp]
	str	r2, [sp, #4]
	beq	.L2
	bic	r3, r3, #64
	str	r3, [r1]
	mov	lr, #0
.L3:
	ldr	r6, [r1, #20]
	ldr	r8, .L21
	ldr	fp, .L21+4
	ldr	r10, [sp]
	movs	r7, #1
	movw	r9, #257
.L12:
	mov	ip, #0
.L14:
	add	ip, ip, #1
	mov	r4, r6
	movs	r2, #1
.L10:
	cmp	lr, #0
	beq	.L4
	lsl	r3, r2, ip
	mul	r3, r6, r3
	udiv	r3, r3, r7
.L5:
	cmp	r3, r8
	bls	.L6
	cmp	r3, fp
	bhi	.L7
	ldr	r0, [sp, #4]
	cbnz	r0, .L15
	lsr	r5, r3, ip
.L8:
	ldr	r0, [sp]
	subs	r0, r0, r5
	cmp	r0, #0
	it	lt
	rsblt	r0, r0, #0
	cmp	r0, r10
	bcs	.L6
	strd	r7, ip, [r1, #8]
	strd	r5, r3, [r1, #24]
	str	r2, [r1, #16]
	mov	r10, r0
.L6:
	adds	r2, r2, #1
	cmp	r2, r9
	add	r4, r4, r6
	bne	.L10
.L7:
	cmp	ip, #4
	bne	.L14
	adds	r7, r7, #1
	cmp	r7, #5
	bne	.L12
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L4:
	udiv	r3, r4, r7
	b	.L5
.L15:
	mov	r5, r3
	b	.L8
.L2:
	and	lr, r3, #64
	b	.L3
.L22:
	.align	2
.L21:
	.word	155999999
	.word	320000000
	.size	pll_calc_divs, .-pll_calc_divs
	.section	.text.Chip_Clock_EnableCrystal,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_EnableCrystal
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_EnableCrystal, %function
Chip_Clock_EnableCrystal:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #8
	ldr	r2, .L29
	mov	r3, #1000
	str	r3, [sp, #4]
	ldr	r3, [r2, #24]
	ldr	r0, [r2, #24]
	bic	r1, r3, #2
	cmp	r0, r1
	it	ne
	strne	r1, [r2, #24]
	ldr	r1, .L29+4
	ldr	r2, .L29+8
	ldr	r1, [r1]
	bic	r3, r3, #3
	cmp	r1, r2
	ldr	r2, .L29
	it	hi
	orrhi	r3, r3, #4
	str	r3, [r2, #24]
.L26:
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	str	r2, [sp, #4]
	cmp	r3, #0
	bne	.L26
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L30:
	.align	2
.L29:
	.word	1074069504
	.word	OscRateIn
	.word	19999999
	.size	Chip_Clock_EnableCrystal, .-Chip_Clock_EnableCrystal
	.section	.text.Chip_Clock_DisableCrystal,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_DisableCrystal
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_DisableCrystal, %function
Chip_Clock_DisableCrystal:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L32
	ldr	r3, [r2, #24]
	orr	r3, r3, #1
	str	r3, [r2, #24]
	bx	lr
.L33:
	.align	2
.L32:
	.word	1074069504
	.size	Chip_Clock_DisableCrystal, .-Chip_Clock_DisableCrystal
	.section	.text.Chip_Clock_SetDivider,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_SetDivider
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_SetDivider, %function
Chip_Clock_SetDivider:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r3, r0, #2
	add	r3, r3, #1073741824
	add	r3, r3, #327680
	cmp	r1, #17
	push	{r4, r5}
	ldr	r4, [r3, #72]
	beq	.L35
	ldr	r5, .L38
	ldrb	r5, [r5, r0]	@ zero_extendqisi2
	ldr	r0, .L38+4
	subs	r2, r2, #1
	orr	r0, r0, r5, lsl #2
	lsls	r1, r1, #24
	orr	r1, r1, r2, lsl #2
	bic	r4, r4, r0
	orrs	r4, r4, r1
	orr	r4, r4, #2048
	str	r4, [r3, #72]
	pop	{r4, r5}
	bx	lr
.L35:
	orr	r4, r4, #1
	str	r4, [r3, #72]
	pop	{r4, r5}
	bx	lr
.L39:
	.align	2
.L38:
	.word	.LC1
	.word	520093697
	.size	Chip_Clock_SetDivider, .-Chip_Clock_SetDivider
	.section	.text.Chip_Clock_GetDividerSource,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetDividerSource
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetDividerSource, %function
Chip_Clock_GetDividerSource:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L43
	adds	r0, r0, #18
	ldr	r0, [r3, r0, lsl #2]
	lsls	r3, r0, #31
	ite	pl
	ubfxpl	r0, r0, #24, #5
	movmi	r0, #17
	bx	lr
.L44:
	.align	2
.L43:
	.word	1074069504
	.size	Chip_Clock_GetDividerSource, .-Chip_Clock_GetDividerSource
	.section	.text.Chip_Clock_GetDividerDivisor,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetDividerDivisor
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetDividerDivisor, %function
Chip_Clock_GetDividerDivisor:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r0, #18
	ldr	r3, .L46
	ldr	r2, .L46+4
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	ldr	r2, [r2, r1, lsl #2]
	and	r0, r0, r2, lsr #2
	bx	lr
.L47:
	.align	2
.L46:
	.word	.LC1
	.word	1074069504
	.size	Chip_Clock_GetDividerDivisor, .-Chip_Clock_GetDividerDivisor
	.section	.text.Chip_Clock_GetClockInputHz,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetClockInputHz
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetClockInputHz, %function
Chip_Clock_GetClockInputHz:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #16
	bhi	.L65
	tbb	[pc, r0]
.L51:
	.byte	(.L64-.L51)/2
	.byte	(.L63-.L51)/2
	.byte	(.L62-.L51)/2
	.byte	(.L61-.L51)/2
	.byte	(.L60-.L51)/2
	.byte	(.L65-.L51)/2
	.byte	(.L59-.L51)/2
	.byte	(.L58-.L51)/2
	.byte	(.L57-.L51)/2
	.byte	(.L56-.L51)/2
	.byte	(.L65-.L51)/2
	.byte	(.L65-.L51)/2
	.byte	(.L55-.L51)/2
	.byte	(.L54-.L51)/2
	.byte	(.L53-.L51)/2
	.byte	(.L52-.L51)/2
	.byte	(.L50-.L51)/2
	.p2align 1
.L50:
	movs	r0, #4
	b	Chip_Clock_GetDivRate.isra.1
.L63:
	ldr	r0, .L68
	bx	lr
.L62:
	ldr	r3, .L68+4
	ldr	r0, .L68+8
	ldr	r3, [r3, #300]
	and	r3, r3, #7
	cmp	r3, #4
	it	eq
	moveq	r0, #0
	bx	lr
.L61:
	ldr	r3, .L68+4
	ldr	r2, .L68+12
	ldr	r3, [r3, #300]
	ldr	r0, .L68+8
	and	r3, r3, #7
	cmp	r3, #4
	it	eq
	moveq	r0, r2
	bx	lr
.L60:
	ldr	r3, .L68+16
	ldr	r0, [r3]
	bx	lr
.L59:
	ldr	r3, .L68+20
	ldr	r0, [r3]
	bx	lr
.L58:
	ldr	r3, .L68+24
	ldr	r0, [r3]
	bx	lr
.L57:
	ldr	r3, .L68+24
	ldr	r0, [r3, #4]
	bx	lr
.L56:
	b	Chip_Clock_GetMainPLLHz
.L55:
	movs	r0, #0
	b	Chip_Clock_GetDivRate.isra.1
.L54:
	movs	r0, #1
	b	Chip_Clock_GetDivRate.isra.1
.L53:
	movs	r0, #2
	b	Chip_Clock_GetDivRate.isra.1
.L52:
	movs	r0, #3
	b	Chip_Clock_GetDivRate.isra.1
.L64:
	mov	r0, #32768
	bx	lr
.L65:
	movs	r0, #0
	bx	lr
.L69:
	.align	2
.L68:
	.word	12000000
	.word	1074016256
	.word	25000000
	.word	50000000
	.word	ExtRateIn
	.word	OscRateIn
	.word	.LANCHOR0
	.size	Chip_Clock_GetClockInputHz, .-Chip_Clock_GetClockInputHz
	.section	.text.Chip_Clock_CalcMainPLLValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_CalcMainPLLValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_CalcMainPLLValue, %function
Chip_Clock_CalcMainPLLValue:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, r0
	sub	sp, sp, #100
	ldrb	r0, [r1, #4]	@ zero_extendqisi2
	mov	r4, r1
	bl	Chip_Clock_GetClockInputHz
	ldr	r3, .L100
	ldr	r2, .L100+4
	str	r0, [r4, #20]
	add	r3, r3, r5
	cmp	r3, r2
	bhi	.L73
	mov	r6, r0
	cmp	r0, #0
	beq	.L73
	udiv	r3, r5, r0
	ldr	r1, .L100+8
	str	r3, [r4, #16]
	movs	r2, #128
	str	r2, [r4]
	cmp	r5, r1
	mov	r2, #0
	strd	r2, r2, [r4, #8]
	bls	.L74
	mul	r2, r3, r0
	cmp	r2, r5
	beq	.L75
.L74:
	movs	r2, #92
	movs	r1, #0
	add	r0, sp, #4
	bl	memset
	ldrb	r3, [r4, #4]	@ zero_extendqisi2
	strb	r3, [sp, #4]
	movs	r2, #128
	mov	r1, sp
	mov	r0, r5
	str	r6, [sp, #20]
	str	r2, [sp]
	bl	pll_calc_divs
	ldr	r3, [sp, #24]
	cmp	r5, r3
	beq	.L81
	subs	r3, r5, r3
	ldr	r0, [r4, #20]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	str	r0, [sp, #84]
	eor	r7, r3, r3, asr #31
	add	r1, sp, #64
	movs	r6, #64
	mov	r0, r5
	sub	r7, r7, r3, asr #31
	str	r6, [sp, #64]
	strb	r2, [sp, #68]
	bl	pll_calc_divs
	ldr	r3, [sp, #88]
	cmp	r5, r3
	beq	.L82
	subs	r3, r5, r3
	ldr	r0, [r4, #20]
	str	r6, [sp, #32]
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	str	r0, [sp, #52]
	eor	r6, r3, r3, asr #31
	add	r1, sp, #32
	mov	r0, r5
	sub	r6, r6, r3, asr #31
	strb	r2, [sp, #36]
	bl	pll_calc_divs
	ldr	r3, [sp, #56]
	cmp	r5, r3
	beq	.L83
	subs	r5, r5, r3
	cmp	r5, #0
	it	lt
	rsblt	r5, r5, #0
	cmp	r7, r5
	ble	.L99
	cmp	r6, r5
	blt	.L82
.L83:
	add	r6, sp, #32
	b	.L98
.L75:
	cmp	r0, r2
	bhi	.L73
.L84:
	subs	r3, r3, #1
	str	r3, [r4, #16]
	movs	r0, #0
.L70:
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L99:
	cmp	r7, r6
	ble	.L81
.L82:
	add	r6, sp, #64
.L98:
	ldmia	r6!, {r0, r1, r2, r3}
	mov	r5, r4
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r6, {r0, r1, r2, r3}
	stm	r5, {r0, r1, r2, r3}
	ldr	r2, [r4, #8]
	cbz	r2, .L73
	ldr	r3, [r4, #16]
	subs	r2, r2, #1
	str	r2, [r4, #8]
	cbz	r3, .L73
	ldr	r2, [r4, #12]
	cmp	r2, #0
	beq	.L84
	subs	r2, r2, #1
	str	r2, [r4, #12]
	b	.L84
.L81:
	mov	r6, sp
	b	.L98
.L73:
	mov	r0, #-1
	b	.L70
.L101:
	.align	2
.L100:
	.word	-9750000
	.word	194250000
	.word	155999999
	.size	Chip_Clock_CalcMainPLLValue, .-Chip_Clock_CalcMainPLLValue
	.section	.text.Chip_Clock_SetupMainPLLMult,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_SetupMainPLLMult
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_SetupMainPLLMult, %function
Chip_Clock_SetupMainPLLMult:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	movs	r3, #250
	mov	r4, r1
	str	r3, [sp, #4]
	mov	r7, r0
	bl	Chip_Clock_GetClockInputHz
	ldr	r3, .L114
	ldr	r5, .L114+4
	ldr	r2, [r3, #68]
	ldr	r6, .L114+8
	bic	r2, r2, #520093696
	mul	r0, r4, r0
	orr	r2, r2, r7, lsl #24
	cmp	r0, r5
	add	r1, r4, #-1
	and	r6, r6, r2
	bhi	.L103
	cmp	r5, r0, lsl #1
	bcc	.L110
	movs	r4, #1
	movs	r2, #0
.L105:
	mul	r3, r4, r0
	cmp	r5, r3, lsl #2
	add	r2, r2, #1
	lsl	r4, r4, #1
	bcs	.L105
	lsls	r3, r2, #8
.L104:
	orr	r3, r3, r1, lsl #16
	orrs	r3, r3, r6
	orr	r3, r3, #64
.L106:
	ldr	r2, .L114
	bic	r3, r3, #1
	str	r3, [r2, #68]
.L109:
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	str	r2, [sp, #4]
	cmp	r3, #0
	bne	.L109
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L103:
	ldr	r2, .L114+12
	cmp	r0, r2
	bhi	.L107
	orr	r3, r6, r1, lsl #16
	orr	r3, r3, #192
	b	.L106
.L107:
	ldr	r2, [r3, #68]
	movs	r0, #0
	orr	r2, r2, #1
	str	r2, [r3, #68]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L110:
	movs	r3, #0
	b	.L104
.L115:
	.align	2
.L114:
	.word	1074069504
	.word	155999999
	.word	-16724931
	.word	319999999
	.size	Chip_Clock_SetupMainPLLMult, .-Chip_Clock_SetupMainPLLMult
	.section	.text.Chip_Clock_SetupMainPLLHz,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_SetupMainPLLHz
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_SetupMainPLLHz, %function
Chip_Clock_SetupMainPLLHz:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r2
	mov	r7, r3
	mov	r5, r1
	mov	r8, r0
	bl	Chip_Clock_GetClockInputHz
	adds	r3, r4, #1
	beq	.L117
	udiv	r1, r4, r0
	mul	r2, r1, r0
	cmp	r5, r2
	add	r3, r0, r2
	add	r6, r1, #1
	bls	.L140
.L118:
	cmp	r5, r3
	bls	.L141
.L117:
	udiv	r4, r5, r0
	udiv	r6, r7, r0
	ldr	ip, .L144+4
	movs	r1, #0
	mul	r2, r4, r0
	b	.L127
.L142:
	adds	r4, r4, #1
.L127:
	cmp	r5, r2
	bhi	.L125
	cmp	r7, r2
	bcc	.L125
	subs	r3, r2, #1
	cmp	r3, ip
	it	ls
	movls	r1, r4
.L125:
	cmp	r4, r6
	add	r2, r2, r0
	bcc	.L142
	cbnz	r1, .L139
	mov	r0, r1
	pop	{r4, r5, r6, r7, r8, pc}
.L140:
	ldr	ip, .L144
	cmp	r2, ip
	bhi	.L118
	cmp	r7, r2
	bcc	.L118
	cmp	r5, r3
	bls	.L143
.L119:
	cmp	r2, #0
	beq	.L117
.L139:
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, lr}
	b	Chip_Clock_SetupMainPLLMult
.L141:
	ldr	r2, .L144
	cmp	r3, r2
	bhi	.L117
	cmp	r7, r3
	bcc	.L117
.L122:
	cmp	r3, #0
	beq	.L117
.L124:
	mov	r1, r6
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, lr}
	b	Chip_Clock_SetupMainPLLMult
.L143:
	cmp	r3, ip
	bhi	.L119
	cmp	r7, r3
	bcc	.L119
	cmp	r2, #0
	beq	.L122
	cmp	r3, #0
	beq	.L139
	subs	r3, r3, r4
	subs	r4, r4, r2
	cmp	r3, r4
	bcs	.L124
	b	.L139
.L145:
	.align	2
.L144:
	.word	204000000
	.word	203999999
	.size	Chip_Clock_SetupMainPLLHz, .-Chip_Clock_SetupMainPLLHz
	.section	.text.Chip_Clock_GetMainPLLHz,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetMainPLLHz
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetMainPLLHz, %function
Chip_Clock_GetMainPLLHz:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L154
	ldr	r4, [r5, #68]
	sub	sp, sp, #12
	ubfx	r0, r4, #24, #4
	bl	Chip_Clock_GetClockInputHz
	ldr	r3, .L154+4
	str	r3, [sp, #4]
	ldr	r3, [r5, #64]
	ands	r3, r3, #1
	beq	.L146
	ubfx	r1, r4, #8, #2
	add	r3, sp, #8
	add	r1, r1, r3
	lsrs	r2, r4, #6
	ubfx	r3, r4, #12, #2
	orr	r2, r2, r4, lsr #7
	ldrb	r1, [r1, #-4]	@ zero_extendqisi2
	ubfx	r4, r4, #16, #8
	adds	r4, r4, #1
	lsls	r2, r2, #31
	add	r3, r3, #1
	it	pl
	lslpl	r1, r1, #1
	udiv	r3, r0, r3
	it	pl
	udivpl	r4, r4, r1
	mul	r3, r3, r4
.L146:
	mov	r0, r3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L155:
	.align	2
.L154:
	.word	1074069504
	.word	134480385
	.size	Chip_Clock_GetMainPLLHz, .-Chip_Clock_GetMainPLLHz
	.section	.text.Chip_Clock_GetDivRate.isra.1,"ax",%progbits
	.align	1
	.p2align 2,,3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetDivRate.isra.1, %function
Chip_Clock_GetDivRate.isra.1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	lsls	r3, r0, #2
	add	r3, r3, #1073741824
	add	r3, r3, #327680
	mov	r4, r0
	ldr	r0, [r3, #72]
	ldr	r5, [r3, #72]
	lsls	r2, r0, #31
	ite	pl
	ubfxpl	r0, r0, #24, #5
	movmi	r0, #17
	bl	Chip_Clock_GetClockInputHz
	ldr	r3, .L160
	ldrb	r3, [r3, r4]	@ zero_extendqisi2
	and	r3, r3, r5, lsr #2
	adds	r3, r3, #1
	udiv	r0, r0, r3
	pop	{r3, r4, r5, pc}
.L161:
	.align	2
.L160:
	.word	.LC1
	.size	Chip_Clock_GetDivRate.isra.1, .-Chip_Clock_GetDivRate.isra.1
	.section	.text.Chip_Clock_GetBaseClocktHz,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetBaseClocktHz
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetBaseClocktHz, %function
Chip_Clock_GetBaseClocktHz:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #27
	bhi	.L165
	ldr	r3, .L166
	lsls	r0, r0, #2
	add	r3, r3, r0
	ldr	r0, [r3, #4]
	lsls	r3, r0, #31
	bmi	.L165
	ubfx	r0, r0, #24, #5
	b	Chip_Clock_GetClockInputHz
.L165:
	movs	r0, #17
	b	Chip_Clock_GetClockInputHz
.L167:
	.align	2
.L166:
	.word	1074069592
	.size	Chip_Clock_GetBaseClocktHz, .-Chip_Clock_GetBaseClocktHz
	.section	.text.Chip_Clock_SetBaseClock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_SetBaseClock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_SetBaseClock, %function
Chip_Clock_SetBaseClock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	lsls	r4, r0, #2
	add	r4, r4, #1073741824
	add	r4, r4, #327680
	cmp	r0, #27
	ldr	r5, [r4, #92]
	bhi	.L169
	cmp	r1, #17
	beq	.L168
	ldr	r0, .L183
	ands	r0, r0, r5
	cbz	r2, .L171
	orr	r0, r0, #2048
.L171:
	cbz	r3, .L172
	orr	r0, r0, #1
.L172:
	orr	r0, r0, r1, lsl #24
	str	r0, [r4, #92]
.L168:
	pop	{r4, r5}
	bx	lr
.L169:
	orr	r5, r5, #1
	str	r5, [r4, #92]
	pop	{r4, r5}
	bx	lr
.L184:
	.align	2
.L183:
	.word	-520095746
	.size	Chip_Clock_SetBaseClock, .-Chip_Clock_SetBaseClock
	.section	.text.Chip_Clock_GetBaseClockOpts,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetBaseClockOpts
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetBaseClockOpts, %function
Chip_Clock_GetBaseClockOpts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	ldr	r4, .L189
	lsls	r5, r0, #2
	add	r4, r4, r5
	cmp	r0, #27
	ldr	r4, [r4, #4]
	bhi	.L186
	ubfx	r5, r4, #24, #5
	ubfx	r0, r4, #11, #1
	and	r4, r4, #1
	strb	r5, [r1]
	strb	r0, [r2]
	strb	r4, [r3]
	pop	{r4, r5}
	bx	lr
.L186:
	movs	r4, #17
	movs	r0, #1
	strb	r4, [r1]
	strb	r0, [r3]
	pop	{r4, r5}
	strb	r0, [r2]
	bx	lr
.L190:
	.align	2
.L189:
	.word	1074069592
	.size	Chip_Clock_GetBaseClockOpts, .-Chip_Clock_GetBaseClockOpts
	.section	.text.Chip_Clock_EnableBaseClock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_EnableBaseClock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_EnableBaseClock, %function
Chip_Clock_EnableBaseClock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #27
	bhi	.L191
	lsls	r0, r0, #2
	add	r0, r0, #1073741824
	add	r0, r0, #327680
	ldr	r3, [r0, #92]
	bic	r3, r3, #1
	str	r3, [r0, #92]
.L191:
	bx	lr
	.size	Chip_Clock_EnableBaseClock, .-Chip_Clock_EnableBaseClock
	.section	.text.Chip_Clock_DisableBaseClock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_DisableBaseClock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_DisableBaseClock, %function
Chip_Clock_DisableBaseClock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #27
	bhi	.L193
	lsls	r0, r0, #2
	add	r0, r0, #1073741824
	add	r0, r0, #327680
	ldr	r3, [r0, #92]
	orr	r3, r3, #1
	str	r3, [r0, #92]
.L193:
	bx	lr
	.size	Chip_Clock_DisableBaseClock, .-Chip_Clock_DisableBaseClock
	.section	.text.Chip_Clock_IsBaseClockEnabled,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_IsBaseClockEnabled
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_IsBaseClockEnabled, %function
Chip_Clock_IsBaseClockEnabled:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #27
	bhi	.L197
	ldr	r3, .L198
	lsls	r0, r0, #2
	add	r3, r3, r0
	ldr	r0, [r3, #4]
	mvns	r0, r0
	and	r0, r0, #1
	bx	lr
.L197:
	movs	r0, #0
	bx	lr
.L199:
	.align	2
.L198:
	.word	1074069592
	.size	Chip_Clock_IsBaseClockEnabled, .-Chip_Clock_IsBaseClockEnabled
	.section	.text.Chip_Clock_GetBaseClock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetBaseClock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetBaseClock, %function
Chip_Clock_GetBaseClock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #27
	bhi	.L203
	ldr	r3, .L204
	lsls	r0, r0, #2
	add	r3, r3, r0
	ldr	r0, [r3, #4]
	lsls	r3, r0, #31
	bmi	.L203
	ubfx	r0, r0, #24, #5
	bx	lr
.L203:
	movs	r0, #17
	bx	lr
.L205:
	.align	2
.L204:
	.word	1074069592
	.size	Chip_Clock_GetBaseClock, .-Chip_Clock_GetBaseClock
	.section	.text.Chip_Clock_EnableOpts,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_EnableOpts
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_EnableOpts, %function
Chip_Clock_EnableOpts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	ite	eq
	moveq	r1, #1
	movne	r1, #3
	cbz	r2, .L208
	orr	r1, r1, #4
.L208:
	cmp	r3, #2
	it	eq
	orreq	r1, r1, #32
	cmp	r0, #322
	ittee	cs
	subcs	r0, r0, #290
	ldrcs	r3, .L216
	ldrcc	r3, .L216+4
	addcc	r0, r0, #32
	str	r1, [r3, r0, lsl #3]
	bx	lr
.L217:
	.align	2
.L216:
	.word	1074077696
	.word	1074073600
	.size	Chip_Clock_EnableOpts, .-Chip_Clock_EnableOpts
	.section	.text.Chip_Clock_Enable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_Enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_Enable, %function
Chip_Clock_Enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #322
	bcc	.L219
	ldr	r3, .L221
	lsls	r0, r0, #3
	add	r3, r3, r0
	ldr	r2, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	bx	lr
.L219:
	lsls	r0, r0, #3
	add	r0, r0, #1073741824
	add	r0, r0, #331776
	ldr	r3, [r0, #256]
	orr	r3, r3, #1
	str	r3, [r0, #256]
	bx	lr
.L222:
	.align	2
.L221:
	.word	1074075376
	.size	Chip_Clock_Enable, .-Chip_Clock_Enable
	.section	.text.Chip_Clock_RTCEnable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_RTCEnable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_RTCEnable, %function
Chip_Clock_RTCEnable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L224
	ldr	r2, [r3, #4]
	bic	r2, r2, #12
	str	r2, [r3, #4]
	ldr	r2, [r3, #4]
	orr	r2, r2, #3
	str	r2, [r3, #4]
	bx	lr
.L225:
	.align	2
.L224:
	.word	1074016256
	.size	Chip_Clock_RTCEnable, .-Chip_Clock_RTCEnable
	.section	.text.Chip_Clock_Disable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_Disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_Disable, %function
Chip_Clock_Disable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #322
	bcc	.L227
	ldr	r3, .L229
	lsls	r0, r0, #3
	add	r3, r3, r0
	ldr	r2, [r3]
	bic	r2, r2, #1
	str	r2, [r3]
	bx	lr
.L227:
	lsls	r0, r0, #3
	add	r0, r0, #1073741824
	add	r0, r0, #331776
	ldr	r3, [r0, #256]
	bic	r3, r3, #1
	str	r3, [r0, #256]
	bx	lr
.L230:
	.align	2
.L229:
	.word	1074075376
	.size	Chip_Clock_Disable, .-Chip_Clock_Disable
	.section	.text.Chip_Clock_StartPowerDown,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_StartPowerDown
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_StartPowerDown, %function
Chip_Clock_StartPowerDown:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L232
	ldr	r2, .L232+4
	movs	r3, #1
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L233:
	.align	2
.L232:
	.word	1074073600
	.word	1074077696
	.size	Chip_Clock_StartPowerDown, .-Chip_Clock_StartPowerDown
	.section	.text.Chip_Clock_ClearPowerDown,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_ClearPowerDown
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_ClearPowerDown, %function
Chip_Clock_ClearPowerDown:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L235
	ldr	r2, .L235+4
	movs	r3, #0
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L236:
	.align	2
.L235:
	.word	1074073600
	.word	1074077696
	.size	Chip_Clock_ClearPowerDown, .-Chip_Clock_ClearPowerDown
	.section	.text.Chip_Clock_GetRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetRate, %function
Chip_Clock_GetRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #322
	itete	cs
	ldrcs	r3, .L253
	ldrcc	r3, .L253+4
	subcs	r2, r0, #290
	addcc	r2, r0, #32
	push	{r4, lr}
	ldr	r4, [r3, r2, lsl #3]
	mov	r1, r0
	ands	r0, r4, #1
	beq	.L237
	ldr	r3, .L253+8
	movs	r0, #10
.L243:
	ldrh	r2, [r3]
	cmp	r2, r1
	bhi	.L241
	ldrh	r2, [r3, #2]
	cmp	r2, r1
	bcc	.L241
.L242:
	bl	Chip_Clock_GetBaseClocktHz
	tst	r4, #224
	it	ne
	lsrne	r0, r0, #1
.L237:
	pop	{r4, pc}
.L241:
	adds	r3, r3, #6
	ldrb	r0, [r3, #4]	@ zero_extendqisi2
	cmp	r0, #28
	bne	.L243
	b	.L242
.L254:
	.align	2
.L253:
	.word	1074077696
	.word	1074073600
	.word	.LANCHOR1
	.size	Chip_Clock_GetRate, .-Chip_Clock_GetRate
	.section	.text.Chip_Clock_GetEMCRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetEMCRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetEMCRate, %function
Chip_Clock_GetEMCRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #102
	bl	Chip_Clock_GetRate
	ldr	r3, .L262
	ldr	r3, [r3, #1144]
	ubfx	r3, r3, #27, #3
	cmp	r3, #1
	beq	.L261
	pop	{r3, pc}
.L261:
	ldr	r3, .L262+4
	ldr	r3, [r3, #300]
	lsls	r3, r3, #15
	it	mi
	lsrmi	r0, r0, #1
	pop	{r3, pc}
.L263:
	.align	2
.L262:
	.word	1074073600
	.word	1074016256
	.size	Chip_Clock_GetEMCRate, .-Chip_Clock_GetEMCRate
	.section	.text.Chip_Clock_SetupPLL,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_SetupPLL
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_SetupPLL, %function
Chip_Clock_SetupPLL:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	ldr	r5, .L267
	ldr	r4, [r2]
	lsls	r3, r1, #4
	adds	r6, r5, r3
	orr	r0, r4, r0, lsl #24
	str	r0, [r6, #32]
	ldrd	r4, r0, [r2, #4]
	add	r3, r3, #1073741824
	add	r3, r3, #327680
	cmp	r1, #1
	str	r4, [r3, #36]
	str	r0, [r3, #40]
	itt	eq
	ldreq	r3, [r2, #12]
	streq	r3, [r5, #60]
	ldr	r3, .L267+4
	ldr	r2, [r2, #16]
	str	r2, [r3, r1, lsl #2]
	pop	{r4, r5, r6}
	bx	lr
.L268:
	.align	2
.L267:
	.word	1074069504
	.word	.LANCHOR0
	.size	Chip_Clock_SetupPLL, .-Chip_Clock_SetupPLL
	.section	.text.Chip_Clock_EnablePLL,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_EnablePLL
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_EnablePLL, %function
Chip_Clock_EnablePLL:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #4
	add	r0, r0, #1073741824
	add	r0, r0, #327680
	ldr	r3, [r0, #32]
	bic	r3, r3, #1
	str	r3, [r0, #32]
	bx	lr
	.size	Chip_Clock_EnablePLL, .-Chip_Clock_EnablePLL
	.section	.text.Chip_Clock_DisablePLL,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_DisablePLL
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_DisablePLL, %function
Chip_Clock_DisablePLL:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #4
	add	r0, r0, #1073741824
	add	r0, r0, #327680
	ldr	r3, [r0, #32]
	orr	r3, r3, #1
	str	r3, [r0, #32]
	bx	lr
	.size	Chip_Clock_DisablePLL, .-Chip_Clock_DisablePLL
	.section	.text.Chip_Clock_GetPLLStatus,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_Clock_GetPLLStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_Clock_GetPLLStatus, %function
Chip_Clock_GetPLLStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #4
	add	r0, r0, #1073741824
	add	r0, r0, #327680
	ldr	r0, [r0, #28]
	bx	lr
	.size	Chip_Clock_GetPLLStatus, .-Chip_Clock_GetPLLStatus
	.section	.bss.audio_usb_pll_freq,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	audio_usb_pll_freq, %object
	.size	audio_usb_pll_freq, 8
audio_usb_pll_freq:
	.space	8
	.section	.rodata.Chip_Clock_SetDivider.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"\003\017\017\017\377\000"
	.section	.rodata.periph_to_base,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	periph_to_base, %object
	.size	periph_to_base, 108
periph_to_base:
	.short	0
	.short	5
	.byte	10
	.space	1
	.short	32
	.short	36
	.byte	9
	.space	1
	.short	64
	.short	64
	.byte	5
	.space	1
	.short	96
	.short	166
	.byte	4
	.space	1
	.short	192
	.short	195
	.byte	2
	.space	1
	.short	224
	.short	224
	.byte	1
	.space	1
	.short	256
	.short	256
	.byte	3
	.space	1
	.short	288
	.short	288
	.byte	6
	.space	1
	.short	320
	.short	320
	.byte	12
	.space	1
	.short	322
	.short	322
	.byte	25
	.space	1
	.short	354
	.short	354
	.byte	19
	.space	1
	.short	386
	.short	386
	.byte	18
	.space	1
	.short	418
	.short	418
	.byte	17
	.space	1
	.short	450
	.short	450
	.byte	16
	.space	1
	.short	482
	.short	482
	.byte	15
	.space	1
	.short	514
	.short	514
	.byte	14
	.space	1
	.short	546
	.short	546
	.byte	13
	.space	1
	.short	547
	.short	547
	.byte	28
	.space	1
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

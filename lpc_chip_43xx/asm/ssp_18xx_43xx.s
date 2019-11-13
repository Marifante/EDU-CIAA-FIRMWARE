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
	.file	"ssp_18xx_43xx.c"
	.text
	.section	.text.Chip_SSP_SetClockRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_SetClockRate
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_SetClockRate, %function
Chip_SSP_SetClockRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	lsls	r1, r1, #8
	uxth	r1, r1
	bic	r3, r3, #65280
	orrs	r1, r1, r3
	str	r1, [r0]
	str	r2, [r0, #16]
	bx	lr
	.size	Chip_SSP_SetClockRate, .-Chip_SSP_SetClockRate
	.section	.text.Chip_SSP_RWFrames_Blocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_RWFrames_Blocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_RWFrames_Blocking, %function
Chip_SSP_RWFrames_Blocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #12]
	lsls	r3, r3, #29
	push	{r4, r5, r6}
	bpl	.L4
.L5:
	ldr	r3, [r0, #8]
	ldr	r3, [r0, #12]
	lsls	r6, r3, #29
	bmi	.L5
.L4:
	movs	r3, #3
	str	r3, [r0, #32]
	ldr	r5, [r0]
	ldrd	r3, r4, [r1, #12]
	lsls	r5, r5, #28
	mov	r2, r3
	bpl	.L64
	movw	r6, #65535
.L6:
	cmp	r4, r2
	bhi	.L17
.L71:
	ldr	r3, [r1, #4]
	cmp	r3, r4
	mov	r5, r3
	bcs	.L30
	ldr	r2, [r0, #12]
	lsls	r2, r2, #30
	bpl	.L8
.L31:
	ldr	r2, [r1]
	cmp	r2, #0
	beq	.L9
	ldrh	r3, [r2, r3]
	str	r3, [r0, #8]
.L10:
	ldr	r3, [r1, #4]
	adds	r3, r3, #2
	str	r3, [r1, #4]
.L8:
	ldr	r3, [r0, #24]
	lsls	r3, r3, #31
	bmi	.L24
.L11:
	ldr	r3, [r0, #12]
	ldr	r2, [r1, #12]
	lsls	r5, r3, #29
	bpl	.L6
	cmp	r4, r2
	bls	.L6
	ldr	r5, [r1, #8]
	b	.L16
.L70:
	cmp	r2, r4
	bcs	.L15
.L16:
	ldr	r3, [r0, #8]
	cbz	r5, .L14
	strh	r3, [r5, r2]	@ movhi
.L14:
	ldr	r3, [r0, #12]
	lsls	r3, r3, #29
	add	r2, r2, #2
	bmi	.L70
.L15:
	cmp	r4, r2
	str	r2, [r1, #12]
	bls	.L71
.L17:
	ldr	r3, [r0, #12]
	lsls	r2, r3, #30
	bpl	.L8
	ldr	r3, [r1, #4]
	cmp	r3, r4
	bcc	.L31
	ldr	r3, [r0, #24]
	lsls	r3, r3, #31
	bpl	.L11
.L24:
	movs	r0, #0
.L3:
	pop	{r4, r5, r6}
	bx	lr
.L64:
	movs	r6, #255
.L7:
	cmp	r4, r3
	bhi	.L28
.L72:
	ldr	r2, [r1, #4]
	cmp	r2, r4
	mov	r5, r2
	bcs	.L30
	ldr	r5, [r0, #12]
	lsls	r5, r5, #30
	bpl	.L21
.L32:
	ldr	r5, [r1]
	cbz	r5, .L22
	ldrb	r2, [r5, r2]	@ zero_extendqisi2
	str	r2, [r0, #8]
.L23:
	ldr	r2, [r1, #4]
	adds	r2, r2, #1
	str	r2, [r1, #4]
.L21:
	ldr	r2, [r0, #24]
	lsls	r5, r2, #31
	bmi	.L24
	ldr	r2, [r0, #12]
	lsls	r2, r2, #29
	bpl	.L7
.L67:
	cmp	r3, r4
	bcs	.L7
	ldr	r2, [r1, #8]
	ldr	r5, [r0, #8]
	cbz	r2, .L26
	strb	r5, [r2, r3]
	ldrd	r3, r4, [r1, #12]
.L26:
	ldr	r2, [r0, #12]
	adds	r3, r3, #1
	lsls	r5, r2, #29
	str	r3, [r1, #12]
	bmi	.L67
	cmp	r4, r3
	bls	.L72
.L28:
	ldr	r2, [r0, #12]
	lsls	r2, r2, #30
	bpl	.L21
	ldr	r2, [r1, #4]
	cmp	r2, r4
	bcs	.L21
	b	.L32
.L9:
	str	r6, [r0, #8]
	b	.L10
.L22:
	str	r6, [r0, #8]
	b	.L23
.L30:
	ldr	r3, [r1]
	cbz	r3, .L73
	mov	r0, r5
	pop	{r4, r5, r6}
	bx	lr
.L73:
	ldr	r3, [r1, #8]
	cmp	r3, #0
	beq	.L24
	ldr	r0, [r1, #12]
	b	.L3
	.size	Chip_SSP_RWFrames_Blocking, .-Chip_SSP_RWFrames_Blocking
	.section	.text.Chip_SSP_WriteFrames_Blocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_WriteFrames_Blocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_WriteFrames_Blocking, %function
Chip_SSP_WriteFrames_Blocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	ldr	r0, [r0, #12]
	push	{r4, r5}
	lsls	r4, r0, #29
	bpl	.L75
.L76:
	ldr	r0, [r3, #8]
	ldr	r0, [r3, #12]
	lsls	r0, r0, #29
	bmi	.L76
.L75:
	movs	r0, #3
	str	r0, [r3, #32]
	ldr	r4, [r3]
	ands	r4, r4, #8
	bne	.L94
	mov	r0, r4
.L78:
	cmp	r0, r2
	bcc	.L88
.L111:
	cmp	r4, r2
	bcs	.L74
	ldr	r5, [r3, #12]
.L93:
	ldr	r5, [r3, #24]
	lsls	r5, r5, #31
	bmi	.L85
.L112:
	ldr	r5, [r3, #12]
	lsls	r5, r5, #29
	bpl	.L78
	cmp	r4, r2
	bcs	.L78
.L87:
	ldr	r5, [r3, #8]
	ldr	r5, [r3, #12]
	lsls	r5, r5, #29
	add	r4, r4, #1
	bpl	.L78
	cmp	r2, r4
	bne	.L87
	cmp	r0, r2
	bcs	.L111
.L88:
	ldr	r5, [r3, #12]
	lsls	r5, r5, #30
	bpl	.L93
	ldrb	r5, [r1], #1	@ zero_extendqisi2
	str	r5, [r3, #8]
	ldr	r5, [r3, #24]
	lsls	r5, r5, #31
	add	r0, r0, #1
	bpl	.L112
.L85:
	movs	r0, #0
.L74:
	pop	{r4, r5}
	bx	lr
.L94:
	movs	r4, #0
	mov	r0, r4
.L77:
	cmp	r0, r2
	bcc	.L83
.L113:
	cmp	r4, r2
	bcs	.L74
	ldr	r5, [r3, #12]
.L91:
	ldr	r5, [r3, #24]
	lsls	r5, r5, #31
	bmi	.L85
	ldr	r5, [r3, #12]
	lsls	r5, r5, #29
	bpl	.L77
.L82:
	ldr	r5, [r3, #8]
	ldr	r5, [r3, #12]
	lsls	r5, r5, #29
	add	r4, r4, #2
	bmi	.L82
	cmp	r0, r2
	bcs	.L113
.L83:
	ldr	r5, [r3, #12]
	lsls	r5, r5, #30
	bpl	.L91
	ldrh	r5, [r1], #2
	str	r5, [r3, #8]
	adds	r0, r0, #2
	b	.L91
	.size	Chip_SSP_WriteFrames_Blocking, .-Chip_SSP_WriteFrames_Blocking
	.section	.text.Chip_SSP_ReadFrames_Blocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_ReadFrames_Blocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_ReadFrames_Blocking, %function
Chip_SSP_ReadFrames_Blocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	ldr	r0, [r0, #12]
	push	{r4, r5, r6, r7}
	lsls	r7, r0, #29
	bpl	.L115
.L116:
	ldr	r0, [r3, #8]
	ldr	r0, [r3, #12]
	lsls	r6, r0, #29
	bmi	.L116
.L115:
	movs	r0, #3
	str	r0, [r3, #32]
	ldr	r7, [r3]
	ands	r7, r7, #8
	bne	.L134
	mov	r0, r7
	mov	ip, #255
.L118:
	cmp	r7, r2
	bcc	.L128
.L152:
	cmp	r0, r2
	bcs	.L114
	ldr	r4, [r3, #12]
.L132:
	ldr	r4, [r3, #24]
	lsls	r4, r4, #31
	bmi	.L125
.L153:
	ldr	r4, [r3, #12]
	lsls	r6, r4, #29
	bpl	.L118
	cmp	r0, r2
	bcs	.L118
	mov	r4, r1
	subs	r5, r2, r0
	add	r1, r1, r5
	subs	r6, r0, r4
	b	.L127
.L151:
	cmp	r1, r4
	beq	.L118
.L127:
	ldr	r5, [r3, #8]
	strb	r5, [r4], #1
	ldr	r5, [r3, #12]
	lsls	r5, r5, #29
	add	r0, r4, r6
	bmi	.L151
	cmp	r7, r2
	mov	r1, r4
	bcs	.L152
.L128:
	ldr	r4, [r3, #12]
	lsls	r4, r4, #30
	bpl	.L132
	str	ip, [r3, #8]
	ldr	r4, [r3, #24]
	lsls	r4, r4, #31
	add	r7, r7, #1
	bpl	.L153
.L125:
	movs	r0, #0
.L114:
	pop	{r4, r5, r6, r7}
	bx	lr
.L134:
	movs	r6, #0
	mov	r0, r6
	movw	r7, #65535
.L117:
	cmp	r6, r2
	bcc	.L123
.L154:
	cmp	r0, r2
	bcs	.L114
	ldr	r4, [r3, #12]
.L131:
	ldr	r4, [r3, #24]
	lsls	r5, r4, #31
	bmi	.L125
	ldr	r4, [r3, #12]
	lsls	r4, r4, #29
	bpl	.L117
	cmp	r0, r2
	bcs	.L117
.L122:
	ldr	r5, [r3, #8]
	ldr	r4, [r3, #12]
	strh	r5, [r1], #2	@ movhi
	lsls	r5, r4, #29
	add	r0, r0, #2
	bpl	.L117
	cmp	r2, r0
	bhi	.L122
	cmp	r6, r2
	bcs	.L154
.L123:
	ldr	r4, [r3, #12]
	lsls	r5, r4, #30
	bpl	.L131
	str	r7, [r3, #8]
	adds	r6, r6, #2
	b	.L131
	.size	Chip_SSP_ReadFrames_Blocking, .-Chip_SSP_ReadFrames_Blocking
	.section	.text.Chip_SSP_Int_FlushData,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_Int_FlushData
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_Int_FlushData, %function
Chip_SSP_Int_FlushData:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L165:
	ldr	r3, [r0, #12]
	lsls	r2, r3, #27
	bpl	.L166
	ldr	r3, [r0, #12]
	lsls	r2, r3, #27
	bmi	.L165
	b	.L166
.L157:
	ldr	r3, [r0, #8]
.L166:
	ldr	r3, [r0, #12]
	lsls	r3, r3, #29
	bmi	.L157
	movs	r3, #3
	str	r3, [r0, #32]
	bx	lr
	.size	Chip_SSP_Int_FlushData, .-Chip_SSP_Int_FlushData
	.section	.text.Chip_SSP_Int_RWFrames8Bits,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_Int_RWFrames8Bits
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_Int_RWFrames8Bits, %function
Chip_SSP_Int_RWFrames8Bits:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	lsls	r3, r3, #31
	bmi	.L205
	ldr	r2, [r1, #16]
	ldr	r3, [r1, #4]
	cmp	r3, r2
	beq	.L207
.L171:
	ldr	r3, [r0, #12]
	push	{r4, r5}
	lsls	r4, r3, #29
	bpl	.L173
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bhi	.L175
	b	.L173
.L208:
	ldr	r2, [r1, #16]
	cmp	r3, r2
	bcs	.L173
.L175:
	ldr	r2, [r1, #8]
	ldr	r4, [r0, #8]
	cbz	r2, .L174
	strb	r4, [r2, r3]
	ldr	r3, [r1, #12]
.L174:
	ldr	r2, [r0, #12]
	adds	r3, r3, #1
	lsls	r2, r2, #29
	str	r3, [r1, #12]
	bmi	.L208
.L173:
	movs	r5, #255
.L176:
	ldr	r3, [r0, #12]
	lsls	r3, r3, #30
	bpl	.L183
.L209:
	ldr	r3, [r1, #4]
	ldr	r2, [r1, #16]
	cmp	r3, r2
	beq	.L183
	ldr	r4, [r1]
	cbz	r4, .L177
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	str	r3, [r0, #8]
.L178:
	ldr	r3, [r1, #4]
	adds	r3, r3, #1
	str	r3, [r1, #4]
	ldr	r3, [r0, #24]
	lsls	r3, r3, #31
	bmi	.L172
	ldr	r3, [r0, #12]
	lsls	r4, r3, #29
	bpl	.L176
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bls	.L176
.L181:
	ldr	r2, [r1, #8]
	ldr	r4, [r0, #8]
	cbz	r2, .L180
	strb	r4, [r2, r3]
	ldr	r3, [r1, #12]
.L180:
	ldr	r2, [r0, #12]
	adds	r3, r3, #1
	lsls	r2, r2, #29
	str	r3, [r1, #12]
	bpl	.L176
	ldr	r2, [r1, #16]
	cmp	r3, r2
	bcc	.L181
	ldr	r3, [r0, #12]
	lsls	r3, r3, #30
	bmi	.L209
.L183:
	movs	r0, #1
	pop	{r4, r5}
	bx	lr
.L177:
	str	r5, [r0, #8]
	b	.L178
.L207:
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L171
.L205:
	movs	r0, #0
	bx	lr
.L172:
	movs	r0, #0
	pop	{r4, r5}
	bx	lr
	.size	Chip_SSP_Int_RWFrames8Bits, .-Chip_SSP_Int_RWFrames8Bits
	.section	.text.Chip_SSP_Int_RWFrames16Bits,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_Int_RWFrames16Bits
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_Int_RWFrames16Bits, %function
Chip_SSP_Int_RWFrames16Bits:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	lsls	r3, r3, #31
	bmi	.L247
	push	{r4, r5, r6}
	ldr	r3, [r1, #4]
	ldr	r5, [r1, #16]
	cmp	r3, r5
	beq	.L213
.L216:
	ldr	r3, [r0, #12]
	lsls	r4, r3, #29
	bpl	.L214
	ldr	r3, [r1, #12]
	cmp	r5, r3
	bls	.L214
	ldr	r4, [r1, #8]
	b	.L220
.L248:
	cmp	r5, r3
	bls	.L219
.L220:
	ldr	r2, [r0, #8]
	cbz	r4, .L218
	strh	r2, [r4, r3]	@ movhi
.L218:
	ldr	r2, [r0, #12]
	lsls	r2, r2, #29
	add	r3, r3, #2
	bmi	.L248
.L219:
	str	r3, [r1, #12]
.L214:
	movw	r6, #65535
.L221:
	ldr	r3, [r0, #12]
	lsls	r3, r3, #30
	bpl	.L229
.L250:
	ldr	r3, [r1, #4]
	cmp	r3, r5
	beq	.L229
	ldr	r2, [r1]
	cbz	r2, .L222
	ldrh	r3, [r2, r3]
	str	r3, [r0, #8]
.L223:
	ldr	r3, [r1, #4]
	adds	r3, r3, #2
	str	r3, [r1, #4]
	ldr	r3, [r0, #24]
	lsls	r3, r3, #31
	bmi	.L217
	ldr	r3, [r0, #12]
	lsls	r4, r3, #29
	bpl	.L221
	ldr	r3, [r1, #12]
	cmp	r5, r3
	bls	.L221
	ldr	r4, [r1, #8]
	b	.L227
.L249:
	cmp	r3, r5
	bcs	.L226
.L227:
	ldr	r2, [r0, #8]
	cbz	r4, .L225
	strh	r2, [r4, r3]	@ movhi
.L225:
	ldr	r2, [r0, #12]
	lsls	r2, r2, #29
	add	r3, r3, #2
	bmi	.L249
.L226:
	str	r3, [r1, #12]
	ldr	r3, [r0, #12]
	lsls	r3, r3, #30
	bmi	.L250
.L229:
	movs	r0, #1
	pop	{r4, r5, r6}
	bx	lr
.L222:
	str	r6, [r0, #8]
	b	.L223
.L213:
	ldr	r3, [r1, #12]
	cmp	r5, r3
	bne	.L216
.L217:
	movs	r0, #0
	pop	{r4, r5, r6}
	bx	lr
.L247:
	movs	r0, #0
	bx	lr
	.size	Chip_SSP_Int_RWFrames16Bits, .-Chip_SSP_Int_RWFrames16Bits
	.section	.text.Chip_SSP_SetMaster,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_SetMaster
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_SetMaster, %function
Chip_SSP_SetMaster:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	cbz	r1, .L252
	bic	r3, r3, #4
	str	r3, [r0, #4]
	bx	lr
.L252:
	orr	r3, r3, #4
	str	r3, [r0, #4]
	bx	lr
	.size	Chip_SSP_SetMaster, .-Chip_SSP_SetMaster
	.section	.text.Chip_SSP_SetBitRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_SetBitRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_SetBitRate, %function
Chip_SSP_SetBitRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r3, .L265
	mov	r7, r0
	movw	r0, #514
	mov	r6, r1
	cmp	r7, r3
	it	eq
	moveq	r0, #482
	bl	Chip_Clock_GetRate
	adds	r3, r6, #1
	beq	.L261
	movs	r5, #2
	movs	r2, #0
.L259:
	adds	r4, r2, #1
	mul	r3, r5, r4
	udiv	r3, r0, r3
	cmp	r6, r3
	bcc	.L257
	lsls	r2, r2, #8
	uxth	r2, r2
.L256:
	ldr	r3, [r7]
	bic	r3, r3, #65280
	orrs	r2, r2, r3
	str	r2, [r7]
	str	r5, [r7, #16]
	pop	{r3, r4, r5, r6, r7, pc}
.L257:
	cmp	r4, #255
	bls	.L262
	adds	r5, r5, #2
	movs	r2, #0
	b	.L259
.L262:
	mov	r2, r4
	b	.L259
.L261:
	movs	r2, #0
	movs	r5, #2
	b	.L256
.L266:
	.align	2
.L265:
	.word	1074548736
	.size	Chip_SSP_SetBitRate, .-Chip_SSP_SetBitRate
	.section	.text.Chip_SSP_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_Init, %function
Chip_SSP_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L274
	cmp	r0, r3
	push	{r4, lr}
	mov	r4, r0
	beq	.L273
	movs	r0, #131
	bl	Chip_Clock_Enable
	movw	r0, #514
.L270:
	bl	Chip_Clock_Enable
	ldr	r3, [r4, #4]
	ldr	r1, .L274+4
	bic	r3, r3, #4
	str	r3, [r4, #4]
	ldr	r3, [r4]
	bic	r3, r3, #255
	orr	r3, r3, #7
	str	r3, [r4]
	mov	r0, r4
	pop	{r4, lr}
	b	Chip_SSP_SetBitRate
.L273:
	movs	r0, #165
	bl	Chip_Clock_Enable
	mov	r0, #482
	b	.L270
.L275:
	.align	2
.L274:
	.word	1074548736
	.word	100000
	.size	Chip_SSP_Init, .-Chip_SSP_Init
	.section	.text.Chip_SSP_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SSP_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SSP_DeInit, %function
Chip_SSP_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r2, .L283
	ldr	r3, [r0, #4]
	cmp	r0, r2
	and	r3, r3, #13
	str	r3, [r0, #4]
	beq	.L282
	movw	r0, #514
	bl	Chip_Clock_Disable
	movs	r0, #131
	pop	{r3, lr}
	b	Chip_Clock_Disable
.L282:
	mov	r0, #482
	bl	Chip_Clock_Disable
	movs	r0, #165
	pop	{r3, lr}
	b	Chip_Clock_Disable
.L284:
	.align	2
.L283:
	.word	1074548736
	.size	Chip_SSP_DeInit, .-Chip_SSP_DeInit
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

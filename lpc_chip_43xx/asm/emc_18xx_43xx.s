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
	.file	"emc_18xx_43xx.c"
	.text
	.section	.text.initDynMem,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	initDynMem
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	initDynMem, %function
initDynMem:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	mov	r7, r0
	sub	sp, sp, #8
	mov	r4, r1
	add	r5, r1, #64
	mov	r6, r1
.L2:
	ldr	r3, [r6, #60]
	ldrb	ip, [r6, #56]	@ zero_extendqisi2
	lsls	r3, r3, #4
	and	r3, r3, #3840
	orr	r3, r3, ip
	str	r3, [r7, #260]
	ldr	r3, [r6, #64]
	str	r3, [r7, #256]
	adds	r6, r6, #16
	cmp	r5, r6
	add	r7, r7, #32
	bne	.L2
	ldrd	r6, r3, [r1, #4]
	cmp	r3, #0
	str	r6, [r0, #40]
	blt	.L68
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L4:
	ldr	r3, [r1, #12]
	str	r6, [r0, #48]
	cmp	r3, #0
	blt	.L69
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L6:
	ldr	r3, [r1, #16]
	str	r6, [r0, #52]
	cmp	r3, #0
	blt	.L70
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L8:
	ldr	r3, [r1, #20]
	str	r6, [r0, #56]
	cmp	r3, #0
	blt	.L71
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r3, r3, r6
	umull	r6, r3, r7, r3
	lsrs	r3, r3, #6
	adds	r3, r3, #255
	lsrs	r3, r3, #8
	cmp	r3, #1
	ite	hi
	addhi	r3, r3, #-1
	movls	r3, #0
.L10:
	ldr	r6, [r1, #24]
	str	r3, [r0, #60]
	cmp	r6, #0
	blt	.L72
	ldr	r3, .L82
	ldr	r7, .L82+4
	umull	ip, r3, r3, r2
	lsrs	r3, r3, #18
	mul	r6, r6, r3
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
.L12:
	ldr	r3, [r1, #28]
	str	r6, [r0, #64]
	cmp	r3, #0
	blt	.L73
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L14:
	ldr	r3, [r1, #32]
	str	r6, [r0, #68]
	cmp	r3, #0
	blt	.L74
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L16:
	ldr	r3, [r1, #36]
	str	r6, [r0, #72]
	cmp	r3, #0
	blt	.L75
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L18:
	ldr	r3, [r1, #40]
	str	r6, [r0, #76]
	cmp	r3, #0
	blt	.L76
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L20:
	ldr	r3, [r1, #44]
	str	r6, [r0, #80]
	cmp	r3, #0
	blt	.L77
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r6, r3, r6
	umull	r3, r6, r7, r6
	lsrs	r6, r6, #6
	adds	r6, r6, #255
	lsrs	r6, r6, #8
	cmp	r6, #1
	ite	hi
	addhi	r6, r6, #-1
	movls	r6, #0
.L22:
	ldr	r3, [r1, #48]
	str	r6, [r0, #84]
	cmp	r3, #0
	blt	.L78
	ldr	r6, .L82
	ldr	r7, .L82+4
	umull	ip, r6, r6, r2
	lsrs	r6, r6, #18
	mul	r3, r3, r6
	umull	r6, r3, r7, r3
	lsrs	r3, r3, #6
	adds	r3, r3, #255
	lsrs	r3, r3, #8
	cmp	r3, #1
	ite	hi
	addhi	r3, r3, #-1
	movls	r3, #0
.L24:
	movs	r6, #0
	str	r3, [r0, #88]
	str	r6, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #1000
	bge	.L28
.L25:
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #1000
	blt	.L25
.L28:
	movs	r3, #0
	movw	r6, #387
	str	r6, [r0, #32]
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #1000
	bge	.L27
.L26:
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #1000
	blt	.L26
.L27:
	movw	r3, #259
	str	r3, [r0, #32]
	movs	r6, #2
	movs	r3, #0
	str	r6, [r0, #36]
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #79
	bgt	.L30
.L29:
	ldr	r3, [sp, #4]
	adds	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, #79
	ble	.L29
.L30:
	ldr	r3, [r1]
	cmp	r3, #0
	blt	.L79
	ldr	r6, .L82
	ldr	r1, .L82+4
	umull	r6, r2, r6, r2
	lsrs	r2, r2, #18
	mul	r3, r3, r2
	umull	r2, r3, r1, r3
	lsrs	r3, r3, #6
	adds	r3, r3, #255
	lsrs	r3, r3, #8
.L33:
	adds	r3, r3, #15
	lsrs	r3, r3, #4
	movs	r2, #131
	str	r3, [r0, #36]
	str	r2, [r0, #32]
.L41:
	ldr	r2, [r4, #64]
	ubfx	r3, r2, #7, #2
	cmp	r3, #2
	beq	.L52
	cmp	r3, #1
	beq	.L80
	cmp	r3, #0
	beq	.L81
	movs	r3, #0
.L34:
	lsls	r6, r2, #17
	ite	mi
	addmi	r3, r3, #2
	addpl	r3, r3, #1
	lsls	r1, r2, #19
	uxtb	r3, r3
	bmi	.L38
	tst	r2, #3584
	ite	eq
	addeq	r3, r3, #1
	addne	r3, r3, #2
	uxtb	r3, r3
.L38:
	ldr	r1, [r4, #52]
	cbz	r1, .L40
	ldr	r2, [r4, #60]
	lsl	r3, r2, r3
	orrs	r3, r3, r1
	ldr	r3, [r3]
.L40:
	adds	r4, r4, #16
	cmp	r5, r4
	bne	.L41
	movs	r3, #0
	str	r3, [r0, #32]
	ldr	r3, [r0, #256]
	orr	r3, r3, #524288
	str	r3, [r0, #256]
	ldr	r3, [r0, #288]
	orr	r3, r3, #524288
	str	r3, [r0, #288]
	ldr	r3, [r0, #320]
	orr	r3, r3, #524288
	str	r3, [r0, #320]
	ldr	r3, [r0, #352]
	orr	r3, r3, #524288
	str	r3, [r0, #352]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7}
	bx	lr
.L81:
	ubfx	r3, r2, #10, #2
	adds	r3, r3, #9
	b	.L34
.L80:
	ubfx	r3, r2, #10, #2
	adds	r3, r3, #8
	b	.L34
.L52:
	movs	r3, #8
	b	.L34
.L79:
	rsbs	r3, r3, #0
	asrs	r3, r3, #8
	b	.L33
.L78:
	rsbs	r3, r3, #0
	asrs	r3, r3, #8
	b	.L24
.L77:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L22
.L76:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L20
.L83:
	.align	2
.L82:
	.word	1125899907
	.word	274877907
.L75:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L18
.L74:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L16
.L73:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L14
.L72:
	rsbs	r6, r6, #0
	asrs	r6, r6, #8
	b	.L12
.L71:
	rsbs	r3, r3, #0
	asrs	r3, r3, #8
	b	.L10
.L70:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L8
.L69:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L6
.L68:
	rsbs	r3, r3, #0
	asrs	r6, r3, #8
	b	.L4
	.size	initDynMem, .-initDynMem
	.section	.text.initStaticMem,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	initStaticMem
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	initStaticMem, %function
initStaticMem:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	ldrd	r4, r3, [r1, #4]
	ldrb	r5, [r1]	@ zero_extendqisi2
	add	r0, r0, r5, lsl #5
	cmp	r3, #0
	str	r4, [r0, #512]
	blt	.L103
	ldr	r4, .L109
	ldr	r5, .L109+4
	umull	ip, r4, r4, r2
	lsrs	r4, r4, #18
	mul	r3, r3, r4
	umull	r4, r3, r5, r3
	lsrs	r3, r3, #6
	adds	r3, r3, #255
	lsrs	r3, r3, #8
	ldr	r4, [r1, #12]
	cmp	r3, #1
	ite	hi
	addhi	r3, r3, #-1
	movls	r3, #0
	cmp	r4, #0
	str	r3, [r0, #516]
	blt	.L104
.L87:
	ldr	r3, .L109
	ldr	r5, .L109+4
	umull	ip, r3, r3, r2
	lsrs	r3, r3, #18
	mul	r4, r4, r3
	umull	r3, r4, r5, r4
	lsrs	r4, r4, #6
	ldr	r3, [r1, #16]
	adds	r4, r4, #255
	lsrs	r4, r4, #8
	cmp	r3, #0
	str	r4, [r0, #520]
	blt	.L105
.L89:
	ldr	r4, .L109
	ldr	r5, .L109+4
	umull	ip, r4, r4, r2
	lsrs	r4, r4, #18
	mul	r3, r3, r4
	umull	r4, r3, r5, r3
	lsrs	r3, r3, #6
	adds	r3, r3, #255
	lsrs	r3, r3, #8
	ldr	r4, [r1, #20]
	cmp	r3, #1
	ite	hi
	addhi	r3, r3, #-1
	movls	r3, #0
	cmp	r4, #0
	str	r3, [r0, #524]
	blt	.L106
.L91:
	ldr	r3, .L109
	ldr	r5, .L109+4
	umull	ip, r3, r3, r2
	lsrs	r3, r3, #18
	mul	r3, r4, r3
	umull	r4, r3, r5, r3
	lsrs	r3, r3, #6
	adds	r3, r3, #255
	lsrs	r3, r3, #8
	ldr	r4, [r1, #24]
	cmp	r3, #1
	ite	hi
	addhi	r3, r3, #-1
	movls	r3, #0
	cmp	r4, #0
	str	r3, [r0, #528]
	blt	.L107
.L93:
	ldr	r3, .L109
	ldr	r5, .L109+4
	umull	ip, r3, r3, r2
	lsrs	r3, r3, #18
	mul	r4, r4, r3
	umull	r3, r4, r5, r4
	lsrs	r4, r4, #6
	adds	r4, r4, #255
	lsrs	r4, r4, #8
	ldr	r3, [r1, #28]
	cmp	r4, #2
	ite	hi
	subhi	r4, r4, #2
	movls	r4, #0
	cmp	r3, #0
	str	r4, [r0, #532]
	blt	.L108
.L95:
	ldr	r4, .L109
	ldr	r1, .L109+4
	umull	r4, r2, r4, r2
	lsrs	r2, r2, #18
	mul	r3, r3, r2
	umull	r2, r3, r1, r3
	lsrs	r3, r3, #6
	adds	r3, r3, #255
	lsrs	r3, r3, #8
	cmp	r3, #1
	ite	hi
	addhi	r3, r3, #-1
	movls	r3, #0
	str	r3, [r0, #536]
	pop	{r4, r5}
	bx	lr
.L103:
	ldr	r4, [r1, #12]
	rsbs	r3, r3, #0
	asrs	r3, r3, #8
	cmp	r4, #0
	str	r3, [r0, #516]
	bge	.L87
.L104:
	ldr	r3, [r1, #16]
	rsbs	r4, r4, #0
	asrs	r4, r4, #8
	cmp	r3, #0
	str	r4, [r0, #520]
	bge	.L89
.L105:
	ldr	r4, [r1, #20]
	rsbs	r3, r3, #0
	asrs	r3, r3, #8
	cmp	r4, #0
	str	r3, [r0, #524]
	bge	.L91
.L106:
	rsbs	r4, r4, #0
	asrs	r3, r4, #8
	ldr	r4, [r1, #24]
	str	r3, [r0, #528]
	cmp	r4, #0
	bge	.L93
.L107:
	ldr	r3, [r1, #28]
	rsbs	r4, r4, #0
	asrs	r4, r4, #8
	cmp	r3, #0
	str	r4, [r0, #532]
	bge	.L95
.L108:
	rsbs	r3, r3, #0
	asrs	r3, r3, #8
	str	r3, [r0, #536]
	pop	{r4, r5}
	bx	lr
.L110:
	.align	2
.L109:
	.word	1125899907
	.word	274877907
	.size	initStaticMem, .-initStaticMem
	.section	.text.Chip_EMC_Dynamic_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EMC_Dynamic_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EMC_Dynamic_Init, %function
Chip_EMC_Dynamic_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	Chip_Clock_GetEMCRate
	mov	r1, r4
	mov	r2, r0
	pop	{r4, lr}
	ldr	r0, .L113
	b	initDynMem
.L114:
	.align	2
.L113:
	.word	1073762304
	.size	Chip_EMC_Dynamic_Init, .-Chip_EMC_Dynamic_Init
	.section	.text.Chip_EMC_Dynamic_Enable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EMC_Dynamic_Enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EMC_Dynamic_Enable, %function
Chip_EMC_Dynamic_Enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L118
	ldr	r3, [r2, #32]
	cbz	r0, .L116
	orr	r3, r3, #3
	str	r3, [r2, #32]
	bx	lr
.L116:
	bic	r3, r3, #3
	str	r3, [r2, #32]
	bx	lr
.L119:
	.align	2
.L118:
	.word	1073762304
	.size	Chip_EMC_Dynamic_Enable, .-Chip_EMC_Dynamic_Enable
	.section	.text.Chip_EMC_Static_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EMC_Static_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EMC_Static_Init, %function
Chip_EMC_Static_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	bl	Chip_Clock_GetEMCRate
	mov	r1, r4
	mov	r2, r0
	pop	{r4, lr}
	ldr	r0, .L122
	b	initStaticMem
.L123:
	.align	2
.L122:
	.word	1073762304
	.size	Chip_EMC_Static_Init, .-Chip_EMC_Static_Init
	.section	.text.Chip_EMC_Mirror,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EMC_Mirror
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EMC_Mirror, %function
Chip_EMC_Mirror:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L127
	ldr	r3, [r2]
	cbz	r0, .L125
	orr	r3, r3, #2
	str	r3, [r2]
	bx	lr
.L125:
	bic	r3, r3, #2
	str	r3, [r2]
	bx	lr
.L128:
	.align	2
.L127:
	.word	1073762304
	.size	Chip_EMC_Mirror, .-Chip_EMC_Mirror
	.section	.text.Chip_EMC_Enable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EMC_Enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EMC_Enable, %function
Chip_EMC_Enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L132
	ldr	r3, [r2]
	cbz	r0, .L130
	orr	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L130:
	bic	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L133:
	.align	2
.L132:
	.word	1073762304
	.size	Chip_EMC_Enable, .-Chip_EMC_Enable
	.section	.text.Chip_EMC_LowPowerMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EMC_LowPowerMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EMC_LowPowerMode, %function
Chip_EMC_LowPowerMode:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L137
	ldr	r3, [r2]
	cbz	r0, .L135
	orr	r3, r3, #4
	str	r3, [r2]
	bx	lr
.L135:
	bic	r3, r3, #4
	str	r3, [r2]
	bx	lr
.L138:
	.align	2
.L137:
	.word	1073762304
	.size	Chip_EMC_LowPowerMode, .-Chip_EMC_LowPowerMode
	.section	.text.Chip_EMC_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EMC_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EMC_Init, %function
Chip_EMC_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r2, r2, #0
	it	ne
	movne	r2, #1
	cbz	r1, .L140
	orr	r2, r2, #256
.L140:
	ldr	r3, .L144
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	str	r2, [r3, #8]
	str	r0, [r3]
	bx	lr
.L145:
	.align	2
.L144:
	.word	1073762304
	.size	Chip_EMC_Init, .-Chip_EMC_Init
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

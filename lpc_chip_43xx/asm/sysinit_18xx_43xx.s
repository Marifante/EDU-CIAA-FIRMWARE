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
	.file	"sysinit_18xx_43xx.c"
	.text
	.section	.text.Chip_SetupCoreClock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SetupCoreClock
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SetupCoreClock, %function
Chip_SetupCoreClock:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #72
	mov	r3, #500
	cmp	r0, #6
	mov	r5, r0
	mov	r6, r1
	mov	r4, r2
	str	r3, [sp, #4]
	beq	.L31
.L2:
	movs	r3, #0
	movs	r2, #1
	mov	r1, r5
	movs	r0, #4
	bl	Chip_Clock_SetBaseClock
	ldr	r2, .L33
	ldr	r3, [r2, #68]
	orr	r3, r3, #1
	str	r3, [r2, #68]
	add	r1, sp, #8
	mov	r0, r6
	strb	r5, [sp, #12]
	bl	Chip_Clock_CalcMainPLLValue
	ldr	r3, .L33+4
	ldr	r2, [sp, #8]
	cmp	r6, r3
	bhi	.L3
	ldr	r1, [sp, #20]
	movs	r5, #0
.L4:
	ldr	r3, [sp, #24]
	ldrb	r6, [sp, #12]	@ zero_extendqisi2
	ldr	r0, [sp, #16]
	lsls	r3, r3, #16
	orr	r3, r3, r6, lsl #24
	orr	r3, r3, r0, lsl #12
	orrs	r3, r3, r2
	ldr	r2, .L33
	orr	r3, r3, r1, lsl #8
	str	r3, [r2, #68]
.L9:
	ldr	r3, [r2, #64]
	lsls	r3, r3, #31
	bpl	.L9
	movs	r3, #0
	movs	r2, #1
	movs	r1, #9
	movs	r0, #4
	bl	Chip_Clock_SetBaseClock
.L10:
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	str	r2, [sp, #4]
	cmp	r3, #0
	bne	.L10
	cbz	r5, .L15
	add	r0, sp, #16
	ldm	r0, {r0, r1, r5}
	ldr	r2, [sp, #8]
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	orr	r2, r2, #128
	orr	r3, r2, r3, lsl #24
	orr	r3, r3, r5, lsl #16
	orr	r3, r3, r0, lsl #12
	ldr	r0, .L33
	str	r2, [sp, #8]
	orr	r3, r3, r1, lsl #8
	mov	r2, #500
	str	r2, [sp, #4]
	str	r3, [r0, #68]
.L14:
	ldr	r3, [sp, #4]
	subs	r2, r3, #1
	str	r2, [sp, #4]
	cmp	r3, #0
	bne	.L14
.L15:
	cbz	r4, .L1
	ldr	r4, .L33+8
	movs	r1, #1
	add	r5, r4, #68
	movs	r0, #0
	b	.L13
.L32:
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	adds	r4, r4, #4
.L13:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	bl	Chip_Clock_SetBaseClock
	cmp	r5, r4
	bne	.L32
.L1:
	add	sp, sp, #72
	@ sp needed
	pop	{r4, r5, r6, pc}
.L3:
	lsls	r0, r2, #24
	bpl	.L5
	ldr	r1, [sp, #20]
	cbz	r1, .L6
.L5:
	add	r1, sp, #40
	ldr	r0, .L33+4
	strb	r5, [sp, #44]
	bl	Chip_Clock_CalcMainPLLValue
	ldr	r3, [sp, #56]
	ldrb	r5, [sp, #44]	@ zero_extendqisi2
	ldr	r0, [sp, #40]
	ldrd	r2, r1, [sp, #48]
	lsls	r3, r3, #16
	orr	r3, r3, r5, lsl #24
	orrs	r3, r3, r0
	orr	r3, r3, r2, lsl #12
	ldr	r2, .L33
	orr	r3, r3, r1, lsl #8
	str	r3, [r2, #68]
.L7:
	ldr	r3, [r2, #64]
	lsls	r1, r3, #31
	bpl	.L7
	movs	r3, #0
	movs	r2, #1
	movs	r1, #9
	movs	r0, #4
	bl	Chip_Clock_SetBaseClock
.L8:
	ldr	r5, [sp, #4]
	subs	r3, r5, #1
	str	r3, [sp, #4]
	cmp	r5, #0
	bne	.L8
	mov	r3, #500
	str	r3, [sp, #4]
	ldr	r2, [sp, #8]
	ldr	r1, [sp, #20]
	b	.L4
.L31:
	bl	Chip_Clock_EnableCrystal
	b	.L2
.L6:
	bic	r2, r2, #128
	str	r2, [sp, #8]
	movs	r5, #1
	b	.L4
.L34:
	.align	2
.L33:
	.word	1074069504
	.word	110000000
	.word	.LANCHOR0
	.size	Chip_SetupCoreClock, .-Chip_SetupCoreClock
	.section	.text.Chip_SetupXtalClocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SetupXtalClocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SetupXtalClocking, %function
Chip_SetupXtalClocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #1
	ldr	r1, .L36
	movs	r0, #6
	b	Chip_SetupCoreClock
.L37:
	.align	2
.L36:
	.word	204000000
	.size	Chip_SetupXtalClocking, .-Chip_SetupXtalClocking
	.section	.text.Chip_SystemInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SystemInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SystemInit, %function
Chip_SystemInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r2, #1
	mov	r0, r2
	ldr	r1, .L39
	b	Chip_SetupCoreClock
.L40:
	.align	2
.L39:
	.word	204000000
	.size	Chip_SystemInit, .-Chip_SystemInit
	.section	.text.Chip_SetupIrcClocking,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SetupIrcClocking
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SetupIrcClocking, %function
Chip_SetupIrcClocking:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	Chip_SystemInit
	.size	Chip_SetupIrcClocking, .-Chip_SetupIrcClocking
	.section	.rodata.InitClkStates,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	InitClkStates, %object
	.size	InitClkStates, 72
InitClkStates:
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.byte	9
	.byte	9
	.byte	1
	.byte	0
	.byte	10
	.byte	9
	.byte	1
	.byte	0
	.byte	1
	.byte	7
	.byte	1
	.byte	1
	.byte	2
	.byte	9
	.byte	1
	.byte	0
	.byte	6
	.byte	9
	.byte	1
	.byte	0
	.byte	12
	.byte	9
	.byte	1
	.byte	1
	.byte	13
	.byte	9
	.byte	1
	.byte	0
	.byte	14
	.byte	9
	.byte	1
	.byte	0
	.byte	15
	.byte	9
	.byte	1
	.byte	0
	.byte	16
	.byte	9
	.byte	1
	.byte	0
	.byte	17
	.byte	9
	.byte	1
	.byte	0
	.byte	18
	.byte	9
	.byte	1
	.byte	0
	.byte	19
	.byte	9
	.byte	1
	.byte	0
	.byte	20
	.byte	17
	.byte	1
	.byte	0
	.byte	25
	.byte	17
	.byte	1
	.byte	0
	.byte	26
	.byte	17
	.byte	1
	.byte	0
	.byte	27
	.byte	17
	.byte	1
	.byte	0
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

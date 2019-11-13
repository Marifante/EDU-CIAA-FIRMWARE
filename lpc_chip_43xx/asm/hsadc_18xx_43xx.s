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
	.file	"hsadc_18xx_43xx.c"
	.text
	.section	.text.Chip_HSADC_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_Init, %function
Chip_HSADC_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r3, #1
	mov	r2, r3
	mov	r1, r3
	movs	r0, #115
	bl	Chip_Clock_EnableOpts
	mov	r0, #320
	bl	Chip_Clock_Enable
	ldr	r3, .L4
	mov	r2, #268435456
	str	r2, [r3, #260]
	pop	{r3, pc}
.L5:
	.align	2
.L4:
	.word	1074081792
	.size	Chip_HSADC_Init, .-Chip_HSADC_Init
	.section	.text.Chip_HSADC_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_DeInit, %function
Chip_HSADC_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #264]
	ldr	r1, .L11
	push	{r4}
	bic	r3, r3, #393216
	mov	r4, #268435456
	str	r3, [r0, #264]
	mov	r2, r1
	str	r4, [r1, #260]
.L7:
	ldr	r3, [r2, #340]
	lsls	r3, r3, #3
	bpl	.L7
	movs	r0, #115
	ldr	r4, [sp], #4
	b	Chip_Clock_Disable
.L12:
	.align	2
.L11:
	.word	1074081792
	.size	Chip_HSADC_DeInit, .-Chip_HSADC_DeInit
	.section	.text.Chip_HSADC_SetupFIFO,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_SetupFIFO
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_SetupFIFO, %function
Chip_HSADC_SetupFIFO:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r1, r1, #1
	cbz	r2, .L14
	orr	r1, r1, #1
.L14:
	str	r1, [r0, #12]
	bx	lr
	.size	Chip_HSADC_SetupFIFO, .-Chip_HSADC_SetupFIFO
	.section	.text.Chip_HSADC_SetThrLowValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_SetThrLowValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_SetThrLowValue, %function
Chip_HSADC_SetThrLowValue:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r0, r1, lsl #2
	ldr	r3, [r1, #32]
	bic	r3, r3, #4080
	bic	r3, r3, #15
	orrs	r2, r2, r3
	str	r2, [r1, #32]
	bx	lr
	.size	Chip_HSADC_SetThrLowValue, .-Chip_HSADC_SetThrLowValue
	.section	.text.Chip_HSADC_SetThrHighValue,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_SetThrHighValue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_SetThrHighValue, %function
Chip_HSADC_SetThrHighValue:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r0, r1, lsl #2
	ldr	r3, [r1, #32]
	bic	r3, r3, #267386880
	bic	r3, r3, #983040
	orr	r2, r3, r2, lsl #16
	str	r2, [r1, #32]
	bx	lr
	.size	Chip_HSADC_SetThrHighValue, .-Chip_HSADC_SetThrHighValue
	.section	.text.Chip_HSADC_SetSpeed,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_SetSpeed
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_SetSpeed, %function
Chip_HSADC_SetSpeed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	lsls	r1, r1, #2
	ldr	r3, [r0, #260]
	movs	r4, #15
	lsls	r4, r4, r1
	bic	r3, r3, r4
	lsls	r2, r2, r1
	orrs	r3, r3, r2
	str	r3, [r0, #260]
	ldr	r4, [sp], #4
	bx	lr
	.size	Chip_HSADC_SetSpeed, .-Chip_HSADC_SetSpeed
	.section	.text.Chip_HSADC_SetPowerSpeed,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_SetPowerSpeed
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_SetPowerSpeed, %function
Chip_HSADC_SetPowerSpeed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r0, #320
	mov	r5, r1
	bl	Chip_Clock_GetRate
	ldr	r3, .L35
	cmp	r0, r3
	bls	.L26
	ldr	r3, .L35+4
	cmp	r0, r3
	bls	.L27
	ldr	r3, .L35+8
	cmp	r0, r3
	bls	.L28
	ldr	r3, .L35+12
	cmp	r0, r3
	itete	ls
	movls	r0, #15
	movhi	r0, #14
	movls	r6, #3
	movhi	r6, #4
.L23:
	cbz	r5, .L24
	orr	r6, r6, #65536
.L24:
	movs	r2, #0
	movs	r5, #15
.L25:
	ldr	r3, [r4, #260]
	lsl	r1, r5, r2
	bic	r3, r3, r1
	lsl	r1, r0, r2
	adds	r2, r2, #4
	orrs	r3, r3, r1
	cmp	r2, #24
	str	r3, [r4, #260]
	bne	.L25
	ldr	r3, [r4, #264]
	bic	r3, r3, #65536
	bic	r3, r3, #15
	orrs	r3, r3, r6
	str	r3, [r4, #264]
	pop	{r4, r5, r6, pc}
.L26:
	movs	r0, #0
	mov	r6, r0
	b	.L23
.L27:
	movs	r0, #0
	movs	r6, #1
	b	.L23
.L28:
	movs	r0, #0
	movs	r6, #2
	b	.L23
.L36:
	.align	2
.L35:
	.word	20000000
	.word	30000000
	.word	50000000
	.word	65000000
	.size	Chip_HSADC_SetPowerSpeed, .-Chip_HSADC_SetPowerSpeed
	.section	.text.Chip_HSADC_SetACDCBias,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_HSADC_SetACDCBias
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_HSADC_SetACDCBias, %function
Chip_HSADC_SetACDCBias:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	lsls	r3, r3, #10
	ldr	r4, [r0, #264]
	mov	r5, #1040
	lsls	r5, r5, r1
	orr	r3, r3, r2, lsl #4
	bic	r4, r4, r5
	lsls	r3, r3, r1
	orrs	r3, r3, r4
	str	r3, [r0, #264]
	pop	{r4, r5}
	bx	lr
	.size	Chip_HSADC_SetACDCBias, .-Chip_HSADC_SetACDCBias
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

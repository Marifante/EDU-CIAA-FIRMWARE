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
	.file	"sct_pwm_18xx_43xx.c"
	.text
	.section	.text.Chip_SCTPWM_SetOutPin,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SCTPWM_SetOutPin
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SCTPWM_SetOutPin, %function
Chip_SCTPWM_SetOutPin:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	add	r5, r0, r1, lsl #3
	orr	r3, r1, #4096
	str	r3, [r5, #772]
	movs	r4, #1
	add	r3, r0, r2, lsl #3
	lsl	r1, r4, r1
	str	r4, [r5, #768]
	str	r4, [r3, #1280]
	lsl	r5, r2, r4
	str	r1, [r3, #1284]
	movs	r3, #3
	ldr	r2, [r0, #88]
	lsls	r3, r3, r5
	mvns	r3, r3
	ands	r2, r2, r3
	lsls	r4, r4, r5
	orrs	r4, r4, r2
	str	r4, [r0, #88]
	ldr	r2, [r0, #84]
	ands	r3, r3, r2
	str	r3, [r0, #84]
	pop	{r4, r5}
	bx	lr
	.size	Chip_SCTPWM_SetOutPin, .-Chip_SCTPWM_SetOutPin
	.section	.text.Chip_SCTPWM_SetRate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SCTPWM_SetRate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SCTPWM_SetRate, %function
Chip_SCTPWM_SetRate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r0
	movs	r0, #109
	mov	r5, r1
	bl	Chip_Clock_GetRate
	ldr	r3, [r4, #4]
	udiv	r0, r0, r5
	orr	r3, r3, #262148
	str	r3, [r4, #4]
	ldr	r2, [r4, #4]
	ldr	r1, .L6
	orr	r2, r2, #524296
	str	r2, [r4, #4]
	movs	r3, #0
	movs	r2, #1
	mov	r5, #4096
	strh	r3, [r4, #76]	@ movhi
	strh	r3, [r4, #78]	@ movhi
	str	r3, [r4, #256]
	str	r0, [r4, #512]
	str	r5, [r4, #772]
	str	r2, [r4, #768]
	strh	r2, [r4, #8]	@ movhi
	str	r1, [r4]
	pop	{r3, r4, r5, pc}
.L7:
	.align	2
.L6:
	.word	131073
	.size	Chip_SCTPWM_SetRate, .-Chip_SCTPWM_SetRate
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

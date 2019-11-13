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
	.file	"pwm_board.c"
	.text
	.section	.text.singlePWM,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	singlePWM
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	singlePWM, %function
singlePWM:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1073741824
	push	{r4, r5, r6}
	ldr	r2, [r3]
	orr	r2, r2, #131072
	str	r2, [r3]
	ldrh	r2, [r3, #4]
	movs	r0, #9
	orr	r2, r2, #352
	strh	r2, [r3, #4]	@ movhi
	movs	r6, #5
	strh	r0, [r3, #512]	@ movhi
	mov	r1, #-1
	mov	r5, #4096
	movw	r4, #4097
	movs	r2, #2
	movs	r0, #1
	strh	r6, [r3, #516]	@ movhi
	str	r1, [r3, #768]
	str	r5, [r3, #772]
	str	r1, [r3, #776]
	str	r4, [r3, #780]
	str	r0, [r3, #1280]
	str	r2, [r3, #1284]
	ldrh	r2, [r3, #4]
	bic	r2, r2, #4
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	strh	r2, [r3, #4]	@ movhi
	pop	{r4, r5, r6}
	bx	lr
	.size	singlePWM, .-singlePWM
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

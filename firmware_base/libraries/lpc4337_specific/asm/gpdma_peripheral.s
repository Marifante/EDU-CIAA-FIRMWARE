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
	.file	"gpdma_peripheral.c"
	.text
	.section	.text.GPDMA_CreateLLI,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPDMA_CreateLLI
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPDMA_CreateLLI, %function
GPDMA_CreateLLI:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	ldr	r4, [sp, #4]
	strd	r1, r2, [r0]
	strd	r3, r4, [r0, #8]
	ldr	r4, [sp], #4
	bx	lr
	.size	GPDMA_CreateLLI, .-GPDMA_CreateLLI
	.section	.text.GPDMA_CtrlWrd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPDMA_CtrlWrd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPDMA_CtrlWrd, %function
GPDMA_CtrlWrd:
	@ args = 36, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	ldrb	r4, [sp, #44]	@ zero_extendqisi2
	ldrb	r5, [sp, #40]	@ zero_extendqisi2
	ldrb	r6, [sp, #36]	@ zero_extendqisi2
	lsls	r4, r4, #31
	orr	r4, r4, r5, lsl #30
	ldrb	r5, [sp, #32]	@ zero_extendqisi2
	orr	r4, r4, r6, lsl #29
	ldrb	r6, [sp, #28]	@ zero_extendqisi2
	orr	r4, r4, r5, lsl #28
	ldrb	r5, [sp, #24]	@ zero_extendqisi2
	orr	r4, r4, r6, lsl #27
	ldrb	r6, [sp, #20]	@ zero_extendqisi2
	orr	r4, r4, r5, lsl #26
	ldrb	r5, [sp, #16]	@ zero_extendqisi2
	orr	r4, r4, r6, lsl #25
	orr	r4, r4, r5, lsl #24
	ldrb	r5, [sp, #12]	@ zero_extendqisi2
	orrs	r0, r0, r4
	orr	r0, r0, r5, lsl #21
	orr	r0, r0, r3, lsl #18
	orr	r0, r0, r2, lsl #15
	orr	r0, r0, r1, lsl #12
	pop	{r4, r5, r6}
	bx	lr
	.size	GPDMA_CtrlWrd, .-GPDMA_CtrlWrd
	.section	.text.GPDMA_clearTerminalCountInterrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPDMA_clearTerminalCountInterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPDMA_clearTerminalCountInterrupt, %function
GPDMA_clearTerminalCountInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L7
	movs	r3, #1
	lsl	r0, r3, r0
	ldr	r3, [r2, #8]
	and	r0, r0, #7
	orrs	r0, r0, r3
	str	r0, [r2, #8]
	bx	lr
.L8:
	.align	2
.L7:
	.word	1073750016
	.size	GPDMA_clearTerminalCountInterrupt, .-GPDMA_clearTerminalCountInterrupt
	.section	.text.GPDMA_init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPDMA_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPDMA_init, %function
GPDMA_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	movs	r2, #1
	str	r2, [r3, #48]
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073750016
	.size	GPDMA_init, .-GPDMA_init
	.section	.text.GPDMA_deInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPDMA_deInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPDMA_deInit, %function
GPDMA_deInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L13
	ldr	r3, [r2, #48]
	bic	r3, r3, #1
	str	r3, [r2, #48]
	bx	lr
.L14:
	.align	2
.L13:
	.word	1073750016
	.size	GPDMA_deInit, .-GPDMA_deInit
	.section	.text.GPDMA_configChannel,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPDMA_configChannel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPDMA_configChannel, %function
GPDMA_configChannel:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	ldr	r5, .L17
	movs	r7, #1
	str	r7, [r5, #48]
	lsls	r4, r0, #5
	ldr	r6, [r5, #8]
	add	ip, r4, #1073741824
	add	ip, ip, #8192
	add	r4, r4, r5
	lsls	r7, r7, r0
	bic	r3, r3, #2
	orrs	r7, r7, r6
	str	r7, [r5, #8]
	str	r1, [ip, #256]
	str	r2, [ip, #260]
	str	r3, [r4, #264]
	ldr	r3, [sp, #16]
	str	r3, [r4, #268]
	ldr	r3, [sp, #20]
	str	r3, [r4, #272]
	pop	{r4, r5, r6, r7}
	bx	lr
.L18:
	.align	2
.L17:
	.word	1073750016
	.size	GPDMA_configChannel, .-GPDMA_configChannel
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

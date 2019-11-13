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
	.file	"ccu_peripheral.c"
	.text
	.section	.text.CCU_clockEnable,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	CCU_clockEnable
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	CCU_clockEnable, %function
CCU_clockEnable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #322
	bcc	.L2
	ldr	r3, .L5
	lsls	r0, r0, #3
	add	r3, r3, r0
	ldr	r2, [r3]
	orr	r2, r2, #1
	str	r2, [r3]
	bx	lr
.L2:
	lsls	r0, r0, #3
	add	r0, r0, #1073741824
	add	r0, r0, #331776
	ldr	r3, [r0, #256]
	orr	r3, r3, #1
	str	r3, [r0, #256]
	bx	lr
.L6:
	.align	2
.L5:
	.word	1074075376
	.size	CCU_clockEnable, .-CCU_clockEnable
	.section	.text.CCU_enableTimerClock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	CCU_enableTimerClock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	CCU_enableTimerClock, %function
CCU_enableTimerClock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #3
	mov	r3, #0
	itt	ls
	ldrls	r3, .L9
	ldrhls	r3, [r3, r0, lsl #1]
	lsls	r3, r3, #3
	add	r3, r3, #1073741824
	add	r3, r3, #331776
	ldr	r2, [r3, #256]
	orr	r2, r2, #1
	str	r2, [r3, #256]
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	CCU_enableTimerClock, .-CCU_enableTimerClock
	.section	.rodata.CSWTCH.0,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.0, %object
	.size	CSWTCH.0, 8
CSWTCH.0:
	.short	132
	.short	133
	.short	163
	.short	164
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

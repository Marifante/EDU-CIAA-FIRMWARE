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
	.file	"creg_peripheral.c"
	.text
	.section	.text.CREG_configDMAmux,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	CREG_configDMAmux
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	CREG_configDMAmux, %function
CREG_configDMAmux:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #27
	beq	.L5
	movs	r0, #0
	bx	lr
.L5:
	ldr	r2, .L6
	ldr	r3, [r2, #284]
	bic	r3, r3, #-1073741824
	str	r3, [r2, #284]
	movs	r0, #15
	bx	lr
.L7:
	.align	2
.L6:
	.word	1074016256
	.size	CREG_configDMAmux, .-CREG_configDMAmux
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

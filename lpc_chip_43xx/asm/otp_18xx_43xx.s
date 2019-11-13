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
	.file	"otp_18xx_43xx.c"
	.text
	.section	.text.Chip_OTP_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_OTP_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_OTP_Init, %function
Chip_OTP_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L4
	ldr	r2, .L4+4
	ldr	r3, [r3]
	ldr	r1, .L4+8
	ldr	r0, .L4+12
	push	{r4, r5}
	ldr	r5, [r3, #4]
	ldr	r4, .L4+16
	str	r5, [r2]
	ldr	r5, [r3, #8]
	str	r5, [r4]
	ldr	r5, [r3, #12]
	str	r5, [r1]
	ldr	r2, .L4+20
	ldr	r5, [r3, #32]
	str	r5, [r0]
	ldr	r4, .L4+24
	ldr	r5, [r3, #36]
	str	r5, [r2]
	ldr	r5, [r3, #40]
	str	r5, [r4]
	ldrd	r5, r4, [r3, #44]
	ldr	r1, .L4+28
	ldr	r0, .L4+32
	ldr	r2, .L4+36
	str	r5, [r1]
	str	r4, [r0]
	ldr	r1, [r3, #52]
	ldr	r3, [r3]
	str	r1, [r2]
	pop	{r4, r5}
	bx	r3
.L5:
	.align	2
.L4:
	.word	272630020
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LANCHOR3
	.word	.LANCHOR1
	.word	.LANCHOR4
	.word	.LANCHOR5
	.word	.LANCHOR6
	.word	.LANCHOR7
	.word	.LANCHOR8
	.size	Chip_OTP_Init, .-Chip_OTP_Init
	.section	.text.Chip_OTP_ProgBootSrc,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_OTP_ProgBootSrc
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_OTP_ProgBootSrc, %function
Chip_OTP_ProgBootSrc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	ldr	r3, [r3]
	bx	r3
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	Chip_OTP_ProgBootSrc, .-Chip_OTP_ProgBootSrc
	.section	.text.Chip_OTP_ProgJTAGDis,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_OTP_ProgJTAGDis
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_OTP_ProgJTAGDis, %function
Chip_OTP_ProgJTAGDis:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldr	r3, [r3]
	bx	r3
.L11:
	.align	2
.L10:
	.word	.LANCHOR1
	.size	Chip_OTP_ProgJTAGDis, .-Chip_OTP_ProgJTAGDis
	.section	.text.Chip_OTP_ProgUSBID,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_OTP_ProgUSBID
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_OTP_ProgUSBID, %function
Chip_OTP_ProgUSBID:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldr	r3, [r3]
	bx	r3
.L14:
	.align	2
.L13:
	.word	.LANCHOR2
	.size	Chip_OTP_ProgUSBID, .-Chip_OTP_ProgUSBID
	.section	.text.Chip_OTP_ProgGPWord,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_OTP_ProgGPWord
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_OTP_ProgGPWord, %function
Chip_OTP_ProgGPWord:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	push	{r4}
	mov	r3, r1
	beq	.L16
	cmp	r0, #2
	beq	.L17
	ldr	r4, .L22
	mov	r0, r3
	mov	r1, r2
	ldr	r3, [r4]
	ldr	r4, [sp], #4
	bx	r3
.L16:
	ldr	r4, .L22+4
	mov	r0, r3
	mov	r1, r2
	ldr	r3, [r4]
	ldr	r4, [sp], #4
	bx	r3
.L17:
	ldr	r4, .L22+8
	mov	r0, r3
	mov	r1, r2
	ldr	r3, [r4]
	ldr	r4, [sp], #4
	bx	r3
.L23:
	.align	2
.L22:
	.word	.LANCHOR3
	.word	.LANCHOR4
	.word	.LANCHOR5
	.size	Chip_OTP_ProgGPWord, .-Chip_OTP_ProgGPWord
	.section	.text.Chip_OTP_ProgKey,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_OTP_ProgKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_OTP_ProgKey, %function
Chip_OTP_ProgKey:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L25
	ldr	r3, .L26
	mov	r0, r1
	ldr	r3, [r3]
	bx	r3
.L25:
	ldr	r3, .L26+4
	mov	r0, r1
	ldr	r3, [r3]
	bx	r3
.L27:
	.align	2
.L26:
	.word	.LANCHOR7
	.word	.LANCHOR6
	.size	Chip_OTP_ProgKey, .-Chip_OTP_ProgKey
	.section	.text.Chip_OTP_GenRand,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_OTP_GenRand
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_OTP_GenRand, %function
Chip_OTP_GenRand:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldr	r3, [r3]
	bx	r3
.L30:
	.align	2
.L29:
	.word	.LANCHOR8
	.size	Chip_OTP_GenRand, .-Chip_OTP_GenRand
	.section	.bss.Otp_GenRand,"aw",%nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	Otp_GenRand, %object
	.size	Otp_GenRand, 4
Otp_GenRand:
	.space	4
	.section	.bss.Otp_ProgBootSrc,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	Otp_ProgBootSrc, %object
	.size	Otp_ProgBootSrc, 4
Otp_ProgBootSrc:
	.space	4
	.section	.bss.Otp_ProgGP0,"aw",%nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	Otp_ProgGP0, %object
	.size	Otp_ProgGP0, 4
Otp_ProgGP0:
	.space	4
	.section	.bss.Otp_ProgGP1,"aw",%nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	Otp_ProgGP1, %object
	.size	Otp_ProgGP1, 4
Otp_ProgGP1:
	.space	4
	.section	.bss.Otp_ProgGP2,"aw",%nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	Otp_ProgGP2, %object
	.size	Otp_ProgGP2, 4
Otp_ProgGP2:
	.space	4
	.section	.bss.Otp_ProgJTAGDis,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	Otp_ProgJTAGDis, %object
	.size	Otp_ProgJTAGDis, 4
Otp_ProgJTAGDis:
	.space	4
	.section	.bss.Otp_ProgKey1,"aw",%nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	Otp_ProgKey1, %object
	.size	Otp_ProgKey1, 4
Otp_ProgKey1:
	.space	4
	.section	.bss.Otp_ProgKey2,"aw",%nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	Otp_ProgKey2, %object
	.size	Otp_ProgKey2, 4
Otp_ProgKey2:
	.space	4
	.section	.bss.Otp_ProgUSBID,"aw",%nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	Otp_ProgUSBID, %object
	.size	Otp_ProgUSBID, 4
Otp_ProgUSBID:
	.space	4
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

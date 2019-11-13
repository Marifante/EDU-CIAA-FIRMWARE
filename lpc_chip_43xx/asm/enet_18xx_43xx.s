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
	.file	"enet_18xx_43xx.c"
	.text
	.section	.text.Chip_ENET_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ENET_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ENET_Init, %function
Chip_ENET_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	movs	r3, #1
	mov	r2, r3
	mov	r4, r0
	mov	r5, r1
	movs	r0, #100
	mov	r1, r3
	bl	Chip_Clock_EnableOpts
	ldr	r2, .L14
	mov	r3, #4194304
	str	r3, [r2, #256]
.L2:
	ldr	r3, [r2, #336]
	lsls	r3, r3, #9
	bpl	.L2
	ldr	r3, .L14+4
	ldr	r1, .L14+8
	ldr	r3, [r3]
	add	r2, r4, #4096
	umull	r1, r3, r1, r3
	lsrs	r3, r3, #18
	ldr	r1, [r2]
	sub	r0, r3, #20
	orr	r1, r1, #1
	cmp	r0, #14
	str	r1, [r2]
	bls	.L4
	sub	r1, r3, #35
	cmp	r1, #24
	bls	.L5
	sub	r1, r3, #60
	cmp	r1, #39
	bls	.L6
	sub	r1, r3, #100
	cmp	r1, #49
	bls	.L7
	sub	r1, r3, #150
	cmp	r1, #99
	bls	.L8
	subs	r3, r3, #250
	cmp	r3, #49
	ite	hi
	movhi	r0, #0
	movls	r0, #20
.L3:
	ldr	r1, .L14+12
	str	r1, [r2]
	movw	r3, #4120
	ldr	r2, .L14+16
	str	r2, [r4]
	ldr	r1, .L14+20
	str	r1, [r4, #4]
	mov	r2, #1048576
	str	r2, [r4, r3]
	lsls	r5, r5, #11
	ldr	r2, [r4, r3]
	ldr	r1, .L14+24
	and	r5, r5, #522240
	orr	r2, r2, #8
	orrs	r5, r5, r0
	movw	r0, #4116
	str	r2, [r4, r3]
	ldr	r2, .L14+28
	str	r2, [r4, r0]
	movw	r3, #4124
	movs	r2, #0
	str	r2, [r4, r3]
	str	r5, [r1]
	pop	{r3, r4, r5, pc}
.L6:
	movs	r0, #0
	b	.L3
.L4:
	movs	r0, #8
	b	.L3
.L5:
	movs	r0, #12
	b	.L3
.L7:
	movs	r0, #4
	b	.L3
.L8:
	movs	r0, #16
	b	.L3
.L15:
	.align	2
.L14:
	.word	1074081792
	.word	SystemCoreClock
	.word	1125899907
	.word	131456
	.word	453632
	.word	-2147483647
	.word	.LANCHOR0
	.word	124927
	.size	Chip_ENET_Init, .-Chip_ENET_Init
	.section	.text.Chip_ENET_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ENET_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ENET_DeInit, %function
Chip_ENET_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	movw	r2, #4120
	push	{r4}
	movs	r1, #0
	mov	r4, #1048576
	str	r1, [r0]
	str	r4, [r3, r2]
	movs	r0, #100
	str	r1, [r3, r2]
	ldr	r4, [sp], #4
	b	Chip_Clock_Disable
	.size	Chip_ENET_DeInit, .-Chip_ENET_DeInit
	.section	.text.Chip_ENET_SetupMII,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ENET_SetupMII
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ENET_SetupMII, %function
Chip_ENET_SetupMII:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r1, r1, #2
	ldr	r3, .L19
	orr	r2, r1, r2, lsl #11
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	Chip_ENET_SetupMII, .-Chip_ENET_SetupMII
	.section	.text.Chip_ENET_StartMIIWrite,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ENET_StartMIIWrite
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ENET_StartMIIWrite, %function
Chip_ENET_StartMIIWrite:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L22
	ldr	r3, [r3]
	orr	r1, r3, r1, lsl #6
	orr	r1, r1, #2
	str	r1, [r0, #16]
	str	r2, [r0, #20]
	ldr	r3, [r0, #16]
	orr	r3, r3, #1
	str	r3, [r0, #16]
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.size	Chip_ENET_StartMIIWrite, .-Chip_ENET_StartMIIWrite
	.section	.text.Chip_ENET_StartMIIRead,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ENET_StartMIIRead
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ENET_StartMIIRead, %function
Chip_ENET_StartMIIRead:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L25
	ldr	r3, [r3]
	orr	r1, r3, r1, lsl #6
	str	r1, [r0, #16]
	ldr	r3, [r0, #16]
	orr	r3, r3, #1
	str	r3, [r0, #16]
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.size	Chip_ENET_StartMIIRead, .-Chip_ENET_StartMIIRead
	.section	.text.Chip_ENET_SetDuplex,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ENET_SetDuplex
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ENET_SetDuplex, %function
Chip_ENET_SetDuplex:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	cbz	r1, .L28
	orr	r3, r3, #2048
	str	r3, [r0]
	bx	lr
.L28:
	bic	r3, r3, #2048
	str	r3, [r0]
	bx	lr
	.size	Chip_ENET_SetDuplex, .-Chip_ENET_SetDuplex
	.section	.text.Chip_ENET_SetSpeed,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_ENET_SetSpeed
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_ENET_SetSpeed, %function
Chip_ENET_SetSpeed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	cbz	r1, .L31
	orr	r3, r3, #16384
	str	r3, [r0]
	bx	lr
.L31:
	bic	r3, r3, #16384
	str	r3, [r0]
	bx	lr
	.size	Chip_ENET_SetSpeed, .-Chip_ENET_SetSpeed
	.section	.bss.phyCfg,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	phyCfg, %object
	.size	phyCfg, 4
phyCfg:
	.space	4
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

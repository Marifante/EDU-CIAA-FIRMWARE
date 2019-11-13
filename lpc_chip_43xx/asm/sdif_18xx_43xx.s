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
	.file	"sdif_18xx_43xx.c"
	.text
	.section	.text.Chip_SDIF_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDIF_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDIF_Init, %function
Chip_SDIF_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #1
	mov	r2, r3
	push	{r4, lr}
	mov	r1, r3
	mov	r4, r0
	movs	r0, #103
	bl	Chip_Clock_EnableOpts
	movs	r2, #1
	movs	r3, #7
	str	r2, [r4, #128]
	str	r3, [r4]
.L2:
	ldr	r3, [r4]
	ands	r3, r3, #7
	bne	.L2
	ldr	r2, .L6
	str	r2, [r4]
	ldr	r0, .L6+4
	str	r3, [r4, #36]
	mov	r2, #-1
	mov	r1, #400
	str	r2, [r4, #68]
	str	r2, [r4, #20]
	str	r0, [r4, #76]
	str	r1, [r4, #128]
	str	r3, [r4, #16]
	str	r3, [r4, #12]
	pop	{r4, pc}
.L7:
	.align	2
.L6:
	.word	33554448
	.word	269418512
	.size	Chip_SDIF_Init, .-Chip_SDIF_Init
	.section	.text.Chip_SDIF_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDIF_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDIF_DeInit, %function
Chip_SDIF_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #103
	b	Chip_Clock_Disable
	.size	Chip_SDIF_DeInit, .-Chip_SDIF_DeInit
	.section	.text.Chip_SDIF_SendCmd,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDIF_SendCmd
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDIF_SendCmd, %function
Chip_SDIF_SendCmd:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	sub	sp, sp, #12
	orr	r1, r1, #-2147483648
	movs	r4, #50
	str	r4, [sp]
	str	r2, [r0, #40]
	str	r1, [r0, #44]
	ldr	r3, [sp]
	subs	r3, r3, #1
	movw	r2, #18000
	str	r3, [sp]
	cbz	r3, .L14
.L21:
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bge	.L14
	ldr	r3, [sp]
	lsls	r3, r3, #31
	ite	mi
	strmi	r4, [sp, #4]
	strpl	r2, [sp, #4]
.L13:
	ldr	r3, [sp, #4]
	subs	r3, r3, #1
	cmp	r3, #1
	str	r3, [sp, #4]
	bgt	.L13
	ldr	r3, [sp]
	subs	r3, r3, #1
	str	r3, [sp]
	cmp	r3, #0
	bne	.L21
.L14:
	ldr	r0, [sp]
	cmp	r0, #0
	ite	gt
	movgt	r0, #0
	movle	r0, #1
	add	sp, sp, #12
	@ sp needed
	ldr	r4, [sp], #4
	bx	lr
	.size	Chip_SDIF_SendCmd, .-Chip_SDIF_SendCmd
	.section	.text.Chip_SDIF_GetResponse,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDIF_GetResponse
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDIF_GetResponse, %function
Chip_SDIF_GetResponse:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #48]
	str	r3, [r1]
	ldr	r3, [r0, #52]
	str	r3, [r1, #4]
	ldr	r3, [r0, #56]
	str	r3, [r1, #8]
	ldr	r3, [r0, #60]
	str	r3, [r1, #12]
	bx	lr
	.size	Chip_SDIF_GetResponse, .-Chip_SDIF_GetResponse
	.section	.text.Chip_SDIF_SetClock,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDIF_SetClock
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDIF_SetClock, %function
Chip_SDIF_SetClock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	udiv	r5, r1, r2
	ldr	r3, [r0, #8]
	adds	r5, r5, #2
	lsrs	r5, r5, #1
	cmp	r3, r5
	bne	.L24
	ldr	r3, [r0, #16]
	cbnz	r3, .L23
.L24:
	mov	r4, r0
	movs	r6, #0
	str	r6, [r0, #16]
	mov	r2, r6
	str	r6, [r0, #12]
	ldr	r1, .L27
	bl	Chip_SDIF_SendCmd
	mov	r2, r6
	str	r5, [r4, #8]
	ldr	r1, .L27
	mov	r0, r4
	bl	Chip_SDIF_SendCmd
	movs	r3, #1
	mov	r2, r6
	str	r3, [r4, #16]
	mov	r0, r4
	ldr	r1, .L27
	pop	{r4, r5, r6, lr}
	b	Chip_SDIF_SendCmd
.L23:
	pop	{r4, r5, r6, pc}
.L28:
	.align	2
.L27:
	.word	2105344
	.size	Chip_SDIF_SetClock, .-Chip_SDIF_SetClock
	.section	.text.Chip_SDIF_SetClearIntFifo,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDIF_SetClearIntFifo
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDIF_SetClearIntFifo, %function
Chip_SDIF_SetClearIntFifo:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	orr	r3, r3, #2
	str	r3, [r0]
.L30:
	ldr	r3, [r0]
	lsls	r3, r3, #30
	bmi	.L30
	mov	r3, #-1
	str	r3, [r0, #68]
	bx	lr
	.size	Chip_SDIF_SetClearIntFifo, .-Chip_SDIF_SetClearIntFifo
	.section	.text.Chip_SDIF_DmaSetup,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_SDIF_DmaSetup
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_SDIF_DmaSetup, %function
Chip_SDIF_DmaSetup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	ldr	r0, [r0]
	orr	r0, r0, #6
	str	r0, [r8]
.L33:
	ldr	r4, [r8]
	ands	r4, r4, #4
	bne	.L33
	cbz	r3, .L35
	cmp	r3, #4096
	mov	r0, r3
	ldr	r5, .L41
	it	cs
	movcs	r0, #4096
	str	r0, [r1, #4]
	str	r2, [r1, #8]
	add	r2, r2, #4096
	mov	lr, r5
	subs	r3, r3, r0
	add	r6, r1, #16
	mov	r5, r2
.L37:
	lsls	r7, r4, #4
	cmp	r3, #4096
	add	r0, r4, #1
	mov	r2, r3
	add	ip, r1, r7
	orr	fp, lr, #2
	it	cs
	movcs	r2, #4096
	add	r9, r1, r0, lsl #4
	add	r10, r6, #16
	cbnz	r3, .L36
	orr	r5, lr, #4
	str	r6, [ip, #12]
	str	r5, [r1, r7]
.L35:
	str	r1, [r8, #136]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L36:
	str	r6, [ip, #12]
	subs	r3, r3, r2
	str	fp, [r1, r7]
	mov	r4, r0
	str	r2, [ip, #20]
	mov	r6, r10
	str	r5, [r9, #8]
	ldr	lr, .L41+4
	add	r5, r5, #4096
	b	.L37
.L42:
	.align	2
.L41:
	.word	-2147483624
	.word	-2147483632
	.size	Chip_SDIF_DmaSetup, .-Chip_SDIF_DmaSetup
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"ring_buffer.c"
	.text
	.section	.text.RingBuffer_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	RingBuffer_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	RingBuffer_Init, %function
RingBuffer_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	movs	r4, #0
	strd	r4, r4, [r0, #12]
	strd	r1, r3, [r0]
	str	r2, [r0, #8]
	ldr	r4, [sp], #4
	movs	r0, #1
	bx	lr
	.size	RingBuffer_Init, .-RingBuffer_Init
	.section	.text.RingBuffer_Insert,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	RingBuffer_Insert
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	RingBuffer_Insert, %function
RingBuffer_Insert:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r2, [r0, #12]
	ldr	r4, [r0, #16]
	ldr	r3, [r0, #4]
	subs	r2, r2, r4
	cmp	r2, r3
	blt	.L8
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L8:
	mov	r4, r0
	ldr	r5, [r0, #12]
	ldr	r2, [r4, #8]
	ldr	r0, [r0]
	subs	r3, r3, #1
	ands	r3, r3, r5
	mla	r0, r2, r3, r0
	bl	memcpy
	ldr	r3, [r4, #12]
	adds	r3, r3, #1
	str	r3, [r4, #12]
	movs	r0, #1
	pop	{r3, r4, r5, pc}
	.size	RingBuffer_Insert, .-RingBuffer_Insert
	.section	.text.RingBuffer_InsertMult,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	RingBuffer_InsertMult
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	RingBuffer_InsertMult, %function
RingBuffer_InsertMult:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r4, [r0, #12]
	ldr	r5, [r0, #16]
	ldr	r3, [r0, #4]
	subs	r4, r4, r5
	cmp	r4, r3
	bge	.L12
	ldr	r4, [r0, #12]
	ldr	r6, [r0, #16]
	ldr	r5, [r0, #12]
	add	lr, r3, #-1
	subs	r4, r4, r6
	subs	r4, r3, r4
	and	lr, lr, r5
	add	r5, r4, lr
	cmp	r5, r3
	ittte	cs
	subcs	r3, r3, lr
	subcs	ip, r4, r3
	movcs	r4, r3
	movcc	ip, #0
	cmp	r4, r2
	mov	r6, r0
	it	ge
	movge	r4, r2
	mov	r7, r1
	ldr	r1, [r0, #8]
	ldr	r0, [r0]
	subs	r5, r2, r4
	cmp	r5, ip
	mla	r0, lr, r1, r0
	mul	r2, r4, r1
	mov	r1, r7
	it	ge
	movge	r5, ip
	bl	memcpy
	ldrd	r3, ip, [r6, #4]
	ldr	r2, [r6, #12]
	subs	r3, r3, #1
	adds	r0, r4, r2
	ands	r3, r3, r0
	str	r0, [r6, #12]
	ldr	r0, [r6]
	mla	r1, r4, ip, r7
	mla	r0, ip, r3, r0
	mul	r2, r5, ip
	bl	memcpy
	ldr	r3, [r6, #12]
	add	r3, r3, r5
	adds	r0, r4, r5
	str	r3, [r6, #12]
	pop	{r3, r4, r5, r6, r7, pc}
.L12:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
	.size	RingBuffer_InsertMult, .-RingBuffer_InsertMult
	.section	.text.RingBuffer_Pop,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	RingBuffer_Pop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	RingBuffer_Pop, %function
RingBuffer_Pop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #12]
	push	{r3, r4, r5, lr}
	ldr	r3, [r0, #16]
	cmp	r2, r3
	beq	.L17
	mov	r4, r0
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #16]
	ldr	r5, [r4]
	ldr	r2, [r4, #8]
	subs	r3, r3, #1
	ands	r3, r3, r0
	mov	r0, r1
	mla	r1, r2, r3, r5
	bl	memcpy
	ldr	r3, [r4, #16]
	adds	r3, r3, #1
	str	r3, [r4, #16]
	movs	r0, #1
	pop	{r3, r4, r5, pc}
.L17:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.size	RingBuffer_Pop, .-RingBuffer_Pop
	.section	.text.RingBuffer_PopMult,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	RingBuffer_PopMult
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	RingBuffer_PopMult, %function
RingBuffer_PopMult:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r4, [r0, #12]
	ldr	r3, [r0, #16]
	cmp	r4, r3
	beq	.L22
	ldr	r4, [r0, #4]
	ldr	r5, [r0, #12]
	ldr	r3, [r0, #16]
	ldr	r6, [r0, #16]
	subs	r7, r4, #1
	subs	r5, r5, r6
	ands	r3, r3, r7
	adds	r6, r3, r5
	cmp	r6, r4
	ittt	cs
	subcs	r4, r4, r3
	subcs	ip, r5, r4
	movcs	r5, r4
	mov	r4, r0
	it	cc
	movcc	ip, #0
	cmp	r5, r2
	it	ge
	movge	r5, r2
	mov	r7, r1
	ldr	r0, [r0, #8]
	ldr	r1, [r4]
	subs	r6, r2, r5
	cmp	r6, ip
	mla	r1, r3, r0, r1
	mul	r2, r5, r0
	mov	r0, r7
	it	ge
	movge	r6, ip
	bl	memcpy
	ldrd	r3, ip, [r4, #4]
	ldr	r2, [r4, #16]
	subs	r3, r3, #1
	adds	r1, r5, r2
	ands	r3, r3, r1
	str	r1, [r4, #16]
	ldr	r1, [r4]
	mla	r0, r5, ip, r7
	mla	r1, ip, r3, r1
	mul	r2, r6, ip
	bl	memcpy
	ldr	r3, [r4, #16]
	add	r3, r3, r6
	adds	r0, r5, r6
	str	r3, [r4, #16]
	pop	{r3, r4, r5, r6, r7, pc}
.L22:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
	.size	RingBuffer_PopMult, .-RingBuffer_PopMult
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

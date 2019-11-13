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
	.file	"interrupts_board.c"
	.text
	.section	.text.configTecInterrupts,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	configTecInterrupts
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	configTecInterrupts, %function
configTecInterrupts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r4, r1
	mov	r5, r2
	ldrb	r1, [r0, #1]	@ zero_extendqisi2
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	mov	r0, r4
	bl	SCU_GPIOIntPinSel
	mov	r0, r4
	bl	setEdgeDetectionGPIOInterrupt
	cmp	r5, #1
	beq	.L14
	cbz	r5, .L3
	cmp	r5, #2
	bne	.L1
	mov	r0, r4
	bl	setRiseEdgeGPIOInterrupt
.L14:
	mov	r0, r4
	bl	setFallEdgeGPIOInterrupt
.L7:
	cmp	r4, #3
	bhi	.L1
	tbb	[pc, r4]
.L9:
	.byte	(.L12-.L9)/2
	.byte	(.L11-.L9)/2
	.byte	(.L10-.L9)/2
	.byte	(.L8-.L9)/2
	.p2align 1
.L1:
	pop	{r3, r4, r5, pc}
.L3:
	mov	r0, r4
	bl	setRiseEdgeGPIOInterrupt
	b	.L7
.L8:
	movs	r0, #35
	pop	{r3, r4, r5, lr}
	b	NVIC_EnaIRQ
.L12:
	movs	r0, #32
	pop	{r3, r4, r5, lr}
	b	NVIC_EnaIRQ
.L11:
	movs	r0, #33
	pop	{r3, r4, r5, lr}
	b	NVIC_EnaIRQ
.L10:
	movs	r0, #34
	pop	{r3, r4, r5, lr}
	b	NVIC_EnaIRQ
	.size	configTecInterrupts, .-configTecInterrupts
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

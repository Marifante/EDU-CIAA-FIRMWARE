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
	.file	"gpio_board.c"
	.text
	.section	.text.GPIOBoard_fillGPIOStruct,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIOBoard_fillGPIOStruct
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIOBoard_fillGPIOStruct, %function
GPIOBoard_fillGPIOStruct:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	cmp	r0, #13
	bhi	.L1
	tbb	[pc, r0]
.L4:
	.byte	(.L17-.L4)/2
	.byte	(.L16-.L4)/2
	.byte	(.L15-.L4)/2
	.byte	(.L14-.L4)/2
	.byte	(.L13-.L4)/2
	.byte	(.L12-.L4)/2
	.byte	(.L11-.L4)/2
	.byte	(.L10-.L4)/2
	.byte	(.L9-.L4)/2
	.byte	(.L8-.L4)/2
	.byte	(.L7-.L4)/2
	.byte	(.L6-.L4)/2
	.byte	(.L5-.L4)/2
	.byte	(.L3-.L4)/2
	.p2align 1
.L17:
	movs	r4, #5
	movs	r3, #0
.L19:
	movs	r0, #4
.L22:
	movs	r2, #2
	strb	r4, [r1, #1]
	strb	r3, [r1, #2]
	strb	r3, [r1, #5]
	strb	r0, [r1, #3]
	strb	r2, [r1, #4]
.L1:
	pop	{r4, r5}
	bx	lr
.L3:
	movs	r5, #5
	movs	r4, #15
	movs	r0, #4
	movs	r2, #6
	movs	r3, #7
.L20:
	strb	r5, [r1, #1]
	strb	r4, [r1, #2]
	strb	r0, [r1, #3]
	strb	r2, [r1, #4]
	strb	r3, [r1, #5]
	pop	{r4, r5}
	bx	lr
.L16:
	movs	r4, #5
	movs	r3, #1
	b	.L19
.L15:
	movs	r3, #2
	movs	r0, #5
	movs	r2, #4
	strb	r0, [r1, #1]
	strb	r3, [r1, #2]
	strb	r3, [r1, #4]
	strb	r3, [r1, #5]
	strb	r2, [r1, #3]
	b	.L1
.L14:
	movs	r3, #0
	movs	r4, #14
	movs	r0, #2
	movs	r2, #11
.L21:
	strb	r4, [r1, #2]
	strb	r3, [r1, #1]
	strb	r3, [r1, #3]
	strb	r0, [r1, #4]
	strb	r2, [r1, #5]
	pop	{r4, r5}
	bx	lr
.L13:
	movs	r4, #1
	movs	r3, #11
	movs	r0, #0
	b	.L22
.L12:
	movs	r4, #1
	movs	r3, #12
	movs	r0, #0
	b	.L22
.L11:
	movs	r3, #0
	movs	r0, #4
	movs	r2, #1
	strb	r3, [r1, #1]
	strb	r3, [r1, #3]
	strb	r3, [r1, #5]
	strb	r0, [r1, #2]
	strb	r2, [r1, #4]
	b	.L1
.L10:
	movs	r2, #0
	movs	r3, #1
	movs	r0, #8
	strb	r2, [r1, #1]
	strb	r2, [r1, #3]
	strb	r0, [r1, #2]
	strb	r3, [r1, #4]
	strb	r3, [r1, #5]
	b	.L1
.L9:
	movs	r3, #0
	movs	r4, #9
	movs	r0, #1
	movs	r2, #2
	b	.L21
.L8:
	movs	r3, #1
	movs	r4, #9
	movs	r0, #0
	movs	r2, #6
	strb	r3, [r1, #1]
	strb	r3, [r1, #4]
	strb	r4, [r1, #2]
	strb	r0, [r1, #3]
	strb	r2, [r1, #5]
	b	.L1
.L7:
	movs	r3, #0
	movs	r4, #3
	movs	r0, #6
	movs	r2, #1
	strb	r4, [r1, #1]
	strb	r3, [r1, #2]
	strb	r3, [r1, #3]
	strb	r0, [r1, #4]
	strb	r2, [r1, #5]
	b	.L1
.L6:
	movs	r3, #3
	movs	r4, #0
	movs	r0, #6
	movs	r2, #4
	strb	r3, [r1, #1]
	strb	r3, [r1, #2]
	strb	r4, [r1, #3]
	strb	r0, [r1, #4]
	strb	r2, [r1, #5]
	b	.L1
.L5:
	movs	r5, #3
	movs	r4, #4
	movs	r0, #0
	movs	r2, #6
	movs	r3, #5
	b	.L20
	.size	GPIOBoard_fillGPIOStruct, .-GPIOBoard_fillGPIOStruct
	.section	.text.configGpio,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	configGpio
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	configGpio, %function
configGpio:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	strb	r0, [r1]
	mov	r4, r1
	mov	r5, r0
	mov	r6, r2
	bl	GPIOBoard_fillGPIOStruct
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	ldrb	r2, [r1, #3]	@ zero_extendqisi2
	ldrb	r1, [r1, #5]	@ zero_extendqisi2
	bl	SCU_SetPinFunc
	cmp	r5, #5
	bls	.L29
	cmp	r5, #9
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	bls	.L30
	cmp	r6, #1
	beq	.L31
	pop	{r4, r5, r6, lr}
	b	GPIO_SetPinDIRInput
.L30:
	bl	GPIO_SetPinDIRInput
	ldrb	r1, [r4, #5]	@ zero_extendqisi2
	ldrb	r0, [r4, #4]	@ zero_extendqisi2
	pop	{r4, r5, r6, lr}
	b	SCU_activateInputBuffer
.L29:
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	pop	{r4, r5, r6, lr}
	b	GPIO_SetPinDIROutput
.L31:
	pop	{r4, r5, r6, lr}
	b	GPIO_SetPinDIROutput
	.size	configGpio, .-configGpio
	.section	.text.readGpio,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	readGpio
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	readGpio, %function
readGpio:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	r2, [r0]	@ zero_extendqisi2
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	cmp	r2, #5
	bhi	.L33
	mov	r0, r3
	b	GPIO_GetPinSET
.L33:
	push	{r4, lr}
	mov	r4, r0
	mov	r0, r3
	bl	GPIO_GetPinBYTE
	ldrb	r2, [r4]	@ zero_extendqisi2
	cmp	r2, #9
	and	r3, r0, #1
	itt	ls
	mvnls	r0, r0
	andls	r3, r0, #1
	mov	r0, r3
	pop	{r4, pc}
	.size	readGpio, .-readGpio
	.section	.text.writeGpio,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	writeGpio
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	writeGpio, %function
writeGpio:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	cmp	r1, #1
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	mov	r1, r3
	beq	.L39
	b	GPIO_SetPinCLR
.L39:
	b	GPIO_SetPinSET
	.size	writeGpio, .-writeGpio
	.section	.text.toggleGpio,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	toggleGpio
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	toggleGpio, %function
toggleGpio:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	b	GPIO_SetPinNOT
	.size	toggleGpio, .-toggleGpio
	.section	.text.configLed,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	configLed
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	configLed, %function
configLed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r1
	movs	r2, #1
	bl	configGpio
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	ldrb	r0, [r4, #1]	@ zero_extendqisi2
	pop	{r4, lr}
	b	GPIO_SetPinCLR
	.size	configLed, .-configLed
	.section	.text.InitializateAllLeds,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	InitializateAllLeds
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	InitializateAllLeds, %function
InitializateAllLeds:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #52
	mov	r1, sp
	movs	r0, #0
	bl	configLed
	add	r1, sp, #8
	movs	r0, #1
	bl	configLed
	add	r1, sp, #16
	movs	r0, #2
	bl	configLed
	add	r1, sp, #24
	movs	r0, #3
	bl	configLed
	add	r1, sp, #32
	movs	r0, #4
	bl	configLed
	add	r1, sp, #40
	movs	r0, #5
	bl	configLed
	ldrb	r1, [sp, #2]	@ zero_extendqisi2
	ldrb	r0, [sp, #1]	@ zero_extendqisi2
	bl	GPIO_SetPinCLR
	ldrb	r1, [sp, #10]	@ zero_extendqisi2
	ldrb	r0, [sp, #9]	@ zero_extendqisi2
	bl	GPIO_SetPinCLR
	ldrb	r1, [sp, #18]	@ zero_extendqisi2
	ldrb	r0, [sp, #17]	@ zero_extendqisi2
	bl	GPIO_SetPinCLR
	ldrb	r1, [sp, #26]	@ zero_extendqisi2
	ldrb	r0, [sp, #25]	@ zero_extendqisi2
	bl	GPIO_SetPinCLR
	ldrb	r1, [sp, #34]	@ zero_extendqisi2
	ldrb	r0, [sp, #33]	@ zero_extendqisi2
	bl	GPIO_SetPinCLR
	ldrb	r1, [sp, #42]	@ zero_extendqisi2
	ldrb	r0, [sp, #41]	@ zero_extendqisi2
	bl	GPIO_SetPinCLR
	add	sp, sp, #52
	@ sp needed
	ldr	pc, [sp], #4
	.size	InitializateAllLeds, .-InitializateAllLeds
	.section	.text.checkButtonState,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	checkButtonState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	checkButtonState, %function
checkButtonState:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r0, r0, #6
	push	{r3, lr}
	cmp	r0, #3
	bhi	.L52
	tbb	[pc, r0]
.L48:
	.byte	(.L51-.L48)/2
	.byte	(.L50-.L48)/2
	.byte	(.L49-.L48)/2
	.byte	(.L47-.L48)/2
	.p2align 1
.L47:
	movs	r1, #9
	movs	r0, #1
	bl	GPIO_GetPinPIN
	movs	r0, #1
	pop	{r3, pc}
.L49:
	movs	r1, #9
	movs	r0, #0
	bl	GPIO_GetPinPIN
	movs	r0, #1
	pop	{r3, pc}
.L51:
	movs	r1, #4
	movs	r0, #0
	bl	GPIO_GetPinPIN
	ubfx	r0, r0, #4, #8
	adds	r0, r0, #-1
	it	ne
	movne	r0, #1
	pop	{r3, pc}
.L50:
	movs	r1, #8
	movs	r0, #0
	bl	GPIO_GetPinPIN
	movs	r0, #1
	pop	{r3, pc}
.L52:
	movs	r0, #255
	pop	{r3, pc}
	.size	checkButtonState, .-checkButtonState
	.section	.text.isABounce,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	isABounce
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	isABounce, %function
isABounce:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	mov	r5, r0
	bl	checkButtonState
	mov	r4, r0
	movw	r0, #10000
	bl	delay_us
	mov	r0, r5
	bl	checkButtonState
	subs	r0, r4, r0
	it	ne
	movne	r0, #1
	pop	{r3, r4, r5, pc}
	.size	isABounce, .-isABounce
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

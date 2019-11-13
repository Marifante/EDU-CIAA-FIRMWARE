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
	.file	"lcd_18xx_43xx.c"
	.text
	.section	.text.Chip_LCD_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_LCD_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_LCD_Init, %function
Chip_LCD_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	movs	r3, #1
	mov	r5, r1
	mov	r2, r3
	mov	r1, r3
	movs	r0, #99
	bl	Chip_Clock_EnableOpts
	ldr	r3, [r4, #24]
	ldrh	r0, [r5, #10]
	ldrh	r2, [r5, #4]
	ldrb	r1, [r5, #18]	@ zero_extendqisi2
	bic	r3, r3, #1
	str	r3, [r4, #24]
	ldrb	r3, [r5, #2]	@ zero_extendqisi2
	ldrb	r6, [r5, #1]	@ zero_extendqisi2
	ldrb	r7, [r5]	@ zero_extendqisi2
	subs	r3, r3, #1
	subs	r6, r6, #1
	lsls	r3, r3, #8
	lsls	r6, r6, #16
	and	r6, r6, #16711680
	uxth	r3, r3
	orrs	r3, r3, r6
	lsrs	r6, r2, #4
	subs	r6, r6, #1
	subs	r7, r7, #1
	lsls	r6, r6, #2
	orr	r3, r3, r7, lsl #24
	uxtb	r6, r6
	orrs	r3, r3, r6
	str	r3, [r4]
	ldrb	r7, [r5, #8]	@ zero_extendqisi2
	ldrb	r6, [r5, #7]	@ zero_extendqisi2
	ldrb	ip, [r5, #6]	@ zero_extendqisi2
	subs	r3, r0, #1
	subs	r7, r7, #1
	lsls	r7, r7, #10
	subs	r0, r6, #1
	add	ip, ip, #-1
	ubfx	r3, r3, #0, #10
	uxth	r6, r7
	orr	r3, r3, ip, lsl #24
	lsls	r0, r0, #16
	orrs	r3, r3, r6
	and	r0, r0, #16711680
	orrs	r3, r3, r0
	str	r3, [r4, #4]
	ldrb	r3, [r5, #12]	@ zero_extendqisi2
	ldrb	r0, [r5, #13]	@ zero_extendqisi2
	ldrb	r7, [r5, #14]	@ zero_extendqisi2
	ldrb	r6, [r5, #15]	@ zero_extendqisi2
	lsls	r3, r3, #14
	lsls	r0, r0, #13
	and	r0, r0, #8192
	and	r3, r3, #16384
	orrs	r3, r3, r0
	ldrb	r0, [r5, #16]	@ zero_extendqisi2
	lsls	r7, r7, #12
	and	r7, r7, #4096
	lsls	r6, r6, #11
	subs	r0, r0, #1
	orrs	r3, r3, r7
	and	r6, r6, #2048
	lsls	r0, r0, #6
	orrs	r3, r3, r6
	and	r0, r0, #1984
	cmp	r1, #1
	orr	r3, r3, r0
	beq	.L2
	cbz	r1, .L3
	cmp	r1, #5
	beq	.L4
	ldr	r0, .L13
	subs	r2, r2, #1
	and	r2, r0, r2, lsl #16
	orrs	r3, r3, r2
.L6:
	orr	r3, r3, #5
	movs	r2, #0
	str	r3, [r4, #8]
	ldrb	r3, [r5, #19]	@ zero_extendqisi2
	str	r2, [r4, #28]
	ldrb	r0, [r5, #17]	@ zero_extendqisi2
	ldrb	r2, [r5, #20]	@ zero_extendqisi2
	lsls	r3, r3, #8
	orr	r3, r3, r0, lsl #1
	orr	r1, r3, r1, lsl #4
	cmp	r2, #1
	it	eq
	orreq	r1, r1, #128
	str	r1, [r4, #24]
	add	r3, r4, #512
	add	r2, r4, #1024
	movs	r1, #0
.L8:
	str	r1, [r3], #4
	cmp	r2, r3
	bne	.L8
	pop	{r3, r4, r5, r6, r7, pc}
.L2:
	lsrs	r0, r2, #2
	ldr	r2, .L13
	subs	r0, r0, #1
	and	r2, r2, r0, lsl #16
	orrs	r3, r3, r2
	b	.L6
.L4:
	lsrs	r0, r2, #3
	ldr	r2, .L13
	subs	r0, r0, #1
	and	r2, r2, r0, lsl #16
	orrs	r3, r3, r2
	b	.L6
.L3:
	add	r2, r2, r2, lsl #1
	asrs	r2, r2, #3
	ldr	r0, .L13
	subs	r2, r2, #1
	and	r2, r0, r2, lsl #16
	orrs	r3, r3, r2
	b	.L6
.L14:
	.align	2
.L13:
	.word	67043328
	.size	Chip_LCD_Init, .-Chip_LCD_Init
	.section	.text.Chip_LCD_DeInit,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_LCD_DeInit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_LCD_DeInit, %function
Chip_LCD_DeInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #99
	b	Chip_Clock_Disable
	.size	Chip_LCD_DeInit, .-Chip_LCD_DeInit
	.section	.text.Chip_LCD_Cursor_Config,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_LCD_Cursor_Config
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_LCD_Cursor_Config, %function
Chip_LCD_Cursor_Config:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	it	ne
	movne	r3, #2
	ldr	r2, .L19
	it	eq
	moveq	r3, #0
	orrs	r3, r3, r1
	strb	r1, [r2]
	str	r3, [r0, #3076]
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	Chip_LCD_Cursor_Config, .-Chip_LCD_Cursor_Config
	.section	.text.Chip_LCD_Cursor_WriteImage,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_LCD_Cursor_WriteImage
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_LCD_Cursor_WriteImage, %function
Chip_LCD_Cursor_WriteImage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L27
	ldrb	r3, [r3]	@ zero_extendqisi2
	push	{r4}
	add	r0, r0, #2048
	cbnz	r3, .L24
	lsls	r1, r1, #6
	add	r4, r1, #64
.L22:
	subs	r2, r2, #4
.L23:
	adds	r1, r1, #1
	ldr	r3, [r2, #4]!
	str	r3, [r0], #4
	cmp	r1, r4
	blt	.L23
	ldr	r4, [sp], #4
	bx	lr
.L24:
	mov	r4, #256
	movs	r1, #0
	b	.L22
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.size	Chip_LCD_Cursor_WriteImage, .-Chip_LCD_Cursor_WriteImage
	.section	.text.Chip_LCD_LoadPalette,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_LCD_LoadPalette
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_LCD_LoadPalette, %function
Chip_LCD_LoadPalette:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r3, #0
	adds	r1, r1, #8
	mov	r2, r3
.L30:
	ldrb	lr, [r1, #-8]	@ zero_extendqisi2
	ldrb	ip, [r1, #-7]	@ zero_extendqisi2
	ldrb	r7, [r1, #-6]	@ zero_extendqisi2
	ldrb	r6, [r1, #-4]	@ zero_extendqisi2
	ldrb	r5, [r1, #-3]	@ zero_extendqisi2
	ldrb	r4, [r1, #-2]	@ zero_extendqisi2
	lsr	lr, lr, #3
	bfi	r3, lr, #10, #5
	lsr	ip, ip, #3
	bfi	r3, ip, #5, #5
	lsrs	r7, r7, #3
	bfi	r3, r7, #0, #5
	lsrs	r6, r6, #3
	lsrs	r5, r5, #3
	bfi	r3, r6, #26, #5
	bfi	r3, r5, #21, #5
	lsrs	r4, r4, #3
	bfi	r3, r4, #16, #5
	add	r4, r2, #256
	adds	r2, r2, #1
	uxth	r5, r3
	cmp	r2, #128
	add	r1, r1, #8
	strh	r5, [r0, r4, lsl #1]	@ movhi
	bne	.L30
	pop	{r4, r5, r6, r7, pc}
	.size	Chip_LCD_LoadPalette, .-Chip_LCD_LoadPalette
	.section	.data.LCD_Cursor_Size,"aw"
	.set	.LANCHOR0,. + 0
	.type	LCD_Cursor_Size, %object
	.size	LCD_Cursor_Size, 1
LCD_Cursor_Size:
	.byte	1
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

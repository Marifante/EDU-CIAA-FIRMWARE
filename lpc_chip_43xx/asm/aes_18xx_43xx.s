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
	.file	"aes_18xx_43xx.c"
	.text
	.section	.text.Chip_AES_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_Init, %function
Chip_AES_Init:
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
	ldr	r5, [r3, #16]
	str	r5, [r0]
	ldr	r4, .L4+24
	ldr	r5, [r3, #20]
	str	r5, [r2]
	ldr	r1, .L4+28
	ldr	r5, [r3, #24]
	str	r5, [r4]
	ldr	r0, .L4+32
	ldr	r5, [r3, #28]
	str	r5, [r1]
	ldr	r2, .L4+36
	ldr	r5, [r3, #32]
	str	r5, [r0]
	ldr	r4, .L4+40
	ldr	r5, [r3, #36]
	str	r5, [r2]
	ldr	r5, [r3, #40]
	str	r5, [r4]
	ldrd	r5, r4, [r3, #44]
	ldr	r1, .L4+44
	ldr	r0, .L4+48
	ldr	r2, .L4+52
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
	.word	272630024
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LANCHOR3
	.word	.LANCHOR1
	.word	.LANCHOR4
	.word	.LANCHOR5
	.word	.LANCHOR6
	.word	.LANCHOR7
	.word	.LANCHOR8
	.word	.LANCHOR9
	.word	.LANCHOR10
	.word	.LANCHOR11
	.word	.LANCHOR12
	.size	Chip_AES_Init, .-Chip_AES_Init
	.section	.text.Chip_AES_SetMode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_SetMode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_SetMode, %function
Chip_AES_SetMode:
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
	.size	Chip_AES_SetMode, .-Chip_AES_SetMode
	.section	.text.Chip_AES_LoadKey,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_LoadKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_LoadKey, %function
Chip_AES_LoadKey:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L10
	ldr	r3, .L11
	ldr	r3, [r3]
	bx	r3	@ indirect register sibling call
.L10:
	ldr	r3, .L11+4
	ldr	r3, [r3]
	bx	r3	@ indirect register sibling call
.L12:
	.align	2
.L11:
	.word	.LANCHOR2
	.word	.LANCHOR1
	.size	Chip_AES_LoadKey, .-Chip_AES_LoadKey
	.section	.text.Chip_AES_LoadKeyRNG,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_LoadKeyRNG
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_LoadKeyRNG, %function
Chip_AES_LoadKeyRNG:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldr	r3, [r3]
	bx	r3	@ indirect register sibling call
.L15:
	.align	2
.L14:
	.word	.LANCHOR3
	.size	Chip_AES_LoadKeyRNG, .-Chip_AES_LoadKeyRNG
	.section	.text.Chip_AES_LoadKeySW,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_LoadKeySW
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_LoadKeySW, %function
Chip_AES_LoadKeySW:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L17
	ldr	r3, [r3]
	bx	r3	@ indirect register sibling call
.L18:
	.align	2
.L17:
	.word	.LANCHOR4
	.size	Chip_AES_LoadKeySW, .-Chip_AES_LoadKeySW
	.section	.text.Chip_AES_LoadIV_SW,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_LoadIV_SW
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_LoadIV_SW, %function
Chip_AES_LoadIV_SW:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldr	r3, [r3]
	bx	r3	@ indirect register sibling call
.L21:
	.align	2
.L20:
	.word	.LANCHOR5
	.size	Chip_AES_LoadIV_SW, .-Chip_AES_LoadIV_SW
	.section	.text.Chip_AES_LoadIV_IC,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_LoadIV_IC
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_LoadIV_IC, %function
Chip_AES_LoadIV_IC:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L23
	ldr	r3, [r3]
	bx	r3	@ indirect register sibling call
.L24:
	.align	2
.L23:
	.word	.LANCHOR6
	.size	Chip_AES_LoadIV_IC, .-Chip_AES_LoadIV_IC
	.section	.text.Chip_AES_Operate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_Operate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_Operate, %function
Chip_AES_Operate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	ldr	r3, [r3]
	bx	r3
.L27:
	.align	2
.L26:
	.word	.LANCHOR7
	.size	Chip_AES_Operate, .-Chip_AES_Operate
	.section	.text.Chip_AES_ProgramKey,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_ProgramKey
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_ProgramKey, %function
Chip_AES_ProgramKey:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L29
	ldr	r3, .L30
	mov	r0, r1
	ldr	r3, [r3]
	bx	r3
.L29:
	ldr	r3, .L30+4
	mov	r0, r1
	ldr	r3, [r3]
	bx	r3
.L31:
	.align	2
.L30:
	.word	.LANCHOR9
	.word	.LANCHOR8
	.size	Chip_AES_ProgramKey, .-Chip_AES_ProgramKey
	.section	.text.Chip_AES_Config_DMA,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_Config_DMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_Config_DMA, %function
Chip_AES_Config_DMA:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldr	r3, [r3]
	bx	r3
.L34:
	.align	2
.L33:
	.word	.LANCHOR10
	.size	Chip_AES_Config_DMA, .-Chip_AES_Config_DMA
	.section	.text.Chip_AES_OperateDMA,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_OperateDMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_OperateDMA, %function
Chip_AES_OperateDMA:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	ldr	r4, .L37
	ldr	r4, [r4]
	mov	ip, r4
	ldr	r4, [sp], #4
	bx	ip
.L38:
	.align	2
.L37:
	.word	.LANCHOR11
	.size	Chip_AES_OperateDMA, .-Chip_AES_OperateDMA
	.section	.text.Chip_AES_GetStatusDMA,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_AES_GetStatusDMA
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_AES_GetStatusDMA, %function
Chip_AES_GetStatusDMA:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldr	r3, [r3]
	bx	r3
.L41:
	.align	2
.L40:
	.word	.LANCHOR12
	.size	Chip_AES_GetStatusDMA, .-Chip_AES_GetStatusDMA
	.section	.bss.aes_Config_DMA,"aw",%nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	aes_Config_DMA, %object
	.size	aes_Config_DMA, 4
aes_Config_DMA:
	.space	4
	.section	.bss.aes_Get_Status_DMA,"aw",%nobits
	.align	2
	.set	.LANCHOR12,. + 0
	.type	aes_Get_Status_DMA, %object
	.size	aes_Get_Status_DMA, 4
aes_Get_Status_DMA:
	.space	4
	.section	.bss.aes_LoadIV_IC,"aw",%nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	aes_LoadIV_IC, %object
	.size	aes_LoadIV_IC, 4
aes_LoadIV_IC:
	.space	4
	.section	.bss.aes_LoadIV_SW,"aw",%nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	aes_LoadIV_SW, %object
	.size	aes_LoadIV_SW, 4
aes_LoadIV_SW:
	.space	4
	.section	.bss.aes_LoadKey1,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	aes_LoadKey1, %object
	.size	aes_LoadKey1, 4
aes_LoadKey1:
	.space	4
	.section	.bss.aes_LoadKey2,"aw",%nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	aes_LoadKey2, %object
	.size	aes_LoadKey2, 4
aes_LoadKey2:
	.space	4
	.section	.bss.aes_LoadKeyRNG,"aw",%nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	aes_LoadKeyRNG, %object
	.size	aes_LoadKeyRNG, 4
aes_LoadKeyRNG:
	.space	4
	.section	.bss.aes_LoadKeySW,"aw",%nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	aes_LoadKeySW, %object
	.size	aes_LoadKeySW, 4
aes_LoadKeySW:
	.space	4
	.section	.bss.aes_Operate,"aw",%nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	aes_Operate, %object
	.size	aes_Operate, 4
aes_Operate:
	.space	4
	.section	.bss.aes_Operate_DMA,"aw",%nobits
	.align	2
	.set	.LANCHOR11,. + 0
	.type	aes_Operate_DMA, %object
	.size	aes_Operate_DMA, 4
aes_Operate_DMA:
	.space	4
	.section	.bss.aes_ProgramKey1,"aw",%nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	aes_ProgramKey1, %object
	.size	aes_ProgramKey1, 4
aes_ProgramKey1:
	.space	4
	.section	.bss.aes_ProgramKey2,"aw",%nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	aes_ProgramKey2, %object
	.size	aes_ProgramKey2, 4
aes_ProgramKey2:
	.space	4
	.section	.bss.aes_SetMode,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	aes_SetMode, %object
	.size	aes_SetMode, 4
aes_SetMode:
	.space	4
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

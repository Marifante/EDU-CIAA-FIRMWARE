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
	.file	"eeprom_18xx_43xx.c"
	.text
	.section	.text.Chip_EEPROM_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EEPROM_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EEPROM_Init, %function
Chip_EEPROM_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, lr}
	mov	r4, r0
	str	r3, [r0, #24]
	movs	r0, #116
	bl	Chip_Clock_GetRate
	ldr	r3, .L4
	umull	r3, r0, r3, r0
	lsrs	r0, r0, #17
	subs	r0, r0, #1
	movs	r2, #88
	movw	r3, #562
	str	r0, [r4, #20]
	str	r2, [r4, #8]
	str	r3, [r4, #16]
	pop	{r4, pc}
.L5:
	.align	2
.L4:
	.word	375299969
	.size	Chip_EEPROM_Init, .-Chip_EEPROM_Init
	.section	.text.Chip_EEPROM_EraseProgramPage,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EEPROM_EraseProgramPage
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EEPROM_EraseProgramPage, %function
Chip_EEPROM_EraseProgramPage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #6
	str	r3, [r0, #4072]
	str	r3, [r0]
.L7:
	ldr	r3, [r0, #4064]
	lsls	r3, r3, #29
	bpl	.L7
	movs	r3, #4
	str	r3, [r0, #4072]
	bx	lr
	.size	Chip_EEPROM_EraseProgramPage, .-Chip_EEPROM_EraseProgramPage
	.section	.text.Chip_EEPROM_WaitForIntStatus,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_EEPROM_WaitForIntStatus
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_EEPROM_WaitForIntStatus, %function
Chip_EEPROM_WaitForIntStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L11:
	ldr	r3, [r0, #4064]
	bics	r3, r1, r3
	bne	.L11
	str	r1, [r0, #4072]
	bx	lr
	.size	Chip_EEPROM_WaitForIntStatus, .-Chip_EEPROM_WaitForIntStatus
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

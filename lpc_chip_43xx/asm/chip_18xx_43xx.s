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
	.file	"chip_18xx_43xx.c"
	.text
	.section	.text.Chip_USB_PllSetup,"ax",%progbits
	.align	1
	.p2align 2,,3
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_USB_PllSetup, %function
Chip_USB_PllSetup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #7
	bl	Chip_Clock_GetClockInputHz
	ldr	r3, .L8
	cmp	r0, r3
	beq	.L1
	movs	r0, #6
	ldr	r2, .L8+4
	movs	r1, #0
	bl	Chip_Clock_SetupPLL
	movs	r0, #0
	bl	Chip_Clock_EnablePLL
.L3:
	movs	r0, #0
	bl	Chip_Clock_GetPLLStatus
	lsls	r3, r0, #31
	bpl	.L3
.L1:
	pop	{r3, pc}
.L9:
	.align	2
.L8:
	.word	480000000
	.word	.LANCHOR0
	.size	Chip_USB_PllSetup, .-Chip_USB_PllSetup
	.section	.text.Chip_USB0_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_USB0_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_USB0_Init, %function
Chip_USB0_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	Chip_USB_PllSetup
	movs	r3, #1
	mov	r2, r3
	mov	r0, r3
	movs	r1, #7
	bl	Chip_Clock_SetBaseClock
	movs	r0, #1
	bl	Chip_Clock_EnableBaseClock
	movs	r3, #1
	mov	r2, r3
	mov	r1, r3
	movs	r0, #101
	bl	Chip_Clock_EnableOpts
	ldr	r2, .L12
	ldr	r3, [r2, #4]
	bic	r3, r3, #32
	str	r3, [r2, #4]
	pop	{r3, pc}
.L13:
	.align	2
.L12:
	.word	1074016256
	.size	Chip_USB0_Init, .-Chip_USB0_Init
	.section	.text.Chip_USB1_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_USB1_Init
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_USB1_Init, %function
Chip_USB1_Init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	Chip_USB_PllSetup
	movs	r2, #4
	movs	r1, #7
	movs	r0, #0
	bl	Chip_Clock_SetDivider
	movs	r2, #2
	movs	r1, #12
	movs	r0, #3
	bl	Chip_Clock_SetDivider
	movs	r3, #1
	mov	r2, r3
	movs	r1, #15
	movs	r0, #3
	bl	Chip_Clock_SetBaseClock
	movs	r0, #3
	bl	Chip_Clock_EnableBaseClock
	movs	r3, #1
	mov	r2, r3
	mov	r1, r3
	movs	r0, #110
	bl	Chip_Clock_EnableOpts
	ldr	r3, .L16
	movs	r2, #18
	str	r2, [r3, #3200]
	pop	{r3, pc}
.L17:
	.align	2
.L16:
	.word	1074290688
	.size	Chip_USB1_Init, .-Chip_USB1_Init
	.section	.text.SystemCoreClockUpdate,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SystemCoreClockUpdate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #105
	bl	Chip_Clock_GetRate
	ldr	r3, .L20
	str	r0, [r3]
	pop	{r3, pc}
.L21:
	.align	2
.L20:
	.word	SystemCoreClock
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.comm	SystemCoreClock,4,4
	.section	.rodata.usbPLLSetup,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	usbPLLSetup, %object
	.size	usbPLLSetup, 20
usbPLLSetup:
	.word	24605
	.word	102137850
	.word	0
	.word	0
	.word	480000000
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

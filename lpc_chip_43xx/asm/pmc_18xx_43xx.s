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
	.file	"pmc_18xx_43xx.c"
	.text
	.section	.text.Chip_PMC_Sleep,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_PMC_Sleep
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_PMC_Sleep, %function
Chip_PMC_Sleep:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax unified
@ 338 ".\inc/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.size	Chip_PMC_Sleep, .-Chip_PMC_Sleep
	.section	.text.Chip_PMC_Set_PwrState,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_PMC_Set_PwrState
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_PMC_Set_PwrState, %function
Chip_PMC_Set_PwrState:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L4
	ldr	r3, .L4+4
	movs	r1, #4
	str	r1, [r2, #16]
	str	r0, [r3, #28]
	.syntax unified
@ 338 ".\inc/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L5:
	.align	2
.L4:
	.word	-536810240
	.word	1074012160
	.size	Chip_PMC_Set_PwrState, .-Chip_PMC_Set_PwrState
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

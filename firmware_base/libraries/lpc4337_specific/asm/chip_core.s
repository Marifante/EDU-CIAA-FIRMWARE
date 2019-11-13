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
	.file	"chip_core.c"
	.text
	.section	.text.enable_IntSysTick,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	enable_IntSysTick
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	enable_IntSysTick, %function
enable_IntSysTick:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L4
	movs	r1, #0
	push	{r4}
	str	r1, [r2]
	ldr	r4, [r2, #12]
	movs	r3, #100
	mul	r3, r3, r4
	subs	r3, r3, #100
	vmov	s15, r3	@ int
	vmov	s14, r0
	vcvt.f32.s32	s15, s15
	movs	r3, #3
	vmul.f32	s15, s15, s14
	ldr	r4, [sp], #4
	vcvt.u32.f32	s15, s15
	vstr.32	s15, [r2, #4]	@ int
	str	r1, [r2, #8]
	str	r3, [r2]
	bx	lr
.L5:
	.align	2
.L4:
	.word	-536813552
	.size	enable_IntSysTick, .-enable_IntSysTick
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

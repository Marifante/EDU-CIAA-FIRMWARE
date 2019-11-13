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
	.file	"edu_ciaa_nxp.c"
	.text
	.section	.text.startup.main,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	main
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	main, %function
main:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r0, .L5
	bl	puts
	ldr	r2, .L5+4
.L2:
	ldr	r3, [r2]
	adds	r3, r3, #1
	str	r3, [r2]
	b	.L2
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	.LANCHOR0
	.size	main, .-main
	.section	.bss.i.6555,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	i.6555, %object
	.size	i.6555, 4
i.6555:
	.space	4
	.section	.rodata.main.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Hello World\000"
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

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
	.file	"gpio_peripheral.c"
	.text
	.section	.text.GPIO_GetPortDIR,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPortDIR
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPortDIR, %function
GPIO_GetPortDIR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	add	r0, r0, #2048
	ldr	r0, [r3, r0, lsl #2]
	bx	lr
.L4:
	.align	2
.L3:
	.word	1074741248
	.size	GPIO_GetPortDIR, .-GPIO_GetPortDIR
	.section	.text.GPIO_GetPortSET,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPortSET
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPortSET, %function
GPIO_GetPortSET:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	add	r0, r0, #2176
	ldr	r0, [r3, r0, lsl #2]
	bx	lr
.L7:
	.align	2
.L6:
	.word	1074741248
	.size	GPIO_GetPortSET, .-GPIO_GetPortSET
	.section	.text.GPIO_GetPortCLR,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPortCLR
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPortCLR, %function
GPIO_GetPortCLR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	add	r0, r0, #2208
	ldr	r0, [r3, r0, lsl #2]
	bx	lr
.L10:
	.align	2
.L9:
	.word	1074741248
	.size	GPIO_GetPortCLR, .-GPIO_GetPortCLR
	.section	.text.GPIO_GetPortNOT,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPortNOT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPortNOT, %function
GPIO_GetPortNOT:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	add	r0, r0, #2208
	ldr	r0, [r3, r0, lsl #2]
	bx	lr
.L13:
	.align	2
.L12:
	.word	1074741248
	.size	GPIO_GetPortNOT, .-GPIO_GetPortNOT
	.section	.text.GPIO_GetPortPIN,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPortPIN
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPortPIN, %function
GPIO_GetPortPIN:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	add	r0, r0, #2112
	ldr	r0, [r3, r0, lsl #2]
	bx	lr
.L16:
	.align	2
.L15:
	.word	1074741248
	.size	GPIO_GetPortPIN, .-GPIO_GetPortPIN
	.section	.text.GPIO_GetPinDIR,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPinDIR
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPinDIR, %function
GPIO_GetPinDIR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L18
	add	r0, r0, #2048
	movs	r3, #1
	ldr	r0, [r2, r0, lsl #2]
	lsl	r1, r3, r1
	ands	r0, r0, r1
	uxtb	r0, r0
	bx	lr
.L19:
	.align	2
.L18:
	.word	1074741248
	.size	GPIO_GetPinDIR, .-GPIO_GetPinDIR
	.section	.text.GPIO_GetPinSET,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPinSET
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPinSET, %function
GPIO_GetPinSET:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L21
	add	r0, r0, #2176
	movs	r3, #1
	ldr	r0, [r2, r0, lsl #2]
	lsl	r1, r3, r1
	ands	r0, r0, r1
	uxtb	r0, r0
	bx	lr
.L22:
	.align	2
.L21:
	.word	1074741248
	.size	GPIO_GetPinSET, .-GPIO_GetPinSET
	.section	.text.GPIO_GetPinCLR,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPinCLR
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPinCLR, %function
GPIO_GetPinCLR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L24
	add	r0, r0, #2208
	movs	r3, #1
	ldr	r0, [r2, r0, lsl #2]
	lsl	r1, r3, r1
	ands	r0, r0, r1
	uxtb	r0, r0
	bx	lr
.L25:
	.align	2
.L24:
	.word	1074741248
	.size	GPIO_GetPinCLR, .-GPIO_GetPinCLR
	.section	.text.GPIO_GetPinNOT,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPinNOT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPinNOT, %function
GPIO_GetPinNOT:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L27
	add	r0, r0, #2240
	movs	r3, #1
	ldr	r0, [r2, r0, lsl #2]
	lsl	r1, r3, r1
	ands	r0, r0, r1
	uxtb	r0, r0
	bx	lr
.L28:
	.align	2
.L27:
	.word	1074741248
	.size	GPIO_GetPinNOT, .-GPIO_GetPinNOT
	.section	.text.GPIO_GetPinPIN,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPinPIN
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPinPIN, %function
GPIO_GetPinPIN:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L30
	add	r0, r0, #2112
	movs	r3, #1
	ldr	r0, [r2, r0, lsl #2]
	lsl	r1, r3, r1
	ands	r0, r0, r1
	uxtb	r0, r0
	bx	lr
.L31:
	.align	2
.L30:
	.word	1074741248
	.size	GPIO_GetPinPIN, .-GPIO_GetPinPIN
	.section	.text.GPIO_GetPinBYTE,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPinBYTE
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPinBYTE, %function
GPIO_GetPinBYTE:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #5
	add	r0, r0, #1073758208
	add	r0, r0, #983040
	ldrb	r0, [r0, r1]	@ zero_extendqisi2
	bx	lr
	.size	GPIO_GetPinBYTE, .-GPIO_GetPinBYTE
	.section	.text.GPIO_GetPinWORD,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_GetPinWORD
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_GetPinWORD, %function
GPIO_GetPinWORD:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r1, r0, lsl #5
	add	r1, r1, #1024
	ldr	r3, .L34
	ldr	r0, [r3, r1, lsl #2]
	bx	lr
.L35:
	.align	2
.L34:
	.word	1074741248
	.size	GPIO_GetPinWORD, .-GPIO_GetPinWORD
	.section	.text.GPIO_SetPinDIROutput,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_SetPinDIROutput
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_SetPinDIROutput, %function
GPIO_SetPinDIROutput:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #2
	add	r0, r0, #1073741824
	add	r0, r0, #1007616
	movs	r3, #1
	ldr	r2, [r0]
	lsl	r1, r3, r1
	orrs	r1, r1, r2
	str	r1, [r0]
	bx	lr
	.size	GPIO_SetPinDIROutput, .-GPIO_SetPinDIROutput
	.section	.text.GPIO_SetPinDIRInput,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_SetPinDIRInput
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_SetPinDIRInput, %function
GPIO_SetPinDIRInput:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsls	r0, r0, #2
	add	r0, r0, #1073741824
	add	r0, r0, #1007616
	movs	r2, #1
	ldr	r3, [r0]
	lsl	r1, r2, r1
	bic	r3, r3, r1
	str	r3, [r0]
	bx	lr
	.size	GPIO_SetPinDIRInput, .-GPIO_SetPinDIRInput
	.section	.text.GPIO_SetPinSET,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_SetPinSET
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_SetPinSET, %function
GPIO_SetPinSET:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L39
	lsls	r0, r0, #2
	add	r2, r2, r0
	movs	r3, #1
	ldr	r0, [r2]
	lsl	r1, r3, r1
	orrs	r1, r1, r0
	str	r1, [r2]
	bx	lr
.L40:
	.align	2
.L39:
	.word	1074749952
	.size	GPIO_SetPinSET, .-GPIO_SetPinSET
	.section	.text.GPIO_SetPinCLR,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_SetPinCLR
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_SetPinCLR, %function
GPIO_SetPinCLR:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L42
	lsls	r0, r0, #2
	add	r2, r2, r0
	movs	r3, #1
	ldr	r0, [r2]
	lsl	r1, r3, r1
	orrs	r1, r1, r0
	str	r1, [r2]
	bx	lr
.L43:
	.align	2
.L42:
	.word	1074750080
	.size	GPIO_SetPinCLR, .-GPIO_SetPinCLR
	.section	.text.GPIO_SetPinNOT,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	GPIO_SetPinNOT
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	GPIO_SetPinNOT, %function
GPIO_SetPinNOT:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L45
	lsls	r0, r0, #2
	add	r2, r2, r0
	movs	r3, #1
	ldr	r0, [r2]
	lsl	r1, r3, r1
	orrs	r1, r1, r0
	str	r1, [r2]
	bx	lr
.L46:
	.align	2
.L45:
	.word	1074750208
	.size	GPIO_SetPinNOT, .-GPIO_SetPinNOT
	.section	.text.SCU_GPIOIntPinSel,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	SCU_GPIOIntPinSel
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	SCU_GPIOIntPinSel, %function
SCU_GPIOIntPinSel:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	and	r3, r0, #252
	add	r3, r3, #1073741824
	add	r3, r3, #548864
	push	{r4, r5}
	lsls	r1, r1, #5
	lsls	r0, r0, #3
	and	r0, r0, #24
	ldr	r4, [r3, #3584]
	uxtb	r1, r1
	and	r2, r2, #31
	movs	r5, #255
	lsls	r5, r5, r0
	orrs	r1, r1, r2
	bic	r4, r4, r5
	lsls	r1, r1, r0
	orrs	r1, r1, r4
	str	r1, [r3, #3584]
	pop	{r4, r5}
	bx	lr
	.size	SCU_GPIOIntPinSel, .-SCU_GPIOIntPinSel
	.section	.text.setEdgeDetectionGPIOInterrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	setEdgeDetectionGPIOInterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setEdgeDetectionGPIOInterrupt, %function
setEdgeDetectionGPIOInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L50
	movs	r2, #1
	ldr	r3, [r1]
	lsl	r0, r2, r0
	bic	r3, r3, r0
	str	r3, [r1]
	bx	lr
.L51:
	.align	2
.L50:
	.word	1074294784
	.size	setEdgeDetectionGPIOInterrupt, .-setEdgeDetectionGPIOInterrupt
	.section	.text.setRiseEdgeGPIOInterrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	setRiseEdgeGPIOInterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setRiseEdgeGPIOInterrupt, %function
setRiseEdgeGPIOInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L53
	movs	r2, #1
	ldr	r3, [r1, #8]
	lsl	r0, r2, r0
	orrs	r3, r3, r0
	str	r3, [r1, #8]
	bx	lr
.L54:
	.align	2
.L53:
	.word	1074294784
	.size	setRiseEdgeGPIOInterrupt, .-setRiseEdgeGPIOInterrupt
	.section	.text.setFallEdgeGPIOInterrupt,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	setFallEdgeGPIOInterrupt
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	setFallEdgeGPIOInterrupt, %function
setFallEdgeGPIOInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L56
	movs	r2, #1
	ldr	r3, [r1, #20]
	lsl	r0, r2, r0
	orrs	r3, r3, r0
	str	r3, [r1, #20]
	bx	lr
.L57:
	.align	2
.L56:
	.word	1074294784
	.size	setFallEdgeGPIOInterrupt, .-setFallEdgeGPIOInterrupt
	.section	.text.clearGPIOInterruptFlag,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	clearGPIOInterruptFlag
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	clearGPIOInterruptFlag, %function
clearGPIOInterruptFlag:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #1
	ldr	r2, .L59
	lsl	r0, r3, r0
	str	r0, [r2, #36]
	bx	lr
.L60:
	.align	2
.L59:
	.word	1074294784
	.size	clearGPIOInterruptFlag, .-clearGPIOInterruptFlag
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

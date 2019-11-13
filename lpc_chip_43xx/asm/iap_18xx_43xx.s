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
	.file	"iap_18xx_43xx.c"
	.text
	.section	.text.Chip_IAP_Init,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_Init
	.arch armv7e-m
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_Init, %function
Chip_IAP_Init:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #44
	movs	r2, #0
	movs	r1, #49
	ldr	r3, .L4
	str	r1, [sp, #20]
	str	r2, [sp, #4]
	add	r0, sp, #20
	ldr	r3, [r3]
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #44
	@ sp needed
	ldr	pc, [sp], #4
.L5:
	.align	2
.L4:
	.word	272630016
	.size	Chip_IAP_Init, .-Chip_IAP_Init
	.section	.text.Chip_IAP_PreSectorForReadWrite,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_PreSectorForReadWrite
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_PreSectorForReadWrite, %function
Chip_IAP_PreSectorForReadWrite:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #40
	strd	r0, r1, [sp, #24]
	movs	r4, #50
	ldr	r3, .L8
	str	r2, [sp, #32]
	str	r4, [sp, #20]
	add	r0, sp, #20
	ldr	r3, [r3]
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
.L9:
	.align	2
.L8:
	.word	272630016
	.size	Chip_IAP_PreSectorForReadWrite, .-Chip_IAP_PreSectorForReadWrite
	.section	.text.Chip_IAP_CopyRamToFlash,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_CopyRamToFlash
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_CopyRamToFlash, %function
Chip_IAP_CopyRamToFlash:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	ldr	r4, .L12+4
	ldr	r3, [r3]
	sub	sp, sp, #40
	strd	r1, r2, [sp, #28]
	str	r0, [sp, #24]
	umull	r0, r3, r4, r3
	lsrs	r3, r3, #6
	movs	r4, #51
	ldr	r0, .L12+8
	str	r3, [sp, #36]
	str	r4, [sp, #20]
	ldr	r3, [r0]
	add	r1, sp, #4
	add	r0, sp, #20
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
.L13:
	.align	2
.L12:
	.word	SystemCoreClock
	.word	274877907
	.word	272630016
	.size	Chip_IAP_CopyRamToFlash, .-Chip_IAP_CopyRamToFlash
	.section	.text.Chip_IAP_EraseSector,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_EraseSector
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_EraseSector, %function
Chip_IAP_EraseSector:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	ldr	r4, .L16+4
	ldr	r3, [r3]
	sub	sp, sp, #40
	str	r0, [sp, #24]
	umull	r0, r3, r4, r3
	lsrs	r3, r3, #6
	strd	r3, r2, [sp, #32]
	movs	r4, #52
	ldr	r0, .L16+8
	str	r1, [sp, #28]
	str	r4, [sp, #20]
	ldr	r3, [r0]
	add	r1, sp, #4
	add	r0, sp, #20
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
.L17:
	.align	2
.L16:
	.word	SystemCoreClock
	.word	274877907
	.word	272630016
	.size	Chip_IAP_EraseSector, .-Chip_IAP_EraseSector
	.section	.text.Chip_IAP_BlankCheckSector,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_BlankCheckSector
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_BlankCheckSector, %function
Chip_IAP_BlankCheckSector:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #40
	strd	r0, r1, [sp, #24]
	movs	r4, #53
	ldr	r3, .L20
	str	r2, [sp, #32]
	str	r4, [sp, #20]
	add	r0, sp, #20
	ldr	r3, [r3]
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
.L21:
	.align	2
.L20:
	.word	272630016
	.size	Chip_IAP_BlankCheckSector, .-Chip_IAP_BlankCheckSector
	.section	.text.Chip_IAP_ReadPID,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_ReadPID
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_ReadPID, %function
Chip_IAP_ReadPID:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #44
	movs	r2, #54
	ldr	r3, .L24
	str	r2, [sp, #20]
	add	r0, sp, #20
	ldr	r3, [r3]
	add	r1, sp, #4
	blx	r3
	ldr	r0, [sp, #8]
	add	sp, sp, #44
	@ sp needed
	ldr	pc, [sp], #4
.L25:
	.align	2
.L24:
	.word	272630016
	.size	Chip_IAP_ReadPID, .-Chip_IAP_ReadPID
	.section	.text.Chip_IAP_ReadBootCode,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_ReadBootCode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_ReadBootCode, %function
Chip_IAP_ReadBootCode:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #44
	movs	r2, #55
	ldr	r3, .L28
	str	r2, [sp, #20]
	add	r0, sp, #20
	ldr	r3, [r3]
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #44
	@ sp needed
	ldr	pc, [sp], #4
.L29:
	.align	2
.L28:
	.word	272630016
	.size	Chip_IAP_ReadBootCode, .-Chip_IAP_ReadBootCode
	.section	.text.Chip_IAP_Compare,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_Compare
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_Compare, %function
Chip_IAP_Compare:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #40
	strd	r0, r1, [sp, #24]
	movs	r4, #56
	ldr	r3, .L32
	str	r2, [sp, #32]
	str	r4, [sp, #20]
	add	r0, sp, #20
	ldr	r3, [r3]
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
.L33:
	.align	2
.L32:
	.word	272630016
	.size	Chip_IAP_Compare, .-Chip_IAP_Compare
	.section	.text.Chip_IAP_ReinvokeISP,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_ReinvokeISP
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_ReinvokeISP, %function
Chip_IAP_ReinvokeISP:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	sub	sp, sp, #44
	movs	r2, #57
	ldr	r3, .L36
	str	r2, [sp, #20]
	add	r0, sp, #20
	ldr	r3, [r3]
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #44
	@ sp needed
	ldr	pc, [sp], #4
.L37:
	.align	2
.L36:
	.word	272630016
	.size	Chip_IAP_ReinvokeISP, .-Chip_IAP_ReinvokeISP
	.section	.text.Chip_IAP_ReadUID,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_ReadUID
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_ReadUID, %function
Chip_IAP_ReadUID:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #40
	movs	r2, #58
	ldr	r3, .L40
	str	r2, [sp]
	mov	r4, r0
	add	r1, sp, #20
	mov	r0, sp
	ldr	r3, [r3]
	blx	r3
	ldrd	r0, r1, [sp, #24]
	ldrd	r2, r3, [sp, #32]
	strd	r0, r1, [r4]
	ldr	r0, [sp, #20]
	strd	r2, r3, [r4, #8]
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
.L41:
	.align	2
.L40:
	.word	272630016
	.size	Chip_IAP_ReadUID, .-Chip_IAP_ReadUID
	.section	.text.Chip_IAP_ErasePage,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_ErasePage
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_ErasePage, %function
Chip_IAP_ErasePage:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L44
	ldr	r4, .L44+4
	ldr	r3, [r3]
	ldr	r2, .L44+8
	sub	sp, sp, #40
	str	r0, [sp, #24]
	umull	r0, r3, r4, r3
	lsrs	r3, r3, #6
	strd	r1, r3, [sp, #28]
	movs	r0, #59
	str	r0, [sp, #20]
	ldr	r3, [r2]
	add	r0, sp, #20
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #40
	@ sp needed
	pop	{r4, pc}
.L45:
	.align	2
.L44:
	.word	SystemCoreClock
	.word	274877907
	.word	272630016
	.size	Chip_IAP_ErasePage, .-Chip_IAP_ErasePage
	.section	.text.Chip_IAP_SetBootFlashBank,"ax",%progbits
	.align	1
	.p2align 2,,3
	.global	Chip_IAP_SetBootFlashBank
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	Chip_IAP_SetBootFlashBank, %function
Chip_IAP_SetBootFlashBank:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	ldr	r3, .L48
	ldr	r1, .L48+4
	ldr	r3, [r3]
	ldr	r2, .L48+8
	sub	sp, sp, #44
	umull	r1, r3, r1, r3
	lsrs	r3, r3, #6
	movs	r1, #60
	str	r0, [sp, #24]
	str	r1, [sp, #20]
	str	r3, [sp, #28]
	add	r0, sp, #20
	ldr	r3, [r2]
	add	r1, sp, #4
	blx	r3
	ldrb	r0, [sp, #4]	@ zero_extendqisi2
	add	sp, sp, #44
	@ sp needed
	ldr	pc, [sp], #4
.L49:
	.align	2
.L48:
	.word	SystemCoreClock
	.word	274877907
	.word	272630016
	.size	Chip_IAP_SetBootFlashBank, .-Chip_IAP_SetBootFlashBank
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 8-2019-q3-update) 8.3.1 20190703 (release) [gcc-8-branch revision 273027]"

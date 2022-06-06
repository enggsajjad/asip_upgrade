; options passed:  -auxbase-strip
; options enabled:  -falign-loops -fargument-alias -fbranch-count-reg
; -fcommon -fearly-inlining -feliminate-unused-debug-types -ffunction-cse
; -fgcse-lm -fident -finline-functions-called-once -fivopts
; -fkeep-static-consts -fleading-underscore -fmath-errno
; -fmove-loop-invariants -fpeephole -freg-struct-return -fsched-interblock
; -fsched-spec -fsched-stalled-insns-dep -fshow-column
; -fsplit-ivs-in-unroller -ftoplevel-reorder -ftrapping-math -ftree-loop-im
; -ftree-loop-ivcanon -ftree-loop-optimize -ftree-vect-loop-version
; -fzero-initialized-in-bss -mquickcall
.text
	.align 2
	.globl	_intToStr
	.type	_intToStr, @function
_intToStr:
;  Function 'intToStr'; 40 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-80	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	addi	r6,r0,#0
	sw	-8(r4),r6
	nop
	addi	r6,r0,#0
	sw	-4(r4),r6
	nop
	lw	r7,8(r4)
	nop
	nop
	addi	r6,r0,#0
	elt	r6,r7,r6
	brz	r6,.L2
	lw	r6,8(r4)
	nop
	nop
	sub	r6,r0,r6
	sw	8(r4),r6
	nop
	lw	r8,12(r4)
	nop
	nop
	addi	r9,r0,#45
	jpl	_storeByte
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
	jp	.L6
.L2:
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L6
	lw	r8,12(r4)
	nop
	nop
	addi	r9,r0,#48
	jpl	_storeByte
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
	jp	.L6
.L7:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r4,#-40
	add	r7,r7,r6
	lw	r8,8(r4)
	nop
	nop
	addi	r6,r0,#10
	mod	r6,r8,r6
	addi	r6,r6,#48
	add	r8,r0,r7
	add	r9,r0,r6
	jpl	_storeByte
	lw	r7,8(r4)
	nop
	nop
	addi	r6,r0,#10
	div	r6,r7,r6
	sw	8(r4),r6
	nop
	lw	r6,-8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-8(r4),r6
	nop
.L6:
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L7
	jp	.L9
.L10:
	lw	r6,-8(r4)
	nop
	nop
	addi	r6,r6,#-1
	sw	-8(r4),r6
	nop
	lw	r6,-4(r4)
	nop
	nop
	add	r7,r0,r6
	lw	r6,12(r4)
	nop
	nop
	add	r8,r7,r6
	lw	r6,-8(r4)
	nop
	nop
	add	r7,r0,r6
	addi	r6,r4,#-40
	add	r6,r6,r7
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	add	r9,r0,r6
	jpl	_storeByte
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
.L9:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	elt	r6,r7,r6
	brnz	r6,.L10
	lw	r6,-4(r4)
	nop
	nop
	add	r7,r0,r6
	lw	r6,12(r4)
	nop
	nop
	add	r6,r7,r6
	add	r8,r0,r6
	addi	r9,r0,#0
	jpl	_storeByte
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_intToStr, .-_intToStr
	.align 2
	.globl	_intToHexStr
	.type	_intToHexStr, @function
_intToHexStr:
;  Function 'intToHexStr'; 24 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-64	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	sw	16(r4),r10
	nop
	addi	r6,r0,#0
	sw	-12(r4),r6
	nop
	jp	.L14
.L15:
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L16
	lw	r6,16(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L18
	lw	r6,-12(r4)
	nop
	nop
	lw	r7,16(r4)
	nop
	nop
	elt	r6,r6,r7
	brz	r6,.L18
.L16:
	lw	r6,8(r4)
	nop
	nop
	andi	r6,r6,#15
	sw	-4(r4),r6
	nop
	lw	r7,-4(r4)
	nop
	nop
	addi	r6,r0,#9
	elt	r6,r6,r7
	brnz	r6,.L20
	lw	r6,-12(r4)
	nop
	nop
	add	r7,r0,r6
	addi	r6,r4,#-22
	add	r6,r6,r7
	lw	r7,-4(r4)
	nop
	nop
	addi	r7,r7,#48
	add	r8,r0,r6
	add	r9,r0,r7
	jpl	_storeByte
	jp	.L22
.L20:
	lw	r6,-12(r4)
	nop
	nop
	add	r7,r0,r6
	addi	r6,r4,#-22
	add	r6,r6,r7
	lw	r7,-4(r4)
	nop
	nop
	addi	r7,r7,#55
	add	r8,r0,r6
	add	r9,r0,r7
	jpl	_storeByte
.L22:
	lw	r6,8(r4)
	nop
	nop
	arsi	r6,r6,#4
	sw	8(r4),r6
	nop
	lw	r6,-12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-12(r4),r6
	nop
.L14:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#7
	elt	r6,r7,r6
	brz	r6,.L15
.L18:
	addi	r6,r0,#0
	sw	-8(r4),r6
	nop
	lw	r6,-12(r4)
	nop
	nop
	addi	r6,r6,#-1
	sw	-12(r4),r6
	nop
	jp	.L23
.L24:
	lw	r6,-8(r4)
	nop
	nop
	add	r7,r0,r6
	lw	r6,12(r4)
	nop
	nop
	add	r8,r7,r6
	lw	r6,-12(r4)
	nop
	nop
	add	r7,r0,r6
	addi	r6,r4,#-22
	add	r6,r6,r7
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	add	r9,r0,r6
	jpl	_storeByte
	lw	r6,-8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-8(r4),r6
	nop
	lw	r6,-12(r4)
	nop
	nop
	addi	r6,r6,#-1
	sw	-12(r4),r6
	nop
.L23:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#0
	elt	r6,r6,r7
	brz	r6,.L24
	lw	r6,-8(r4)
	nop
	nop
	add	r7,r0,r6
	lw	r6,12(r4)
	nop
	nop
	add	r6,r7,r6
	add	r8,r0,r6
	addi	r9,r0,#0
	jpl	_storeByte
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_intToHexStr, .-_intToHexStr
	.align 2
	.globl	_strlen
	.type	_strlen, @function
_strlen:
;  Function 'strlen'; 8 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-16	; alloc local storage
	sw	8(r4),r8
	nop
	addi	r6,r0,#0
	sw	-4(r4),r6
	nop
	jp	.L28
.L29:
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
.L28:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	sb	-5(r4),r6
	nop
	lb	r7,-5(r4)
	nop
	nop
	andi	r7,r7,#0x00ff
	addi	r6,r0,#0
	eeq	r6,r7,r6
	brnz	r6,.L30
	addi	r6,r0,#0x1
	sb	-5(r4),r6
	nop
.L30:
	lb	r7,-5(r4)
	nop
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	andi	r7,r7,#0x00ff
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L29
	lw	r6,-4(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_strlen, .-_strlen
	.align 2
	.globl	_strcat
	.type	_strcat, @function
_strcat:
;  Function 'strcat'; 4 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-44	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-4(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	jp	.L34
.L35:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-4(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
.L34:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L35
	lw	r6,12(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-4(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
	jp	.L37
.L38:
	lw	r7,8(r4)
	nop
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	add	r8,r0,r7
	lw	r9,-4(r4)
	nop
	nop
	jpl	_storeByte
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
.L37:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L38
	lw	r8,8(r4)
	nop
	nop
	addi	r9,r0,#0
	jpl	_storeByte
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_strcat, .-_strcat
	.align 2
	.globl	_strncat
	.type	_strncat, @function
_strncat:
;  Function 'strncat'; 8 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-48	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	sw	16(r4),r10
	nop
	addi	r6,r0,#0
	sw	-4(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-8(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	jp	.L42
.L43:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-8(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
.L42:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L43
	lw	r6,12(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-8(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
	jp	.L45
.L46:
	lw	r7,8(r4)
	nop
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	add	r8,r0,r7
	lw	r9,-8(r4)
	nop
	nop
	jpl	_storeByte
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
.L45:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L47
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
	lw	r7,-4(r4)
	nop
	nop
	lw	r6,16(r4)
	nop
	nop
	elt	r6,r7,r6
	brnz	r6,.L46
.L47:
	lw	r8,8(r4)
	nop
	nop
	addi	r9,r0,#0
	jpl	_storeByte
	lw	r6,8(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_strncat, .-_strncat
	.align 2
	.globl	_strcpy
	.type	_strcpy, @function
_strcpy:
;  Function 'strcpy'; 4 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-44	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	lw	r6,12(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-4(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
	jp	.L51
.L52:
	lw	r7,8(r4)
	nop
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	add	r8,r0,r7
	lw	r9,-4(r4)
	nop
	nop
	jpl	_storeByte
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
.L51:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L52
	lw	r8,8(r4)
	nop
	nop
	addi	r9,r0,#0
	jpl	_storeByte
	lw	r6,8(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_strcpy, .-_strcpy
	.align 2
	.globl	_strncpy
	.type	_strncpy, @function
_strncpy:
;  Function 'strncpy'; 8 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-48	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	sw	16(r4),r10
	nop
	addi	r6,r0,#0
	sw	-4(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-8(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
	jp	.L56
.L57:
	lw	r7,8(r4)
	nop
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	add	r8,r0,r7
	lw	r9,-8(r4)
	nop
	nop
	jpl	_storeByte
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
.L56:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L58
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
	lw	r7,-4(r4)
	nop
	nop
	lw	r6,16(r4)
	nop
	nop
	elt	r6,r7,r6
	brnz	r6,.L57
.L58:
	lw	r8,8(r4)
	nop
	nop
	addi	r9,r0,#0
	jpl	_storeByte
	lw	r6,8(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_strncpy, .-_strncpy
	.align 2
	.globl	_strcmp
	.type	_strcmp, @function
_strcmp:
;  Function 'strcmp'; 12 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-20	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-8(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-4(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
	jp	.L62
.L63:
	lw	r6,-8(r4)
	nop
	nop
	lw	r7,-4(r4)
	nop
	nop
	elt	r6,r6,r7
	brz	r6,.L64
	addi	r6,r0,#-1
	sw	-12(r4),r6
	nop
	jp	.L66
.L64:
	lw	r6,-8(r4)
	nop
	nop
	lw	r7,-4(r4)
	nop
	nop
	elt	r6,r7,r6
	brz	r6,.L67
	addi	r6,r0,#1
	sw	-12(r4),r6
	nop
	jp	.L66
.L67:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-8(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-4(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
.L62:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L69
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L63
.L69:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L71
	addi	r6,r0,#1
	sw	-12(r4),r6
	nop
	jp	.L66
.L71:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L73
	addi	r6,r0,#-1
	sw	-12(r4),r6
	nop
	jp	.L66
.L73:
	addi	r6,r0,#0
	sw	-12(r4),r6
	nop
.L66:
	lw	r6,-12(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_strcmp, .-_strcmp
	.align 2
	.globl	_strncmp
	.type	_strncmp, @function
_strncmp:
;  Function 'strncmp'; 16 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-24	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	sw	16(r4),r10
	nop
	addi	r6,r0,#0
	sw	-4(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-12(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	sw	-8(r4),r6
	nop
	lw	r6,12(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	12(r4),r6
	nop
	jp	.L77
.L78:
	lw	r6,-12(r4)
	nop
	nop
	lw	r7,-8(r4)
	nop
	nop
	elt	r6,r6,r7
	brz	r6,.L79
	addi	r6,r0,#-1
	sw	-16(r4),r6
	nop
	jp	.L81
.L79:
	lw	r6,-12(r4)
	nop
	nop
	lw	r7,-8(r4)
	nop
	nop
	elt	r6,r7,r6
	brz	r6,.L77
	addi	r6,r0,#1
	sw	-16(r4),r6
	nop
	jp	.L81
.L77:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L83
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L83
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
	lw	r7,-4(r4)
	nop
	nop
	lw	r6,16(r4)
	nop
	nop
	elt	r6,r7,r6
	brnz	r6,.L78
.L83:
	lw	r6,-4(r4)
	nop
	nop
	lw	r7,16(r4)
	nop
	nop
	eneq	r6,r6,r7
	brnz	r6,.L86
	addi	r6,r0,#0
	sw	-16(r4),r6
	nop
	jp	.L81
.L86:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L88
	addi	r6,r0,#1
	sw	-16(r4),r6
	nop
	jp	.L81
.L88:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L90
	addi	r6,r0,#-1
	sw	-16(r4),r6
	nop
	jp	.L81
.L90:
	addi	r6,r0,#0
	sw	-16(r4),r6
	nop
.L81:
	lw	r6,-16(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_strncmp, .-_strncmp
	.align 2
	.globl	_tolower
	.type	_tolower, @function
_tolower:
;  Function 'tolower'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#64
	elt	r6,r7,r6
	brz	r6,.L94
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#90
	elt	r6,r7,r6
	brnz	r6,.L94
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#32
	sw	-4(r4),r6
	nop
	jp	.L97
.L94:
	lw	r6,8(r4)
	nop
	nop
	sw	-4(r4),r6
	nop
.L97:
	lw	r6,-4(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_tolower, .-_tolower
	.align 2
	.globl	_toupper
	.type	_toupper, @function
_toupper:
;  Function 'toupper'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#96
	elt	r6,r7,r6
	brz	r6,.L100
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#122
	elt	r6,r7,r6
	brnz	r6,.L100
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#-32
	sw	-4(r4),r6
	nop
	jp	.L103
.L100:
	lw	r6,8(r4)
	nop
	nop
	sw	-4(r4),r6
	nop
.L103:
	lw	r6,-4(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_toupper, .-_toupper
	.align 2
	.globl	_isdigit
	.type	_isdigit, @function
_isdigit:
;  Function 'isdigit'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#47
	elt	r6,r7,r6
	brz	r6,.L106
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#57
	elt	r6,r7,r6
	brnz	r6,.L106
	addi	r6,r0,#1
	sw	-4(r4),r6
	nop
	jp	.L109
.L106:
	addi	r6,r0,#0
	sw	-4(r4),r6
	nop
.L109:
	lw	r6,-4(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_isdigit, .-_isdigit
	.ident	"GCC: (GNU) 4.2.2"

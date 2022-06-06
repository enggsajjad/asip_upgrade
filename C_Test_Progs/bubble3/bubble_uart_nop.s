; options passed:  -auxbase-strip
; options enabled:  -falign-loops -fargument-alias -fbranch-count-reg
; -fcommon -fearly-inlining -feliminate-unused-debug-types -ffunction-cse
; -fgcse-lm -fident -finline-functions-called-once -fivopts
; -fkeep-static-consts -fleading-underscore -fmath-errno
; -fmove-loop-invariants -fpeephole -freg-struct-return -fsched-interblock
; -fsched-spec -fsched-stalled-insns-dep -fshow-column
; -fsplit-ivs-in-unroller -ftoplevel-reorder -ftrapping-math -ftree-loop-im
; -ftree-loop-ivcanon -ftree-loop-optimize -ftree-vect-loop-version
; -funit-at-a-time -fzero-initialized-in-bss -mquickcall
.text
	.align 2
	.globl	_storeByte
	.type	_storeByte, @function
_storeByte:
;  Function 'storeByte'; 20 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-28	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	addi	r6,r0,#-4
	sw	-20(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	sw	-16(r4),r6
	nop
	lw	r7,-16(r4)
	nop
	nop
	lw	r6,-20(r4)
	nop
	nop
	and	r6,r7,r6
	sw	-12(r4),r6
	nop
	lw	r6,-12(r4)
	nop
	nop
	lw	r6,(r6)
	nop
	nop
	sw	-8(r4),r6
	nop
	lw	r6,-16(r4)
	nop
	nop
	sub	r6,r0,r6
	subi	r6,r6,#1
	andi	r6,r6,#3
	llsi	r7,r6,#3
	addi	r6,r0,#255
	lls	r6,r6,r7
	sw	-4(r4),r6
	nop
	lw	r6,-16(r4)
	nop
	nop
	andi	r6,r6,#3
	sub	r6,r0,r6
	subi	r6,r6,#1
	llsi	r7,r6,#3
	lw	r6,12(r4)
	nop
	nop
	lls	r6,r6,r7
	sw	12(r4),r6
	nop
	lw	r6,-4(r4)
	nop
	nop
	sub	r7,r0,r6
	subi	r7,r7,#1
	lw	r6,-8(r4)
	nop
	nop
	and	r6,r6,r7
	sw	-8(r4),r6
	nop
	lw	r7,-8(r4)
	nop
	nop
	lw	r6,12(r4)
	nop
	nop
	or	r6,r7,r6
	sw	-8(r4),r6
	nop
	lw	r7,-12(r4)
	nop
	nop
	lw	r6,-8(r4)
	nop
	nop
	sw	(r7),r6
	nop
	lw	r6,-8(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_storeByte, .-_storeByte
	.align 2
	.globl	_storeShort
	.type	_storeShort, @function
_storeShort:
;  Function 'storeShort'; 24 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-32	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	addi	r6,r0,#-4
	sw	-20(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	sw	-16(r4),r6
	nop
	lw	r7,-16(r4)
	nop
	nop
	lw	r6,-20(r4)
	nop
	nop
	and	r6,r7,r6
	sw	-12(r4),r6
	nop
	lw	r6,-12(r4)
	nop
	nop
	lw	r6,(r6)
	nop
	nop
	sw	-8(r4),r6
	nop
	lw	r6,-16(r4)
	nop
	nop
	andi	r7,r6,#1
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L4
	addi	r6,r0,#-1
	lsoi	r6,r6,#0
	sw	-24(r4),r6
	nop
	jp	.L6
.L4:
	lsoi	r6,r0,#65535
	sw	-24(r4),r6
	nop
.L6:
	lw	r6,-24(r4)
	nop
	nop
	sw	-4(r4),r6
	nop
	lw	r6,-16(r4)
	nop
	nop
	andi	r7,r6,#2
	addi	r6,r0,%hi(_temp)
	lsoi	r6,r6,%lo(_temp)
	sw	(r6),r7
	nop
	addi	r6,r0,%hi(_temp)
	lsoi	r6,r6,%lo(_temp)
	lw	r6,(r6)
	nop
	nop
	arsi	r6,r6,#1
	sub	r6,r0,r6
	subi	r6,r6,#1
	llsi	r7,r6,#4
	lw	r6,12(r4)
	nop
	nop
	ars	r6,r6,r7
	sw	12(r4),r6
	nop
	lw	r6,-4(r4)
	nop
	nop
	sub	r7,r0,r6
	subi	r7,r7,#1
	lw	r6,-8(r4)
	nop
	nop
	and	r6,r6,r7
	sw	-8(r4),r6
	nop
	lw	r7,-8(r4)
	nop
	nop
	lw	r6,12(r4)
	nop
	nop
	or	r6,r7,r6
	sw	-8(r4),r6
	nop
	lw	r7,-12(r4)
	nop
	nop
	lw	r6,-8(r4)
	nop
	nop
	sw	(r7),r6
	nop
	lw	r6,-8(r4)
	nop
	nop
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_storeShort, .-_storeShort
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
	brz	r6,.L9
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
	jp	.L13
.L9:
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L13
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
	jp	.L13
.L14:
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
.L13:
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L14
	jp	.L16
.L17:
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
.L16:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	elt	r6,r7,r6
	brnz	r6,.L17
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
	jp	.L21
.L22:
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L23
	lw	r6,16(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L25
	lw	r6,-12(r4)
	nop
	nop
	lw	r7,16(r4)
	nop
	nop
	elt	r6,r6,r7
	brz	r6,.L25
.L23:
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
	brnz	r6,.L27
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
	jp	.L29
.L27:
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
.L29:
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
.L21:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#7
	elt	r6,r7,r6
	brz	r6,.L22
.L25:
	addi	r6,r0,#0
	sw	-8(r4),r6
	nop
	lw	r6,-12(r4)
	nop
	nop
	addi	r6,r6,#-1
	sw	-12(r4),r6
	nop
	jp	.L30
.L31:
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
.L30:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#0
	elt	r6,r6,r7
	brz	r6,.L31
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
	jp	.L35
.L36:
	lw	r6,-4(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-4(r4),r6
	nop
.L35:
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
	brnz	r6,.L37
	addi	r6,r0,#0x1
	sb	-5(r4),r6
	nop
.L37:
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
	brnz	r6,.L36
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
	jp	.L41
.L42:
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
.L41:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L42
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
	jp	.L44
.L45:
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
.L44:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L45
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
	jp	.L49
.L50:
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
.L49:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L50
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
	jp	.L52
.L53:
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
.L52:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L54
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
	brnz	r6,.L53
.L54:
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
	jp	.L58
.L59:
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
.L58:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L59
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
	jp	.L63
.L64:
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
.L63:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L65
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
	brnz	r6,.L64
.L65:
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
	jp	.L69
.L70:
	lw	r6,-8(r4)
	nop
	nop
	lw	r7,-4(r4)
	nop
	nop
	elt	r6,r6,r7
	brz	r6,.L71
	addi	r6,r0,#-1
	sw	-12(r4),r6
	nop
	jp	.L73
.L71:
	lw	r6,-8(r4)
	nop
	nop
	lw	r7,-4(r4)
	nop
	nop
	elt	r6,r7,r6
	brz	r6,.L74
	addi	r6,r0,#1
	sw	-12(r4),r6
	nop
	jp	.L73
.L74:
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
.L69:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L76
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eneq	r6,r6,r7
	brnz	r6,.L70
.L76:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L78
	addi	r6,r0,#1
	sw	-12(r4),r6
	nop
	jp	.L73
.L78:
	lw	r6,-4(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L80
	addi	r6,r0,#-1
	sw	-12(r4),r6
	nop
	jp	.L73
.L80:
	addi	r6,r0,#0
	sw	-12(r4),r6
	nop
.L73:
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
	jp	.L84
.L85:
	lw	r6,-12(r4)
	nop
	nop
	lw	r7,-8(r4)
	nop
	nop
	elt	r6,r6,r7
	brz	r6,.L86
	addi	r6,r0,#-1
	sw	-16(r4),r6
	nop
	jp	.L88
.L86:
	lw	r6,-12(r4)
	nop
	nop
	lw	r7,-8(r4)
	nop
	nop
	elt	r6,r7,r6
	brz	r6,.L84
	addi	r6,r0,#1
	sw	-16(r4),r6
	nop
	jp	.L88
.L84:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L90
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L90
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
	brnz	r6,.L85
.L90:
	lw	r6,-4(r4)
	nop
	nop
	lw	r7,16(r4)
	nop
	nop
	eneq	r6,r6,r7
	brnz	r6,.L93
	addi	r6,r0,#0
	sw	-16(r4),r6
	nop
	jp	.L88
.L93:
	lw	r6,-12(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L95
	addi	r6,r0,#1
	sw	-16(r4),r6
	nop
	jp	.L88
.L95:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#0
	eeq	r6,r6,r7
	brnz	r6,.L97
	addi	r6,r0,#-1
	sw	-16(r4),r6
	nop
	jp	.L88
.L97:
	addi	r6,r0,#0
	sw	-16(r4),r6
	nop
.L88:
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
	brz	r6,.L101
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#90
	elt	r6,r7,r6
	brnz	r6,.L101
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#32
	sw	-4(r4),r6
	nop
	jp	.L104
.L101:
	lw	r6,8(r4)
	nop
	nop
	sw	-4(r4),r6
	nop
.L104:
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
	brz	r6,.L107
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#122
	elt	r6,r7,r6
	brnz	r6,.L107
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#-32
	sw	-4(r4),r6
	nop
	jp	.L110
.L107:
	lw	r6,8(r4)
	nop
	nop
	sw	-4(r4),r6
	nop
.L110:
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
	brz	r6,.L113
	lw	r6,8(r4)
	nop
	nop
	addi	r7,r0,#57
	elt	r6,r7,r6
	brnz	r6,.L113
	addi	r6,r0,#1
	sw	-4(r4),r6
	nop
	jp	.L116
.L113:
	addi	r6,r0,#0
	sw	-4(r4),r6
	nop
.L116:
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
	.align 2
	.globl	_u_print3
	.type	_u_print3, @function
_u_print3:
;  Function 'u_print3'; 8 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-16	; alloc local storage
	sw	8(r4),r8
	nop
	addi	r6,r0,#0
	sw	-8(r4),r6
	nop
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	nop
	jp	.L119
.L120:
	lw	r6,-8(r4)
	nop
	nop
	add	r7,r0,r6
	lw	r6,8(r4)
	nop
	nop
	add	r6,r7,r6
	lb	r6,(r6)
	nop
	nop
	andi	r6,r6,#0x00ff
	addi	r7,r6,#48
	lw	r6,-4(r4)
	nop
	nop
	sw	(r6),r7
	nop
	lw	r6,-8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-8(r4),r6
	nop
.L119:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#2
	elt	r6,r7,r6
	brz	r6,.L120
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_u_print3, .-_u_print3
	.align 2
	.globl	_u_print2
	.type	_u_print2, @function
_u_print2:
;  Function 'u_print2'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
	nop
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	nop
	jp	.L124
.L125:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r7,r6,#0x00ff
	lw	r6,-4(r4)
	nop
	nop
	sw	(r6),r7
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
.L124:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r7,r6,#0x00ff
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L125
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_u_print2, .-_u_print2
	.align 2
	.globl	_u_print
	.type	_u_print, @function
_u_print:
;  Function 'u_print'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
	nop
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	nop
	jp	.L129
.L130:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r7,r6,#0x00ff
	lw	r6,-4(r4)
	nop
	nop
	sw	(r6),r7
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
.L129:
	lw	r6,8(r4)
	nop
	nop
	lb	r6,(r6)
	nop
	nop
	andi	r7,r6,#0x00ff
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L130
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_u_print, .-_u_print
	.align 2
	.globl	_u_printInt
	.type	_u_printInt, @function
_u_printInt:
;  Function 'u_printInt'; 20 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-60	; alloc local storage
	sw	8(r4),r8
	nop
	addi	r6,r4,#-20
	lw	r8,8(r4)
	nop
	nop
	add	r9,r0,r6
	jpl	_intToStr
	addi	r6,r4,#-20
	add	r8,r0,r6
	jpl	_u_print
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_u_printInt, .-_u_printInt
	.section	.rodata
	.align 2
.LC0:
	.string	"0x"
.text
	.align 2
	.globl	_u_printHex
	.type	_u_printHex, @function
_u_printHex:
;  Function 'u_printHex'; 12 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-52	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	addi	r6,r4,#-10
	lw	r8,8(r4)
	nop
	nop
	add	r9,r0,r6
	lw	r10,12(r4)
	nop
	nop
	jpl	_intToHexStr
	addi	r8,r0,%hi(.LC0)
	lsoi	r8,r8,%lo(.LC0)
	jpl	_u_print
	addi	r6,r4,#-10
	add	r8,r0,r6
	jpl	_u_print
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_u_printHex, .-_u_printHex
	.align 2
	.globl	_u_getbytes
	.type	_u_getbytes, @function
_u_getbytes:
;  Function 'u_getbytes'; 8 bytes of locals, 0 regs to save, 32 byte of out. args. size.
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
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	nop
	addi	r6,r0,#0
	sw	-8(r4),r6
	nop
	jp	.L138
.L139:
	lw	r7,8(r4)
	nop
	nop
	lw	r6,8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	nop
	lw	r6,-4(r4)
	nop
	nop
	lw	r6,(r6)
	nop
	nop
	add	r8,r0,r7
	add	r9,r0,r6
	jpl	_storeByte
	lw	r6,-8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-8(r4),r6
	nop
.L138:
	lw	r6,-8(r4)
	nop
	nop
	lw	r7,12(r4)
	nop
	nop
	elt	r6,r6,r7
	brnz	r6,.L139
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_u_getbytes, .-_u_getbytes
	.section	.rodata
	.align 2
.LC1:
	.string	"Array:"
	.align 2
.LC2:
	.string	"\r\n"
	.align 2
.LC3:
	.string	" "
.text
	.align 2
	.globl	_printArray
	.type	_printArray, @function
_printArray:
;  Function 'printArray'; 44 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-84	; alloc local storage
	addi	r6,r0,#1
	sw	-4(r4),r6
	nop
	addi	r8,r0,%hi(.LC1)
	lsoi	r8,r8,%lo(.LC1)
	jpl	_u_print
	addi	r6,r0,#0
	sw	-8(r4),r6
	nop
	jp	.L143
.L144:
	lw	r6,-8(r4)
	nop
	nop
	andi	r7,r6,#7
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L145
	addi	r8,r0,%hi(.LC2)
	lsoi	r8,r8,%lo(.LC2)
	jpl	_u_print
.L145:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,%hi(_array)
	lsoi	r7,r7,%lo(_array)
	llsi	r6,r6,#2
	add	r6,r6,r7
	lw	r6,(r6)
	nop
	nop
	addi	r7,r4,#-40
	add	r8,r0,r6
	add	r9,r0,r7
	jpl	_intToStr
	addi	r6,r4,#-40
	add	r8,r0,r6
	jpl	_u_print
	addi	r8,r0,%hi(.LC3)
	lsoi	r8,r8,%lo(.LC3)
	jpl	_u_print
	lw	r7,-8(r4)
	nop
	nop
	addi	r6,r0,#0
	elt	r6,r6,r7
	brz	r6,.L147
	lw	r6,-8(r4)
	nop
	nop
	addi	r6,r6,#-1
	addi	r7,r0,%hi(_array)
	lsoi	r7,r7,%lo(_array)
	llsi	r6,r6,#2
	add	r6,r6,r7
	lw	r8,(r6)
	nop
	nop
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,%hi(_array)
	lsoi	r7,r7,%lo(_array)
	llsi	r6,r6,#2
	add	r6,r6,r7
	lw	r6,(r6)
	nop
	nop
	addi	r7,r0,#0
	sw	-44(r4),r7
	nop
	eltu	r6,r6,r8
	brnz	r6,.L149
	addi	r6,r0,#1
	sw	-44(r4),r6
	nop
.L149:
	lw	r6,-4(r4)
	nop
	nop
	lw	r7,-44(r4)
	nop
	nop
	and	r6,r6,r7
	sw	-4(r4),r6
	nop
.L147:
	lw	r6,-8(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-8(r4),r6
	nop
.L143:
	lw	r6,-8(r4)
	nop
	nop
	addi	r7,r0,#19
	elt	r6,r7,r6
	brz	r6,.L144
	addi	r8,r0,%hi(.LC2)
	lsoi	r8,r8,%lo(.LC2)
	jpl	_u_print
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
	.size	_printArray, .-_printArray
	.align 2
	.globl	_bubbleSort
	.type	_bubbleSort, @function
_bubbleSort:
;  Function 'bubbleSort'; 28 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-36	; alloc local storage
	sw	8(r4),r8
	nop
	sw	12(r4),r9
	nop
	lw	r6,12(r4)
	nop
	nop
	llsi	r6,r6,#2
	addi	r7,r0,%hi(_array)
	lsoi	r7,r7,%lo(_array)
	add	r6,r6,r7
	sw	-20(r4),r6
	nop
	lw	r6,8(r4)
	nop
	nop
	sw	-16(r4),r6
	nop
	jp	.L153
.L154:
	lw	r6,8(r4)
	nop
	nop
	llsi	r6,r6,#2
	addi	r7,r0,%hi(_array)
	lsoi	r7,r7,%lo(_array)
	add	r6,r6,r7
	sw	-28(r4),r6
	nop
	lw	r6,-28(r4)
	nop
	nop
	lw	r6,(r6)
	nop
	nop
	sw	-8(r4),r6
	nop
	lw	r6,-28(r4)
	nop
	nop
	sw	-24(r4),r6
	nop
	jp	.L155
.L156:
	lw	r6,-24(r4)
	nop
	nop
	addi	r6,r6,#4
	sw	-24(r4),r6
	nop
	lw	r6,-24(r4)
	nop
	nop
	lw	r6,(r6)
	nop
	nop
	sw	-4(r4),r6
	nop
	lw	r7,-4(r4)
	nop
	nop
	lw	r6,-8(r4)
	nop
	nop
	eltu	r6,r7,r6
	brz	r6,.L157
	lw	r7,-28(r4)
	nop
	nop
	lw	r6,-4(r4)
	nop
	nop
	sw	(r7),r6
	nop
	lw	r7,-24(r4)
	nop
	nop
	lw	r6,-8(r4)
	nop
	nop
	sw	(r7),r6
	nop
	lw	r6,-8(r4)
	nop
	nop
	sw	-12(r4),r6
	nop
	lw	r6,-4(r4)
	nop
	nop
	sw	-8(r4),r6
	nop
	lw	r6,-12(r4)
	nop
	nop
	sw	-4(r4),r6
	nop
.L157:
	lw	r6,-24(r4)
	nop
	nop
	sw	-28(r4),r6
	nop
	lw	r6,-4(r4)
	nop
	nop
	sw	-8(r4),r6
	nop
.L155:
	lw	r6,-28(r4)
	nop
	nop
	lw	r7,-20(r4)
	nop
	nop
	eltu	r6,r6,r7
	brnz	r6,.L156
	lw	r6,-20(r4)
	nop
	nop
	addi	r6,r6,#-4
	sw	-20(r4),r6
	nop
	lw	r6,-16(r4)
	nop
	nop
	addi	r6,r6,#1
	sw	-16(r4),r6
	nop
.L153:
	lw	r6,-16(r4)
	nop
	nop
	lw	r7,12(r4)
	nop
	nop
	eltu	r6,r6,r7
	brnz	r6,.L154
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_bubbleSort, .-_bubbleSort
	.section	.rodata
	.align 2
.LC4:
	.string	"BubbleSort: sorting...\r\n"
	.align 2
.LC5:
	.string	"New u print\r\n"
.text
	.align 2
	.globl	_main
	.type	_main, @function
_main:
;  Function 'main'; 56 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
	nop
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-96	; alloc local storage
	addi	r6,r0,#768
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	nop
	jpl	_printArray
	sw	-8(r4),r6
	nop
	addi	r8,r0,%hi(.LC4)
	lsoi	r8,r8,%lo(.LC4)
	jpl	_u_print
	lw	r6,-4(r4)
	nop
	nop
	lw	r6,(r6)
	nop
	nop
	sw	-12(r4),r6
	nop
	addi	r8,r0,#0
	addi	r9,r0,#19
	jpl	_bubbleSort
	lw	r6,-4(r4)
	nop
	nop
	lw	r7,(r6)
	nop
	nop
	lw	r6,-12(r4)
	nop
	nop
	sub	r6,r7,r6
	sw	-12(r4),r6
	nop
	jpl	_printArray
	sw	-8(r4),r6
	nop
	addi	r6,r4,#-54
	add	r8,r0,r6
	addi	r9,r0,#54
	jpl	_storeByte
	addi	r6,r4,#-54
	addi	r6,r6,#1
	add	r8,r0,r6
	addi	r9,r0,#51
	jpl	_storeByte
	addi	r6,r4,#-54
	addi	r6,r6,#2
	add	r8,r0,r6
	addi	r9,r0,#52
	jpl	_storeByte
	addi	r6,r4,#-54
	addi	r6,r6,#3
	add	r8,r0,r6
	addi	r9,r0,#50
	jpl	_storeByte
	addi	r6,r4,#-54
	addi	r6,r6,#4
	add	r8,r0,r6
	addi	r9,r0,#55
	jpl	_storeByte
	addi	r6,r4,#-54
	addi	r6,r6,#5
	add	r8,r0,r6
	addi	r9,r0,#56
	jpl	_storeByte
	addi	r6,r4,#-54
	addi	r6,r6,#6
	add	r8,r0,r6
	addi	r9,r0,#0
	jpl	_storeByte
	addi	r8,r0,%hi(.LC5)
	lsoi	r8,r8,%lo(.LC5)
	jpl	_u_print
	addi	r6,r4,#-54
	add	r8,r0,r6
	jpl	_u_print
	addi	r8,r0,%hi(.LC2)
	lsoi	r8,r8,%lo(.LC2)
	jpl	_u_print
	addi	r6,r0,#0
	lw	r3,4(r4)	; pop LinkRegister(r3)
	nop
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	nop
	jpr	r3		; return
	.size	_main, .-_main
	.globl	_ts
.data
	.align 2
	.type	_ts, @object
	.size	_ts, 10
_ts:
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	0
	.zero	5
	.globl	_ts1
	.align 2
	.type	_ts1, @object
	.size	_ts1, 10
_ts1:
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	0
	.zero	5
	.globl	_array
	.align 2
	.type	_array, @object
	.size	_array, 80
_array:
	.long	45
	.long	75
	.long	342
	.long	54
	.long	7
	.long	86
	.long	92
	.long	235
	.long	4
	.long	42
	.long	99
	.long	78
	.long	63
	.long	352
	.long	21
	.long	634
	.long	6
	.long	77
	.long	346
	.long	23
	.comm	_temp,4,4
	.ident	"GCC: (GNU) 4.2.2"

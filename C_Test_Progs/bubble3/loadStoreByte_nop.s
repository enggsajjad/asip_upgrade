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
	.comm	_temp,4,4
	.ident	"GCC: (GNU) 4.2.2"

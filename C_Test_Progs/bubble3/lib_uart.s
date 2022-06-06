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
	.globl	_u_print3
	.type	_u_print3, @function
_u_print3:
;  Function 'u_print3'; 8 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	sw	-8(r5),r4	; push FrameRegister(r4)
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-16	; alloc local storage
	sw	8(r4),r8
	addi	r6,r0,#0
	sw	-8(r4),r6
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	jp	.L2
.L3:
	lw	r6,-8(r4)
	nop
	add	r7,r0,r6
	lw	r6,8(r4)
	nop
	add	r6,r7,r6
	lb	r6,(r6)
	nop
	andi	r6,r6,#0x00ff
	addi	r7,r6,#48
	lw	r6,-4(r4)
	nop
	sw	(r6),r7
	lw	r6,-8(r4)
	nop
	addi	r6,r6,#1
	sw	-8(r4),r6
.L2:
	lw	r6,-8(r4)
	nop
	addi	r7,r0,#2
	elt	r6,r7,r6
	brz	r6,.L3
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	jpr	r3		; return
	.size	_u_print3, .-_u_print3
	.align 2
	.globl	_u_print2
	.type	_u_print2, @function
_u_print2:
;  Function 'u_print2'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	sw	-8(r5),r4	; push FrameRegister(r4)
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	jp	.L7
.L8:
	lw	r6,8(r4)
	nop
	lb	r6,(r6)
	nop
	andi	r7,r6,#0x00ff
	lw	r6,-4(r4)
	nop
	sw	(r6),r7
	lw	r6,8(r4)
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
.L7:
	lw	r6,8(r4)
	nop
	lb	r6,(r6)
	nop
	andi	r7,r6,#0x00ff
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L8
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	jpr	r3		; return
	.size	_u_print2, .-_u_print2
	.align 2
	.globl	_u_print
	.type	_u_print, @function
_u_print:
;  Function 'u_print'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	sw	-8(r5),r4	; push FrameRegister(r4)
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	jp	.L12
.L13:
	lw	r6,8(r4)
	nop
	lb	r6,(r6)
	nop
	andi	r7,r6,#0x00ff
	lw	r6,-4(r4)
	nop
	sw	(r6),r7
	lw	r6,8(r4)
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
.L12:
	lw	r6,8(r4)
	nop
	lb	r6,(r6)
	nop
	andi	r7,r6,#0x00ff
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L13
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	jpr	r3		; return
	.size	_u_print, .-_u_print
	.align 2
	.globl	_u_printInt
	.type	_u_printInt, @function
_u_printInt:
;  Function 'u_printInt'; 20 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	sw	-8(r5),r4	; push FrameRegister(r4)
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-60	; alloc local storage
	sw	8(r4),r8
	addi	r6,r4,#-20
	lw	r8,8(r4)
	nop
	add	r9,r0,r6
	jpl	_intToStr
	addi	r6,r4,#-20
	add	r8,r0,r6
	jpl	_u_print
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
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
	sw	-8(r5),r4	; push FrameRegister(r4)
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-52	; alloc local storage
	sw	8(r4),r8
	sw	12(r4),r9
	addi	r6,r4,#-10
	lw	r8,8(r4)
	nop
	add	r9,r0,r6
	lw	r10,12(r4)
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
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	jpr	r3		; return
	.size	_u_printHex, .-_u_printHex
	.align 2
	.globl	_u_getbytes
	.type	_u_getbytes, @function
_u_getbytes:
;  Function 'u_getbytes'; 8 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	sw	-8(r5),r4	; push FrameRegister(r4)
	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-48	; alloc local storage
	sw	8(r4),r8
	sw	12(r4),r9
	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
	addi	r6,r0,#0
	sw	-8(r4),r6
	jp	.L21
.L22:
	lw	r7,8(r4)
	nop
	lw	r6,8(r4)
	nop
	addi	r6,r6,#1
	sw	8(r4),r6
	lw	r6,-4(r4)
	nop
	lw	r6,(r6)
	nop
	add	r8,r0,r7
	add	r9,r0,r6
	jpl	_storeByte
	lw	r6,-8(r4)
	nop
	addi	r6,r6,#1
	sw	-8(r4),r6
.L21:
	lw	r6,-8(r4)
	nop
	lw	r7,12(r4)
	nop
	elt	r6,r6,r7
	brnz	r6,.L22
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
	jpr	r3		; return
	.size	_u_getbytes, .-_u_getbytes
	.ident	"GCC: (GNU) 4.2.2"

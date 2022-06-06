; options passed:  -iprefix -auxbase-strip
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
	.globl	_u_print
	.type	_u_print, @function
_u_print:
;  Function 'u_print'; 4 bytes of locals, 0 regs to save, 0 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
	nop
	nop
	sw	-8(r5),r4	; push FrameRegister(r4)
        nop
        nop

	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-12	; alloc local storage
	sw	8(r4),r8
        nop
        nop

	addi	r6,r0,#256
	lsoi	r6,r6,#0
	sw	-4(r4),r6
        nop
        nop

	jp	.L2
.L3:
	lw	r6,8(r4)
        nop
        nop

	nop
	lb	r6,(r6)
        nop
        nop

	nop
	andi	r7,r6,#0x00ff
	lw	r6,-4(r4)
        nop
        nop

	nop
	sw	(r6),r7
        nop
        nop

	lw	r6,8(r4)
        nop
        nop

	nop
	addi	r6,r6,#1
	sw	8(r4),r6
        nop
        nop

.L2:
	lw	r6,8(r4)
        nop
        nop

	nop
	lb	r6,(r6)
        nop
        nop

	nop
	andi	r7,r6,#0x00ff
	addi	r6,r0,#0
	eneq	r6,r7,r6
	brnz	r6,.L3
	addi	r6,r0,#0
	nop
	lw	r3,4(r4)	; pop LinkRegister(r3)
        nop
        nop

	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
        nop
        nop

	jpr	r3		; return
	.size	_u_print, .-_u_print
	.section	.rodata
	.align 2
.LC0:
	.string	"Testing\r\n"
.text
	.align 2
	.globl	_main
	.type	_main, @function
_main:
;  Function 'main'; 0 bytes of locals, 0 regs to save, 32 byte of out. args. size.
	sw	-4(r5),r3	; push LinkRegister(r3)
        nop
        nop

	sw	-8(r5),r4	; push FrameRegister(r4)
        nop
        nop

	addi	r4, r5,#-8	; FramePtr = StackPtr-8
	addi	r5,r5,#-40	; alloc local storage
	addi	r8,r0,%hi(.LC0)
	lsoi	r8,r8,%lo(.LC0)
	jpl	_u_print
	addi	r6,r0,#0
	lw	r3,4(r4)	; pop LinkRegister(r3)
        nop
        nop

	addi	r5,r4,#8	; StackPointer = FramePointer+8
	lw	r4,(r4)		; restore FramePointer
        nop
        nop

	jpr	r3		; return
	.size	_main, .-_main
	.ident	"GCC: (GNU) 4.2.2"

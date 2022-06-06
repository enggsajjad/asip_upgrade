; Calculating manual labeling with word addressing

	.addr_space	32	; address space is 2^32
	.addressing	Word	; byte addressing          (default)
	.bits_per_byte	8	; 1 byte consists of 8 bit (default)
	.endian		Big	; Big endian (default)
	.section	.data
	.align		4

data:
	.data.32	0x12345678
	.data.32	0x98765432
	.data.8		0xAA
	.data.8		0xFF
	.data.16	0x0000
_start:
	.data.32	8
	.data.32	4
	.data.32	0

	.section	.text
	.org	0x00000000
main:

	LW		%GPR17, 0(%GPR6)
	ADDI	%GPR11, %GPR0, $10
	SW		5(%GPR6), %GPR17
	NOP
	NOP
	LLSI	%GPR17, %GPR17, $2
BRNZtest1:
	BRNZ	%GPR11, $(test1-BRNZtest1)
	NOP
	NOP
	LLSI	%GPR17, %GPR17, $2

test1:	LW	%GPR16, 1(%GPR6)
	NOP
	NOP
	NOP
	LLSI	%GPR16, %GPR16, $2
BRZtest2:
	BRZ	%GPR0, $(test2-BRZtest2)
	NOP
	NOP
	LLSI	%GPR16, %GPR16, $2
	NOP
	NOP
	NOP
test2:
	ADD	%GPR16, %GPR16, %GPR17
	NOP
	NOP
	NOP
	SW	2(%GPR6), %GPR16
	SW	3(%GPR6), %GPR17
	SW	4(%GPR6), %GPR11
	NOP
	NOP
	NOP


finish_up_main:
	; finish
	LSOI	%GPR10,	%GPR10,	$(end / 0x10000)
	LSOI	%GPR10,	%GPR10,	$(end % 0x10000)
	JPR	%GPR10


	.org	0x0FFE0000
reset:	; reset interrupt handler
	; GPR6 is all 1 register
	LSOI	%GPR4,	%GPR4,	$(0xAAAA)
	LSOI	%GPR4,	%GPR4,	$(0xAAAA)

	; GPR5 is used as ID, in trap_dump
	; also, is used as a flag that stands for the program was aborted or not
	XOR	%GPR5,	%GPR5,	%GPR5

	; GPR6 is dumping pointer
	LSOI	%GPR6,	%GPR6,	$(_start / 0x10000)
	LSOI	%GPR6,	%GPR6,	$(_start % 0x10000)

	; GPR7 is reserved now 
	XOR	%GPR7,	%GPR7,	%GPR7

	; GPR8 is reserved now
	XOR	%GPR8,	%GPR8,	%GPR8

	; GPR9 is used by system
	XOR	%GPR9,	%GPR9,	%GPR9

	; goto main (interrupt will be permitted)
	LSOI	%GPR2,	%GPR2,	$(main / 0x10000)
	LSOI	%GPR2,	%GPR2,	$(main % 0x10000)
	RETI

	.org	0x0FFE0400
ext_interrupt:
	ADDI	%GPR7,	%GPR7,	$(0x0001)
	RETI

	.org	0x0FFE0800
trap_base:


trap_abort:
	ADDI	%GPR5,	%GPR0,	$(0xFFFF)

	LSOI	%GPR10,	%GPR10,	$(end / 0x10000)
	LSOI	%GPR10,	%GPR10,	$(end % 0x10000)
	JPR	%GPR10


	.org	0x0FFE0F00
end:
	NOP
	NOP
	NOP
	NOP

; TEST relative branch from Sajjad
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Simple test program for brownie std 32 v.0.97c
;   Copyright 2008 ASIP Solutions, Inc. All rights reserved.

	.addr_space	32	; address space is 2^32
	.addressing	Byte	; byte addressing          (default)
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
data_dump_start:


	.section	.text
	.org	0x00000000
main:


	; relative branch testing
br_t:
br_pa:	
	JP		$(br0 - br_pa)		; enter br maze
br_abt:	
	TRAP	$(trap_abort - trap_base)
br0:
	LSOI	%GPR10,	%GPR10,	$(0x0000)
	LSOI	%GPR10,	%GPR10,	$(0x1111)
	ADDI	%GPR11,	%GPR11, $(0x0001)
br1:
	ADDI	%GPR11,	%GPR11, $(0x0002)
	BRZ	%GPR0,	$(br2 - br1 - 8)
	ADDI	%GPR11,	%GPR11, $(0x0040); next instruction is not executed (fetched) when a branch occurs (taken)
br2:
	ADDI	%GPR11,	%GPR11, $(0x0004)
	BRZ	%GPR10,	$(br_abt - br2)
	ADDI	%GPR11,	%GPR11, $(0x0080); next instruction is executed (fetched) when a branch does not occur (taken)
br3:
	ADDI	%GPR11,	%GPR11, $(0x0008)
	BRNZ	%GPR0,	$(br_abt - br3)
	ADDI	%GPR11,	%GPR11, $(0x0200); next instruction is executed (fetched) when a branch does not occur (taken)
br4:
	ADDI	%GPR11,	%GPR11, $(0x0010)
	BRNZ	%GPR10,	$(br5 - br4 - 8)
	ADDI	%GPR11,	%GPR11, $(0x0100); next instruction is not executed (fetched) when a branch occurs (taken)
br5:
	NOP						; clear
	ADDI	%GPR11,	%GPR11, $(0x0020)
	SW	0x0000(%GPR6),	%GPR4	; 0xAAAAAAAA - separater for easy look up
	SW	0x0004(%GPR6),	%GPR5	; put ID
	SW	0x0008(%GPR6),	%GPR1	; status register
	SW	0x000C(%GPR6),	%GPR2	; interrupt return register
	SW	0x0010(%GPR6),	%GPR3	; link register
	SW	0x0014(%GPR6),	%GPR11	; should be  
	; OK, go to the next test

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
	LSOI	%GPR6,	%GPR6,	$(data_dump_start / 0x10000)
	LSOI	%GPR6,	%GPR6,	$(data_dump_start % 0x10000)

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

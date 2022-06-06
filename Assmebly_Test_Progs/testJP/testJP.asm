;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

	; relative jump testing
jp_t:
jp0:	
	ORI	%GPR11,	%GPR0, $(0x0001)
	JP	$(jp1 - jp0 - 8)
	ORI	%GPR11,	%GPR0, $(0x0020)

jp2:	
	ORI	%GPR11,	%GPR11, $(0x0002)
	JP	$(jp3 - jp2 - 8)
	ORI	%GPR11,	%GPR0, $(0x0040)

jp1:
	ORI	%GPR11,	%GPR11, $(0x0004)
	JP	$(jp2 - jp1 - 8)
	ORI	%GPR11,	%GPR0, $(0x0080)

jp3:
	ORI	%GPR11,	%GPR11, $(0x0008)
	JP	$(jp4 - jp3 - 8)
	ORI	%GPR11,	%GPR0, $(0x0100)

jp4:
	ADDI	%GPR11,	%GPR11, $(0x0010)
	NOP
	SW	0x0000(%GPR6),	%GPR4	; 0xAAAAAAAA - separater for easy look up
	SW	0x0004(%GPR6),	%GPR5	; put ID
	SW	0x0008(%GPR6),	%GPR1	; status register
	SW	0x000C(%GPR6),	%GPR2	; interrupt return register
	SW	0x0010(%GPR6),	%GPR3	; link register
	SW	0x0014(%GPR6),	%GPR11	; should be 0x1F at 0x20 


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

	.org	0x0FFE0F00
end:
	NOP
	NOP
	NOP
	NOP

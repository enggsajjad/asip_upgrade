; TEST Absolute Jump
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


	; absolute jump testing
jpr_t:
	LSOI	%GPR10,	%GPR10,	$(jpr1 / 0x10000)
	LSOI	%GPR10,	%GPR10,	$(jpr1 % 0x10000)
	LSOI	%GPR11,	%GPR11,	$(jpr2 / 0x10000)
	LSOI	%GPR11,	%GPR11,	$(jpr2 % 0x10000)
	LSOI	%GPR12,	%GPR12,	$(jpr3 / 0x10000)
	LSOI	%GPR12,	%GPR12,	$(jpr3 % 0x10000)
	LSOI	%GPR13,	%GPR13,	$(jpr4 / 0x10000)
	LSOI	%GPR13,	%GPR13,	$(jpr4 % 0x10000)
	JPR	%GPR10					; enter jpr maze
	TRAP    $(trap_abort - trap_base)

jpr2:
	JPR		%GPR12
	TRAP    $(trap_abort - trap_base)

jpr1:
	JPR		%GPR11
	TRAP    $(trap_abort - trap_base)

jpr3:
	JPR		%GPR13
	TRAP    $(trap_abort - trap_base)

jpr4:
	NOP						; clear
	ADDI	%GPR11,	%GPR0, $(0x0001)
	SW	0x04(%GPR6),	%GPR11	;


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
	ADDI	%GPR11,	%GPR0, $(0x0020)
	SW	0x04(%GPR6),	%GPR11	

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

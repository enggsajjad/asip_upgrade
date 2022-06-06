;	TEST1: Checking All commands


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
R10:
	.data.32	0x00000002	;0	GPR11 
	.data.32	0x00000009	;4	GPR12
  

	.section	.text
	.org	0x00000000

main:

	; load some values
	LSOI	%GPR10,	%GPR10,	$(R10 / 0x10000)
	LSOI	%GPR10,	%GPR10,	$(R10 % 0x10000)

	LW	%GPR11, 0(%GPR10)	;2
	LW	%GPR12, 4(%GPR10)	;9
	NOP						; required for load delay slot
	;call RI Commands
	ADDI %GPR13, %GPR12, $(2)	;shoule be 11
	SUBI %GPR14, %GPR12, $(2)	; 9
	ANDI %GPR15, %GPR12, $(2)	;0
	ORI %GPR16, %GPR12, $(2)	;11
	XORI %GPR17, %GPR12, $(2)	;11
	LLSI %GPR18, %GPR12, $(2)	;36
	LRSI %GPR19, %GPR12, $(2)	;2
	ARSI %GPR20, %GPR12, $(2)	;2
	LSOI %GPR21, %GPR12, $(2)	;0x00090002

	EXBW %GPR22, %GPR12	;0x00090002
	EXHW %GPR23, %GPR12	;0x00090002

	;store values
	SW	8(%GPR10),    %GPR13
	SW	12(%GPR10),    %GPR14
	SW	16(%GPR10),    %GPR15
	SW	20(%GPR10),    %GPR16
	SW	24(%GPR10),    %GPR17
	SW	28(%GPR10),    %GPR18
	SW	32(%GPR10),    %GPR19
	SW	36(%GPR10),    %GPR20
	SW	40(%GPR10),    %GPR21
	SW	44(%GPR10),    %GPR22
	SW	48(%GPR10),    %GPR23


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

	; increment interrupt return register to return correctly
	ADDI	%GPR2,	%GPR2,	$(0x0004)
	RETI


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

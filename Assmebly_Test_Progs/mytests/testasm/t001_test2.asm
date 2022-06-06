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

	;call trap for RR Commands
	TRAP	$(trap_RR - trap_base)
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

trap_RR:
	ADD %GPR13, %GPR12, %GPR11	;shoule be 11
	SUB %GPR14, %GPR12, %GPR11	; 9
	MUL %GPR15, %GPR12, %GPR11	;18
	DIV %GPR16, %GPR12, %GPR11	;4
	DIVU %GPR17, %GPR12, %GPR11	;4
	MOD %GPR18, %GPR12, %GPR11	;1
	MODU %GPR19, %GPR12, %GPR11	;1
	AND %GPR20, %GPR12, %GPR11	;0
	NAND %GPR21, %GPR12, %GPR11
	OR %GPR22, %GPR12, %GPR11	;11
	NOR %GPR23, %GPR12, %GPR11
	XOR %GPR24, %GPR12, %GPR11	;11
	LLS %GPR25, %GPR12, %GPR11	;36
	LRS %GPR26, %GPR12, %GPR11	;2
	ARS %GPR27, %GPR12, %GPR11	;0x40000002
	ELT %GPR28, %GPR12, %GPR11	;0
	ELTU %GPR29, %GPR12, %GPR11	;0
	EEQ %GPR30, %GPR12, %GPR11	;0
	ENEQ %GPR31, %GPR12, %GPR11	;1

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
	SW	52(%GPR10),    %GPR24
	SW	56(%GPR10),    %GPR25
	SW	60(%GPR10),    %GPR26
	SW	64(%GPR10),    %GPR27
	SW	68(%GPR10),    %GPR28
	SW	72(%GPR10),    %GPR29
	SW	76(%GPR10),    %GPR30
	SW	80(%GPR10),    %GPR31
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

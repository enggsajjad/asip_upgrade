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
	.data.32	0x0000000B	;0	GPR11 
	.data.32	0x0000000C	;4	GPR12
	.data.32	0x0000000D	;8	GPR13 
	.data.32	0x0000000E	;12	GPR14 
	.data.32	0x0000000F	;16 GPR15 
	.data.32	0x00000010	;20	GPR16 
	.data.32	0x00000011	;24	GPR17
	.data.32	0x00000012	;28	GPR18 
	.data.32	0x00000013	;32	GPR19 
	.data.32	0x00000014	;36	GPR20 
	.data.32	0x00000015	;40	GPR21  

	.section	.text
	.org	0x00000000

main:

	; load some values
	LSOI	%GPR10,	%GPR10,	$(R10 / 0x10000)
	LSOI	%GPR10,	%GPR10,	$(R10 % 0x10000)

	LW	%GPR12, 4(%GPR10)
	LW	%GPR13, 8(%GPR10)
	LW	%GPR15, 16(%GPR10)
	LW	%GPR17, 24(%GPR10)
	LW	%GPR19, 32(%GPR10)
	LW	%GPR21, 40(%GPR10)

	; perform some operations
	ADD %GPR11, %GPR12, %GPR13
	SUB %GPR14, %GPR15, %GPR11
	AND %GPR16, %GPR11, %GPR17
	OR %GPR18, %GPR11, %GPR19
	XOR %GPR20, %GPR11, %GPR21
	; store the results to confirm
	SW	0(%GPR10),    %GPR11	; should be 25
	SW	12(%GPR10),    %GPR14	; should be 4
	SW	20(%GPR10),     %GPR16  ; should be 1
	SW	28(%GPR10),     %GPR18	; should be 27
	SW	36(%GPR10),     %GPR20	; should be 30

	;TRAP	$(trap_abort - trap_base)

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
trap_rf_clear:
	XOR	%GPR10,	%GPR10,	%GPR10
	XOR	%GPR11,	%GPR11,	%GPR11
	XOR	%GPR12,	%GPR12,	%GPR12
	XOR	%GPR13,	%GPR13,	%GPR13
	XOR	%GPR14,	%GPR14,	%GPR14
	XOR	%GPR15,	%GPR15,	%GPR15
	XOR	%GPR16,	%GPR16,	%GPR16
	XOR	%GPR17,	%GPR17,	%GPR17
	XOR	%GPR18,	%GPR18,	%GPR18
	XOR	%GPR19,	%GPR19,	%GPR19
	XOR	%GPR20,	%GPR20,	%GPR20
	XOR	%GPR21,	%GPR21,	%GPR21
	XOR	%GPR22,	%GPR22,	%GPR22
	XOR	%GPR23,	%GPR23,	%GPR23
	XOR	%GPR24,	%GPR24,	%GPR24
	XOR	%GPR25,	%GPR26,	%GPR25
	XOR	%GPR26,	%GPR27,	%GPR27
	XOR	%GPR27,	%GPR28,	%GPR28
	XOR	%GPR28,	%GPR28,	%GPR28
	XOR	%GPR29,	%GPR29,	%GPR29
	XOR	%GPR30,	%GPR30,	%GPR30
	XOR	%GPR31,	%GPR31,	%GPR31

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

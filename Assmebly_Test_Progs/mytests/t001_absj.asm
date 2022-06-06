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
	JPR		%GPR10					; enter jpr maze
	TRAP    $(trap_abort - trap_base)
jpr2:	
	ADDI	%GPR11,	%GPR11, $(0x0001)
	JPR		%GPR12
	ADDI	%GPR11,	%GPR11, $(0x0010)
	TRAP    $(trap_abort - trap_base)
jpr1:
	ADDI	%GPR11,	%GPR11, $(0x0002)
	JPR		%GPR11
	ADDI	%GPR11,	%GPR11, $(0x0020)
	TRAP    $(trap_abort - trap_base)
jpr3:
	ADDI	%GPR11,	%GPR11, $(0x0004)
	JPR		%GPR13
	ADDI	%GPR11,	%GPR11, $(0x0040)
	TRAP    $(trap_abort - trap_base)
jpr4:
	NOP						; clear

	ADDI	%GPR11,	%GPR11, $(0x0008)
	SW	0x0000(%GPR6),	%GPR4	; 0xAAAAAAAA - separater for easy look up
	SW	0x0004(%GPR6),	%GPR5	; put ID
	SW	0x0008(%GPR6),	%GPR1	; status register
	SW	0x000C(%GPR6),	%GPR2	; interrupt return register
	SW	0x0010(%GPR6),	%GPR3	; link register
	SW	0x0014(%GPR6),	%GPR11	; link register

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

trap_dump:
	SW	0x0000(%GPR6),	%GPR4	; 0xAAAAAAAA - separater for easy look up
	SW	0x0004(%GPR6),	%GPR5	; put ID
	SW	0x0008(%GPR6),	%GPR1	; status register
	SW	0x000C(%GPR6),	%GPR2	; interrupt return register
	SW	0x0010(%GPR6),	%GPR3	; link register
	SW	0x0014(%GPR6),	%GPR10	; GPR10 - 31 are dumped
	SW	0x0018(%GPR6),	%GPR11
	SW	0x001C(%GPR6),	%GPR12
	SW	0x0020(%GPR6),	%GPR13
	SW	0x0024(%GPR6),	%GPR14
	SW	0x0028(%GPR6),	%GPR15
	SW	0x002C(%GPR6),	%GPR16
	SW	0x0030(%GPR6),	%GPR17
	SW	0x0034(%GPR6),	%GPR18
	SW	0x0038(%GPR6),	%GPR19
	SW	0x003C(%GPR6),	%GPR20
	SW	0x0040(%GPR6),	%GPR21
	SW	0x0044(%GPR6),	%GPR22
	SW	0x0048(%GPR6),	%GPR23
	SW	0x004C(%GPR6),	%GPR24
	SW	0x0050(%GPR6),	%GPR25
	SW	0x0054(%GPR6),	%GPR26
	SW	0x0058(%GPR6),	%GPR27
	SW	0x005C(%GPR6),	%GPR28
	SW	0x0060(%GPR6),	%GPR29
	SW	0x0064(%GPR6),	%GPR30
	SW	0x0068(%GPR6),	%GPR31

	; increment dumping pointer
	ADDI	%GPR6,	%GPR6,	$(0x006C)

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

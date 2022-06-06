; Load Store Test
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


lsw_t:
	ADDI	%GPR10, %GPR0 , $(0x0000)
	LSOI	%GPR10, %GPR10, $(0x0400)
	ADDI	%GPR11, %GPR0 , $(0x0000)
	LSOI	%GPR11, %GPR11, $(0x0001)
	ADDI	%GPR12, %GPR0 , $(0x0000)
	LSOI	%GPR12, %GPR12, $(0x0010)
	ADDI	%GPR13, %GPR0 , $(0x0000)
	LSOI	%GPR13, %GPR13, $(0xFFFF)
	ADDI	%GPR14, %GPR0 , $(0xFFFF)
	LSOI	%GPR14, %GPR14, $(0xFFFF)

	SW	-16(%GPR10),    %GPR11
	SW	-12(%GPR10),    %GPR12
	SW	-8(%GPR10),     %GPR13
	SW	-4(%GPR10),     %GPR14
	ADDI	%GPR15, %GPR0 , $(0x8000)
	LSOI	%GPR15, %GPR15, $(0x0000)
	SW	0(%GPR10),      %GPR15
	SW	4(%GPR10),      %GPR14
	SW	8(%GPR10),      %GPR13
	SW	12(%GPR10),     %GPR12
	SW	16(%GPR10),     %GPR11

	LW	%GPR21, -16(%GPR10)
	LW	%GPR22, -12(%GPR10)
	LW	%GPR23, -8(%GPR10)
	LW	%GPR24, -4(%GPR10)
	
	LW	%GPR25, 0(%GPR10)
	NOP
	ADDI	%GPR25, %GPR25,  $(0x0001)
	SW	20(%GPR10),      %GPR25

	LW	%GPR26, 4(%GPR10)
	LW	%GPR27, 8(%GPR10)
	LW	%GPR28, 12(%GPR10)
	LW	%GPR29, 16(%GPR10)





	ADDI	%GPR31, %GPR0,  $(0x0001)
	EEQ	%GPR30, %GPR21, %GPR11
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR22, %GPR12
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR23, %GPR13
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR24, %GPR14
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR25, %GPR15
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR26, %GPR14
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR27, %GPR13
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR28, %GPR12
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR29, %GPR11
	AND	%GPR31, %GPR31, %GPR30

ev1:	BRNZ	%GPR31, $(ev2 - ev1)
		TRAP	$(trap_abort - trap_base)
ev2:	NOP

	ADDI	%GPR10, %GPR0 , $(0x0000)
	LSOI	%GPR10, %GPR10, $(0x0450)
	ADDI	%GPR11, %GPR0 , $(0x0000)
	LSOI	%GPR11, %GPR11, $(0x0001)
	ADDI	%GPR12, %GPR0 , $(0x0000)
	LSOI	%GPR12, %GPR12, $(0x0010)
	ADDI	%GPR13, %GPR0 , $(0x0000)
	LSOI	%GPR13, %GPR13, $(0xFFFF)
	ADDI	%GPR14, %GPR0 , $(0x0000)
	LSOI	%GPR14, %GPR14, $(0xABCD)
	ADDI	%GPR15, %GPR0 , $(0x0000)
	LSOI	%GPR15, %GPR15, $(0x0000)

	SH	-16(%GPR10),    %GPR11
	SH	-12(%GPR10),    %GPR12
	SH	-8(%GPR10),     %GPR13
	SH	-4(%GPR10),     %GPR14
	SH	0(%GPR10),      %GPR15
	SH	4(%GPR10),      %GPR14
	SH	8(%GPR10),      %GPR13
	SH	12(%GPR10),     %GPR12
	SH	16(%GPR10),     %GPR11
	LH	%GPR21, -16(%GPR10)
	LH	%GPR22, -12(%GPR10)
	LH	%GPR23, -8(%GPR10)
	LH	%GPR24, -4(%GPR10)
	LH	%GPR25, 0(%GPR10)
	LH	%GPR26, 4(%GPR10)
	LH	%GPR27, 8(%GPR10)
	LH	%GPR28, 12(%GPR10)
	LH	%GPR29, 16(%GPR10)

	ADDI	%GPR31, %GPR0,  $(0x0001)
	EEQ	%GPR30, %GPR21, %GPR11
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR22, %GPR12
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR23, %GPR13			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR24, %GPR14			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR25, %GPR15
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR26, %GPR14			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR27, %GPR13			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR28, %GPR12
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR29, %GPR11
	AND	%GPR31, %GPR31, %GPR30

ev3:	BRNZ	%GPR31, $(ev4 - ev3 - 4)
		TRAP	$(trap_abort - trap_base)
ev4:	NOP

	ADDI	%GPR10, %GPR0 , $(0x0000)
	LSOI	%GPR10, %GPR10, $(0x0500)
	ADDI	%GPR11, %GPR0 , $(0x0000)
	LSOI	%GPR11, %GPR11, $(0x0001)
	ADDI	%GPR12, %GPR0 , $(0x0000)
	LSOI	%GPR12, %GPR12, $(0x0010)
	ADDI	%GPR13, %GPR0 , $(0x0000)
	LSOI	%GPR13, %GPR13, $(0x00FF)
	ADDI	%GPR14, %GPR0 , $(0x0000)
	LSOI	%GPR14, %GPR14, $(0x00AB)
	ADDI	%GPR15, %GPR0 , $(0x0000)
	LSOI	%GPR15, %GPR15, $(0x0000)

	SB	-16(%GPR10),    %GPR11
	SB	-12(%GPR10),    %GPR12
	SB	-8(%GPR10),     %GPR13
	SB	-4(%GPR10),     %GPR14
	SB	0(%GPR10),      %GPR15
	SB	4(%GPR10),      %GPR14
	SB	8(%GPR10),      %GPR13
	SB	12(%GPR10),     %GPR12
	SB	16(%GPR10),     %GPR11

	LB	%GPR21, -16(%GPR10)
	LB	%GPR22, -12(%GPR10)
	LB	%GPR23, -8(%GPR10)
	LB	%GPR24, -4(%GPR10)
	LB	%GPR25, 0(%GPR10)
	LB	%GPR26, 4(%GPR10)
	LB	%GPR27, 8(%GPR10)
	LB	%GPR28, 12(%GPR10)
	LB	%GPR29, 16(%GPR10)

	ADDI	%GPR31, %GPR0,  $(0x0001)
	EEQ	%GPR30, %GPR21, %GPR11
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR22, %GPR12
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR23, %GPR13			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR24, %GPR14			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR25, %GPR15
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR26, %GPR14			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	ENEQ	%GPR30, %GPR27, %GPR13			; not equal becase signed ext.
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR28, %GPR12
	AND	%GPR31, %GPR31, %GPR30
	EEQ	%GPR30, %GPR29, %GPR11
	AND	%GPR31, %GPR31, %GPR30

ev5:	BRNZ	%GPR31, $(ev6 - ev5 - 4)
		TRAP	$(trap_abort -  trap_base)
ev6:	NOP


load_static_data_t:
	LSOI	%GPR10,	%GPR10,	$(data / 0x10000)
	LSOI	%GPR10,	%GPR10,	$(data % 0x10000)

	LW	%GPR11,	0x0000(%GPR10)
	LW	%GPR12,	0x0004(%GPR10)
	LW	%GPR13,	0x0008(%GPR10)

	LH	%GPR14,	0x0000(%GPR10)
	LH	%GPR15,	0x0002(%GPR10)
	LH	%GPR16,	0x0004(%GPR10)
	LH	%GPR17,	0x0006(%GPR10)
	LH	%GPR18,	0x0008(%GPR10)
	LH	%GPR19,	0x000A(%GPR10)

	LB	%GPR20,	0x0000(%GPR10)
	LB	%GPR21,	0x0001(%GPR10)
	LB	%GPR22,	0x0002(%GPR10)
	LB	%GPR23,	0x0003(%GPR10)
	LB	%GPR24,	0x0004(%GPR10)
	LB	%GPR25,	0x0005(%GPR10)
	LB	%GPR26,	0x0006(%GPR10)
	LB	%GPR27,	0x0007(%GPR10)
	LB	%GPR28,	0x0008(%GPR10)
	LB	%GPR29,	0x0009(%GPR10)
	LB	%GPR30,	0x000A(%GPR10)
	LB	%GPR31,	0x000B(%GPR10)

	ADDI	%GPR5,	%GPR0,	$(0x0005)	; set dump ID
	TRAP	$(trap_dump - trap_base)

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

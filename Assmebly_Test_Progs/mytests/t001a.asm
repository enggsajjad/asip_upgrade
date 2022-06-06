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
	LSOI	%GPR10, %GPR10, $(0x0020)
	ADDI	%GPR11, %GPR0 , $(0x0000)
	LSOI	%GPR11, %GPR11, $(0x0001)
	ADDI	%GPR12, %GPR0 , $(0x0000)
	LSOI	%GPR12, %GPR12, $(0x0002)
	ADDI	%GPR13, %GPR0 , $(0x0000)
	LSOI	%GPR13, %GPR13, $(0x0003)
	ADDI	%GPR14, %GPR0 , $(0x0000)
	LSOI	%GPR14, %GPR14, $(0x0004)
	ADDI	%GPR15, %GPR0 , $(0x0000)
	LSOI	%GPR15, %GPR15, $(0x0005)

	SW	-16(%GPR10),    %GPR11
	SW	-12(%GPR10),    %GPR12
	SW	-8(%GPR10),     %GPR13
	SW	-4(%GPR10),     %GPR14
	SW	0(%GPR10),      %GPR15
	SW	4(%GPR10),      %GPR14
	SW	8(%GPR10),      %GPR13
	SW	12(%GPR10),     %GPR12
	SW	16(%GPR10),     %GPR11

	;clear registers
	XOR     %GPR11, %GPR11, %GPR11	
	XOR     %GPR12, %GPR12, %GPR12
	XOR     %GPR13, %GPR13, %GPR13
	XOR     %GPR14, %GPR14, %GPR14
	XOR     %GPR15, %GPR15, %GPR15
	XOR     %GPR16, %GPR16, %GPR16	

add0:
	BRZ	%GPR0, $(add21-add0-4)
	TRAP	$(trap_abort - trap_base)

	ADDI	%GPR15, %GPR15,  $(0x0111); executed when branch is not taken
					  ; not executed when brunch is taken

add11:
	ADDI	%GPR16, %GPR16,  $(0x11)
	
	ADDI	%GPR10, %GPR0 , $(0x0000)
	LSOI	%GPR10, %GPR10, $(0x0020)
	
	LW	%GPR11, -16(%GPR10)
	ADDI	%GPR11, %GPR11,  $(0x0011)
	LW	%GPR12, -12(%GPR10)
	ADDI	%GPR12, %GPR12,  $(0x0011)
	LW	%GPR13, -8(%GPR10)
	ADDI	%GPR13, %GPR13,  $(0x0011)
	LW	%GPR14, -4(%GPR10)
	ADDI	%GPR14, %GPR14,  $(0x0011)
	LW	%GPR15, 0(%GPR10)
	ADDI	%GPR15, %GPR15,  $(0x0011)
	
	SW	20(%GPR10),      %GPR15
	SW	24(%GPR10),      %GPR14
	SW	28(%GPR10),      %GPR13
	SW	32(%GPR10),     %GPR12
	SW	36(%GPR10),     %GPR11
	SW	60(%GPR10),     %GPR16


add21:
	ADDI	%GPR16, %GPR16,  $(0x21)

	ADDI	%GPR10, %GPR0 , $(0x0000)
	LSOI	%GPR10, %GPR10, $(0x0020)

	LW	%GPR11, -16(%GPR10)
	;NOP
	ADDI	%GPR11, %GPR11,  $(0x0021)
	;NOP
	LW	%GPR12, -12(%GPR10)
	ADDI	%GPR12, %GPR12,  $(0x0021)
	LW	%GPR13, -8(%GPR10)
	ADDI	%GPR13, %GPR13,  $(0x0021)
	LW	%GPR14, -4(%GPR10)
	ADDI	%GPR14, %GPR14,  $(0x0021)
	LW	%GPR15, 0(%GPR10)
	ADDI	%GPR15, %GPR15,  $(0x0021)
	
	SW	40(%GPR10),      %GPR15
	SW	44(%GPR10),      %GPR14
	SW	48(%GPR10),      %GPR13
	SW	52(%GPR10),     %GPR12
	SW	56(%GPR10),     %GPR11
	SW	64(%GPR10),     %GPR16



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

	TRAP	$(trap_abort - trap_base)

mode_check:
	; we are user mode now, so be prohibited to update the status register
	ORI	%GPR1,	%GPR1,	$(0xFFFF)

	LSOI	%GPR5,	%GPR5,	$(0x0000)	; set dump ID
	LSOI	%GPR5,	%GPR5,	$(0x0006)	; 
	SW	0x0000(%GPR6),	%GPR4		; 0xAAAAAAAA - separater for easy look up
	SW	0x0004(%GPR6),	%GPR5		; put ID
	SW	0x0008(%GPR6),	%GPR1		; status is dumped

	; increment dumping pointer
	ADDI	%GPR6,	%GPR6,	$(0x000C)

	TRAP	$(trap_mode_check - trap_base)
	
	; above trap_mode_check could break status register, 
	; we finish program immediately

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
;	XOR	%GPR10,	%GPR10,	%GPR10
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

	LSOI	%GPR20,	%GPR20,	$(end / 0x10000)
	LSOI	%GPR20,	%GPR20,	$(end % 0x10000)
	JPR	%GPR20

trap_mode_check:
	ORI	%GPR1,	%GPR1,	$(0xFFFF)
	
	LSOI	%GPR5,	%GPR5,	$(0x0000)	; set dump ID
	LSOI	%GPR5,	%GPR5,	$(0x0007)	; 
	SW	0x0000(%GPR6),	%GPR4		; 0xAAAAAAAA - separater for easy look up
	SW	0x0004(%GPR6),	%GPR5		; put ID
	SW	0x0008(%GPR6),	%GPR1		; status is dumped

	; increment dumping pointer
	ADDI	%GPR6,	%GPR6,	$(0x000C)

	; increment interrupt return register to return correctly
	; but this routine breaks status register, 
	; you need to abort or finish immediately
	ADDI	%GPR2,	%GPR2,	$(0x0004)
	RETI

	.org	0x0FFE0F00
end:
	NOP
	NOP
	NOP
	NOP

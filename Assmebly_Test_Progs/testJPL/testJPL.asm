;relative jump with link testing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	; relative jump with link testing
jpl_t:
	LSOI	%GPR10,	%GPR10,	$(jpl1 / 0x10000)
	LSOI	%GPR10,	%GPR10,	$(jpl1 % 0x10000)
	ADDI	%GPR10,	%GPR10,	$(4)

jpl1:
	JPL	$(jpl2 - jpl1 - 4)
	TRAP	$(trap_abort - trap_base)

jpl2:
	EEQ	%GPR11,	%GPR10,	%GPR3			; check saved value

jpl3:
	BRNZ	%GPR11, $(jpl4 - jpl3 - 4)
	TRAP	$(trap_abort - trap_base)		; trapped

jpl4:
	NOP						; clear
	; OK, go to the next test

	; absolute jump with link testing
jprl_t:
	LSOI	%GPR10, %GPR10,	$(jprl1 / 0x10000)
	LSOI	%GPR10, %GPR10,	$(jprl1 % 0x10000)
	ADDI	%GPR10, %GPR10,	$(4)
	LSOI	%GPR11, %GPR11,	$(jprl2 / 0x10000)
	LSOI	%GPR11, %GPR11,	$(jprl2 % 0x10000)

jprl1:
	JPRL	%GPR11
	TRAP	$(trap_abort - trap_base)

jprl2:
	EEQ	%GPR12, %GPR10, %GPR3			; check saved value

jprl3:
	BRNZ	%GPR12, $(jprl4 - jprl3 - 4)
	TRAP	$(trap_abort - trap_base)		; trapped

jprl4:
	NOP						; clear
	ADDI	%GPR11,	%GPR0, $(0x0010)
	SW	0x04(%GPR6),	%GPR11	; should be 0x10 at 0x00000010 

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
; Simple test program for brownie std 32 v.0.97c
;   Copyright 2008 ASIP Solutions, Inc. All rights reserved.

	.addr_space	32	; address space is 2^32
	.addressing	Byte	; byte addressing          (default)
	.bits_per_byte	8	; 1 byte consists of 8 bit (default)
	.endian		Big	; Big endian (default)
	.section	.data
	.align		4
	.org		0x00000000

data:
	.data.32	0x000005
	.data.32	0x000009
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00
	.data.32	0x00


	.section	.text
	.org	0x00000000
main:

	;LSOI	%GPR11,	%GPR0,	$(data / 0x10000)
	;LSOI	%GPR11,	%GPR0,	$(data % 0x10000)
	ADDI	%GPR11, %GPR0, $(0x0000)
	LSOI    %GPR11, %GPR11, $(0x0000)

	ADDI    %GPR19, %GPR0, $(0xa)
	SW	40(%GPR11), %GPR19

	LW	%GPR12, 0(%GPR11)
	NOP
	ADDI 	%GPR12, %GPR12, 	$(5)
	LW	%GPR13, 4(%GPR11)
	NOP
	ADDI 	%GPR13, %GPR13,	$(5)

	ADDI 	%GPR14, %GPR0, 	$(5)
	ADDI 	%GPR14, %GPR14, 	$(9)
	SUB 	%GPR15, %GPR13, 	%GPR12

	BRZ 	%GPR0, $(dump)
	ADDI 	%GPR16, %GPR0, 	$(6)
	ADDI 	%GPR17, %GPR0, 	$(7)
	ADDI 	%GPR18, %GPR0, 	$(8)

dump:
	SW	8(%GPR11),      %GPR14
	SW	12(%GPR11),     %GPR12
	SW	16(%GPR11),     %GPR13
	SW	20(%GPR11),     %GPR14
	SW	24(%GPR11),     %GPR15
	SW	28(%GPR11),     %GPR16
	SW	32(%GPR11),     %GPR17
	SW	36(%GPR11),     %GPR18


end:
	NOP
	NOP
	NOP
	TRAP $(0)

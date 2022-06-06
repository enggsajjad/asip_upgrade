;One more Example 
;To prevent a stall in this example, we would need to forward the values of R1 and R4 from the pipeline registers to the ALU and data memory inputs. 
;	 	1	2	3	4	5	6	7
;ADD	R1, R2, R3	IF	ID	EXadd	MEMadd	WB	 	 
;LW	R4, d (R1)	 	IF	ID	EXlw	MEMlw	WB	 
;SW	R4,12(R1)	 	 	IF	ID	EXsw	MEMsw	WB
;Stores require an operand during MEM, and forwarding of that operand is shown here. 
;The first forwarding is for value of R1 from EXadd to EXlw . 
;The second forwarding is also for value of R1 from MEMadd to EXsw. 
;The third forwarding is for value of R4 from MEMlw to MEMsw. 
;Observe that the SW instruction is storing the value of R4 into a memory location computed by adding the displacement 12 to the value contained in register R1. This effective address computation is 
;done in the ALU during the EX stage of the SW instruction. The value to be stored (R4 in this case) is needed only in the MEM stage as an input to Data Memory. Thus the value of R1 is forwarded to 
;the EX stage for effective address computation and is needed earlier in time than the value of R4 which is forwarded to the input of Data Memory in the MEM stage. 
;So forwarding takes place from "left-to-right" in time, but operands are not ALWAYS forwarded to the EX stage - it depends on the instruction and the point in the Datapath where the operand is 
;needed. Of course, hardware support is necessary to support data forwarding. 

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
	.data.32	0x00000000	;0	GPR11 
	.data.32	0x00000004	;4	GPR12
	.data.32	0x00000008	;8	GPR13 
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

	LW	%GPR12, 4(%GPR10)		; 4 from 0x10
	LW	%GPR13, 8(%GPR10)		; 8 from 0x14
	;NOP 						;required, otherwise newxt ADD is not doing anything
								; perform some operations; causing dependencies
	ADD %GPR11, %GPR12, %GPR13	;should be 12
	LW	%GPR14, 4(%GPR11)		;should be 4 from 0x10
	NOP							;required, otherwise newxt SW is not writing anything
	SW	8(%GPR11),    %GPR14	; should be 4 at 0x14
	SW	40(%GPR10),   %GPR11	; should be 0XC at 0x34
	SW	44(%GPR10),   %GPR13	; should be 0X8 at 0x38


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
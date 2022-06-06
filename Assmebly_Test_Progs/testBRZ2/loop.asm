	.section	.text
	.addressing	Word
	.section	.text
	.addressing	Word
	;.addressing	Word

	xor	%r30, %r30, %r30
	xor	%r29, %r29, %r29
	xor	%r28, %r28, %r28
	nop
	lhi	%r30, $(0xFFFFC/0x10000)
	lhi	%r29, $(0xFFFFC/0x10000)
	nop
	nop
	ori	%r30, %r30, $(0xFFFFC%0x10000)
	ori	%r29, %r29, $(0xFFFFC%0x10000)
	nop
	nop
	nop
	sw	-4(%r29), %r30
	sw	-8(%r29), %r31
	addi	%r29, %r30, $-8
	nop
	nop
	nop
	jal	main	
	nop
	nop
	nop
	nop
	nop
	sw	0(%r29), %r1
	jal	exit
	nop
	nop

	;.addressing	Word

main:
	addi	%r3, %r0, $8
	nop
	nop
	nop
	slli	%r3, %r3, $1
	lw	%r7, C(%r0)
	addi	%r1, %r0, $10
	nop
	nop
	addi	%r7, %r7, $5

loop:	lw	%r6, B(%r4)
	subi	%r1, %r1, $1
	nop
	nop
	add	%r6, %r6, %r7
	nop
	nop
	nop
	sw	A(%r4), %r6
	addi	%r4, %r4, $4
	bnez	%r1, loop
	nop
	nop

	.section	.data
	;.addressing	Word

A:	.data.32	0
	.data.32	0
	.data.32	0
	.data.32	0
	.data.32	0
	.data.32	0
	.data.32	0
	.data.32	0
	.data.32	0
	.data.32	0

B:	.data.32	1
	.data.32	2
	.data.32	3
	.data.32	4
	.data.32	5
	.data.32	6
	.data.32	7
	.data.32	8
	.data.32	9
	.data.32	10

C:	.data.32	42

	.section	.text
	.addressing	Word
	;.addressing	Word
	nop
exit:
	nop
	nop


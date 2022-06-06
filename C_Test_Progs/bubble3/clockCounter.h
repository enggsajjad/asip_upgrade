#ifndef _clockCounter_h_weqghxt78qew4zdtoe4783a9zxtme478tzc7
#define _clockCounter_h_weqghxt78qew4zdtoe4783a9zxtme478tzc7

#define CLOCK_COUNTER_HI_ADDR 0x3000000

/*
#define CLOCK_COUNTER_HI_ADDR 0x300

asm void writeClockCounter(int value){
 @[
	.barrier
	.scratch temp
	.restrict temp:reg
 ]
	lhi	@{temp}, $CLOCK_COUNTER_HI_ADDR
	nop
	nop
	nop
	sw	0(@{temp}), @{value}
}

asm int readClockCounter(){
@[
	.barrier
  ]
	lhi	@{},$CLOCK_COUNTER_HI_ADDR
	nop
	nop
	nop
	lw	@{}, 0(@{})
	nop
	nop
	nop
}
*/
#endif


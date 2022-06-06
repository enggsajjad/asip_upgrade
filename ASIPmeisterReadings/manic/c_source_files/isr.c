/*
 * Embedded Systems Lab 4840 - Manic Player
 * Prakash GS(pg2132)
 * Devyani Gupta(dg2168)
 * Vijayarka Nandikonda(vn2107)
 *
 * Interrupt Service Routines for the UART and the Audio Codec are defined here
 */


#include "xbasic_types.h"
#include "xio.h"
#include "xparameters.h"
#include "xuartlite_l.h"
#include "xintc_l.h"
#include "xuartlite_l.h"
#include "main.h"

/* The buffer */
Xuint8 *buffer = 0x00800000;
int volatile buffer_write_pointer=0;
int volatile buffer_read_pointer=0;  

/* The audio buffer */
Xuint32 audio_buffer[AUDIO_BUFF_LEN];
int volatile audio_read_pointer=0;  
int volatile audio_write_pointer=0;  

Xuint16 output[PCM_BUFF_LEN];
int volatile pcm_read_ptr = 0;

Xuint8 wave_array[8]; 

/* The audio structure */
struct audio_info audio;

int volatile space_left = UART_BUFF_LEN;
int volatile audio_space = AUDIO_BUFF_LEN;
int volatile vga_locn = VGA_START;
int volatile wave_locn = VGA_ALT_START;
int volatile count = 0;
int volatile uart_loop = 0; 
int volatile audio_loop = 0;
int volatile playon = 0;
int dac_addr = DAC_ADDR_START;
int dac_mid = DAC_ADDR_START + 64 * 4;
int k;
int audio_count = 0;
int uart_count = 0;
int stop_uart = 0;

int volatile wave_write_ptr = 1;
int volatile wave_read_ptr = 0;
int volatile current_bar_x =100 ;
int volatile current_bar_y =376;


void audio_handler(void *callback)
{
  Xuint32 IsrStatus;
  Xuint32 sample;
  Xuint16 temp;
  Xuint8 incoming_character;
  int i, data;

  if (playon == 0) return;

  	for (i=0;i<64;i++)  
    {
      
      if( dac_addr >= DAC_ADDR_END ) dac_addr = DAC_ADDR_START;    
      XIo_Out32 ( dac_addr, audio_buffer[audio_read_pointer] );
      dac_addr += 4;
	
      if( (i&4 )== 4)
	  {
	  	audio_read_pointer=(audio_read_pointer + 1) % AUDIO_BUFF_LEN;
	  } 

    }
 
}  


/*
 * Interrupt service routine for the UART 
 */
void uart_handler(void *callback)
{

  Xuint32 IsrStatus;
  Xuint32 temp;
  int l,r,i;
  Xuint8  incoming_character;


  IsrStatus = XIo_In32(XPAR_MYUART_BASEADDR + XUL_STATUS_REG_OFFSET);
  
  if ((IsrStatus & (XUL_SR_RX_FIFO_FULL | XUL_SR_RX_FIFO_VALID_DATA)) != 0) 
    {
      incoming_character = (Xuint8) XIo_In32( XPAR_MYUART_BASEADDR + XUL_RX_FIFO_OFFSET);
      if( space_left == 0 )
	{ 
	  return;
	}
      else
	{ 
	 
	  buffer[buffer_write_pointer] = incoming_character;
	  buffer_write_pointer=(buffer_write_pointer+1)%UART_BUFF_LEN;

	  space_left = space_left-1;

	}
    }
}


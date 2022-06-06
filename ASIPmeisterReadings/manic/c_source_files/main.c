/*
 * Embedded Systems Lab 4840 - Manic Player
 * Prakash GS(pg2132)
 * Devyani Gupta(dg2168)
 * Vijayarka Nandikonda(vn2107)
 *
 * Main Program that :
 *	Processes Audio header
 *	Manages UART and Audio buffers
 *	Calls Decoding Routines
 */

#include "xbasic_types.h"
#include "xio.h"
#include "xintc_l.h"
#include "xuartlite_l.h"
#include "xparameters.h"
#include "fonts.h"
#include "main.h"
#define FLOW_CONTROL 1

/* extern declarations ( defined in isr.c )*/
extern void uart_handler(void *callback);
extern void audio_handler(void *callback);
extern int decode_audio(char *input,Xuint16 *output,int nbytes);

extern Xuint32 audio_buffer[];
extern Xuint8 wave_array[];
extern Xuint8 *buffer;
extern Xuint16 *output;
extern Xuint16 *pcmbuff;
extern struct audio_info audio;

extern int volatile buffer_read_pointer;
extern int volatile buffer_write_pointer;
extern int volatile audio_read_pointer;
extern int volatile audio_write_pointer;
extern int volatile pcm_read_ptr;
extern int volatile space_left;
extern int volatile audio_space;
extern int volatile dac_addr ;
extern int volatile playon ;
extern int volatile count ;
extern int volatile uartoff;
extern int uart_icount;
extern int stop_uart;
int stop = 0;

/*
 * Draws a string at a particular location on the screen
 */
void draw_string (char *s, int x, int y)
{
  int vga_locn, font_offset;
  while(*s){
    font_offset = *s * BYTE_LEN;
    vga_locn = VGA_LOCN(y,x);
    display_character(font_offset,vga_locn);
    s++;
    x+=8;
  }
}  

/*
 * Draws a hex value at a particular location on the screen
 */
void draw_hex(int n, int x, int y)
{
  int i, d;
  char c;
  for(i=0;i<8;i++){
    d= (n>>28) & 0xF;
    c = d>9 ? d-10+'A' : d+'0';
    display_character(c*BYTE_LEN, VGA_LOCN(y,x));
    x+=8;
    n<<=4;
  }
}


/*
 * get 32 bit value from 4 8bit characters
 */
int get32bitvalue()
{
  int value;
  value = UART_ELEMENT(buffer_read_pointer,0,24)  | \
    UART_ELEMENT(buffer_read_pointer,1,16)  | \
    UART_ELEMENT(buffer_read_pointer,2,8)   | \
    UART_ELEMENT(buffer_read_pointer,3,0) ;
  return value;
}


/*
 * PCM and ADPCM audio processing happens here.
 * Calls ADPCM decoder in case of ADPCM format.
 * In case of PCM it converts mono to stereo.
 */
void process_audio()
{
  int k=0,i=0;
  int nsamples;
  int decode_length,value;
  
  Xuint16 l,r;
  Xuint16 alsb,amsb;
 
  switch ( audio.encoding  )  {
  case 1: /* PCM */ 

    switch ( audio.encoding  )  {
    case 1: /* PCM */

      switch ( audio.bit_rate ) {/* bit-rate */
      case 8:
	if( space_left == UART_BUFF_LEN ) return;
	l = r = ((buffer[buffer_read_pointer] << 8) - 0x8000 ) & 0xFFFF ;
	XIo_Out32 (audio_buffer+audio_write_pointer, l<<16 |r );
	audio_write_pointer=(audio_write_pointer + 1) % AUDIO_BUFF_LEN;
	buffer_read_pointer=(buffer_read_pointer + 1) % UART_BUFF_LEN;
	space_left = space_left+1;
	break;
 
      case 16: // This is for 16 bit MONO audio
	if( space_left > UART_BUFF_LEN - 16) return;
	alsb = buffer[buffer_read_pointer];
	amsb = buffer[buffer_read_pointer + 1];
  
	l = r = ((amsb<<8) | alsb);
     
	XIo_Out32 (audio_buffer+ audio_write_pointer, r );
	audio_write_pointer=(audio_write_pointer + 1) % AUDIO_BUFF_LEN;
     
	buffer_read_pointer=(buffer_read_pointer + 2) % UART_BUFF_LEN;
	space_left = space_left+2;      
      }
      break;

    case 2: /* ADPCM */
      decode_length = 4;
      if(UART_BUFF_LEN - space_left < decode_length) return;
      nsamples = decode_audio(buffer+buffer_read_pointer, pcmbuff, decode_length);
      {
	buffer_read_pointer=(buffer_read_pointer + decode_length) % UART_BUFF_LEN;
	space_left = space_left + decode_length;
      }
    
      for(k=0; k<nsamples;k++){
	l = r = pcmbuff[k] ;
	audio_buffer[audio_write_pointer] = (l<<16) | r;
	audio_write_pointer=(audio_write_pointer + 1) % AUDIO_BUFF_LEN;
      }
       
      break;
    }
  }
}


/*
 * Process the audio header here.
 * Parse out and print :
 * The WAVE header, 
 * The encoding type , 
 * The bit rate
 * and The File Length
 */
void process_header()
{
  int i = 0,j=0;
  int x=200,y=370;
  char riff_array[5],len_array[4];
  int value,encoding_type,bit_rate;

 

  /* Process the RIFF field-display it byte 0 to 4 */

  for(j=0;j<4;j++)
    {
      display_character(buffer[j]*BYTE_LEN,VGA_LOCN(368,200+(j*8)));
    }

  // File length , byte 4 to 8 
  for( i=0,j=4;j<8;j++,i++)
    {
      len_array[i] = buffer[j];
    }	

  value = len_array[3];
  value <<= 8;
  value = value | len_array[2];
  value <<= 8;
  value = value | len_array[1];
  value <<= 8;
  value = value | len_array[0];
  draw_string("Length",200,376);
  draw_hex(value,300,376);

  //Process the WAVE field-display it byte 8 to 12 
  for(i=0,j=8;j<12;j++,i++)
    {
      display_character(buffer[j]*BYTE_LEN,VGA_LOCN(384,200+(i*8)));
    }

  //Skip the next 8 bytes and go to the 20th for the encoding type
  encoding_type = ( buffer[21]<<8 ) | ( buffer[20] );
  audio.encoding = encoding_type;
  draw_string("TYPE",200,392);
  switch( encoding_type )
    {
    case 1:
      draw_string("PCM",300,392);
      break;

    case 2:
      draw_string("ADPCM",300,392);
      break;

    default:
      draw_string("UNKNOWN FORMAT",300,392);
      break;

    }

  // Get the bit rate
  bit_rate = ( buffer[35] << 8 ) | ( buffer[34] );
  audio.bit_rate = bit_rate;
  draw_string("BIT_RATE",200,400);

  switch( bit_rate )
    {
    case 4:
      draw_string("4",300,400);
      break;
    case 8:
      draw_string("8",300,400); 
      break; 
    case 16: 
      draw_string("16",300,400);
      break;

    default:
     
      break;

    }
  buffer_read_pointer = (buffer_read_pointer +44 ) % UART_BUFF_LEN;
  space_left = space_left + 44;
	
}



int main()
{
  char ch=0,curchar,backspace=0,lfcount=0;
  int k=0,i=0;
  int x,len,byte_disp=0,font_offset,vga_locn;
  int row=0,column=0;
  
  /* Enable the instruction cache: makes the code run 6 times faster */
  microblaze_enable_icache();

  for(x=0;x<UART_BUFF_LEN;x++) 
    buffer[x] = 0;  

  for(x=0;x<H*W;x++)XIo_Out8(VGA_START+x, 0);
  draw_string("UART BUFFER", 250,8);
  draw_string("---------------------",200,360);
  draw_string("FILE",270,350);
  setup_interrupts();
  while(space_left!= UART_BUFF_LEN - 44);
  process_header();	

  playon = 1; 

  while(1)
    {

/* Flow Control to control the UART transmission rate */
#if FLOW_CONTROL

      if ( (space_left < UART_BUFF_LEN/4 ) && !stop)
     	{
	  stop = 1;
	  XIo_Out8(XPAR_MYUART_BASEADDR + XUL_TX_FIFO_OFFSET,'1');
	}
    
      if( (space_left > 3*UART_BUFF_LEN/4) && stop)
	{
	  stop = 0;
	  XIo_Out8(XPAR_MYUART_BASEADDR + XUL_TX_FIFO_OFFSET,'0');
	}
#endif
      process_audio();
    }
}      
      
     
/*
 * Setup the UART and audio codec Interrupts
 */
inline void setup_interrupts()
{
  
  XIntc_mMasterDisable(XPAR_INTC_SINGLE_BASEADDR);
  XIntc_mEnableIntr(XPAR_INTC_SINGLE_BASEADDR,0);
  XIntc_mAckIntr(XPAR_INTC_SINGLE_BASEADDR, 0xffffffff);
  XIntc_InterruptVectorTable[XPAR_INTC_MYUART_INTERRUPT_INTR].Handler = uart_handler;
  XIntc_InterruptVectorTable[XPAR_INTC_AUDIO_INTERRUPT_INTR].Handler = audio_handler;
  microblaze_enable_interrupts();
  XIntc_mMasterEnable(XPAR_INTC_SINGLE_BASEADDR);
  XIntc_mEnableIntr(XPAR_INTC_SINGLE_BASEADDR, XPAR_MYUART_INTERRUPT_MASK | XPAR_AUDIO_INTERRUPT_MASK);
  XUartLite_mEnableIntr(XPAR_MYUART_BASEADDR);
}

/*
 * Display a character at a position
 */
inline void display_character(int font_offset,int vga_locn)
{
  int x,y,andval;
  for( x = 0; x < BYTE_LEN; x++)
    {
      /* Get each byte of the font */
      int curbyte = fontdata[font_offset + x];

      /* Mask pattern to find '1's in the font  */
      andval = DISPLAY_MASK;
    
      for( y = 0; y <BYTE_LEN ; y++,andval>>=1)
	{
	  /* If that bit of the font is '1' */
	  XIo_Out8( (vga_locn)+(x*W)+y, (curbyte&andval)?RED:NO_COLOR);
	}
    }
  return;
}


	






/*
 * Embedded Systems Lab 4840 - Manic Player
 * Prakash GS(pg2132)
 * Devyani Gupta(dg2168)
 * Vijayarka Nandikonda(vn2107)
 *
 * Header file for ADPCM Decoder Program
 * 
 */

#ifndef _MAIN_H
#define _MAIN_H

#define W 640
#define H 480
#define SCREEN_SIZE H*W
#define VGA_START 0x00800000
#define VGA_ALT_START 0x00C00000
#define DAC_ADDR_START 0xFEFE0000
#define DAC_ADDR_END 0xFEFEFFFF


/*defines for the cursor which is the underscore key */
#define CURSOR_KEY '_'
#define NO_CURSOR_KEY ' '
#define CURSOR ( CURSOR_KEY * BYTE_LEN )
#define NO_CURSOR ( NO_CURSOR_KEY * BYTE_LEN )

/* Calculate the location to write to here */
#define VGA_LOCN(x,y) (VGA_START+(x*W)+(y))

/* Colors */
#define RED 0xE0
#define GREEN 0x1C
#define BLUE 0x03
#define NO_COLOR 0x00

#define BYTE_LEN 8

/* Mask for checking '1' on the font */
#define DISPLAY_MASK 0x80

/* Letters/Characters used in the logic */
#define TAB_WIDTH 8
#define WSP ' '
#define BKSP '\b'
#define CR '\r'
#define LF '\n'
#define DEL 0x7F
#define TAB '\t'

#define UART_BUFF_LEN (4096)
#define AUDIO_BUFF_LEN (1024)
#define PCM_BUFF_LEN 8192

#define NEXT_ELEMENT(pointer,index) \
	( (pointer+index)% UART_BUFF_LEN )

#define UART_ELEMENT(pointer,byte_no,shift) (  ( buffer[NEXT_ELEMENT(pointer,byte_no)] << shift) & 0xFFFF )


/* Structure to store the parsed audio header */
struct audio_info
{

int encoding;
int bit_rate;

};


/* Function declarations */
inline void send_audio();
inline void scroll(int skip);
inline char get_character();
inline void display_character(int font_offset,int vga_locn);
inline void draw_cursor(int row,int column);
inline void remove_cursor(int row,int column);
inline int getnewlines();
inline void setup_interrupts();
inline int get32bitvalue();

#endif /* _MAIN_H */

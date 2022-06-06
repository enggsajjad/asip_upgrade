#ifndef _lib_uart_h_lrdvsgjrasdmioogsrepivhjrtmshcmdhi
#define _lib_uart_h_lrdvsgjrasdmioogsrepivhjrtmshcmdhi

//#define UART_HI_ADDR 0x100
#define UART_ADDR 0x1000000

int u_print(const char* str);

int u_printInt(int a);

int u_printHex(int value, int digits);

int u_getbytes(char* dest, int bytes_to_read);

#endif


#include "lib_uart.h"
#include "loadStoreByte.h"
#include "string.h"

/*asm int loadUARTaddress() {
 @[	.barrier
 ]
	lhi	@{}, $UART_HI_ADDR
	nop
	nop
	nop
}*/
int u_print3(char str []) {
  //volatile int* const uartAddress = (int*)loadUARTaddress();
  int cnt = 0;
  volatile int* const uartAddress = (int*)UART_ADDR;
  while (cnt < 3) {
    *uartAddress = str[cnt++]+48;
  }
  return 0;
}

int u_print2(char* str) {
  //volatile int* const uartAddress = (int*)loadUARTaddress();
  volatile int* const uartAddress = (int*)UART_ADDR;
  while (*str != '\0') {
    *uartAddress = *str++;
  }
  return 0;
}

int u_print(const char* str) {
  //volatile int* const uartAddress = (int*)loadUARTaddress();
  volatile int* const uartAddress = (int*)UART_ADDR;
  while (*str != '\0') {
    *uartAddress = *str++;
  }
  return 0;
}


int u_printInt(int a) {
  char tempString[20];
  intToStr(a, tempString);
  u_print(tempString);
  return 0;
}

int u_printHex(int value, int digits) {
  char tempString[10];
  intToHexStr(value, tempString, digits);
  u_print("0x");
  u_print(tempString);
  return 0;
}

int u_getbytes(char* dest, int bytes_to_read) {
  int i;
  //volatile const int* const uartAddress = (int*)loadUARTaddress();
  volatile int* const uartAddress = (int*)UART_ADDR;
  for(i=0; i<bytes_to_read; i++){
    storeByte(dest++, *uartAddress);
  }
  return 0;
}


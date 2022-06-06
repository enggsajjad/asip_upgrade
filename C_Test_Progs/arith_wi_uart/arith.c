#define UART_ADDR 0x1000000

//unsigned int array[2] = { 45, 75};

int u_print(const char* str) {
  //volatile int* const uartAddress = (int*)loadUARTaddress();
  volatile int* const uartAddress = (int*)UART_ADDR;
  while (*str != '\0') {
    *uartAddress = *str++;
  }
  return 0;
}
///////////////////////////////////////////////////////////////

/*
int u_print(const char* str) {
  //volatile int* const uartAddress = (int*)loadUARTaddress();
  volatile int* const uartAddress = (int*)UART_ADDR;
  while (*str != '\0') {
    *uartAddress = *str++;
  }
  return 0;
}
*/
/*
int storeByte(char* address, int value) {
  int loadMask = -4;
  int charAddress = (int)address;
  int* wordPointer = (int*)(charAddress & loadMask);
  int wordValue = *wordPointer;
  int mask = 0xFF << ( (3 - (charAddress&3) ) << 3);
  value <<= (~(charAddress&3) ) << 3;  // The "~()" is because the endianess
  wordValue &= ~mask;
  wordValue |= value;
  *wordPointer = wordValue;
  return wordValue;
}

int intToStr(int value, char* outputString) {
  int i=0, j=0;
  char stringReverse[32];

  if (value < 0) {
    value = -value;
    storeByte(outputString, '-');
    j++;
  } else if (value == 0) {
    storeByte(outputString, '0');
    j++;
  }
  while(value != 0) {
    storeByte(stringReverse+i, (value % 10) + '0' );
    value /= 10;
    i++;
  }
  while( i>0 ) {
    i--;
    storeByte(outputString+j, *(stringReverse+i));
    j++;
  }
  storeByte(outputString+j, '\0');
  return 0;
}

int printArray() {
  int i;
  int sorted=1;
  char tempString[32];

  for (i=0; i<5; i++) {
    if ( (i&0x7) == 0) u_print("\r\n");
    intToStr(array[i], tempString);
    u_print(tempString);
    u_print(" ");
  }
  u_print("\r\n");

  return sorted;
}

*/
int main() {
  //int sorted;
  //unsigned int *j;
  //load array address
  //j = array;
  //store modified data into array locations 2,3,4
  //*(j+1) = *(j+0) + 1;
  u_print("Testing");

  return 0;
}




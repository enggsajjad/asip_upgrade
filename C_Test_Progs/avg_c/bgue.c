//#define UART_ADDR 0x1000000

unsigned int array[2] = { 45, 75};
///////////////////////////////////////////////////////////////
int main() {
  //int sorted;
  unsigned int *j;
  unsigned int *rdMin, *rdMax;
  //load array address
  j = array;
  //store modified data into array locations 2,3,4
  *(j+1) = *(j+0) + 10;
  *(j+2) = *(j+0) + *(j+1);
  *(j+3) = __builtin_brownie32_NXOR(*(j+0), *(j+1));
  *(j+4) = __builtin_brownie32_AVG(*(j+0), *(j+1));
  *(j+5) = __builtin_brownie32_SWAP(*(j+0));
  *(j+6) = __builtin_brownie32_NXOR(*(j+0), *(j+1));
  __builtin_brownie32_MINMAX(*rdMin, *rdMax,*(j+0), *(j+1));
  *(j+7) = *rdMin;
  *(j+8) = *rdMax;
  //u_print("Testing...\r\n");

  return 0;
}





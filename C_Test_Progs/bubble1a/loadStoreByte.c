#include "loadStoreByte.h"

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

int temp; // The usage of global 'temp' is due to a CoSy problem that doesn't accept the actual statement in one line...

// TODO: untested...
int storeShort(short* address, int value) {
  int loadMask = -4;
  int shortAddress = (int)address;
  int* wordPointer = (int*)(shortAddress & loadMask);
  int wordValue = *wordPointer;
  int mask = 0xFFFF << ( (1 - (shortAddress&1) ) << 4);
  temp = shortAddress&2;  // The usage of global 'temp' is due to a CoSy problem that doesn't accept the actual statement in one line...
  value >>= (~(temp >> 1) << 4);  // The "~()" is because the endianess
  wordValue &= ~mask;
  wordValue |= value;
  *wordPointer = wordValue;
  return wordValue;
}



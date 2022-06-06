#include "string.h"
#include "loadStoreByte.h"

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

int intToHexStr(int value, char* outputString, int digits) {
  int i, j, tempValue;
  char stringReverse[10];

  for (i=0; i<8; i++) {
    if (value==0 && (digits==0 || i>=digits)) break;
    tempValue = value & 0xF;
    if (tempValue < 10) storeByte(stringReverse+i, '0'+tempValue);
    else storeByte(stringReverse+i, 'A'+(tempValue-10));
    value >>= 4;
  }

  for (j=0, i--; i>=0; j++, i--) {
    storeByte(outputString+j, *(stringReverse+i));
  }
  storeByte(outputString+j, '\0');

  return 0;
}

int strlen (const char* str) {
  int count = 0;
  while (*str++ != '\0') count++;
  return count;
}

char* strcat(char* dest, const char* src) {
  int ch;
  ch = *dest++;
  while (ch != '\0') ch = *dest++;
  ch = *src++;
  while(ch != '\0') {
    storeByte(dest++, ch);
    *src++;
  }
  storeByte(dest, '\0');
}

char* strncat(char* dest, const char* src, int n) {
  int ch, i=0;
  ch = *dest++;
  while (ch != 0) ch = *dest++;

  ch = *src++;
  while(ch != '\0' && ++i < n) {
    storeByte(dest++, ch);
    *src++;
  }
  storeByte(dest, 0);
  return dest;
}

char* strcpy(char* dest, const char* src) {
  int ch;
  ch = *src++;
  while(ch != '\0') {
    storeByte(dest++, ch);
    *src++;
  }
  storeByte(dest, '\0');
  return dest;
}

char* strncpy(char* dest, const char* src, int n) {
  int ch, i=0;
  ch = *src++;
  while(ch != '\0' && ++i < n) {
    storeByte(dest++, ch);
    *src++;
  }
  storeByte(dest, 0);
  return dest;
}

int strcmp(const char* s1, const char* s2) {
  int ch1, ch2;
  ch1 = *s1++;
  ch2 = *s2++;
  while (ch1 != '\0' && ch2 != '\0') {
    if (ch1 < ch2) return -1;
    if (ch1 > ch2) return 1;
    ch1 = *s1++;
    ch2 = *s2++;
  }
  if (ch1 != '\0') return 1;
  if (ch2 != '\0') return -1;
  return 0;
}

int strncmp(const char* s1, const char* s2, int n) {
  int ch1, ch2, i=0;
  ch1 = *s1++;
  ch2 = *s2++;
  while (ch1 != '\0' && ch2 != '\0' && ++i < n) {
    if (ch1 < ch2) return -1;
    if (ch1 > ch2) return 1;
  }
  if (i==n) return 0;
  if (ch1 != '\0') return 1;
  if (ch2 != '\0') return -1;
  return 0;
}

int tolower(int c) {
  if (c>='A' && c <='Z')
    return 'a' + (c-'A');
  else return c;
}

int toupper(int c) {
  if (c>='a' && c <='z')
    return 'A' + (c-'a');
  else return c;
}

int isdigit(int c) {
  if (c>='0' && c<='9') return 1;
  else return 0;
}



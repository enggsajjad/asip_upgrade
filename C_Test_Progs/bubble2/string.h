#ifndef _string_h_tzdshcse48ozuk34ec7kuz8ew59c4w5mzcg89
#define _string_h_tzdshcse48ozuk34ec7kuz8ew59c4w5mzcg89

int intToStr(int value, char* outputString);

// with 'digits' you can force each value to be printed as n-digit hex number.
// '0' digits mean: print just as many as required
int intToHexStr(int value, char* outputString, int digits);

int strlen(const char* s);

char* strcat(char* dest, const char* src);

char* strncat(char* dest, const char* src, int n);

char* strcpy(char* dest, const char* src);

char* strncpy(char* dest, const char* src, int n);

int strcmp(const char* s1, const char* s2);

int strncmp(const char* s1, const char* s2, int n);

int tolower(int c);

int toupper(int c);

int isdigit(int c);

#endif


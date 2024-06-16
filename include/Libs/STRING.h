#ifndef _STRING_H_
#define _STRING_H_

#ifdef TARGET_PSX
void *memset(void *ptr, int value, size_t num);
void *memcpy(void *dest, const void *src, size_t count);
size_t strlen(const char *theString);
char *strpbrk(char *string, char *searchedCharacters);
char *strchr(char *str, int character);
#endif

#endif

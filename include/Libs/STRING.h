#ifndef _STRING_H_
#define _STRING_H_

typedef unsigned long size_t;

void *memset(void *ptr, int value, size_t num);
void *memcpy(void *dest, const void *src, size_t count);

#endif

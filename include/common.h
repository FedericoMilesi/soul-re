#ifndef _COMMON_H_
#define _COMMON_H_

#include "include_asm.h"

#define NULL (void*)0

#define EXTERN extern
#define STATIC

/*TODO: Remove this when adding PSYQ headers*/
#define getScratchAddr(offset)  ((unsigned long *)(0x1f800000+(offset)*4))

#endif

#ifndef _COMMON_H_
#define _COMMON_H_

#ifdef TARGET_PSX
typedef unsigned long uintptr_t;
typedef long intptr_t;
#define NULL (void*)0
#else
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#endif

#include "include_asm.h"
#include "Game/TYPES.h"
#include "LIBS.h"
#include "Game/INSTANCE.h"

#define EXTERN extern
#define STATIC

#endif

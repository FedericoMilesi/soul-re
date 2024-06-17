#ifndef _COMMON_H_
#define _COMMON_H_

#ifdef TARGET_PSX
typedef unsigned long uintptr_t;
typedef long intptr_t;
typedef unsigned long size_t;
typedef	unsigned long u_long;
typedef unsigned char u_char;
#define NULL (void*)0
#else
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#endif

#include "include_asm.h"
#include "Game/TYPES.h"
#include "Game/INSTANCE.h"
#include "Libs/SDK.h"

#define EXTERN extern
#define STATIC

#define SCREEN_WIDTH		512
#define SCREEN_HEIGHT		240

#endif

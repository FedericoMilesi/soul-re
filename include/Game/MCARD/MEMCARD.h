#ifndef _MEMCARD_H_
#define _MEMCARD_H_

#include "common.h"

void memcard_end(memcard_t *memcard);
int maybe_start(memcard_t *memcard);
int memcard_initialize(memcard_t *memcard, void *gt, int nblocks, void *buffer, int nbytes);

extern memcard_t gMemcard;

#endif

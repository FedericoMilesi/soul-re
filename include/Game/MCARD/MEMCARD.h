#ifndef _MEMCARD_H_
#define _MEMCARD_H_

#include "common.h"

// size: 0x10
typedef struct memcard_t {
    // offset: 0000 (76 bytes)
    struct Object *object;
    // offset: 0004 (36 bytes)
    struct mcmenu_table_t *table;
    // offset: 0008 (404 bytes)
    struct mcmenu_t *mcmenu;
    // offset: 000C
    short running;
    // offset: 000E
    short wrongVerison;
} memcard_t;

extern memcard_t gMemcard;

void memcard_end(memcard_t *memcard);
int maybe_start(memcard_t *memcard);
int memcard_initialize(memcard_t *memcard, void *gt, int nblocks, void *buffer, int nbytes);

#endif

#ifndef _MBMISS_H_
#define _MBMISS_H_

#include "Game/GAMELOOP.h"

typedef struct Dummy {
    char pad[40];
    int unknown;
} Dummy; // not from types.h

void WCBEGG_CommonPostProcess2(Instance *instance, GameTracker *gameTracker);

#endif

#ifndef _MBMISS_H_
#define _MBMISS_H_

#include "Game/GAMELOOP.h"

typedef struct Dummy {
    char pad[40];
    int unknown;
} Dummy; // not from types.h

typedef struct Dummy2 {
    int pad;
    int unknown;
} Dummy2; // not from types.h

// size: 0x1C
typedef struct _walbossAttributes {
    // offset: 0000
    unsigned char segmentToAttach;
    // offset: 0001
    unsigned char frameToBirth;
    // offset: 0002
    unsigned char frameToExpel;
    // offset: 0003
    unsigned char maxEggHits;
    // offset: 0004
    short maxAngle;
    // offset: 0006
    short timeForHitAgony;
    // offset: 0008
    short segmentForBodyTwist;
    // offset: 000A
    short timeToThornPrep;
    // offset: 000C
    short timeToThornPoke;
    // offset: 000E
    short timeToEggThrob;
    // offset: 0010
    short timeToEggExplode;
    // offset: 0012
    short razielStunTime;
    // offset: 0014
    short eggIgniteDist;
    // offset: 0016
    short angleForShortAttack;
    // offset: 0018
    short closeAttackStart;
    // offset: 001A
    short junk;
    // offset: 001C
    // size: 0x6
    struct {
        // offset: 0000
        short plusDelta;
        // offset: 0002
        short minusDelta;
        // offset: 0004
        short validAtHitPoint;
    } attackDeltas[1];
} walbossAttributes;

void WCBEGG_CommonPostProcess2(Instance *instance, GameTracker *gameTracker);
void WCBEGG_Process(Instance *instance, GameTracker *gameTracker);
void WCBEGG_ExplodeCollide(Instance *instance, GameTracker *gameTracker);
void WCBEGG_ExplodeProcess(Instance *instance, GameTracker *gameTracker);
void WCBEGG_SplitProcess(Instance *instance, GameTracker *gameTracker);
void WCBEGG_CommonPostProcess(Instance *instance, GameTracker *gameTracker);
void WCBEGG_Collide(Instance *instance, GameTracker *gameTracker);

#endif

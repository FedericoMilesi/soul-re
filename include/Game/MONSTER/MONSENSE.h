#ifndef _MONSENSE_H_
#define _MONSENSE_H_

#include "common.h"
#include "Game/MONSTER/MONAPI.h"

// size: 0x12
typedef struct _MonsterSenses {
    // offset: 0000
    short sightArc;
    // offset: 0002
    short sightRadius;
    // offset: 0004
    short sightElevation;
    // offset: 0006
    short soundArc;
    // offset: 0008
    short soundRadius;
    // offset: 000A
    short soundElevation;
    // offset: 000C
    unsigned short scentRadius;
    // offset: 000E
    short alarmRadius;
    // offset: 0010
    unsigned short allyRadius;
} MonsterSenses;

MonsterIR *MONSENSE_SetEnemy(Instance *instance, Instance *newenemy);
void MONSENSE_DoSenses(Instance *instance);
void MONSENSE_RemoveSenses(Instance *instance);
void MONSENSE_SetupSenses(Instance *instance);
void MONSENSE_StartMonsterIRList(Instance *instance);
void MONSENSE_SenseInstance(Instance *instance, evCollideInstanceStatsData *data);

#endif

#ifndef _MONSTER_H_
#define _MONSTER_H_

#include "common.h"

void MON_Flee(Instance *instance);
void MON_Idle(Instance *instance);
void MON_IdleEntry(Instance *instance);
void MON_CombatEntry(Instance *instance);
void MON_Embrace(Instance *instance);
void MON_FleeEntry(Instance *instance);
void MON_EmbraceEntry(Instance *instance);
void MON_Combat(Instance *instance);
void MON_Stunned(Instance *instance);
void MON_CleanUp(Instance *instance);
void MON_DefaultInit(Instance *instance);
void MON_StunnedEntry(Instance *instance);
void MON_Dead(Instance *instance);
void MON_DeadEntry(Instance *instance);
void MON_DamageEffect(Instance *instance, evFXHitData *data);

extern char monVersion[];

#endif

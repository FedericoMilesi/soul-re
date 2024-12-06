#ifndef _MISSILE_H_
#define _MISSILE_H_

#include "common.h"

Instance *MISSILE_Fire(Instance *instance, MonsterMissile *missiledef, void *target, int type);
Instance *MISSILE_FireAtInstance(Instance *instance, MonsterMissile *missiledef, Instance *target);
Instance *MISSILE_Birth(Instance *instance, MonsterMissile *missiledef);
Instance *MISSILE_Find(Instance *instance, MonsterMissile *missiledef);

#endif

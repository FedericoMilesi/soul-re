#ifndef HEALTH_H_
#define HEALTH_H_

#include "common.h"

void SetMana(int amount);
void razPlayUnderworldSounds(Instance *instance);
int GetMaxHealth();
void LoseHealth(int amount);
void BumpUpHealth();

#endif

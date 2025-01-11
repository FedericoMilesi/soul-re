#ifndef HEALTH_H_
#define HEALTH_H_

#include "common.h"

void razPlayUnderworldSounds(Instance *instance);
void SetMana(int amount);
int GetMaxHealth();
void LoseHealth(int amount);
void BumpUpHealth();

#endif

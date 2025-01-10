#ifndef ATTACK_H_
#define ATTACK_H_

#include "common.h"

void PointAt(Instance *instance, Position *Target, Rotation *Rot1);
void StateHandlerHitReaction(CharacterState *In, int CurrentSection, intptr_t Data);

#endif

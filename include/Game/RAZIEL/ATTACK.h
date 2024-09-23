#ifndef ATTACK_H_
#define ATTACK_H_

#include "common.h"

void LimitRotation(Rotation *rot);
void StateHandlerHitReaction(CharacterState *In, int CurrentSection, intptr_t Data);
void PointAt(Instance *instance, Position *Target, Rotation *Rot1);

#endif

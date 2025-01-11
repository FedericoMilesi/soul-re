#ifndef SWIM_H_
#define SWIM_H_

#include "common.h"

void StateHandlerSwim(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerSwimTread(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerSwimCoil(CharacterState *In, int CurrentSection, intptr_t Data);

#endif

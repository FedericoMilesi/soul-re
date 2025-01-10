#ifndef PUPPET_H_
#define PUPPET_H_

#include "common.h"

void StateHandlerMoveToPosition(CharacterState *In, int CurrentSection, intptr_t Data);
void DefaultPuppetStateHandler(CharacterState *In, int CurrentSection, intptr_t Data);

#endif

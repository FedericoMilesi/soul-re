#ifndef RAZLIB_H_
#define RAZLIB_H_

#include "common.h"

void razAlignYRotMove(Instance *dest, short distance, Position *position, Rotation *rotation, int extraZ);
void razAlignYRotInterp(Instance *source, Position *dest, unsigned char segNumber, int Frames);
void razClearPlayerEvent();
void StateHandlerPickupObject(CharacterState *In, int CurrentSection, intptr_t Data);

#endif

#ifndef _VWRAITH_H_
#define _VWRAITH_H_

#include "Game/MONSTER/MONTABLE.h"

extern MonsterFunctionTable VWRAITH_FunctionTable;

int VWRAITH_ShouldISwoop(Instance *instance);
void VWRAITH_VerticalMove(Instance *instance);
void VWRAITH_PursueEntry(Instance *instance);

#endif

#ifndef _SLUAGH_H_
#define _SLUAGH_H_

#include "common.h"

void SLUAGH_Attack(Instance *instance);
void SLUAGH_Death(Instance *instance);
void SLUAGH_AttackEntry(Instance *instance);
void SLUAGH_DeathEntry(Instance *instance);

extern MonsterFunctionTable SLUAGH_FunctionTable;

#endif
#ifndef _MONTABLE_H_
#define _MONTABLE_H_

#include "common.h"

typedef struct _MonsterState {
    void (*entryFunction)(); // size=0, offset=0
    void (*stateFunction)(); // size=0, offset=4
} MonsterStateFunction;

typedef struct _MonsterStateChoice {
    int state; // size=0, offset=0
    struct _MonsterState functions; // size=8, offset=4
} MonsterStateChoice;

// size: 0x20
typedef struct _MonsterFunctionTable {
    // offset: 0000
    void (*initFunc)();
    // offset: 0004
    void (*cleanUpFunc)();
    // offset: 0008
    void (*damageEffectFunc)();
    // offset: 000C
    unsigned long (*queryFunc)();
    // offset: 0010
    void (*messageFunc)();
    // offset: 0014 (12 bytes)
    struct _MonsterStateChoice *stateFuncs;
    // offset: 0018
    char *versionID;
    // offset: 001C
    char *localVersionID;
} MonsterFunctionTable;

// size: 0x8
typedef struct _MonsterChoice {
    // offset: 0000
    long whatAmI;
    // offset: 0004 (32 bytes)
    struct _MonsterFunctionTable *table;
} MonsterChoice;

void *MONTABLE_GetInitFunc(Instance *instance);
void *MONTABLE_GetDamageEffectFunc(Instance *instance);
MonsterStateFunction *MONTABLE_GetStateFuncs(Instance *instance, int state);
void *MONTABLE_GetCleanUpFunc(Instance *instance);
void MONTABLE_SetQueryFunc(Instance *instance);
void MONTABLE_SetMessageFunc(Instance *instance);

#endif

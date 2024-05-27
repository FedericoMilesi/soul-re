#include "common.h"
#include "Game/SAVEINFO.h"
#include "Game/GAMELOOP.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterInit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", SendHitObject);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterCollide);

void MonsterAdditionalCollide(Instance *instance, GameTracker *gameTracker)
{
    (void)gameTracker;
    if (instance->data != NULL)
    {
        MON_CheckEnvironment(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterQuery);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterMessage);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", AnimDistanceAndVel);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", TranslateAnimList);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterTranslateAnim);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterRelocateTune);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterRelocateInstanceObject);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_TurnHead);

void MONAPI_SetLookAround(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    MON_EnableHeadMove(instance);

    mv->mode = 0x80000;
}

void MONAPI_ResetLookAround(Instance *instance)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    MON_DisableHeadMove(instance);

    mv->mode = 0x1;
}

long MONAPI_OkToLookAround(Instance *instance)
{
    return instance->currentMainState == MONSTER_STATE_IDLE;
}

void MONAPI_DeleteRegen(MONAPI_Regenerator *regen);
INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_DeleteRegen);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_ProcessGenerator);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_AddToGenerator);

void MONAPI_CheckGenerator(Instance *instance)
{
    int i;
    MONAPI_Regenerator *regen;
    int id;

    regen = GlobalSave->regenEntries;

    id = instance->introUniqueID;

    for (i = 0; i < GlobalSave->numRegens; i++, regen++)
    {
        if (regen->introUniqueID == id)
        {
            MONAPI_DeleteRegen(regen);
            break;
        }
    }
}

#include "common.h"
#include "Game/SAVEINFO.h"
#include "Game/GAMELOOP.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MONTABLE.h"

void MonsterProcess(Instance *instance, GameTracker *gameTracker)
{
    MonsterStateFunction *state;
    MonsterVars *mv;
    MonsterAttributes *attributes;
    typedef void (*MONTABLE_DamageEffectFunc)(Instance *, int); // not from decls.h 

    attributes = (MonsterAttributes *)instance->data;

    mv = (MonsterVars *)instance->extraData;

    if ((mv != NULL) && (attributes != NULL) && (!(mv->mvFlags & 0x80000)))
    {
        instance->waterFace = NULL;
        instance->waterFaceTerrain = NULL;

        MONSENSE_DoSenses(instance);

        MON_DoCombatTimers(instance);

        state = MONTABLE_GetStateFuncs(instance, instance->currentMainState);

        instance->flags2 &= ~0x10;
        instance->flags2 &= ~0x2;

        if (!(mv->mvFlags & 0x80))
        {
            G2EmulationInstancePlayAnimation(instance);
        }

        (state->stateFunction)(instance);

        if ((mv->mvFlags & 0x1))
        {
            state = MONTABLE_GetStateFuncs(instance, instance->currentMainState);

            ((state)->entryFunction)(instance);
        }

        mv->mvFlags &= ~0x41;

        if ((instance->flags & 0x200))
        {
            ((MONTABLE_DamageEffectFunc)MONTABLE_GetDamageEffectFunc(instance))(instance, 0);
        }

        MON_ProcessLookAt(instance);
        MON_ProcessSpecialFade(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterInit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", SendHitObject);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterCollide);

void MonsterAdditionalCollide(Instance *instance, GameTracker *gameTracker)
{
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

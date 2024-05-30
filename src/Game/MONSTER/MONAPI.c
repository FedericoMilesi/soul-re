#include "common.h"
#include "Libs/STRING.h"
#include "Game/SAVEINFO.h"
#include "Game/GAMELOOP.h"
#include "Game/MONSTER.h"
#include "Game/STATE.h"
#include "Game/MEMPACK.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/MONSTER/MONTABLE.h"
#include "Game/MONSTER/MONSENSE.h"
#include "Game/G2/ANMG2ILF.h"
#include "Game/G2/INSTNCG2.h"

typedef void (*MONTABLE_DamageEffectFunc)(Instance *, int);

void MonsterProcess(Instance *instance, GameTracker *gameTracker)
{
    MonsterStateFunction *state;
    MonsterVars *mv;
    MonsterAttributes *attributes;

    (void)gameTracker;
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

void MonsterInit(Instance *instance, GameTracker *gameTracker)
{
    MonsterStateFunction *state;
    MonsterAttributes *attributes;
    MonsterVars *mv;
    typedef void (*MONTABLE_CleanUpFunc)(Instance *); // not from decls.h
    typedef void (*MONTABLE_InitFunc)(Instance *);    // not from decls.h

    (void)gameTracker;

    attributes = (MonsterAttributes *)instance->data;

    if ((instance->flags & 0x20000))
    {
        mv = (MonsterVars *)instance->extraData;

        ((MONTABLE_CleanUpFunc)MONTABLE_GetCleanUpFunc(instance))(instance);

        MONSENSE_RemoveSenses(instance);

        MEMPACK_Free((char *)mv);
    }
    else if ((attributes == NULL) || (attributes->magicnum != 0xACE00065))
    {
        instance->data = NULL;

        G2Anim_SwitchToKeylist(&instance->anim, G2Instance_GetKeylist(instance, 0), 0);
    }
    else
    {
        mv = (MonsterVars *)MEMPACK_Malloc(608, 23);

        instance->extraData = mv;

        if (instance->instanceID == 0)
        {
            if (instance->extraData == NULL)
            {
                return;
            }

            MEMPACK_Free((char *)mv);
        }
        else if (mv == NULL)
        {
            instance->data = NULL;

            G2Anim_SwitchToKeylist(&instance->anim, G2Instance_GetKeylist(instance, 0), 0);
        }
        else
        {
            memset(mv, 0, 608);

            InitMessageQueue(&mv->messageQueue);

            instance->currentMainState = -1;

            mv->pathSlotID = -1;

            mv->lastValidPos = instance->position;

            mv->terrainImpaleID = -1;

            mv->mode = 0;

            instance->flags |= 0x10000;
            instance->flags |= 0x40;

            if (!(attributes->whatAmI & 0x10000))
            {
                instance->flags2 |= 0x100;
            }

            instance->maxXVel = 400;
            instance->maxYVel = 400;
            instance->maxZVel = 400;

            instance->xVel = 0;
            instance->yVel = 0;
            instance->zVel = 0;

            MONTABLE_SetQueryFunc(instance);
            MONTABLE_SetMessageFunc(instance);

            MON_ProcessIntro(instance);

            mv->maxHitPoints = mv->hitPoints;

            MON_TurnOnAllSpheres(instance);
            MON_TurnOffWeaponSpheres(instance);

            MONSENSE_SetupSenses(instance);

            MON_AnimInit(instance);

            ((MONTABLE_InitFunc)MONTABLE_GetInitFunc(instance))(instance);

            if ((mv->mvFlags & 0x1))
            {
                state = MONTABLE_GetStateFuncs(instance, instance->currentMainState);

                mv->mvFlags &= ~0x1;

                state->entryFunction(instance);
            }
        }
    }
}

void SendHitObject(Instance *instance, Instance *hit, int type)
{
    MonsterVars *mv;
    int i;

    mv = (MonsterVars *)instance->extraData;

    i = mv->messageQueue.Head;

    do
    {
        if (mv->messageQueue.Queue[i].ID == 0x1000008)
        {
            evMonsterHitObjectData *data1;

            data1 = (evMonsterHitObjectData *)mv->messageQueue.Queue[i].Data;

            if (data1->instance == hit)
            {
                break;
            }
        }

        i++;

        if (i == 16)
        {
            i = 0;
        }
    } while (i != mv->messageQueue.Tail);

    if (i == mv->messageQueue.Tail)
    {
        evMonsterHitObjectData *data;

        data = (evMonsterHitObjectData *)CIRC_Alloc(sizeof(evMonsterHitObjectData));

        data->instance = hit;
        data->hitType = type;

        INSTANCE_Post(instance, 0x1000008, (intptr_t)data);
    }
}

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

void MONAPI_DeleteRegen(MONAPI_Regenerator *regen)
{
    GlobalSave->numRegens--;

    memcpy(regen, &regen[1], ((signed char)GlobalSave->numRegens - (regen - GlobalSave->regenEntries)) * sizeof(MONAPI_Regenerator));
}

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

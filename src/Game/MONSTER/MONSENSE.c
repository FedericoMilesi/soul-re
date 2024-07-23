#include "common.h"
#include "Game/MONSTER/MONSENSE.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MATH3D.h"

MonsterIR *MONSENSE_FindIR(MonsterVars *mv, Instance *instance)
{
    MonsterIR *mir;

    for (mir = mv->monsterIRList; mir != NULL; mir = mir->next)
    {
        if (mir->instance == instance)
        {
            break;
        }
    }

    return mir;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_See);

int MONSENSE_Hear(Instance *instance, evCollideInstanceStatsData *data)
{
    MonsterVars *mv;
    MonsterSenses *senses;
    long mode;

    mv = (MonsterVars *)instance->extraData;

    senses = mv->subAttr->senses;

    mode = INSTANCE_Query(data->instance, 10);

    if (((!(mode & 0x10B0143)) || ((mode & 0x200000))) && (data->distance < (unsigned)senses->soundRadius))
    {
        return MATH3D_ConeDetect(&data->relativePosition, senses->soundArc, senses->soundElevation);
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_Smell);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_FirstSense);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_SetupMIR);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_SenseInstance);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_StartMonsterIRList);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_GetMonsterIR);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_InitIRList);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_SetEnemy);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_ProcessIRList);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_SetupSenses);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_RemoveSenses);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_Radar);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_GetClosestFreeDirection);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_GetDistanceInDirection);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_DoSenses);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_AdjustRadarFromObjects);

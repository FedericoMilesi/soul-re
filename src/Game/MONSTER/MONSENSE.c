#include "common.h"
#include "Game/MONSTER/MONAPI.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_Hear);

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

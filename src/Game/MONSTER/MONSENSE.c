#include "common.h"
#include "Game/MONSTER/MONSENSE.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MATH3D.h"
#include "Game/PHYSOBS.h"
#include "Game/MONSTER/MONLIB.h"

//static int gNumMonsters;
int gNumMonsters;

//static int gNumSpectralMonsters;
int gNumSpectralMonsters;

//static int gNumMaterialMonsters;
int gNumMaterialMonsters;

//static MonsterVars *monsterSenseArray[40];
MonsterVars *monsterSenseArray[40];

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

int MONSENSE_Smell(Instance *instance, evCollideInstanceStatsData *data)
{
    MonsterVars *mv;

    mv = (MonsterVars *)instance->extraData;

    return data->distance < mv->subAttr->senses->scentRadius;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_FirstSense);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_SetupMIR);

void MONSENSE_SenseInstance(Instance *instance, evCollideInstanceStatsData *data)
{
    MonsterVars *mv;
    long flags;
    unsigned long whatAmI;

    flags = 0;

    mv = (MonsterVars *)instance->extraData;

    whatAmI = INSTANCE_Query(data->instance, 1);

    if (!(mv->mvFlags & 0x200))
    {
        if ((whatAmI & 0x20))
        {
            PhysObProperties *prop;

            prop = (PhysObProperties *)data->instance->data;

            if ((prop->family == 3) && ((((PhysObInteractProperties *)prop)->engageXYDistance >> 1) > data->xyDistance)
            && (((PhysObInteractProperties *)prop)->engageZMaxDelta > data->zDelta) && (((PhysObInteractProperties *)prop)->engageZMinDelta < data->zDelta))
            {
                if ((((PhysObInteractProperties *)prop)->conditions & 0x40))
                {
                    INSTANCE_Post(instance, 0x100000C, 0x20);
                }

                if ((((PhysObInteractProperties *)prop)->conditions & 0x8))
                {
                    INSTANCE_Post(instance, 0x100000C, 0x40);
                }

                if ((((PhysObInteractProperties *)prop)->conditions & 0x10))
                {
                    INSTANCE_Post(instance, 0x100000C, 0x10);
                }
            }
        }
        else if (mv->alertCount != 0)
        {
            if (MONSENSE_Smell(instance, data) != 0)
            {
                flags = 0x80;
            }

            if (MONSENSE_See(instance, data) != 0)
            {
                flags |= 0x20;
            }

            if (MONSENSE_Hear(instance, data) != 0)
            {
                flags |= 0x40;
            }

            if (((whatAmI & mv->subAttr->allegiances->allies)) && (data->distance < mv->subAttr->senses->allyRadius))
            {
                flags |= 0x2;
            }

            MONSENSE_SetupMIR(instance, data, flags);
        }
    }
}

void MONSENSE_StartMonsterIRList(Instance *instance)
{
    MonsterVars *mv;
    MonsterIR *mir;
    MonsterIR *newlist;
    int enemyOnList;
    char temp; // not from decls.h

    temp = 0;

    mv = (MonsterVars *)instance->extraData;

    newlist = NULL;

    enemyOnList = 0;

    if (mv->alertCount != 0)
    {
        MonsterIR *next;

        for (mir = mv->monsterIRList; mir != NULL; mir = next)
        {
            next = mir->next;

            if ((mir->handle != mir->instance->instanceID) || ((!(mir->mirFlags & 0xE0)) && (mir->forgetTimer < MON_GetTime(instance))))
            {
                if (mv != NULL) // garbage code for reodering
                {
                    temp = -temp;
                }

                mir->next = mv->freeIRs;

                mv->freeIRs = mir;
            }
            else
            {
                mir->next = newlist;

                newlist = mir;

                newlist->mirFlags &= ~0xE0;

                if (mv->enemy == newlist)
                {
                    enemyOnList = 1;
                }
            }
        }

        if (enemyOnList == 0)
        {
            mv->enemy = NULL;
        }

        mv->monsterIRList = newlist;
    }
}

MonsterIR *MONSENSE_GetMonsterIR(MonsterVars *mv)
{
    MonsterIR *mir;

    if (mv->freeIRs != NULL)
    {
        mir = mv->freeIRs;

        mv->freeIRs = mir->next;
    }
    else
    {
        mir = NULL;
    }

    return mir;
}

void MONSENSE_InitIRList(MonsterVars *mv, MonsterIR *list, int num)
{
    int i;

    i = num;

    mv->freeIRs = list;

    while (--i != 0)
    {
        list->next = list + 1;

        list = list->next;
    }

    list->next = NULL;

    mv->monsterIRList = NULL;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_SetEnemy);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_ProcessIRList);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_SetupSenses);

void MONSENSE_RemoveSenses(Instance *instance)
{
    MonsterVars *mv;
    int i;

    mv = (MonsterVars *)instance->extraData;

    gNumMonsters--;

    if ((((MonsterAttributes *)instance->data)->whatAmI & 0x1804))
    {
        gNumSpectralMonsters--;
    }
    else
    {
        gNumMaterialMonsters--;
    }

    for (i = mv->senseIndex; i < gNumMonsters; i++)
    {
        monsterSenseArray[i] = monsterSenseArray[i + 1];

        monsterSenseArray[i]->senseIndex = i;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_Radar);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_GetClosestFreeDirection);

int MONSENSE_GetDistanceInDirection(Instance *instance, short angle)
{
    MonsterVars *mv;
    int bit;

    bit = (angle + 256) & 0xFFF;

    mv = (MonsterVars *)instance->extraData;

    return mv->radarDistance[bit / 512];
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_DoSenses);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONSENSE", MONSENSE_AdjustRadarFromObjects);

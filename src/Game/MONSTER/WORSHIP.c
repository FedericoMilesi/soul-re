#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/MONSTER/MONAPI.h"

void WORSHIP_Init(Instance *instance)
{
    MonsterAttributes *ma;
    MonsterVars *mv;
    Instance *weapon;

    mv = (MonsterVars *)instance->extraData;

    ma = (MonsterAttributes *)instance->data;

    if (mv->age == 0)
    {
        weapon = HUMAN_CreateWeapon(instance, 12, ma->rightWeaponSegment);
    }
    else
    {
        HUMAN_CreateWeapon(instance, 11, ma->leftWeaponSegment);

        weapon = HUMAN_CreateWeapon(instance, 11, ma->rightWeaponSegment);
    }

    if (weapon != NULL)
    {
        HUMAN_Init(instance);
    }

    if (mv->age == 0)
    {
        mv->soulJuice = 20480;
    }
    else
    {
        mv->soulJuice = 24576;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/WORSHIP", WORSHIP_CombatEntry);

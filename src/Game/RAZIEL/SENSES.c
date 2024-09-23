#include "common.h"
#include "Game/PLAYER.h"
#include "Game/MATH3D.h"

int SetEngagedInstance(Player *player, evCollideInstanceStatsData *Ptr, unsigned long Attribute)
{
    int rc;

    rc = 0;

    if ((player->Senses.EngagedMask & (1 << Attribute)))
    {
        if (player->Senses.EngagedList[Attribute].distance > Ptr->distance)
        {
            rc = 1;

            player->Senses.EngagedList[Attribute].instance = Ptr->instance;
            player->Senses.EngagedList[Attribute].distance = Ptr->distance;
        }
    }
    else
    {
        rc = 1;

        player->Senses.EngagedMask |= 1 << Attribute;

        player->Senses.EngagedList[Attribute].instance = Ptr->instance;
        player->Senses.EngagedList[Attribute].distance = Ptr->distance;
    }

    return rc;
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/SENSES", UpdateEngagementList);

long UpdateAutoFaceAngle(Instance *player, Instance *instance)
{
    long rc;

    rc = MATH3D_FastAtan2(player->position.y - instance->position.y, player->position.x - instance->position.x);

    return (rc + 3072) & 0xFFF;
}

#include "common.h"
#include "Game/MATH3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/SENSES", SetEngagedInstance);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/SENSES", UpdateEngagementList);

long UpdateAutoFaceAngle(Instance *player, Instance *instance)
{
    long rc;

    rc = MATH3D_FastAtan2(player->position.y - instance->position.y, player->position.x - instance->position.x);

    return (rc + 3072) & 0xFFF;
}

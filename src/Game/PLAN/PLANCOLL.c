#include "common.h"
#include "Game/PLAN/PLANCOLL.h"
#include "Game/MATH3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANCOLL", PLANCOLL_DoesLOSExistFinal);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANCOLL", PLANCOLL_CheckUnderwaterPoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANCOLL", PLANCOLL_FindTerrainHitFinal);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANCOLL", PLANCOLL_DoesStraightLinePathExist);

int PLANCOLL_DoesWaterPathUpExist(Position *startPos, Position *endPos, int collideType, Position *peakPos, int passThroughHit)
{
    long time_ftop;
    long time_ptow;
    long time_tot;
    Position diff;

    time_ftop = MATH3D_FastSqrt(327680);

    peakPos->z = (startPos->z - endPos->z) + 640;

    time_ptow = MATH3D_FastSqrt((peakPos->z * 131072) / 3);

    time_tot = time_ptow / 16;

    diff.x = startPos->x - endPos->x;
    diff.y = startPos->y - endPos->y;

    peakPos->x = endPos->x + ((diff.x * time_tot) / (time_ftop + time_tot));
    peakPos->y = endPos->y + ((diff.y * time_tot) / (time_ftop + time_tot));

    return PLANCOLL_DoesLOSExistFinal(startPos, peakPos, collideType, passThroughHit, 0);
}

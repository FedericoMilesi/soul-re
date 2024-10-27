#include "common.h"
#include "Game/PLAN/PLANCOLL.h"
#include "Game/MATH3D.h"
#include "Game/GAMELOOP.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANCOLL", PLANCOLL_DoesLOSExistFinal);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANCOLL", PLANCOLL_CheckUnderwaterPoint);

INCLUDE_ASM("asm/nonmatchings/Game/PLAN/PLANCOLL", PLANCOLL_FindTerrainHitFinal);

int PLANCOLL_DoesStraightLinePathExist(Position *startPos, Position *endPos, int collideType)
{
    int temp, temp2; // not from decls.h

    temp = 0;

    temp2 = gameTrackerX.gameFlags < temp;

    if (PLANCOLL_DoesLOSExistFinal(startPos, endPos, collideType, temp2, 256) != 0)
    {
        temp = PLANCOLL_DoesLOSExistFinal(startPos, endPos, collideType, temp2, -256) != 0;
    }

    return temp;
}

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

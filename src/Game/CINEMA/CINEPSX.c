#include "common.h"
#include "Game/OBTABLE.h"

extern int StCdIntrFlag;

EXTERN STATIC ObjectTracker *the_cine_tracker;

int CINE_CDIntrQuery()
{
    if (StCdIntrFlag != 0)
    {
        StCdIntrFlag = 0;

        return 1;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_Pad);

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_Play);

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_Load);

int CINE_Loaded()
{
    return the_cine_tracker != NULL;
}

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_Unload);

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_PlayIngame);

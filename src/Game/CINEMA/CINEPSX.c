#include "common.h"

extern int StCdIntrFlag;

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

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_Loaded);

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_Unload);

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_PlayIngame);

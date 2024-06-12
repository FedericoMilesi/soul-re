#include "common.h"
#include "Game/OBTABLE.h"
#include "Game/PSX/MAIN.h"
#include "Game/CINEMA/CINEPSX.h"

extern int StCdIntrFlag;

EXTERN STATIC ObjectTracker *the_cine_tracker;

EXTERN STATIC cinema_fn_table_t *the_cine_table;

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

void CINE_Unload()
{
    VSyncCallback(VblTick);

    the_cine_table = NULL;

    if (the_cine_tracker != NULL)
    {
        STREAM_DumpObject(the_cine_tracker);

        the_cine_tracker = NULL;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/CINEMA/CINEPSX", CINE_PlayIngame);

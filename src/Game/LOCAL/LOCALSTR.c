#include "common.h"
#include "Game/LOCAL/LOCALSTR.h"
#include "Game/VOICEXA.h"
#include "Game/LOAD3D.h"

// TODO: this file needs migrating its .sdata to C

static language_t the_language;

STATIC char **LocalStrings;

STATIC LocalizationHeader *LocalizationTable;

XAVoiceListEntry *voiceList;

language_t localstr_get_language()
{
    return the_language;
}

extern char D_800D1EE8[];
void localstr_set_language(language_t lang)
{
    int i;

    (void)lang;

    LocalizationTable = (LocalizationHeader *)LOAD_ReadFileFromCD(D_800D1EE8, 6);
    // LocalizationTable = (LocalizationHeader *)LOAD_ReadFileFromCD("LOCALS.TBL", 6);

    if (LocalizationTable != NULL)
    {
        LocalStrings = (char **)(LocalizationTable + 1);

        voiceList = (XAVoiceListEntry *)((uintptr_t)LocalizationTable + LocalizationTable->XATableOffset);

        for (i = 0; i < LocalizationTable->numStrings; i++)
        {
            LocalStrings[i] += (uintptr_t)LocalizationTable;
        }

        the_language = LocalizationTable->language;
    }
}

extern char D_800D1EF8[2];
char *localstr_get(localstr_t id)
{
    // static char BlankStr[2];

    if (LocalStrings != NULL)
    {
        return LocalStrings[id];
    }
    else
    {
        // return &BlankStr[0];
        return &D_800D1EF8[0];
    }
}

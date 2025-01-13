#include "Game/LOCAL/LOCALSTR.h"
#include "Game/VOICEXA.h"
#include "Game/LOAD3D.h"

static language_t the_language;

static LocalizationHeader *LocalizationTable = NULL;

static char **LocalStrings = NULL;

XAVoiceListEntry *voiceList = NULL;

language_t localstr_get_language()
{
    return the_language;
}

void localstr_set_language(language_t lang)
{
    int i;

    (void)lang;

    LocalizationTable = (LocalizationHeader *)LOAD_ReadFileFromCD("\\LOCALS.TBL;1", 6);

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

char *localstr_get(localstr_t id)
{
    static char BlankStr[2] = ".";

    if (LocalStrings != NULL)
    {
        return LocalStrings[id];
    }
    else
    {
        return &BlankStr[0];
    }
}

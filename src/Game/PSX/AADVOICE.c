#include "common.h"
#include "Game/PSX/AADLIB.h"

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADVOICE", aadAllocateVoice);
#else
AadSynthVoice *aadAllocateVoice(int priority)
{
    int i;
    int lowestPriSus;
    int lowestPriRel;
    AadSynthVoice *lowestPriSusVoice;
    AadSynthVoice *lowestPriRelVoice;
    AadSynthVoice *voice;

    lowestPriRel = 0x7FFF;
    lowestPriSus = 0x7FFF;

    lowestPriRelVoice = NULL;
    lowestPriSusVoice = NULL;

    for (i = 0; i < 24; i++)
    {
        voice = &aadMem->synthVoice[i];

        if (!(voice->flags & 0x1))
        {
            if (aadMem->voiceStatus[i] == 0)
            {
                aadMem->voiceStatus[i] = 1;

                voice->flags |= 0x2;

                return voice;
            }
            else
            {
                if (aadMem->voiceStatus[i] == 2)
                {
                    if (voice->priority < lowestPriRel)
                    {
                        lowestPriRel = voice->priority;

                        lowestPriRelVoice = voice;
                    }
                }
                else if (voice->priority < lowestPriSus)
                {
                    lowestPriSus = voice->priority;

                    lowestPriSusVoice = voice;
                }
            }
        }
    }

    if (priority >= lowestPriRel)
    {
        lowestPriRelVoice->flags |= 0x2;

        return lowestPriRelVoice;
    }

    if (priority >= lowestPriSus)
    {
        lowestPriSusVoice->flags |= 0x2;

        return lowestPriSusVoice;
    }

    return NULL;
}
#endif

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADVOICE", SpuSetVoiceADSR1ADSR2);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADVOICE", aadPlayTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADVOICE", aadPlayTonePitchBend);

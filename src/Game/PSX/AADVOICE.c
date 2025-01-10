#include "Game/PSX/AADVOICE.h"
#include "Game/PSX/AADLIB.h"

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

void SpuSetVoiceADSR1ADSR2(int vNum, unsigned short adsr1, unsigned short adsr2)
{
    unsigned short sl;
    unsigned short dr;
    unsigned short ar;
    unsigned short arm;
    unsigned short rr;
    unsigned short rrm;
    unsigned short sr;
    unsigned short srm;

    sl = adsr1 & 0xF;
    dr = (adsr1 >> 4) & 0xF;
    ar = (adsr1 >> 8) & 0x7F;

    arm = 1;

    if ((adsr1 & 0x8000))
    {
        arm = 5;
    }

    rr = adsr2 & 0x1F;

    rrm = 3;

    if ((adsr2 & 0x20))
    {
        rrm = 7;
    }

    sr = (adsr2 >> 6) & 0x7F;

    if ((adsr2 & 0x4000))
    {
        if ((adsr2 & 0x8000))
        {
            srm = 7;
        }
        else
        {
            srm = 3;
        }
    }
    else if ((adsr2 & 0x8000))
    {
        srm = 5;
    }
    else
    {
        srm = 1;
    }

    SpuSetVoiceADSRAttr(vNum, ar, dr, sr, rr, sl, arm, srm, rrm);
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADVOICE", aadPlayTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADVOICE", aadPlayTonePitchBend);

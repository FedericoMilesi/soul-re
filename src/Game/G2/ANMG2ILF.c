#include "common.h"
#include "Game/G2/ANMG2ILF.h"
#include "Game/G2/ANMINTRP.h"
#include "Game/G2/TIMERG2.h"

short G2Anim_GetElapsedTime(G2Anim *anim)
{
    G2AnimSection *section;

    section = &anim->section[anim->masterSection];

    return section->elapsedTime;
}

G2AnimKeylist *G2Anim_GetKeylist(G2Anim *anim)
{
    G2AnimSection *section;

    section = &anim->section[anim->masterSection];

    return section->keylist;
}

void G2Anim_GetRootMotionOverInterval(G2Anim *anim, short intervalStart, short intervalEnd, G2SVector3 *motionVector)
{
    short temp; // not from decls.h

    temp = intervalEnd - intervalStart;

    G2Anim_GetRootMotionFromTimeForDuration(anim, intervalStart, temp, motionVector);
}

//void G2Anim_InterpToKeylistFrame(G2Anim *anim, G2AnimKeylist *keylist, int keylistID, int targetFrame, int duration)
void G2Anim_InterpToKeylistFrame(G2Anim *anim, G2AnimKeylist *keylist, int keylistID, int targetFrame, short duration)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_InterpToKeylistFrame(&anim->section[i], keylist, keylistID, targetFrame, duration);
    }
}

void G2Anim_SetAlphaTable(G2Anim *anim, G2AnimAlphaTable *table)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_SetAlphaTable(&anim->section[i], table);
    }
}

void G2Anim_SetCallback(G2Anim *anim, long (*callback)(), void *data)
{
    int i;
    G2AnimSection *section;

    for (i = 0; i < anim->sectionCount; i++)
    {
        section = ((G2Anim *)&((G2AnimSection *)anim)[i])->section;

        section->callback = (void *)callback;
        section->callbackData = data;
    }
}

void G2Anim_SetLooping(G2Anim *anim)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_SetLooping(&anim->section[i]);
    }
}

void G2Anim_SetNoLooping(G2Anim *anim)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_SetNoLooping(&anim->section[i]);
    }
}

void G2Anim_SetPaused(G2Anim *anim)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_SetPaused(&anim->section[i]);
    }
}

void G2Anim_SetSpeedAdjustment(G2Anim *anim, long adjustment)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        anim->section[i].speedAdjustment = adjustment;
    }
}

void G2Anim_SetUnpaused(G2Anim *anim)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_SetUnpaused(&anim->section[i]);
    }
}

void G2Anim_SwitchToKeylist(G2Anim *anim, G2AnimKeylist *keylist, int keylistID)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_SwitchToKeylist(&anim->section[i], keylist, keylistID);
    }
}

short G2AnimKeylist_GetDuration(G2AnimKeylist *keylist)
{
    return keylist->s0TailTime + (keylist->timePerKey * (keylist->keyCount - 1));
}

int G2AnimKeylist_GetKeyframeCount(G2AnimKeylist *keylist)
{
    return ((keylist->timePerKey * (keylist->keyCount - 1)) + ((keylist->s0TailTime * 2) - 1)) / keylist->s0TailTime;
}

void G2AnimSection_ClearAlarm(G2AnimSection *section, unsigned long flag)
{
    section->alarmFlags &= ~flag;
}

int G2AnimSection_GetKeyframeNumber(G2AnimSection *section)
{
    if (G2AnimSection_IsInInterpolation(section) != G2FALSE)
    {
        return section->interpInfo->targetTime / section->keylist->s0TailTime;
    }
    else
    {
        return section->elapsedTime / section->keylist->s0TailTime;
    }
}

int G2AnimSection_GetStoredKeyframeNumber(G2AnimSection *section)
{
    return section->storedTime / section->keylist->s0TailTime;
}

void G2AnimSection_InterpToKeylistFrame(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, int targetFrame, int duration)
{
    G2AnimSection_InterpToKeylistAtTime(section, keylist, keylistID, (short)(targetFrame * keylist->s0TailTime), (short)duration);
}

G2Bool G2AnimSection_IsInInterpolation(G2AnimSection *section)
{
    G2AnimInterpInfo *interpInfo;

    interpInfo = section->interpInfo;

    if ((interpInfo == NULL) || (interpInfo->stateBlockList == NULL))
    {
        return G2FALSE;
    }

    return !G2FALSE;
}

short G2AnimSection_NextKeyframe(G2AnimSection *section)
{
    if (!(section->flags & 0x1))
    {
        G2AnimSection_SetNotRewinding(section);

        return G2AnimSection_UpdateOverInterval(section, G2Timer_GetFrameTime());
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetAlphaTable);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetInterpInfo);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetLooping);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetLoopRangeAll);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetNoLooping);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetNotRewinding);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetPaused);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetUnpaused);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SwitchToKeylist);

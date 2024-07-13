#include "common.h"
#include "Game/G2/ANMG2ILF.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_ClearAlarm);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_GetKeyframeNumber);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_GetStoredKeyframeNumber);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_InterpToKeylistFrame);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_IsInInterpolation);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_NextKeyframe);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetAlphaTable);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetInterpInfo);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetLooping);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetLoopRangeAll);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetNoLooping);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetNotRewinding);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetPaused);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SetUnpaused);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMG2ILF", G2AnimSection_SwitchToKeylist);

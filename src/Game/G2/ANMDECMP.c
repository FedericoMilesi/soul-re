#include "common.h"
#include "Game/G2/ANMDECMP.h"

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMDECMP", _G2Anim_DecompressChannel_AdaptiveDelta);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMDECMP", _G2Anim_DecompressChannel_Linear);

void _G2Anim_InitializeChannel_AdaptiveDelta(G2AnimDecompressChannelInfo *dcInfo, G2AnimChanStatus *status)
{
    unsigned short *chanData;
    int keyCount;

    keyCount = dcInfo->keylist->keyCount;

    chanData = dcInfo->chanData;

    status->index = ((unsigned char *)chanData)[0]; // double-check

    status->keyData = chanData[1];

    dcInfo->chanData = &chanData[((keyCount + 3) >> 2)] + 2;
}

void _G2Anim_InitializeChannel_Linear(G2AnimDecompressChannelInfo *dcInfo, G2AnimChanStatus *status)
{
    unsigned short *chanData;
    int chanLength;

    chanData = dcInfo->chanData;

    chanLength = (chanData[0] & 0xFFF) + 1;

    status->keyData = chanData[1];

    dcInfo->chanData = &chanData[chanLength];
}



INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_DecompressChannel_AdaptiveDelta);

void _G2Anim_DecompressChannel_Linear(G2AnimDecompressChannelInfo *dcInfo, G2AnimChanStatus *status)
{
    unsigned short *chanData;
    short rangeBase;
    short rangeInfo;
    int rangeLength;
    int rangeOffset;
    int targetKey;

    chanData = dcInfo->chanData;

    targetKey = dcInfo->targetKey;

    dcInfo->chanData = &chanData[((chanData[0] & 0xFFF)) + 1];

    rangeBase = chanData[1];

    rangeInfo = chanData[2]; // double-check

    chanData++;

    rangeLength = (rangeInfo & 0xF800) >> 11;

    rangeOffset = (rangeInfo << 21) >> 21;

    while (rangeLength < targetKey)
    {
        rangeInfo = chanData[2]; // double-check

        targetKey -= rangeLength;

        rangeBase += rangeOffset;

        chanData++;

        rangeLength = (rangeInfo & 0xF800) >> 11;

        rangeOffset = (rangeInfo << 21) >> 21;
    }

    rangeOffset = (short)((rangeOffset * targetKey) / rangeLength);

    status->keyData = rangeBase + rangeOffset;
}

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

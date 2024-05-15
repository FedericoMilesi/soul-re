#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", aadQueueNextEvent);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", aadExecuteEvent);

void midiNoteOff(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", midiNoteOn);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", aadUpdateChannelVolPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", aadUpdateSlotVolPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", aadUpdateChannelPitchBend);

void midiPolyphonicAftertouch(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", midiControlChange);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", midiProgramChange);

void midiChannelAftertouch(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", midiPitchWheelControl);

void midiMetaEvent(void)
{
}

void midiControlBankSelect(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", midiControlVolume);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", midiControlPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSEQEV", midiControlCallback);

void midiControlDummy(void)
{
}

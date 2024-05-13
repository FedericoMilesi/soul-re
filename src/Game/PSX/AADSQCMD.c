#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", aadSubstituteVariables);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSelectChannel);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSelectSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdAssignSequence);

void metaCmdUsePrimaryTempo(void) {
}

void metaCmdUseSecondaryTempo(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetTempo);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdChangeTempo);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetTempoFromSequence);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdStartSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdStopSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdPauseSlot);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdResumeSlot);

void metaCmdSetSlotBendRange(void) {
}

void metaCmdSetChannelBendRange(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetSlotVolume);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetSlotPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetChannelVolume);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetChannelPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdEnableSustainUpdate);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdDisableSustainUpdate);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdMuteChannel);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdUnMuteChannel);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdMuteChannelList);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdUnMuteChannelList);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetChannelMute);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdDelayMute);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdUpdateMute);

void metaCmdChannelVolumeFade(void) {
}

void metaCmdChannelPanFade(void) {
}

void metaCmdSlotVolumeFade(void) {
}

void metaCmdSlotPanFade(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetChannelProgram);

void metaCmdSetChannelBasePriority(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetChannelTranspose);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdIgnoreChannelTranspose);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdRespectChannelTranspose);

void metaCmdSetChannelPitchMap(void) {
}

void metaCmdIgnoreChannelPitchMap(void) {
}

void metaCmdRespectChannelPitchMap(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetSequenceAssigned);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetTempo);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetSlotStatus);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetChannelMute);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetChannelVolume);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetChannelPan);

void metaCmdGetChannelTranspose(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetChannelProgram);

void metaCmdGetChannelBasePriority(void) {
}

void metaCmdGetChannelBendRange(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetSlotVolume);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGetSlotPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetVariable);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdCopyVariable);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdAddVariable);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSubtractVariable);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetVariableBits);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdClearVariableBits);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", aadGotoSequencePosition);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", aadGotoSequenceLabel);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdLoopStart);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdLoopEnd);

void metaCmdLoopBreak(void) {
}

void metaCmdDefineLabel(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdGotoLabel);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSetSequencePosition);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarEqual);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarNotEqual);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarLess);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarGreater);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarLessOrEqual);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarGreaterOrEqual);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarBitsSet);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdBranchIfVarBitsClear);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSubstituteVariableParam1);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSubstituteVariableParam2);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdSubstituteVariableParam3);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSQCMD", metaCmdEndSequence);

void metaCmdPlaySoundEffect(void) {
}

void metaCmdStopSoundEffect(void) {
}

void metaCmdSetSoundEffectVolumePan(void) {
}

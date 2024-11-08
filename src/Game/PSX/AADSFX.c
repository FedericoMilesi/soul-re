#include "common.h"
#include "Game/PSX/AADSFX.h"

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadPlaySfx);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadStopSfx);

void aadStopAllSfx()
{
    aadPutSfxCommand(4, 0, 0, 0, 0);
}

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxPlaying);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxPlayingOrRequested);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxTypePlaying);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadIsSfxTypePlayingOrRequested);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadSetSfxVolPanPitch);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", createSfxHandle);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadPutSfxCommand);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", aadExecuteSfxCommand);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdPlayTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdStopTone);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdStopAllTones);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetToneVolumeAndPan);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetToneVolPanPitch);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdLockVoice);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetVoiceAttr);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetVoiceKeyOn);

INCLUDE_ASM("asm/nonmatchings/Game/PSX/AADSFX", sfxCmdSetVoiceKeyOff);

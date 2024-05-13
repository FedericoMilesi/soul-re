#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Init);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", putCdCommand);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_CdSyncCallback);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", processCdCommands);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", putVoiceCommand);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", processVoiceCommands);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdPlay);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdStop);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdPause);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", voiceCmdResume);

void voiceCmdNull(void) {
}

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Play);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_FinalStatus);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Pause);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Resume);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_Tick);

INCLUDE_ASM("asm/nonmatchings/Game/VOICEXA", VOICEXA_IsPlaying);

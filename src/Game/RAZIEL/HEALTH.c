#include "common.h"
#include "Game/RAZIEL/HEALTH.h"
#include "Game/PLAYER.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/RAZIEL/RAZLIB.h"

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", InitHealthSystem);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", GainHealth);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", LoseHealth);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", DrainHealth);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", BumpUpHealth);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", GetMaxHealth);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", ProcessHealth);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", HealthCheckForLowHealth);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", DrainMana);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", SetMana);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", HealthInstantDeath);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", RAZIEL_DebugHealthSetScale);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", RAZIEL_DebugManaSetMax);

void RAZIEL_DebugHealthFillUp()
{
    if (Raziel.CurrentPlane == 1)
    {
        Raziel.HitPoints = 100000 + (Raziel.HealthScale * 100000);
    }
    else
    {
        Raziel.HitPoints = 100000;
    }
}

void RAZIEL_DebugManaFillUp()
{
    SetMana(1);
}

void razPlayUnderworldSounds(Instance *instance)
{
    if (Raziel.soundHandle != 0)
    {
        SndEndLoop(Raziel.soundHandle);

        Raziel.soundHandle = 0;
    }

    razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 26, -250, -250, 120, 120, 0, 3500);
    razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 26, -300, -300, 120, 120, 0, 3500);
    razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 18, -220, -220, 120, 120, 0, 3500);
    razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 26, -250, -250, 120, 120, 0, 3500);
}

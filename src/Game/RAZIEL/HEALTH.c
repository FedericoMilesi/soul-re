#include "common.h"
#include "Game/RAZIEL/HEALTH.h"
#include "Game/GAMELOOP.h"
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

void DrainMana(int amount)
{
    Raziel.GlyphManaBalls -= amount;

    if (Raziel.GlyphManaBalls == 0)
    {
        Raziel.GlyphManaBalls = 0;
    }

    if (Raziel.GlyphManaBalls > Raziel.GlyphManaMax)
    {
        Raziel.GlyphManaBalls = Raziel.GlyphManaMax;
    }
}

void SetMana(int amount)
{
    if (amount <= 0)
    {
        Raziel.GlyphManaBalls = 0;
    }
    else
    {
        Raziel.GlyphManaBalls = Raziel.GlyphManaMax;
    }
}

void HealthInstantDeath(Instance *instance)
{
    (void)instance;

    gameTrackerX.gameData.asmData.MorphType = 1;

    razSpectralShift();

    Raziel.HitPoints = 50000;

    gameTracker->streamFlags |= 0x80000;

    if (Raziel.soulReaver != NULL)
    {
        INSTANCE_Post(Raziel.soulReaver, 0x800105, 0);
    }

    razSetPlayerEventHistory(0x8000);

    Raziel.playerEvent |= 0x8000;

    razPlayUnderworldSounds(gameTrackerX.playerInstance);
}

void RAZIEL_DebugHealthSetScale(long healthScale)
{
    Raziel.HealthScale = (short)healthScale;
    Raziel.HealthBalls = (short)((healthScale - 1) * 5);

    Raziel.HitPoints = (100000 * (short)healthScale) + 100000;
}

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/HEALTH", RAZIEL_DebugManaSetMax);
#else
void RAZIEL_DebugManaSetMax(long manaScale)
{
    Raziel.GlyphManaMax = Raziel.GlyphManaBalls = (short)(manaScale * 4);
}
#endif

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

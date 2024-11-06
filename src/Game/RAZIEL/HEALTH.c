#include "common.h"
#include "Game/RAZIEL/HEALTH.h"
#include "Game/GAMELOOP.h"
#include "Game/PLAYER.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/RAZIEL/RAZLIB.h"
#include "Game/GAMEPAD.h"
#include "Game/CAMERA.h"
#include "Game/FX.h"
#include "Game/INSTANCE.h"
#include "Game/STATE.h"
#include "Game/STREAM.h"
#include "Game/SOUND.h"

extern char D_800D1D1C[];
void InitHealthSystem()
{
    Raziel.DamageFrequency = 0;

    Raziel.HealthScale = 1;
    Raziel.HealthBalls = 0;

    Raziel.GlyphManaBalls = 0;

    if (gameTrackerX.gameData.asmData.MorphType == 0)
    {
        Raziel.CurrentPlane = 2;

        Raziel.HitPoints = 100000;

        razMaterialShift();
    }
    else
    {
        Raziel.CurrentPlane = 1;

        Raziel.HitPoints = GetMaxHealth();

        razSpectralShift();
    }

    // if (razInBaseArea("under", sizeof("under") - 1) != 0)
    if (razInBaseArea(D_800D1D1C, 5) != 0)
    {
        Raziel.HitPoints = 100;
    }
    else
    {
        razSetPlayerEventHistory(0x1000);
    }
}

void GainHealth(int data)
{
    Raziel.HitPoints += (data * 20000) / 4096;

    if ((Raziel.HitPoints >= GetMaxHealth()) && (Raziel.CurrentPlane == 1))
    {
        Raziel.HitPoints = GetMaxHealth();

        razReaverOn();
    }
}

void LoseHealth(int amount)
{
    if ((!(ControlFlag & 0x1000000)) && (Raziel.invincibleTimer == 0) && (Raziel.HitPoints > 525))
    {
        Raziel.HitPoints -= (amount * 20000) / 4096;

        Raziel.DamageFrequency -= (amount * 20000) / 4096;

        Raziel.invincibleTimer = PlayerData->healthInvinciblePostHit * 122880;

        if (Raziel.CurrentPlane == 1)
        {
            razReaverOff();

            if (Raziel.soulReaver != NULL)
            {
                INSTANCE_Post(Raziel.soulReaver, 0x800101, 0);

                razReaverImbue(2);
            }
        }

        if (!(gameTrackerX.gameFlags & 0x80))
        {
            GAMEPAD_Shock0(1, 9000);
        }
    }
}

void DrainHealth(int amount)
{
    if (!(ControlFlag & 0x1000000))
    {
        amount /= 4096;

        if (Raziel.CurrentPlane == 1)
        {
            Raziel.HitPoints += (int)(PlayerData->healthMaterialRate * amount * gameTrackerX.timeMult) / 4096;

            if (Raziel.soulReaver != NULL)
            {
                INSTANCE_Post(Raziel.soulReaver, 0x800101, 0);

                razReaverImbue(2);
            }
        }
        else if ((Raziel.invincibleTimer == 0) && (Raziel.HitPoints > 525))
        {
            Raziel.HitPoints += (int)(-PlayerData->healthSpectralRate * amount * gameTrackerX.timeMult) / 4096;
        }
    }
}

void BumpUpHealth()
{
    Raziel.HealthScale++;

    Raziel.HitPoints = GetMaxHealth();
}

int GetMaxHealth()
{
    if (Raziel.CurrentPlane == 2)
    {
        return 100000;
    }
    else
    {
        return (Raziel.HealthScale + 1) * 100000;
    }
}

void ProcessHealth(Instance *instance)
{
    if ((Raziel.invincibleTimer != 0) || (!(Raziel.playerEventHistory & 0x1000)))
    {
        Raziel.invincibleTimer -= gameTrackerX.timeMult;

        if (Raziel.invincibleTimer < 0)
        {
            Raziel.invincibleTimer = 0;
        }

        if (Raziel.CurrentPlane == 1)
        {
            FX_Health_Spiral(Raziel.HealthScale, Raziel.HitPoints - 100000, Raziel.HealthScale * 100000);
        }
        else
        {
            FX_Health_Spiral(0, Raziel.HitPoints, 100000);
        }
    }
    else
    {
        if ((Raziel.HitPoints == GetMaxHealth()) || (Raziel.CurrentPlane == 2))
        {
            razReaverOn();
        }
        else
        {
            razReaverOff();
        }

        if (Raziel.CurrentPlane == 1)
        {
            if ((instance->waterFace != NULL) && (!(Raziel.Abilities & 0x10)))
            {
                DrainHealth(40960);
            }

            if ((Raziel.soulReaver == NULL) || (Raziel.HitPoints != GetMaxHealth()))
            {
                Raziel.HitPoints += (int)(PlayerData->healthMaterialRate * gameTrackerX.timeMult) / 4096;
            }

            if (Raziel.HitPoints < 100000)
            {
                razPlaneShift(instance);

                Raziel.invincibleTimer = PlayerData->healthInvinciblePostShunt * 122880;

                if ((Raziel.Mode & 0x40000))
                {
                    CAMERA_ChangeToOutOfWater(&theCamera, instance);
                }
            }
            else if (Raziel.HitPoints < 150000)
            {
                Raziel.DamageFrequency -= (int)(gameTrackerX.timeMult * 1000) / 4096;

                if (Raziel.DamageFrequency < 0)
                {
                    Raziel.DamageFrequency = Raziel.HitPoints - 100000;

                    if ((Raziel.HitPoints - 100000) < 18750)
                    {
                        Raziel.DamageFrequency = 18750;
                    }

                    FX_DoInstancePowerRing(instance, 750 - ((300 * (50000 - Raziel.DamageFrequency)) / 31250), 0, 0, 0);

                    if (!(gameTrackerX.gameFlags & 0x80))
                    {
                        GAMEPAD_Shock1(128, 20480);
                    }
                }
            }

            FX_Health_Spiral(Raziel.HealthScale, Raziel.HitPoints - 100000, Raziel.HealthScale * 100000);
        }
        else
        {
            if (Raziel.HitPoints <= 525)
            {
                Raziel.HitPoints -= (int)(PlayerData->healthSpectralRate * gameTrackerX.timeMult) / 4096;
            }
            else if (Raziel.HitPoints < 100000)
            {
                Raziel.HitPoints += (int)(PlayerData->healthSpectralRate * gameTrackerX.timeMult) / 4096;
            }
            else
            {
                Raziel.HitPoints = 100000;
            }

            if ((!(ControlFlag & 0x800000)) && (Raziel.HitPoints < 525))
            {
                StateSwitchStateCharacterData(&Raziel.State, StateHandlerIdle, SetControlInitIdleData(0, 0, 3));

                G2EmulationSwitchAnimationCharacter(&Raziel.State, 214, 0, 3, 1);

                Raziel.HitPoints = 525;

                ControlFlag |= 0x804000;
            }

            if (Raziel.HitPoints < 0)
            {
                gameTracker->streamFlags |= 0x80000;

                if (Raziel.soulReaver != NULL)
                {
                    INSTANCE_Post(Raziel.soulReaver, 0x800105, 0);
                }

                razSetPlayerEventHistory(0x8000);

                Raziel.HitPoints = 50000;

                gameTrackerX.gameData.asmData.MorphType = 1;

                Raziel.playerEvent |= 0x8000;

                razPlayUnderworldSounds(gameTrackerX.playerInstance);
            }

            FX_Health_Spiral(0, Raziel.HitPoints, 100000);
        }
    }
}

int HealthCheckForLowHealth()
{
    if (STREAM_IsMorphInProgress() == 0)
    {
        if (Raziel.CurrentPlane == 1)
        {
            if (Raziel.HitPoints < 100100)
            {
                return 1;
            }
        }
        else if (Raziel.HitPoints < 100)
        {
            return 1;
        }

        return 0;
    }

    return 1;
}

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

void RAZIEL_DebugManaSetMax(long manaScale)
{
    Raziel.GlyphManaBalls = Raziel.GlyphManaMax = (short)(manaScale * 4);
}

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

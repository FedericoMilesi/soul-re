#ifndef RAZLIB_H_
#define RAZLIB_H_

#include "common.h"

// size: 0x18
typedef struct _SoundRamp {
    // offset: 0000
    unsigned long soundHandle;
    // offset: 0004
    long soundTimer;
    // offset: 0008
    long soundTotalTime;
    // offset: 000C
    unsigned long soundDistance;
    // offset: 0010
    short soundStartPitch;
    // offset: 0012
    short soundEndPitch;
    // offset: 0014
    short soundStartVolume;
    // offset: 0016
    short soundEndVolume;
} SoundRamp;

Instance *razGetHeldWeapon();
void razSetupSoundRamp(Instance *instance, SoundRamp *sound, int sfx, int startPitch, int endPitch, int startVolume, int endVolume, int timer, int distance);
void razSpectralShift();
void razSetPlayerEventHistory(unsigned long event);
int razReaverOn();
Instance *razGetHeldItem();
void razResetMotion(Instance *instance);

#endif

#ifndef _REAVER_H_
#define _REAVER_H_

#include "Game/INSTANCE.h"
#include "Game/GAMELOOP.h"

// size: 0xC0
typedef struct __ReaverTuneData {
    // offset: 0000
    unsigned long spectralGlowColor;
    // offset: 0004
    unsigned long materialGlowColor;
    // offset: 0008
    unsigned long sunlightGlowColor;
    // offset: 000C
    unsigned long waterGlowColor;
    // offset: 0010
    unsigned long stoneGlowColor;
    // offset: 0014
    unsigned long fireGlowColor;
    // offset: 0018
    unsigned long spiritGlowColor;
    // offset: 001C
    unsigned long soundGlowColor;
    // offset: 0020
    unsigned long spectralInnerColor;
    // offset: 0024
    unsigned long materialInnerColor;
    // offset: 0028
    unsigned long sunlightInnerColor;
    // offset: 002C
    unsigned long waterInnerColor;
    // offset: 0030
    unsigned long stoneInnerColor;
    // offset: 0034
    unsigned long fireInnerColor;
    // offset: 0038
    unsigned long spiritInnerColor;
    // offset: 003C
    unsigned long soundInnerColor;
    // offset: 0040
    unsigned long spectralInnerGlowColor;
    // offset: 0044
    unsigned long materialInnerGlowColor;
    // offset: 0048
    unsigned long sunlightInnerGlowColor;
    // offset: 004C
    unsigned long waterInnerGlowColor;
    // offset: 0050
    unsigned long stoneInnerGlowColor;
    // offset: 0054
    unsigned long fireInnerGlowColor;
    // offset: 0058
    unsigned long spiritInnerGlowColor;
    // offset: 005C
    unsigned long soundInnerGlowColor;
    // offset: 0060 (96 bytes)
    unsigned long icon_colors[24];
} ReaverTuneData;

// size: 0x4
typedef struct __ReaverSaveDat {
    unsigned long pad;
} ReaverSaveData;

// size: 0x24
typedef struct __ReaverData {
    // offset: 0000
    char ReaverPickedUp;
    // offset: 0001
    char ReaverOn;
    // offset: 0002
    short ReaverSize;
    // offset: 0004
    short CurrentReaver;
    // offset: 0006
    short ReaverDeg;
    // offset: 0008
    long ReaverChargeTime;
    // offset: 000C
    long ReaverShockAmount;
    // offset: 0010
    long ReaverGlowColor;
    // offset: 0014
    long ReaverBladeColor;
    // offset: 0018
    long ReaverBladeGlowColor;
    // offset: 001C
    short ReaverScale;
    // offset: 001E
    short ReaverTargetScale;
    // offset: 0020 (4 bytes)
    struct __ReaverSaveDat saveData;
} ReaverData;

void CollideReaverProjectile(Instance *instance, GameTracker *gameTracker);

#endif

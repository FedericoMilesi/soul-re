#ifndef _GAMELOOP_H_
#define _GAMELOOP_H_

#include "common.h"
#include "Game/LIGHT3D.h"

// size: 0x20
typedef struct _GameTrackerASMData_Type {
    // offset: 0000
    long drawBackFaces;
    // offset: 0004
    long dispPage;
    // offset: 0008
    short MorphTime;
    // offset: 000A
    short MorphType;
    // offset: 000C (20 bytes)
    struct LightInstance lightInstances[1];
} GameTrackerASMData;

// size: 0x20
typedef struct _GameData_Type {
    // offset: 0000 (32 bytes)
    struct _GameTrackerASMData_Type asmData;
} GameData;

// size: 0x270
typedef struct GameTracker {
    // offset: 0000 (32 bytes)
    struct _GameData_Type gameData;
    // offset: 0020
    struct menu_t *menu;
    // offset: 0024
    struct memcard_t *memcard;
    // offset: 0028 (392 bytes)
    struct Level *level;
    // offset: 002C (668 bytes)
    struct _Instance *playerInstance;
    // offset: 0030
    long drawPage;
    // offset: 0034 (268 bytes)
    struct _InstanceList *instanceList;
    // offset: 0038 (40092 bytes)
    struct _InstancePool *instancePool;
    // offset: 003C (6336 bytes)
    struct _VertexPool *vertexPool;
    // offset: 0040 (96012 bytes)
    struct _PrimPool *primPool;
    // offset: 0044 (36 bytes)
    struct _ObjectTracker *GlobalObjects;
    // offset: 0048 (40 bytes)
    long controlCommand[5][2];
    // offset: 0070 (40 bytes)
    long controlData[5][2];
    // offset: 0098 (40 bytes)
    long overrideData[5][2];
    // offset: 00C0
    long debugFlags;
    // offset: 00C4
    long debugFlags2;
    // offset: 00C8 (4 bytes)
    struct CVECTOR wipeColor;
    // offset: 00CC
    short wipeTime;
    // offset: 00CE
    short maxWipeTime;
    // offset: 00D0
    short wipeType;
    // offset: 00D2
    short numGSignals;
    // offset: 00D4 (64 bytes)
    void *gSignal[16];
    // offset: 0114 (1148 bytes)
    struct LightInfo *lightInfo;
    // offset: 0118
    void *reqDisp;
    // offset: 011C
    long *drawTimerReturn;
    // offset: 0120
    long usecsStartDraw;
    // offset: 0124
    void *disp;
    // offset: 0128
    unsigned long displayFrameCount;
    // offset: 012C
    unsigned long frameCount;
    // offset: 0130
    unsigned long fps30Count;
    // offset: 0134
    unsigned long vblFrames;
    // offset: 0138
    unsigned long vblCount;
    // offset: 013C
    long numMatrices;
    // offset: 0140
    long gameFlags;
    // offset: 0144
    long streamFlags;
    // offset: 0148
    void *drawNonAnimatedSegmentFunc;
    // offset: 014C
    void *drawAnimatedModelFunc;
    // offset: 0150
    void *drawDisplayPolytopeListFunc;
    // offset: 0154
    void *drawBgFunc;
    // offset: 0158 (392 bytes)
    struct Level *mainDrawUnit;
    // offset: 015C (16 bytes)
    char baseAreaName[16];
    // offset: 016C
    short levelDone;
    // offset: 016E
    short levelChange;
    // offset: 0170
    short hideBG;
    // offset: 0172
    short gameMode;
    // offset: 0174
    long currentHotSpot;
    // offset: 0178
    long StreamUnitID;
    // offset: 017C
    short SwitchToNewStreamUnit;
    // offset: 017E
    short SwitchToNewWarpIndex;
    // offset: 0180 (16 bytes)
    char S_baseAreaName[16];
    // offset: 0190
    short toSignal;
    // offset: 0192
    short fromSignal;
    // offset: 0194
    char LastSignal;
    // offset: 0196
    short StreamNormalA;
    // offset: 0198
    short StreamNormalB;
    // offset: 019A
    short StreamNormalC;
    // offset: 019C
    long StreamNormalD;
    // offset: 01A0
    long moveRazielToStreamID;
    // offset: 01A4 (4 bytes)
    struct _ColorType animObjLine;
    // offset: 01A8 (4 bytes)
    struct _ColorType animObjShade;
    // offset: 01AC
    long maxIntroFXTime;
    // offset: 01B0 (20 bytes)
    struct gSoundData sound;
    // offset: 01C4
    short controllerMode;
    // offset: 01C6
    unsigned char plan_collide_override;
    // offset: 01C7
    unsigned char cheatMode;
    // offset: 01C8
    char currentLvl;
    // offset: 01C9
    char lastLvl;
    // offset: 01CC (76 bytes)
    struct Object *introFX;
    // offset: 01D0 (76 bytes)
    struct Intro *introFXIntro;
    // offset: 01D4
    unsigned long **drawOT;
    // offset: 01D8
    unsigned long **dispOT;
    // offset: 01DC (8 bytes)
    struct P_TAG *savedOTStart;
    // offset: 01E0 (8 bytes)
    struct P_TAG *savedOTEnd;
    // offset: 01E4
    long introWaitTime;
    // offset: 01E8
    long mirrorZPush;
    // offset: 01EC
    long defVVRemoveDist;
    // offset: 01F0
    long defRemoveDist;
    // offset: 01F4 (6 bytes)
    struct _Position forcedStartPosition;
    // offset: 01FA
    short hudCollDisplay;
    // offset: 01FC
    long primMemUsed;
    // offset: 0200
    long cheatTimerCount;
    // offset: 0204
    long playerCheatFlags;
    // offset: 0208
    long savedPlayerCameraMode;
    // offset: 020C
    long debugDrawFlags;
    // offset: 0210
    void *planningPool;
    // offset: 0214
    void *enemyPlanPool;
    // offset: 0218
    unsigned char block_collide_override;
    // offset: 0219
    unsigned char raziel_collide_override;
    // offset: 021A
    short timeOfDay;
    // offset: 021C
    long decoupleGame;
    // offset: 0220
    long multGameTime;
    // offset: 0224
    short spectral_fadeValue;
    // offset: 0226
    short material_fadeValue;
    // offset: 0228
    unsigned long drawTime;
    // offset: 022C
    unsigned long currentTime;
    // offset: 0230
    unsigned long currentMaterialTime;
    // offset: 0234
    unsigned long currentSpectralTime;
    // offset: 0238
    unsigned long currentTimeOfDayTime;
    // offset: 023C
    unsigned long lastLoopTime;
    // offset: 0240
    unsigned long timeMult;
    // offset: 0244
    unsigned long globalTimeMult;
    // offset: 0248
    unsigned long spectralTimeMult;
    // offset: 024C
    unsigned long materialTimeMult;
    // offset: 0250
    unsigned long currentTicks;
    // offset: 0254
    unsigned long totalTime;
    // offset: 0258
    unsigned long idleTime;
    // offset: 025C
    long visibleInstances;
    // offset: 0260
    int gameFramePassed;
    // offset: 0264
    unsigned long timeSinceLastGameFrame;
    // offset: 0268
    long frameRateLock;
    // offset: 026C
    short frameRate24fps;
    // offset: 026E
    char monster_collide_override;
    // offset: 026F
    char pad;
} GameTracker;

void GAMELOOP_SetGameTime(long timeOfDay);
int GAMELOOP_GetTimeOfDay();
MATRIX *GAMELOOP_GetMatrices(int numMatrices);
void GAMELOOP_Set_Pause_Redraw();

GameTracker gameTrackerX;
extern long playerCameraMode;
extern long cameraMode;
DRAWENV draw[2];

#endif

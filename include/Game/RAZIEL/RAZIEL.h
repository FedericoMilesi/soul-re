#ifndef RAZIEL_H_
#define RAZIEL_H_

#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/PLAYER.h"

// size: 0x24
typedef struct __AttackItem {
    // offset: 0000
    unsigned char anim;
    // offset: 0001
    unsigned char framesIn;
    // offset: 0002
    unsigned char alphaIn;
    // offset: 0003
    unsigned char framesOut;
    // offset: 0004
    unsigned char switchDelay;
    // offset: 0005
    unsigned char ignoreDelay;
    // offset: 0006
    unsigned char segmentToGlow;
    // offset: 0007
    unsigned char startCollisionFrame;
    // offset: 0008
    unsigned char handsToCollide;
    // offset: 0009
    unsigned char endCollisionFrame;
    // offset: 000A
    unsigned char ribbonStartFrame;
    // offset: 000B
    unsigned char ribbonStartSegment;
    // offset: 000C
    unsigned char ribbonEndSegment;
    // offset: 000D
    unsigned char ribbonLifeTime;
    // offset: 000E
    unsigned char ribbonFaceLifeTime;
    // offset: 000F
    unsigned char knockBackFrames;
    // offset: 0010
    unsigned char glowFadeInFrames;
    // offset: 0011
    unsigned char glowFadeOutFrames;
    // offset: 0012
    unsigned short ribbonStartOpacity;
    // offset: 0014
    unsigned long ribbonStartColor;
    // offset: 0018
    unsigned long ribbonEndColor;
    // offset: 001C
    unsigned long glowColor;
    // offset: 0020
    unsigned short knockBackDistance;
    // offset: 0022
    unsigned short hitPowerScale;
} AttackItem;

// size: 0xA0
typedef struct RazielData {
    // offset: 0000
    unsigned long version;
    // offset: 0004
    unsigned long nonBurningRibbonStartColor;
    // offset: 0008
    unsigned long nonBurningRibbonEndColor;
    // offset: 000C (4 bytes)
    struct __Idle ***idleList;
    // offset: 0010 (36 bytes)
    struct __AttackItem ***attackList;
    // offset: 0014 (32 bytes)
    struct __ThrowItem **throwList;
    // offset: 0018 (8 bytes)
    struct __VAnim *virtualAnimations;
    // offset: 001C (8 bytes)
    struct __VAnim *virtualAnimSingle;
    // offset: 0020 (16 bytes)
    struct __SAnim **stringAnimations;
    // offset: 0024
    short throwFadeValue;
    // offset: 0026
    short throwFadeInRate;
    // offset: 0028
    int throwFadeOutRate;
    // offset: 002C
    int throwManualDistance;
    // offset: 0030
    short healthMaterialRate;
    // offset: 0032
    short healthSpectralRate;
    // offset: 0034
    short healthInvinciblePostHit;
    // offset: 0036
    short healthInvinciblePostShunt;
    // offset: 0038
    short forceMinPitch;
    // offset: 003A
    short forceMaxPitch;
    // offset: 003C
    short forceMinVolume;
    // offset: 003E
    short forceMaxVolume;
    // offset: 0040
    unsigned long forceRampTime;
    // offset: 0044
    int SwimPhysicsFallDamping;
    // offset: 0048
    int SwimPhysicsWaterFrequency;
    // offset: 004C
    int SwimPhysicsWaterAmplitude;
    // offset: 0050
    int SwimPhysicsUnderDeceleration;
    // offset: 0054
    int SwimPhysicsUnderKickVelocity;
    // offset: 0058
    int SwimPhysicsUnderKickAccel;
    // offset: 005C
    int SwimPhysicsUnderVelocity;
    // offset: 0060
    int SwimPhysicsUnderKickDecel;
    // offset: 0064
    int SwimPhysicsUnderStealthAdjust;
    // offset: 0068
    int SwimPhysicsCoilVelocity;
    // offset: 006C
    int SwimPhysicsCoilDecelerationIn;
    // offset: 0070
    int SwimPhysicsCoilDecelerationOut;
    // offset: 0074
    int SwimPhysicsShotVelocity;
    // offset: 0078
    int SwimPhysicsShotAccelerationIn;
    // offset: 007C
    int SwimPhysicsShotAccelerationOut;
    // offset: 0080
    int SwimPhysicsSurfVelocity;
    // offset: 0084
    int SwimPhysicsSurfAccelerationIn;
    // offset: 0088
    int SwimPhysicsSurfAccelerationOut;
    // offset: 008C
    int SwimPhysicsSurfKickVelocity;
    // offset: 0090
    int SwimPhysicsSurfKickAccel;
    // offset: 0094
    int SwimPhysicsSurfMinRotation;
    // offset: 0098
    int SwimPhysicsSurfMaxRotation;
    // offset: 009C
    int SwimPhysicsSurfKickDecel;
} RazielData;

//static Player Raziel;
Player Raziel;

//static RazielData *PlayerData;
RazielData *PlayerData;

int ControlFlag;

EXTERN STATIC int PhysicsMode;

long RazielCommands[10];

EXTERN STATIC long *PadData;

void RAZIEL_DebugHurtRaziel();
void RAZIEL_DebugHealthSetScale(long healthScale);
void RAZIEL_DebugManaSetMax(long manaScale);
void RAZIEL_DebugHealthFillUp();
void RAZIEL_DebugManaFillUp();
void RAZIEL_ResetLookAround(Instance *instance);
void RAZIEL_SetLookAround(Instance *instance);
void RAZIEL_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker);
long RAZIEL_OkToLookAround(Instance *playerInstance);
void StateHandlerIdle(CharacterState *In, int CurrentSection, intptr_t Data);
void DefaultStateHandler(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerLookAround(CharacterState *In, int CurrentSection, intptr_t Data);
void SetTimer(int ticks);
void StateHandlerFall(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerMove(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerStopMove(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerAutoFace(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerCompression(CharacterState *In, int CurrentSection, intptr_t Data);
void DisableWristCollision(Instance *instance, int Side);

#endif

#ifndef _PLAYER_H_
#define _PLAYER_H_

#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/STATE.h"

// size: 0x54
typedef struct __SensoryData {
    // offset: 0000
    int Flags;
    // offset: 0004 (8 bytes)
    struct _SVector ForwardNormal;
    // offset: 000C (8 bytes)
    struct _SVector AboveNormal;
    // offset: 0014 (8 bytes)
    struct _SVector BelowNormal;
    // offset: 001C (8 bytes)
    struct _SVector BelowPoint;
    // offset: 0024 (8 bytes)
    struct _SVector Delta;
    // offset: 002C (668 bytes)
    struct _Instance *HitMonster;
    // offset: 0030 (668 bytes)
    struct _Instance *CurrentAutoFace;
    // offset: 0034 (668 bytes)
    struct _Instance *LastAutoFace;
    // offset: 0038 (668 bytes)
    struct _Instance *Portal;
    // offset: 003C (8 bytes)
    struct __EngagedInstance *EngagedList;
    // offset: 0040
    unsigned long EngagedMask;
    // offset: 0044 (12 bytes)
    struct _Vector lookAtPoint;
    // offset: 0050
    unsigned long heldClass;
} SensoryData;

// size: 0x20
typedef struct __ThrowItem {
    // offset: 0000
    unsigned char prepAnim;
    // offset: 0001
    unsigned char prepAnimFramesIn;
    // offset: 0002
    unsigned char prepAnimAlphaIn;
    // offset: 0003
    unsigned char coilAnim;
    // offset: 0004
    unsigned char coilAnimFramesIn;
    // offset: 0005
    unsigned char coilAnimAlphaIn;
    // offset: 0006
    unsigned char throwAnim;
    // offset: 0007
    unsigned char throwAnimFramesInFactor;
    // offset: 0008
    unsigned char throwFrameToLaunch;
    // offset: 0009
    unsigned char framesOut;
    // offset: 000A
    short launchPointX;
    // offset: 000C
    short launchPointY;
    // offset: 000E
    short launchPointZ;
    // offset: 0010
    short maxXRotation;
    // offset: 0012
    short minXRotation;
    // offset: 0014
    short maxZRotation;
    // offset: 0016
    short minZRotation;
    // offset: 0018
    short velocity;
    // offset: 001A
    short gravity;
    // offset: 001C
    short coilRot;
    // offset: 001E
    short selfAdjustingFlag;
} ThrowItem;

// size: 0x5B8
typedef struct __Player {
    // offset: 0000
    int footPrint;
    // offset: 0004 (860 bytes)
    struct __CharacterState State;
    // offset: 0360
    int Mode;
    // offset: 0364
    int Anim;
    // offset: 0368
    int RotationSegment;
    // offset: 036C (8 bytes)
    struct _SVector iVelocity;
    // offset: 0374
    int Magnitude;
    // offset: 0378
    int input;
    // offset: 037C
    int lastInput;
    // offset: 0380
    int ZDirection;
    // offset: 0384
    short Bearing;
    // offset: 0386
    short LastBearing;
    // offset: 0388
    int steeringMode;
    // offset: 038C
    short steeringVelocity;
    // offset: 038E
    short steeringAcceleration;
    // offset: 0390
    int steeringLockRotation;
    // offset: 0394
    short movementMinRate;
    // offset: 0396
    short movementMaxRate;
    // offset: 0398
    short movementMinAnalog;
    // offset: 039A
    short movementMaxAnalog;
    // offset: 039C (84 bytes)
    struct __SensoryData Senses;
    // offset: 03F0 (668 bytes)
    struct _Instance *attachedPlatform;
    // offset: 03F4
    short dropOffHeight;
    // offset: 03F6
    short fallZVelocity;
    // offset: 03F8
    short HealthScale;
    // offset: 03FA
    short HealthBalls;
    // offset: 03FC
    int HitPoints;
    // offset: 0400
    int DamageFrequency;
    // offset: 0404
    int invincibleTimer;
    // offset: 0408
    int Abilities;
    // offset: 040C (668 bytes)
    struct _Instance *GlyphSystem;
    // offset: 0410
    unsigned short GlyphManaBalls;
    // offset: 0412
    unsigned short GlyphManaMax;
    // offset: 0414 (4 bytes)
    struct __FitPoint *constrictData;
    // offset: 0418
    short constrictIndex;
    // offset: 041A
    short constrictWaitIndex;
    // offset: 041C (8 bytes)
    struct _SVector constrictCenter;
    // offset: 0424
    short constrictFlag;
    // offset: 0426
    short constrictGoodCircle;
    // offset: 0428
    unsigned long constrictXTotal;
    // offset: 042C
    unsigned long constrictYTotal;
    // offset: 0430 (668 bytes)
    struct _Instance *soulReaver;
    // offset: 0434
    unsigned long currentSoulReaver;
    // offset: 0438
    int CurrentPlane;
    // offset: 043C
    int slipSlope;
    // offset: 0440
    unsigned long idleCount;
    // offset: 0444 (668 bytes)
    struct _Instance *idleInstance;
    // offset: 0448 (36 bytes)
    struct __AttackItem *attack;
    // offset: 044C
    int attackFlags;
    // offset: 0450
    int currentAttack;
    // offset: 0454 (668 bytes)
    struct _Instance *attackCurrentHit;
    // offset: 0458 (668 bytes)
    struct _Instance *attackLastHit;
    // offset: 045C (44 bytes)
    struct _FXGlowEffect *glowEffect;
    // offset: 0460 (668 bytes)
    struct _Instance *attackedBy;
    // offset: 0464 (32 bytes)
    struct __ThrowItem *throwData;
    // offset: 0468
    int throwMode;
    // offset: 046C (6 bytes)
    struct _Position throwTarget;
    // offset: 0474 (668 bytes)
    struct _Instance *throwInstance;
    // offset: 0478
    short throwXRot;
    // offset: 047A
    short throwZRot;
    // offset: 047C
    int throwReturnRot;
    // offset: 0480 (136 bytes)
    struct __MessageQueue padCommands;
    // offset: 0508
    void (*returnState)();
    // offset: 050C
    unsigned long passedMask;
    // offset: 0510 (6 bytes)
    struct _G2SVector3_Type extraRot;
    // offset: 0518
    long blankPad;
    // offset: 051C
    int effectsFlags;
    // offset: 0520
    short effectsFadeSource;
    // offset: 0522
    short effectsFadeDest;
    // offset: 0524
    int effectsFadeStep;
    // offset: 0528
    int effectsFadeSteps;
    // offset: 052C
    short autoFaceZone;
    // offset: 052E
    short autoFaceAngle;
    // offset: 0530
    int autoFaceLastRootAngle;
    // offset: 0534
    int autoFaceRootAngle;
    // offset: 0538
    int autoFaceTrueAngle;
    // offset: 053C
    int autoFaceAnim;
    // offset: 0540
    int autoFaceLastAnim;
    // offset: 0544
    int nothingCounter;
    // offset: 0548
    int timeAccumulator;
    // offset: 054C (6 bytes)
    struct _Position puppetMoveToPoint;
    // offset: 0552 (6 bytes)
    struct _Position puppetRotToPoint;
    // offset: 0558
    int soundModifier;
    // offset: 055C
    short alarmTable;
    // offset: 055E
    short terminator;
    // offset: 0560
    short swimSpeedAdjustment;
    // offset: 0562
    short swimTargetSpeed;
    // offset: 0564
    unsigned long soundHandle;
    // offset: 0568
    long soundTimer;
    // offset: 056C
    long soundTotalTime;
    // offset: 0570
    unsigned long soundDistance;
    // offset: 0574
    short soundStartPitch;
    // offset: 0576
    short soundEndPitch;
    // offset: 0578
    short soundStartVolume;
    // offset: 057A
    short soundEndVolume;
    // offset: 057C
    unsigned long soundHandle2;
    // offset: 0580
    long soundTimer2;
    // offset: 0584
    long soundTotalTime2;
    // offset: 0588
    unsigned long soundDistance2;
    // offset: 058C
    short soundStartPitch2;
    // offset: 058E
    short soundEndPitch2;
    // offset: 0590
    short soundStartVolume2;
    // offset: 0592
    short soundEndVolume2;
    // offset: 0594
    long soundTimerNext;
    // offset: 0598
    unsigned long soundTimerData;
    // offset: 059C
    unsigned long forcedGlideSpeed;
    // offset: 05A0 (8 bytes)
    struct _SVector collisionEdgeOffset;
    // offset: 05A8 (16 bytes)
    struct __SAnim *currentSAnim;
    // offset: 05AC
    unsigned long playerEvent;
    // offset: 05B0
    unsigned long playerEventHistory;
    // offset: 05B4
    int currentHint;
} Player;

void PLAYER_ReSetLookAround(Instance *instance);
void PLAYER_SetLookAround(Instance *instance);
long PLAYER_OkToLookAround(Instance *instance);
void PLAYER_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker);

#endif

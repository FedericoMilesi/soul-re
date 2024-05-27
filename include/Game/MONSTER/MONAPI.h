#ifndef _MONAPI_H_
#define _MONAPI_H_

#include "common.h"
#include "Game/GAMELOOP.h"

typedef enum MonsterState {
    MONSTER_STATE_BIRTH = 0,
    MONSTER_STATE_PURSUE = 1,
    MONSTER_STATE_IDLE = 2,
    MONSTER_STATE_MISSILEHIT = 3,
    MONSTER_STATE_FALL = 4,
    MONSTER_STATE_WANDER = 5,
    MONSTER_STATE_ATTACK = 6,
    MONSTER_STATE_IMPALEDEATH = 7,
    MONSTER_STATE_HIT = 8,
    MONSTER_STATE_STUNNED = 9,
    MONSTER_STATE_GRABBED = 10,
    MONSTER_STATE_THROWN = 11,
    MONSTER_STATE_IMPACT = 12,
    MONSTER_STATE_COMBAT = 13,
    MONSTER_STATE_BREAKHOLD = 14,
    MONSTER_STATE_LANDONFEET = 15,
    MONSTER_STATE_GENERALDEATH = 16,
    MONSTER_STATE_ENVIRONMENTDAMAGE = 17,
    MONSTER_STATE_LANDINWATER = 18,
    MONSTER_STATE_FLEE = 19,
    MONSTER_STATE_HIDE = 20,
    MONSTER_STATE_SURPRISEATTACK = 21,
    MONSTER_STATE_PARRY = 22,
    MONSTER_STATE_DEAD = 23,
    MONSTER_STATE_SURPRISED = 24,
    MONSTER_STATE_NOTICE = 25,
    MONSTER_STATE_PUPATE = 26,
    MONSTER_STATE_EMBRACE = 27,
    MONSTER_STATE_PROJECTILE = 28,
    MONSTER_STATE_TERRAINIMPALEDEATH = 29,
    MONSTER_STATE_PETRIFIED = 30,
    MONSTER_NUM_STATES = 31,
} MonsterState;

typedef enum MonsterAnim {
    MONSTER_ANIM_HIT1 = 0,
    MONSTER_ANIM_HIT2 = 1,
    MONSTER_ANIM_WALK = 2,
    MONSTER_ANIM_RUN = 3,
    MONSTER_ANIM_GRABBED = 4,
    MONSTER_ANIM_STUNNED = 5,
    MONSTER_ANIM_JUMPFORWARD = 6,
    MONSTER_ANIM_JUMPBACK = 7,
    MONSTER_ANIM_JUMPLEFT = 8,
    MONSTER_ANIM_JUMPRIGHT = 9,
    MONSTER_ANIM_STANCE_HEALTHY = 10,
    MONSTER_ANIM_STANCE_VULNERABLE = 11,
    MONSTER_ANIM_STUNNED_RECOVERY = 12,
    MONSTER_ANIM_IMPALED = 13,
    MONSTER_ANIM_STRUGGLE = 14,
    MONSTER_ANIM_BREAKHOLD = 15,
    MONSTER_ANIM_THROWN = 16,
    MONSTER_ANIM_IMPACT = 17,
    MONSTER_ANIM_LANDONFEET = 18,
    MONSTER_ANIM_FALL = 19,
    MONSTER_ANIM_BREAKFALL = 20,
    MONSTER_ANIM_SPINLAND = 21,
    MONSTER_ANIM_IMPALEDEATH = 22,
    MONSTER_ANIM_GETUP = 23,
    MONSTER_ANIM_GENERALDEATH = 24,
    MONSTER_ANIM_MISSILEIMPALEDEATH = 25,
    MONSTER_ANIM_SURPRISED = 26,
    MONSTER_ANIM_AGONY = 27,
    MONSTER_ANIM_PUPATE = 28,
    MONSTER_ANIM_NOTICE = 29,
    MONSTER_ANIM_SOULSUCK = 30,
    MONSTER_ANIM_IMPALEHORZ = 31,
    MONSTER_ANIM_IMPALEVERT = 32,
    MONSTER_ANIM_SOULOUTGRND = 33,
    MONSTER_ANIM_SOULOUTHORZ = 34,
    MONSTER_ANIM_SOULOUTVERT = 35,
    MONSTER_ANIM_FALLOVER = 36,
    MONSTER_ANIM_EMBRACE = 37,
    MONSTER_ANIM_SHOVE = 38,
    MONSTER_ANIM_FLIPSWITCH = 39,
    MONSTER_ANIM_EVADELEFT = 40,
    MONSTER_ANIM_EVADERIGHT = 41,
    MONSTER_ANIM_ALARM = 42,
    MONSTER_ANIM_DEAF = 43,
    MONSTER_ANIM_BLIND = 44,
    MONSTER_ANIM_SUCKED = 45,
    MONSTER_NUM_ANIMS = 46,
} MonsterAnim;

// size: 0x24
typedef struct _MonsterIR {
    // offset: 0000 (36 bytes)
    struct _MonsterIR *next;
    // offset: 0004 (668 bytes)
    struct _Instance *instance;
    // offset: 0008
    long handle;
    // offset: 000C (8 bytes)
    struct _SVector relativePosition;
    // offset: 0014
    short distance;
    // offset: 0016
    unsigned short mirFlags;
    // offset: 0018
    unsigned short mirConditions;
    // offset: 001C
    unsigned long forgetTimer;
    // offset: 0020
    unsigned long idleTime;
} MonsterIR;

// size: 0x2E
typedef struct _MonsterCombatAttributes {
    // offset: 0000
    short stunTime;
    // offset: 0002
    short damageTime;
    // offset: 0004
    short recovery;
    // offset: 0006
    short surpriseTime;
    // offset: 0008
    short grabTime;
    // offset: 000A
    short combatRange;
    // offset: 000C
    short surpriseRange;
    // offset: 000E
    short allyRange;
    // offset: 0010
    short enemyAttackRange;
    // offset: 0012
    short enemyRunAttackRange;
    // offset: 0014
    short preferredCombatRange;
    // offset: 0016
    short suckPower;
    // offset: 0018
    short suckRange;
    // offset: 001A
    short suckTime;
    // offset: 001C
    char hitPoints;
    // offset: 001D
    char numAttacks;
    // offset: 001E
    char missileAttack;
    // offset: 001F
    char ambushAttack;
    // offset: 0020 (12 bytes)
    char evadeProbability[12];
    // offset: 002C (1 bytes)
    char attackList[1];
} MonsterCombatAttributes;

// size: 0x10
typedef struct _MonsterAllegiances {
    // offset: 0000
    unsigned long enemies;
    // offset: 0004
    unsigned long allies;
    // offset: 0008
    unsigned long food;
    // offset: 000C
    unsigned long gods;
} MonsterAllegiances;

// size: 0x54
typedef struct _MonsterSubAttributes {
    // offset: 0000
    char *animList;
    // offset: 0004 (18 bytes)
    struct _MonsterSenses *senses;
    // offset: 0008 (46 bytes)
    struct _MonsterCombatAttributes *combatAttributes;
    // offset: 000C (16 bytes)
    struct _MonsterAllegiances *allegiances;
    // offset: 0010
    char *behaviorList;
    // offset: 0014
    short scale;
    // offset: 0016
    short fallDistance;
    // offset: 0018
    short defAmbushRange;
    // offset: 001A
    short fleeRange;
    // offset: 001C
    short speedPivotTurn;
    // offset: 001E
    short speedWalkTurn;
    // offset: 0020
    short speedRunTurn;
    // offset: 0022
    short speedFleeTurn;
    // offset: 0024
    short forgetTime;
    // offset: 0026
    unsigned char modelNum;
    // offset: 0027
    unsigned char physAbility;
    // offset: 0028
    unsigned char stunnable;
    // offset: 0029
    unsigned char grabable;
    // offset: 002A
    unsigned char numSections;
    // offset: 002B (3 bytes)
    unsigned char sectionEnd[3];
    // offset: 002E
    short defPlayerAttitude;
    // offset: 0030
    short defWanderRange;
    // offset: 0032
    short defGuardRange;
    // offset: 0034
    unsigned char defInitialBehavior;
    // offset: 0035
    unsigned char defTriggeredBehavior;
    // offset: 0036
    char defActiveBehavior;
    // offset: 0037
    unsigned char defSpectral;
    // offset: 0038
    unsigned char sunVuln;
    // offset: 0039
    unsigned char fireVuln;
    // offset: 003A
    unsigned char waterVuln;
    // offset: 003B
    unsigned char impaleVuln;
    // offset: 003C
    unsigned char soundVuln;
    // offset: 003D
    unsigned char weaponVuln;
    // offset: 003E
    unsigned char missileVuln;
    // offset: 003F
    unsigned char bruiseRed;
    // offset: 0040
    unsigned char bruiseGreen;
    // offset: 0041
    unsigned char bruiseBlue;
    // offset: 0042
    short minSpikeRange;
    // offset: 0044
    short maxSpikeRange;
    // offset: 0046
    short maxSpikeAngle;
    // offset: 0048
    short minSpikeHorzSpeed;
    // offset: 004A
    short maxSpikeHorzSpeed;
    // offset: 004C
    short maxSpikeVertSpeed;
    // offset: 004E
    short upOnGroundOffset;
    // offset: 0050
    short downOnGroundOffset;
} MonsterSubAttributes;

// size: 0x50
typedef struct _MonsterAttributes {
    // offset: 0000
    unsigned long magicnum;
    // offset: 0004
    void *tunData;
    // offset: 0008
    char *auxAnimList;
    // offset: 000C
    char *ambientAnimList;
    // offset: 0010
    long whatAmI;
    // offset: 0014
    char numAuxAnims;
    // offset: 0015
    char numAmbientAnims;
    // offset: 0016
    unsigned char defaultAge;
    // offset: 0017
    char pupateObject;
    // offset: 0018
    unsigned char damageFXSegment;
    // offset: 0019
    unsigned char headSegment;
    // offset: 001A
    unsigned char neckSegment;
    // offset: 001B
    unsigned char leftShoulderSegment;
    // offset: 001C
    unsigned char rightShoulderSegment;
    // offset: 001D
    unsigned char waistSegment;
    // offset: 001E
    unsigned char leftKneeSegment;
    // offset: 001F
    unsigned char rightKneeSegment;
    // offset: 0020
    unsigned char leftFootSegment;
    // offset: 0021
    unsigned char rightFootSegment;
    // offset: 0022
    unsigned char spineSegment;
    // offset: 0023
    unsigned char leftWeaponSegment;
    // offset: 0024
    unsigned char rightWeaponSegment;
    // offset: 0025
    unsigned char grabSegment;
    // offset: 0026
    unsigned char bloodImpaleFrame;
    // offset: 0027
    unsigned char bloodConeFrame;
    // offset: 0028
    char numSubAttributes;
    // offset: 0029
    char numCombatAttributes;
    // offset: 002A
    char numAttackAttributes;
    // offset: 002B
    char numMissiles;
    // offset: 002C
    char numAnims;
    // offset: 002D
    char numIdles;
    // offset: 002E
    char numBehaviors;
    // offset: 002F
    char numShatters;
    // offset: 0030 (84 bytes)
    struct _MonsterSubAttributes **subAttributesList;
    // offset: 0034 (46 bytes)
    struct _MonsterCombatAttributes **combatAttributesList;
    // offset: 0038 (32 bytes)
    struct _MonsterAttackAttributes *attackAttributesList;
    // offset: 003C (16 bytes)
    struct _MonsterMissile *missileList;
    // offset: 0040 (16 bytes)
    struct _MonsterAnim *animList;
    // offset: 0044 (4 bytes)
    struct _MonsterIdle *idleList;
    // offset: 0048 (8 bytes)
    struct _MonsterBehavior *behaviorList;
    // offset: 004C
    void *shatterList;
} MonsterAttributes;

// size: 0x1AC
typedef struct _MonsterVars {
    // offset: 0000
    unsigned long mvFlags;
    // offset: 0004
    unsigned long auxFlags;
    // offset: 0008 (136 bytes)
    struct __MessageQueue messageQueue;
    // offset: 0090
    struct _MonsterIR *monsterIRList;
    // offset: 0094 (36 bytes)
    struct _G2AnimInterpInfo_Type interpInfo[3];
    // offset: 00B8 (32 bytes)
    struct _MonsterAttackAttributes *attackType;
    // offset: 00BC (16 bytes)
    struct _MonsterAnim *anim;
    // offset: 00C0
    void *messageData;
    // offset: 00C4
    struct _MonsterIR *enemy;
    // offset: 00C8
    struct _MonsterIR *leader;
    // offset: 00CC
    struct _MonsterIR *ally;
    // offset: 00D0 (668 bytes)
    struct _Instance *held;
    // offset: 00D4
    long heldID;
    // offset: 00D8
    long soulID;
    // offset: 00DC
    void *effect;
    // offset: 00E0
    unsigned long radarMap;
    // offset: 00E4
    unsigned long radarCounter;
    // offset: 00E8 (32 bytes)
    short radarDistance[16];
    // offset: 0108
    unsigned long mode;
    // offset: 010C
    unsigned long damageTimer;
    // offset: 0110
    unsigned long stunTimer;
    // offset: 0114
    unsigned long generalTimer;
    // offset: 0118
    unsigned long generalTimer2;
    // offset: 011C
    unsigned long effectTimer;
    // offset: 0120 (6 bytes)
    struct _Position *lookAtPos;
    // offset: 0124 (6 bytes)
    struct _Position destination;
    // offset: 012A
    short speed;
    // offset: 012C (6 bytes)
    struct _Position lastValidPos;
    // offset: 0132 (6 bytes)
    struct _Position lookAtPosData;
    // offset: 0138
    short fleeMarker;
    // offset: 013A
    short wanderRange;
    // offset: 013C
    short guardRange;
    // offset: 013E
    short ambushRange;
    // offset: 0140
    short ambushArc;
    // offset: 0142
    short ambushElevation;
    // offset: 0144
    short hitPoints;
    // offset: 0146
    short maxHitPoints;
    // offset: 0148
    short soulJuice;
    // offset: 014A
    short regenTime;
    // offset: 014C
    short mainColorVertex;
    // offset: 014E
    short lookAngleX;
    // offset: 0150
    short lookAngleZ;
    // offset: 0152
    unsigned short avoidMask;
    // offset: 0154
    unsigned short damageType;
    // offset: 0156
    char ambushMarker;
    // offset: 0157
    char ambushJumpType;
    // offset: 0158
    unsigned char causeOfDeath;
    // offset: 0159
    char previousMainState;
    // offset: 015A
    unsigned char behaviorState;
    // offset: 015B
    unsigned char initialBehavior;
    // offset: 015C
    unsigned char triggeredBehavior;
    // offset: 015D
    char activeBehavior;
    // offset: 015E
    unsigned char age;
    // offset: 015F
    char attackState;
    // offset: 0160
    unsigned char ambient;
    // offset: 0161
    char alertness;
    // offset: 0162
    char alertCount;
    // offset: 0163
    char senseIndex;
    // offset: 0164
    char lastSideMove;
    // offset: 0165
    char chance;
    // offset: 0166
    char pathSlotID;
    // offset: 0168 (84 bytes)
    struct _MonsterSubAttributes *subAttr;
    // offset: 016C
    struct _MonsterIR *freeIRs;
    // offset: 0170
    void *extraVars;
    // offset: 0174 (20 bytes)
    short validUnits[10];
    // offset: 0188 (24 bytes)
    short patrolMarkers[12];
    // offset: 01A0
    short *currentMarker;
    // offset: 01A4
    long terrainImpaleID;
    // offset: 01A8
    short targetFade;
    // offset: 01AA
    short fadeRate;
} MonsterVars;

// size: 0x8
typedef struct _MONAPI_Regenerator {
    // offset: 0000
    unsigned long regenTime;
    // offset: 0004
    short introUniqueID;
    // offset: 0006
    short streamUnitID;
} MONAPI_Regenerator;

void MonsterProcess(Instance *instance, GameTracker *gameTracker);
unsigned long MonsterQuery(Instance *instance, unsigned long query);
void MONAPI_ResetLookAround(Instance *instance);
void MONAPI_SetLookAround(Instance *instance);
long MONAPI_OkToLookAround(Instance *instance);
void MONAPI_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker);

#endif

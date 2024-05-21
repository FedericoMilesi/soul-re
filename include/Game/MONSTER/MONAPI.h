#ifndef _MONAPI_H_
#define _MONAPI_H_

#include "Game/TYPES.h"
#include "Game/STATE.h"
#include "Game/G2/ANIMG2.h"

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

#endif

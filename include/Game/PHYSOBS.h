#ifndef _PHYSOBS_H_
#define _PHYSOBS_H_

#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/STATE.h"

// size: 0x8
typedef struct PhysObSplinter {
    // offset: 0000
    long numSplintData;
    // offset: 0004
    void *splinterData;
} PhysObSplinter;

// size: 0x8
typedef struct PhysObProperties {
    // offset: 0000
    unsigned short version;
    // offset: 0002
    unsigned short family;
    // offset: 0004
    unsigned short ID;
    // offset: 0006
    unsigned short Type;
} PhysObProperties;

// size: 0x1C
typedef struct PhysObWeaponAttributes {
    // offset: 0000
    long Damage;
    // offset: 0004
    long AltDamage;
    // offset: 0008
    short knockBackDistance;
    // offset: 000A
    char knockBackFrames;
    // offset: 000B
    char dropSound;
    // offset: 000C
    char Class;
    // offset: 000D
    char ThrowSphere;
    // offset: 000E
    char LeftHandSphere;
    // offset: 000F
    char RightHandSphere;
    // offset: 0010
    struct _PhysObLight *Light;
    // offset: 0014 (8 bytes)
    struct PhysObSplinter splinter;
} PhysObWeaponAttributes;

// size: 0x24
typedef struct PhysObWeaponProperties {
    // offset: 0000 (8 bytes)
    struct PhysObProperties Properties;
    // offset: 0008 (28 bytes)
    struct PhysObWeaponAttributes WeaponAttributes;
} PhysObWeaponProperties;

// size: 0x2C
typedef struct PhysObInteractProperties {
    // offset: 0000 (8 bytes)
    struct PhysObProperties Properties;
    // offset: 0008
    unsigned short conditions;
    // offset: 000A
    unsigned short auxConditions;
    // offset: 000C
    unsigned short action;
    // offset: 000E
    unsigned short auxAction;
    // offset: 0010
    unsigned char startAnim;
    // offset: 0011
    unsigned char endAnim;
    // offset: 0012
    unsigned char razielAnim;
    // offset: 0013
    unsigned char razielAuxAnim;
    // offset: 0014
    unsigned char frame;
    // offset: 0015
    unsigned char startAnimMode;
    // offset: 0016
    unsigned short distance;
    // offset: 0018
    unsigned short newType;
    // offset: 001A
    unsigned short newClass;
    // offset: 001C
    unsigned short mode;
    // offset: 001E
    unsigned short engageXYDistance;
    // offset: 0020
    short engageZMinDelta;
    // offset: 0022
    short engageZMaxDelta;
    // offset: 0024
    unsigned char engageYCone;
    // offset: 0025
    unsigned char engageZCone;
    // offset: 0026
    unsigned short pad;
    // offset: 0028 (28 bytes)
    struct PhysObWeaponAttributes *weapon;
} PhysObInteractProperties;

// size: 0x48
typedef struct PhysObData {
    // offset: 0000
    long Mode;
    // offset: 0004
    short xForce;
    // offset: 0006
    short yForce;
    // offset: 0008 (668 bytes)
    struct _Instance *Force;
    // offset: 000C
    short LinkNode;
    // offset: 000E
    short px;
    // offset: 0010
    short py;
    // offset: 0012
    short pz;
    // offset: 0014
    short rx1;
    // offset: 0016
    short ry1;
    // offset: 0018
    short rz1;
    // offset: 001A
    short Segment1;
    // offset: 001C
    short rx2;
    // offset: 001E
    short ry2;
    // offset: 0020
    short rz2;
    // offset: 0022
    short Segment2;
    // offset: 0024
    short Steps;
    // offset: 0026
    short Step;
    // offset: 0028
    short PathNumber;
    // offset: 002A
    short Pad1;
    // offset: 002C (24 bytes)
    struct _HInfo *RightCollision;
    // offset: 0030 (24 bytes)
    struct _HInfo *LeftCollision;
    // offset: 0034
    short burnAmpl;
    // offset: 0036
    short throwFlags;
    // offset: 0038
    short initialXRot;
    // offset: 003A
    short xRotVel;
    // offset: 003C
    short yRotVel;
    // offset: 003E
    short zRotVel;
    // offset: 0040 (668 bytes)
    struct _Instance *throwingInstance;
    // offset: 0044
    int physObTimer;
} PhysObData;

// size: 0x8
typedef struct LightTableEntry {
    // offset: 0000
    short r;
    // offset: 0002
    short g;
    // offset: 0004
    short b;
    // offset: 0006
    short radius;
} LightTableEntry;

// size: 0x8
typedef struct _PhysObLight {
    // offset: 0000
    unsigned char length;
    // offset: 0001
    unsigned char segment;
    // offset: 0002
    short speed;
    // offset: 0004 (8 bytes)
    struct LightTableEntry *lightTable;
} PhysObLight;

// size: 0xC
typedef struct __PhysObProjectileData {
    // offset: 0000
    char model;
    // offset: 0001
    char startAnim;
    // offset: 0002
    char loopAnim;
    // offset: 0003
    char endAnim;
    // offset: 0004
    long flags;
    // offset: 0008 (28 bytes)
    struct PhysObWeaponAttributes *weapon;
} PhysObProjectileData;

// size: 0x10
typedef struct __PhysObProjectileProperties {
    // offset: 0000 (8 bytes)
    struct PhysObProperties Properties;
    // offset: 0008
    long totalProjectiles;
    // offset: 000C (12 bytes)
    struct __PhysObProjectileData *data;
} PhysObProjectileProperties;

evObjectBirthProjectileData *PHYSOB_BirthProjectile(Instance *parent, int joint, int type);
void CollidePhysicalObject(Instance *instance, GameTracker *gameTracker);
void ProcessPhysicalObject(Instance *instance, GameTracker *gameTracker);
void PhysicalObjectPost(Instance *instance, unsigned long Message, unsigned long Data);
void TurnOffCollisionPhysOb(Instance *instance, int coll);
void TurnOnCollisionPhysOb(Instance *instance, int coll);
Instance *PHYSOB_BirthCollectible(Instance *parent, int x, int y, int z, int type, int lifeTime);
int CheckPhysOb(Instance *instance);
int CheckPhysObFamily(Instance *instance, unsigned short family);
void PHYSOB_NormalToAxis(short *x, short *y);
int PHYSOB_CheckSlide2(Instance *instance, int x, int y, evPhysicsSlideData **data);
int PHYSOB_CheckDroppedLineCollision(Instance *instance, Instance *parent);
int PHYSOB_ReAlignFalling(Instance *instance, int zEndOff);
int CheckPhysObAbility(Instance *instance, unsigned short ability);
void ResetOrientation(Instance *instance);
void PhysOb_AlignPush(Instance *instance, int x, int y, int path, PhysObData *Data);
Instance *PHYSOBS_IsAPushBlockAttached(Instance *block);
int PHYSOB_CheckDirectedLineCollision(Instance *instance, int xoffset, int yoffset, int startZOffset);
void FinishPush(Instance *instance);
PhysObWeaponAttributes *PhysObGetWeapon(Instance *instance);

#endif

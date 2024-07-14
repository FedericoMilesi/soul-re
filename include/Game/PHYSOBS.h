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

evObjectBirthProjectileData *PHYSOB_BirthProjectile(Instance *parent, int joint, int type);
void CollidePhysicalObject(Instance *instance, GameTracker *gameTracker);
void ProcessPhysicalObject(Instance *instance, GameTracker *gameTracker);
void PhysicalObjectPost(Instance *instance, unsigned long Message, unsigned long Data);
void TurnOffCollisionPhysOb(Instance *instance, int coll);
void TurnOnCollisionPhysOb(Instance *instance, int coll);
Instance *PHYSOB_BirthCollectible(Instance *parent, int x, int y, int z, int type, int lifeTime);
int CheckPhysOb(Instance *instance);
int CheckPhysObFamily(Instance *instance, unsigned short family);

#endif

#ifndef _PHYSOBS_H_
#define _PHYSOBS_H_

#include "common.h"
#include "Game/GAMELOOP.h"

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

// size: 0x10
typedef struct evObjectBirthProjectileData {
    // offset: 0000 (668 bytes)
    struct _Instance *instance;
    // offset: 0004
    int joint;
    // offset: 0008
    int type;
    // offset: 000C (668 bytes)
    struct _Instance *birthInstance;
} evObjectBirthProjectileData;

evObjectBirthProjectileData *PHYSOB_BirthProjectile(Instance *parent, int joint, int type);
void CollidePhysicalObject(Instance *instance, GameTracker *gameTracker);
void ProcessPhysicalObject(Instance *instance, GameTracker *gameTracker);

#endif

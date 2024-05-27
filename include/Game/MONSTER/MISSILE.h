#ifndef _MISSILE_H_
#define _MISSILE_H_

// size: 0x10
typedef struct _MonsterMissile {
    // offset: 0000
    unsigned short speed;
    // offset: 0002
    unsigned short range;
    // offset: 0004
    unsigned char frame;
    // offset: 0005
    unsigned char anim;
    // offset: 0006
    unsigned char segment;
    // offset: 0007
    unsigned char damage;
    // offset: 0008
    unsigned char type;
    // offset: 0009
    unsigned char graphic;
    // offset: 000A
    char gravity;
    // offset: 000B
    char reload;
    // offset: 000C
    char fireChance;
    // offset: 000D
    unsigned char numAnims;
    // offset: 000E (2 bytes)
    char animList[2];
} MonsterMissile;

Instance *MISSILE_Fire(Instance *instance, MonsterMissile *missiledef, void *target, int type);
Instance *MISSILE_FireAtInstance(Instance *instance, MonsterMissile *missiledef, Instance *target);

#endif

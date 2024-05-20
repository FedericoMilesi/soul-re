#ifndef _PHYSOBS_H_
#define _PHYSOBS_H_

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

#endif

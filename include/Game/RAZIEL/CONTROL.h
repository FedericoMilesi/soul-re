#ifndef CONTROL_H_
#define CONTROL_H_

#include "common.h"

// size: 0x14
typedef struct __Force {
	// offset: 0000
	int Type;
	// offset: 0004 (12 bytes)
	struct _Vector LinearForce;
	// offset: 0010
	short Friction;
} Force;

void SetExternalForce(Force *In, short x, short y, short z, int Space, int Friction);

#endif

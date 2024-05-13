#include "TYPES.h"
#include "LIST.h"

// size: 0x10
struct TextureMT3 {
	// offset: 0000
	unsigned char u0;
	// offset: 0001
	unsigned char v0;
	// offset: 0002
	unsigned short clut;
	// offset: 0004
	unsigned char u1;
	// offset: 0005
	unsigned char v1;
	// offset: 0006
	unsigned short tpage;
	// offset: 0008
	unsigned char u2;
	// offset: 0009
	unsigned char v2;
	// offset: 000A
	char pad1;
	// offset: 000B
	char sortPush;
	// offset: 000C
	long color;
};

// size: 0x2C
struct _FX_MATRIX {
	// offset: 0000 (8 bytes)
	struct NodeType node;
	// offset: 0008
	long flags;
	// offset: 000C (32 bytes)
	struct MATRIX lwTransform;
};

// size: 0x68
struct _FX_PRIM {
	// offset: 0000 (8 bytes)
	struct NodeType node;
	// offset: 0008 (16 bytes)
	struct TextureMT3 *texture;
	// offset: 000C
	long flags;
	// offset: 0010
	short timeToLive;
	// offset: 0012
	short curFrame;
	// offset: 0014
	void *process;
	// offset: 0018 (44 bytes)
	struct _FX_MATRIX *matrix;
	// offset: 001C
	long color;
	// offset: 0020
	long startColor;
	// offset: 0024
	long endColor;
	// offset: 0028
	short colorFadeValue;
	// offset: 002A
	short colorFadeStep;
	// offset: 002C (6 bytes)
	struct _Position position;
	// offset: 0032
	short fadeStep;
	// offset: 0034 (8 bytes)
	short fadeValue[4];
	// offset: 003C (6 bytes)
	struct _Position v0;
	// offset: 0042
	short work0;
	// offset: 0044 (6 bytes)
	struct _Position v1;
	// offset: 004A
	short work1;
	// offset: 004C (6 bytes)
	struct _Position v2;
	// offset: 0052
	short work2;
	// offset: 0054 (6 bytes)
	struct _Position v3;
	// offset: 005A
	short work3;
	// offset: 005C (12 bytes)
	// size: 0xC
	union {
		// offset: 0000 (8 bytes)
		// size: 0x8
        struct {
        	// offset: 0000 (668 bytes)
        	struct _Instance *parent;
        	// offset: 0004
        	long segment;
        } flame;
		// offset: 0000 (12 bytes)
		// size: 0xC
        struct {
        	// offset: 0000
        	short xVel;
        	// offset: 0002
        	short yVel;
        	// offset: 0004
        	short zVel;
        	// offset: 0006
        	short xAccl;
        	// offset: 0008
        	short yAccl;
        	// offset: 000A
        	short zAccl;
        } phys;
	} duo;
};

// size: 0x6DA8
struct _FXTracker {
	// offset: 0000 (1408 bytes)
	struct _FX_MATRIX matrixPool[32];
	// offset: 0580 (8 bytes)
	struct NodeType usedMatrixList;
	// offset: 0588 (8 bytes)
	struct NodeType freeMatrixList;
	// offset: 0590 (26624 bytes)
	struct _FX_PRIM primPool[256];
	// offset: 6D90 (8 bytes)
	struct NodeType usedPrimList;
	// offset: 6D98 (8 bytes)
	struct NodeType usedPrimListSprite;
	// offset: 6DA0 (8 bytes)
	struct NodeType freePrimList;
};

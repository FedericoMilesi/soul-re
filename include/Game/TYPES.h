#ifndef _TYPES_H_
#define _TYPES_H_

// size: 0x6
struct _Position {
	// offset: 0000
	short x;
	// offset: 0002
	short y;
	// offset: 0004
	short z;
};

// size: 0x20
struct MATRIX {
	// offset: 0000 (18 bytes)
	short m[3][3];
	// offset: 0014 (12 bytes)
	long t[3];
};

// size: 0x8
struct SVECTOR {
	// offset: 0000
	short vx;
	// offset: 0002
	short vy;
	// offset: 0004
	short vz;
	// offset: 0006
	short pad;
};

// size: 0x8
struct _SVector {
	// offset: 0000
	short x;
	// offset: 0002
	short y;
	// offset: 0004
	short z;
	// offset: 0006
	short pad;
};

// size: 0x4
struct DVECTOR {
	// offset: 0000
	short vx;
	// offset: 0002
	short vy;
};

// size: 0x8
struct _Rotation {
	// offset: 0000
	short x;
	// offset: 0002
	short y;
	// offset: 0004
	short z;
	// offset: 0006
	short pad;
};

// size: 0x4
struct CVECTOR {
	// offset: 0000
	unsigned char r;
	// offset: 0001
	unsigned char g;
	// offset: 0002
	unsigned char b;
	// offset: 0003
	unsigned char cd;
};

// size: 0xC
struct _Triangle2D {
	// offset: 0000
	short x0;
	// offset: 0002
	short y0;
	// offset: 0004
	short x1;
	// offset: 0006
	short y1;
	// offset: 0008
	short x2;
	// offset: 000A
	short y2;
};

#endif

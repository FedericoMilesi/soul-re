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

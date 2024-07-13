#ifndef _ANMDECMP_H_
#define _ANMDECMP_H_

// size: 0x4
typedef struct _G2AnimChanStatus_Type {
	// offset: 0000
	short keyData;
	// offset: 0002
	short index;
} G2AnimChanStatus;

// size: 0x10
typedef struct _G2AnimDecompressChannelInfo_Type {
	// offset: 0000 (20 bytes)
	struct _G2AnimKeylist_Type *keylist;
	// offset: 0004
	unsigned short *chanData;
	// offset: 0008
	int storedKey;
	// offset: 000C
	int targetKey;
} G2AnimDecompressChannelInfo;

#endif

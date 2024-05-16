#ifndef _MEMPACK_H_
#define _MEMPACK_H_

// size: 0x8
struct MemHeader {
	// offset: 0000
	unsigned short magicNumber;
	// offset: 0002
	unsigned char memStatus;
	// offset: 0003
	unsigned char memType;
	// offset: 0004
	unsigned long memSize;
};

#endif

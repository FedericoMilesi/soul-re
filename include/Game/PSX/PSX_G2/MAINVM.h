#ifndef _MAINVM_H_
#define _MAINVM_H_

// size: 0x8
typedef struct _G2AppDataVM_Type {
	// offset: 0000
	int argc;
	// offset: 0004
	int *argv;
} G2AppDataVM;

#endif

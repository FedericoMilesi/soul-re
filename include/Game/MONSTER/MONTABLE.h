#ifndef _MONTABLE_H_
#define _MONTABLE_H_

// size: 0x20
typedef struct _MonsterFunctionTable {
	// offset: 0000
	void (*initFunc)();
	// offset: 0004
	void (*cleanUpFunc)();
	// offset: 0008
	void (*damageEffectFunc)();
	// offset: 000C
	unsigned long (*queryFunc)();
	// offset: 0010
	void (*messageFunc)();
	// offset: 0014 (12 bytes)
	struct _MonsterStateChoice *stateFuncs;
	// offset: 0018
	char *versionID;
	// offset: 001C
	char *localVersionID;
} MonsterFunctionTable;

#endif

#ifndef _RESOLVE_H_
#define _RESOLVE_H_

// size: 0x8
struct RedirectList {
	// offset: 0000
	long numPointers;
	// offset: 0004
	long *data;
};

typedef struct RedirectList RedirectList;

#endif

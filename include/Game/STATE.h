#ifndef _STATE_H_
#define _STATE_H_

// size: 0x8
struct __Event {
	// offset: 0000
	int ID;
	// offset: 0004
	int Data;
};

// size: 0x88
struct __MessageQueue {
	// offset: 0000
	int Head;
	// offset: 0004
	int Tail;
	// offset: 0008 (128 bytes)
	struct __Event Queue[16];
};

typedef struct __Event Message;

typedef struct __MessageQueue MessageQueue;

#endif

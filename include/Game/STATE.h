#ifndef _STATE_H_
#define _STATE_H_

// size: 0x8
typedef struct __Event {
    // offset: 0000
    int ID;
    // offset: 0004
    int Data;
} Message;

// size: 0x88
typedef struct __MessageQueue {
    // offset: 0000
    int Head;
    // offset: 0004
    int Tail;
    // offset: 0008 (128 bytes)
    struct __Event Queue[16];
} MessageQueue;

void EnMessageQueueData(MessageQueue *In, int ID, int Data);

#endif

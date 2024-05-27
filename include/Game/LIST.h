#ifndef _LIST_H_
#define _LIST_H_

// size: 0x8
typedef struct NodeType {
    // offset: 0000 (8 bytes)
    struct NodeType *prev;
    // offset: 0004 (8 bytes)
    struct NodeType *next;
} NodeType;

void LIST_DeleteFunc(NodeType *node);
NodeType *LIST_GetFunc(NodeType *list);
void LIST_InsertFunc(NodeType *list, NodeType *node);

#endif

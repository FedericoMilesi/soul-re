#ifndef _LIST_H_
#define _LIST_H_

#include "common.h"

void LIST_DeleteFunc(NodeType *node);
NodeType *LIST_GetFunc(NodeType *list);
void LIST_InsertFunc(NodeType *list, NodeType *node);

#endif

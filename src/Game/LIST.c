#include "common.h"
#include "Game/LIST.h"

void LIST_InsertFunc(struct NodeType *list, struct NodeType *node)
{
	node->prev = list;

	node->next = list->next;

	if (list->next != NULL)
	{
		list->next->prev = node;
	}

	list->next = node;
}

INCLUDE_ASM("asm/nonmatchings/Game/LIST", LIST_DeleteFunc);

struct NodeType * LIST_GetFunc(struct NodeType *list)
{
    struct NodeType* temp; // not from decls.h

    temp = list->next;
    
	if (temp != NULL)
	{
		LIST_DeleteFunc(temp);

		return temp;
	}

	return NULL;
}

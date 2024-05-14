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

INCLUDE_ASM("asm/nonmatchings/Game/LIST", LIST_GetFunc);

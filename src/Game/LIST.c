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

void LIST_DeleteFunc(struct NodeType *node)
{
    if (node->prev != NULL)
    {
        if (node->next != NULL)
        {
            node->prev->next = node->next;
            
            node->next->prev = node->prev;
            
            node->next = NULL;
            
            node->prev = NULL;
            
            return;
        }
    }
    else if (node->next != NULL)
    {
        node->next->prev = NULL;
        
        node->next = NULL;
        
        node->prev = NULL;

        return;
    }
    
    if (node->prev != NULL)
    {
        node->prev->next = NULL;
        
        node->next = NULL;
    }
    else
    {
        node->next = NULL;
    }
    
    node->prev = NULL;
}

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

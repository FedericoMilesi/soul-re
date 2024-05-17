#include "common.h"
#include "Game/VRAM.h"

EXTERN struct _BlockVramEntry *usedVramBlocks;

EXTERN struct _BlockVramEntry *openVramBlocks;

void VRAM_PrintVramBlock()
{
}

void VRAM_PrintInfo()
{
    struct _BlockVramEntry *vblock;

    vblock = usedVramBlocks;

    while (vblock != NULL)
    {
        vblock = vblock->next;
    }

    vblock = openVramBlocks;

    while (vblock != NULL)
    {
        vblock = vblock->next;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_InitVramBlockCache);

void VRAM_EnableTerrainArea()
{
    VRAM_InsertFreeVram(512, 0, 512, 240 + 16, 0);
}

void VRAM_DisableTerrainArea()
{
    VRAM_DeleteFreeVram(512, 0, 512, 240 + 16);
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_ConcatanateMemory);

void VRAM_GarbageCollect()
{
    while (VRAM_ConcatanateMemory(openVramBlocks) == 1)
    {
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_InsertFreeBlock);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_DeleteFreeBlock);

void VRAM_InsertUsedBlock(struct _BlockVramEntry *block)
{
    if (block != NULL)
    {
        if (usedVramBlocks == NULL)
        {
            usedVramBlocks = block;
        }
        else
        {
            block->next = usedVramBlocks;

            usedVramBlocks = block;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_DeleteUsedBlock);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_GetOpenBlock);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_DeleteFreeVram);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_InsertFreeVram);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_CheckVramSlot);

void VRAM_ClearVramBlock(struct _BlockVramEntry *block)
{
    if (block != NULL)
    {
        VRAM_DeleteUsedBlock(block);

        VRAM_InsertFreeBlock(block);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", AdjustVramCoordsObject);

struct _BlockVramEntry *VRAM_InsertionSort(struct _BlockVramEntry *rootNode, struct _BlockVramEntry *newBlock)
{
    struct _BlockVramEntry *prev;
    struct _BlockVramEntry *next;

    prev = NULL;
    next = rootNode;

    while (next != NULL)
    {
        if (newBlock->area >= next->area)
        {
            break;
        }

        prev = next;
        next = next->next;
    }

    if (prev == NULL)
    {
        newBlock->next = rootNode;

        rootNode = newBlock;
    }
    else
    {
        newBlock->next = next;

        prev->next = newBlock;
    }

    return rootNode;
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_RearrangeVramsLayer);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_TransferBufferToVram);

void VRAM_LoadReturn(void *dataPtr, void *data1, void *data2)
{
    MEMPACK_Free((char *)data1);
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_GetObjectVramSpace);

void VRAM_InitMorphPalettes()
{
}

void VRAM_UpdateMorphPalettes()
{
}

void MORPH_ChangeAreaPalettes()
{
}

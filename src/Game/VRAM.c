#include "common.h"
#include "Game/MEMPACK.h"

int VRAM_InsertFreeVram(short x, short y, short w, short h, short flags);
int VRAM_DeleteFreeVram(short x, short y, short w, short h);
void VRAM_DeleteFreeBlock(BlockVramEntry *block);

EXTERN BlockVramEntry *usedVramBlocks;

EXTERN BlockVramEntry *openVramBlocks;

EXTERN BlockVramEntry vramBlockList[90];

void VRAM_PrintVramBlock()
{
}

void VRAM_PrintInfo()
{
    BlockVramEntry *vblock;

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

int VRAM_ConcatanateMemory(BlockVramEntry *curBlock)
{
    BlockVramEntry *nextBlock;

    while (curBlock != NULL)
    {
        nextBlock = curBlock->next;

        while (nextBlock != NULL)
        {
            if ((curBlock->x == nextBlock->x) && (curBlock->w == nextBlock->w))
            {
                if ((curBlock->y >> 8) == (nextBlock->y >> 8))
                {
                    if ((curBlock->y + curBlock->h) == nextBlock->y)
                    {
                        curBlock->h += nextBlock->h;

                        VRAM_DeleteFreeBlock(nextBlock);

                        nextBlock->flags = 0;
                        return 1;
                    }

                    if ((nextBlock->y + nextBlock->h) == curBlock->y)
                    {
                        nextBlock->h += curBlock->h;

                        VRAM_DeleteFreeBlock(curBlock);

                        curBlock->flags = 0;
                        return 1;
                    }
                }
            }

            if ((curBlock->y == nextBlock->y) && (curBlock->h == nextBlock->h))
            {
                if (((curBlock->x + curBlock->w) == nextBlock->x) && ((!(curBlock->x & 0x3F)) || ((curBlock->w + nextBlock->w) < 65)))
                {
                    curBlock->w += nextBlock->w;

                    VRAM_DeleteFreeBlock(nextBlock);

                    nextBlock->flags = 0;
                    return 1;
                }

                if (((nextBlock->x + nextBlock->w) == curBlock->x) && ((!(nextBlock->x & 0x3F)) || ((curBlock->w + nextBlock->w) < 65)))
                {
                    nextBlock->w += curBlock->w;

                    VRAM_DeleteFreeBlock(curBlock);

                    curBlock->flags = 0;
                    return 1;
                }
            }

            nextBlock = nextBlock->next;
        }

        curBlock = curBlock->next;
    }

    return 0;
}

void VRAM_GarbageCollect()
{
    while (VRAM_ConcatanateMemory(openVramBlocks) == 1);
}

int VRAM_InsertFreeBlock(BlockVramEntry *block)
{
    BlockVramEntry *next;
    BlockVramEntry *prev;

    prev = NULL;

    if (block == NULL)
    {
        return 0;
    }

    next = openVramBlocks;

    while (next != NULL)
    {
        if (next->area >= block->area)
        {
            break;
        }

        prev = next;
        next = prev->next;
    }

    if (prev == NULL)
    {
        block->next = openVramBlocks;

        openVramBlocks = block;
    }
    else
    {
        block->next = next;
        prev->next = block;
    }

    VRAM_GarbageCollect();

    return 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_DeleteFreeBlock);

void VRAM_InsertUsedBlock(BlockVramEntry *block)
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

void VRAM_DeleteUsedBlock(BlockVramEntry *block);
INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_DeleteUsedBlock);

BlockVramEntry *VRAM_GetOpenBlock();
INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_GetOpenBlock);

int VRAM_DeleteFreeVram(short x, short y, short w, short h)
{
    BlockVramEntry *prev;
    BlockVramEntry *vblock;
    BlockVramEntry *nextVBlock;
    BlockVramEntry *blockLists[2] = {
        openVramBlocks, usedVramBlocks
    };
    int i;
    int delCount;

    delCount = 0;

    for (i = 0; i < 2; i++)
    {
        vblock = blockLists[i];

        prev = NULL;

        while (vblock != NULL)
        {
            nextVBlock = vblock->next;

            if ((vblock->x >= x) && ((x + w) >= (vblock->x + vblock->w)) && (vblock->y >= y)
            && ((y + h) >= (vblock->y + vblock->h)))
            {
                vblock->flags = 0;

                if (prev == NULL)
                {
                    if (i == 0)
                    {
                        openVramBlocks = nextVBlock;
                    }
                    else
                    {
                        usedVramBlocks = nextVBlock;
                    }
                }
                else
                {
                    prev->next = nextVBlock;
                }

                delCount++;
            }
            else
            {
                prev = vblock;
            }

            vblock = nextVBlock;
        }
    }

    return delCount;
}

int VRAM_InsertFreeVram(short x, short y, short w, short h, short flags)
{
    BlockVramEntry *useBlock;

    if (((x & 0x3F)) && (w > (64 - ((x & 0x3F)))))
    {
        useBlock = VRAM_GetOpenBlock();

        useBlock->next = NULL;
        useBlock->flags = (unsigned char)flags;
        useBlock->time = 0;
        useBlock->ID = 0;

        useBlock->x = x;
        useBlock->y = y;
        useBlock->w = 64;

        useBlock->w -= ((x & 0x3F));

        useBlock->h = h;

        useBlock->area = useBlock->w * h;

        VRAM_InsertFreeBlock(useBlock);

        useBlock = VRAM_GetOpenBlock();

        useBlock->next = NULL;
        useBlock->flags = (unsigned char)flags;
        useBlock->time = 0;
        useBlock->ID = 0;

        useBlock->x = x + 64;

        useBlock->x -= ((x & 0x3F));

        useBlock->y = y;

        useBlock->w = w - 64;

        useBlock->w += ((x & 0x3F));

        useBlock->h = h;

        useBlock->area = useBlock->w * useBlock->h;

        VRAM_InsertFreeBlock(useBlock);
    }
    else
    {
        useBlock = VRAM_GetOpenBlock();

        useBlock->next = NULL;
        useBlock->flags = (unsigned char)flags;
        useBlock->time = 0;
        useBlock->ID = 0;

        useBlock->x = x;
        useBlock->y = y;
        useBlock->w = w;
        useBlock->h = h;

        useBlock->area = w * h;

        VRAM_InsertFreeBlock(useBlock);
    }

    return 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_CheckVramSlot);

void VRAM_ClearVramBlock(BlockVramEntry *block)
{
    if (block != NULL)
    {
        VRAM_DeleteUsedBlock(block);

        VRAM_InsertFreeBlock(block);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", AdjustVramCoordsObject);

BlockVramEntry *VRAM_InsertionSort(BlockVramEntry *rootNode, BlockVramEntry *newBlock)
{
    BlockVramEntry *prev;
    BlockVramEntry *next;

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
    (void)dataPtr;
    (void)data2;
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

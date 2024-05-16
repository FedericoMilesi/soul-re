#include "common.h"
#include "Game/VRAM.h"

void VRAM_PrintVramBlock(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_PrintInfo);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_InitVramBlockCache);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_EnableTerrainArea);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_DisableTerrainArea);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_ConcatanateMemory);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_GarbageCollect);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_InsertFreeBlock);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_DeleteFreeBlock);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_InsertUsedBlock);

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

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_InsertionSort);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_RearrangeVramsLayer);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_TransferBufferToVram);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_LoadReturn);

INCLUDE_ASM("asm/nonmatchings/Game/VRAM", VRAM_GetObjectVramSpace);

void VRAM_InitMorphPalettes(void)
{
}

void VRAM_UpdateMorphPalettes(void)
{
}

void MORPH_ChangeAreaPalettes(void)
{
}

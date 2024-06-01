#include "common.h"

void RELMOD_InitModulePointers(intptr_t baseaddr, int *relocs)
{
    unsigned int *rel_addr;

    while (*relocs != -1)
    {
        rel_addr = (unsigned int *)(baseaddr + ((*relocs & ~0x3)));

        switch ((*relocs++ & 0x3))
        {
        case 0:
            if ((int)*rel_addr >= 0)
            {
                *rel_addr += baseaddr;
            }

            break;
        case 1:
            *(short *)rel_addr = ((baseaddr + *relocs++) + 32768) >> 16;
            break;
        case 2:
            *(short *)rel_addr += baseaddr;
            break;
        case 3:
            *rel_addr += ((unsigned int)baseaddr << 4) >> 6;
            break;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RELMOD", RELMOD_RelocModulePointers);

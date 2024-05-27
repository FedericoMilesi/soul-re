#include "common.h"
#include "Game/VM.h"
#include "Game/MEMPACK.h"

static long vmRealClock = 0;

static long vmClock = 0;

void VM_Tick(long time)
{
    vmRealClock += time;

    vmClock = vmRealClock >> 8;
}

INCLUDE_ASM("asm/nonmatchings/Game/VM", VM_UpdateMorph);

void VM_VMObjectSetTable(Level *level, VMObject *vmobject, int table)
{
    VMOffsetTable *curTable;

    (void)level;
    curTable = vmobject->curVMOffsetTable;

    if (curTable != vmobject->vmoffsetTableList[vmobject->currentIdx])
    {
        MEMPACK_Free((char *)curTable);
    }

    vmobject->currentIdx = table;
    vmobject->curVMOffsetTable = (VMOffsetTable *)vmobject->vmoffsetTableList[vmobject->currentIdx];
}

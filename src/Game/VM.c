#include "common.h"
#include "Game/VM.h"

static long vmRealClock = 0;

static long vmClock = 0;

void VM_Tick(long time)
{
    vmRealClock += time;

    vmClock = vmRealClock >> 8;
}

INCLUDE_ASM("asm/nonmatchings/Game/VM", VM_UpdateMorph);

void VM_VMObjectSetTable(struct Level *level, struct _VMObject *vmobject, int table)
{
    struct _VMOffsetTable *curTable;

    curTable = vmobject->curVMOffsetTable;

    if (curTable != vmobject->vmoffsetTableList[vmobject->currentIdx])
    {
        MEMPACK_Free((char *)curTable);
    }

    vmobject->currentIdx = table;
    vmobject->curVMOffsetTable = (struct _VMOffsetTable *)vmobject->vmoffsetTableList[vmobject->currentIdx];
}

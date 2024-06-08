#include "common.h"
#include "Game/G2/INSTNCG2.h"

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", G2Instance_BuildTransformsForList);

void G2Instance_BuildTransforms(Instance *instance)
{
    if ((instance->object->animList != NULL) && (!(instance->object->oflags2 & 0x40000000)))
    {
        _G2Instance_BuildAnimatedTransforms(instance);
    }
    else
    {
        _G2Instance_BuildNonAnimatedTransforms(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", G2Instance_RebuildTransforms);

G2AnimKeylist *G2Instance_GetKeylist(Instance *instance, int id)
{
    return instance->object->animList[id];
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_RebuildAnimatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", G2Instance_ClearMatrices);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_BuildAnimatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_RebuildNonAnimatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_BuildDeactivatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_BuildNonAnimatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_BuildFacadeTransforms);

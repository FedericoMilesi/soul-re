#include "common.h"
#include "Game/G2/INSTNCG2.h"
#include "Game/GAMELOOP.h"

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

void G2Instance_RebuildTransforms(Instance *instance)
{
    if ((instance->object->animList != NULL) && (!(instance->object->oflags2 & 0x40000000)))
    {
        _G2Instance_RebuildAnimatedTransforms(instance);
    }
    else
    {
        _G2Instance_RebuildNonAnimatedTransforms(instance);
    }
}

G2AnimKeylist *G2Instance_GetKeylist(Instance *instance, int id)
{
    return instance->object->animList[id];
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_RebuildAnimatedTransforms);

void G2Instance_ClearMatrices(Instance *instance)
{
    instance->oldMatrix = instance->matrix;
    instance->matrix = NULL;

    instance = instance->LinkChild;

    while (instance != NULL)
    {
        G2Instance_ClearMatrices(instance);

        instance = instance->LinkSibling;
    }
}

void _G2Instance_BuildAnimatedTransforms(Instance *instance)
{
    MATRIX *rootMatrix;
    Model *model;

    if (((instance->flags2 & 0x10000000)) && (((instance->flags2 & 0x4000000)) || (((instance->flags2 & 0x20000000)) && ((instance->flags & 0x800)))))
    {
        G2Instance_ClearMatrices(instance);

        return;
    }

    model = instance->object->modelList[instance->currentModel];

    rootMatrix = (MATRIX *)GAMELOOP_GetMatrices(model->numSegments + 1);

    if (rootMatrix == NULL)
    {
        instance->matrix = NULL;
    }
    else
    {
        instance->oldMatrix = instance->matrix;
        instance->matrix = &rootMatrix[1];

        _G2Instance_RebuildAnimatedTransforms(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_RebuildNonAnimatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_BuildDeactivatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_BuildNonAnimatedTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/INSTNCG2", _G2Instance_BuildFacadeTransforms);

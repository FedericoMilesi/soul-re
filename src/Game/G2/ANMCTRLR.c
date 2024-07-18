#include "common.h"
#include "Game/G2/ANMCTRLR.h"

//static G2AnimControllerPool _controllerPool;
G2AnimControllerPool _controllerPool;

void G2Anim_AttachControllerToSeg(G2Anim *anim, int segNumber, int type)
{
    _G2AnimController_InsertIntoList(_G2AnimController_Create(segNumber, type), &anim->controllerList);
}

void G2Anim_DetachControllerFromSeg(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;
    unsigned short *controllerNextPtr;

    controllerNextPtr = &anim->controllerList;

    controller = _G2AnimControllerST_FindPtrInList(segNumber, type, &controllerNextPtr);

    if (controller == NULL)
    {
        controllerNextPtr = &anim->disabledControllerList;

        controller = _G2AnimControllerST_FindPtrInList(segNumber, type, &controllerNextPtr);

        if (controller == NULL)
        {
            return;
        }
    }

    controller = _G2AnimController_Destroy(controller);

    *controllerNextPtr = controller - _controllerPool.blockPool;
}

void G2Anim_EnableController(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;
    G2Matrix *segMatrix;

    controller = _G2AnimControllerST_RemoveFromList(segNumber, type, &anim->disabledControllerList);

    if (controller != NULL)
    {
        controller->duration = 0;

        controller->elapsedTime = 0;

        controller->flags = (unsigned char)controller->flags;

        if (controller->type == 8)
        {
            G2Quat_FromMatrix_S(&controller->data.quat.dest, &anim->segMatrices[segNumber]);
        }
        else if (controller->type == 32)
        {
            segMatrix = &anim->segMatrices[segNumber];

            controller->data.quat.src.x = (unsigned short)segMatrix->trans.x;
            controller->data.quat.src.y = (unsigned short)segMatrix->trans.y;
            controller->data.quat.src.z = (unsigned short)segMatrix->trans.z;
        }
        else
        {
            memset(&controller->data.quat.src, 0, sizeof(G2Quat) * 2);
        }

        _G2AnimController_InsertIntoList(controller, &anim->controllerList);
    }
}

void G2Anim_DisableController(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;

    controller = _G2AnimControllerST_RemoveFromList(segNumber, type, &anim->controllerList);

    if (controller != NULL)
    {
        _G2AnimController_InsertIntoList(controller, &anim->disabledControllerList);
    }
}

void G2Anim_InterpDisableController(G2Anim *anim, int segNumber, int type, short duration)
{
    G2SVector3 zeroVector;
    G2Quat targetQuat;
    G2AnimController *controller;

    memset(&zeroVector, 0, sizeof(G2SVector3));

    if ((duration == 0) || (type == 32))
    {
        G2Anim_DisableController(anim, segNumber, type);
    }

    controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->controllerList);

    if (controller != NULL)
    {
        if (controller->type == 8)
        {
            _G2AnimController_GetSimpleWorldRotQuat(controller, anim, &targetQuat);

            G2Anim_SetInterpController_Quat(anim, segNumber, type, &targetQuat, duration);
        }
        else
        {
            G2Anim_SetInterpController_Vector(anim, segNumber, type, &zeroVector, duration);
        }

        controller->flags |= 0x8000;
    }
}

G2Bool G2Anim_IsControllerActive(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;

    controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->controllerList);

    if (controller == NULL)
    {
        return G2FALSE;
    }

    return ((controller->flags & 0x8000) < 0x8000);
}

G2Bool G2Anim_IsControllerInterpolating(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;

    controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->controllerList);

    if ((controller == NULL) || (!(controller->flags & 0x4000)))
    {
        return G2FALSE;
    }
    else
    {
        return ((controller->flags & 0x2000) < 0x2000);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_GetControllerCurrentInterpVector);

void G2Anim_SetControllerCallbackData(G2Anim *anim, int segNumber, int type, void *callbackData)
{
    _G2Anim_FindController(anim, segNumber, type)->callbackData = callbackData;
}

void G2Anim_SetControllerAngleOrder(G2Anim *anim, int segNumber, int type, int order)
{
    G2AnimController *controller;

    controller = _G2Anim_FindController(anim, segNumber, type);

    controller->flags = (controller->flags & 0xFF00) | order;
}

void G2Anim_SetController_Vector(G2Anim *anim, int segNumber, int type, G2SVector3 *vector)
{
    G2AnimController *controller;

    controller = _G2Anim_FindController(anim, segNumber, type);

    controller->data.vector.base = *vector;

    controller->flags = (unsigned char)controller->flags;
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_SetInterpController_Vector);

void G2Anim_SetInterpController_Quat(G2Anim *anim, int segNumber, int type, G2Quat *quat, int duration)
{
    G2AnimController *controller;
    G2Quat *source;
    unsigned long zw;
    unsigned long xy;

    source = quat;

    controller = _G2Anim_FindController(anim, segNumber, type);

    _G2AnimController_GetCurrentInterpQuat(controller, anim, &controller->data.quat.src);

    xy = *(unsigned long *)&source->x;
    zw = *(unsigned long *)&source->z;

    controller->elapsedTime = 0;

    *(unsigned int *)&controller->data.quat.dest.x = xy;
    *(unsigned int *)&controller->data.quat.dest.z = zw;

    controller->flags = (unsigned char)controller->flags | 0x4000;

    controller->duration = duration;
}

void _G2Anim_ApplyControllersToStoredFrame(G2Anim *anim)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        _G2AnimSection_ApplyControllersToStoredFrame(&anim->section[i]);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2Anim_BuildTransformsWithControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2Anim_BuildSegTransformWithControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_ApplyToSegValue);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2Anim_UpdateControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2Anim_CopyVectorWithOrder);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimSection_ApplyControllersToStoredFrame);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_ApplyWorldToParentMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_GetMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_GetVector);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2Anim_FindController);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_Create);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_Destroy);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_InsertIntoList);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_GetCurrentInterpQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimController_GetSimpleWorldRotQuat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimControllerST_FindInList);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimControllerST_FindPtrInList);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2AnimControllerST_RemoveFromList);

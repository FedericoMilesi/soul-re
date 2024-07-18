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

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_EnableController);

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

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_SetControllerAngleOrder);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_SetController_Vector);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_SetInterpController_Vector);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_SetInterpController_Quat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", _G2Anim_ApplyControllersToStoredFrame);

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

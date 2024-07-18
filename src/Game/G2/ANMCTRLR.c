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

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_InterpDisableController);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_IsControllerActive);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_IsControllerInterpolating);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_GetControllerCurrentInterpVector);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANMCTRLR", G2Anim_SetControllerCallbackData);

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

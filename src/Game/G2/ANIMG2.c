#include "common.h"
#include "Game/G2/ANMCTRLR.h"
#include "Game/G2/ANMDECMP.h"

//static G2AnimChanStatusBlockPool _chanStatusBlockPool;
G2AnimChanStatusBlockPool _chanStatusBlockPool;

//static G2AnimInterpStateBlockPool _interpStateBlockPool;
G2AnimInterpStateBlockPool _interpStateBlockPool;

//static G2AnimControllerPool _controllerPool;
G2AnimControllerPool _controllerPool;

G2Bool G2Anim_Install()
{
    G2AnimController *dummyController;

    G2PoolMem_InitPool(&_chanStatusBlockPool, 180, sizeof(G2AnimChanStatusBlock));
    G2PoolMem_InitPool(&_interpStateBlockPool, 96, sizeof(G2AnimInterpStateBlock));
    G2PoolMem_InitPool(&_controllerPool, 122, sizeof(G2AnimController));

    dummyController = (G2AnimController *)G2PoolMem_Allocate(&_controllerPool);

    dummyController->next = 0;

    dummyController->segNumber = 255;

    dummyController->type = 0;

    return !G2FALSE;
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_ResetInternalState);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_Init);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_AddSection);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_Free);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_Restore);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_BuildTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_UpdateStoredFrame);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetSectionWithSeg);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_SegmentHasActiveChannels);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetSegChannelValue);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetRootMotionFromTimeForDuration);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_SwitchToKeylistAtTime);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_JumpToTime);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_UpdateOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_AdvanceOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2AnimSection_RewindOverInterval);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildTransformsNoControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildSegTransformNoControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildSegLocalRotMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", wombat);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", kangaroo);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_InitializeSegValue);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_InitStatus);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", FooBar);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_UpdateStoredFrameFromData);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_GetAnim);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimSection_TriggerEffects);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_FreeChanStatusBlockList);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimAlphaTable_GetValue);

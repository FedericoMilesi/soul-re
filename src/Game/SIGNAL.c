#include "common.h"
#include "Game/SIGNAL.h"
#include "Game/CAMERA.h"

long SIGNAL_HandleLightGroup(Instance *instance, Signal *signal)
{
    if (instance != NULL)
    {
        instance->lightGroup = signal->data.misc[0].size.c[0];
    }

    return 1;
}

long SIGNAL_HandleCameraAdjust(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_Adjust(&theCamera, signal->data.cameraAdjust);

    return 1;
}

long SIGNAL_HandleCamera(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_ChangeTo(&theCamera, signal->data.cameraKey);

    return 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_RelocateCamera);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraMode);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraLock);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraUnlock);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraSmooth);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraTimer);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraSave);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraRestore);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraValue);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleStreamLevel);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleFogNear);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleFogFar);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraShake);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCallSignal);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleStopPlayerControl);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleStartPlayerControl);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_RelocateCameraSpline);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleCameraSpline);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleScreenWipe);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleBlendStart);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleScreenWipeColor);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleSetSlideAngle);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleResetSlideAngle);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleSetCameraTilt);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleSetCameraDistance);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleEnd);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", COLLIDE_HandleSignal);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_IsThisStreamAWarpGate);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_IsStreamSignal);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleSignal);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_RelocateSignal);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_FindSignal);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_OutOfWater);

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_InWater);

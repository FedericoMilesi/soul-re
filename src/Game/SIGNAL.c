#include "common.h"
#include "Game/SIGNAL.h"
#include "Game/CAMERA.h"
#include "Game/STREAM.h"
#include "Game/LIGHT3D.h"
#include "Game/GAMELOOP.h"

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

void SIGNAL_RelocateCamera(Signal *signal, long offset)
{
    signal->data.cameraKey = (CameraKey *)OFFSET_DATA(signal->data.cameraKey, offset);
}

long SIGNAL_HandleCameraMode(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_SetMode(&theCamera, signal->data.cameraMode);

    return 1;
}

long SIGNAL_HandleCameraLock(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_Lock(&theCamera, signal->data.cameraLock);

    return 1;
}

long SIGNAL_HandleCameraUnlock(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_Unlock(&theCamera, signal->data.cameraUnlock);

    return 1;
}

long SIGNAL_HandleCameraSmooth(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_SetSmoothValue(&theCamera, signal->data.cameraSmooth);

    return 1;
}

long SIGNAL_HandleCameraTimer(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_SetTimer(&theCamera, signal->data.cameraTimer);

    return 1;
}

long SIGNAL_HandleCameraSave(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_Save(&theCamera, signal->data.cameraSave);

    return 1;
}

long SIGNAL_HandleCameraRestore(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_Restore(&theCamera, signal->data.cameraRestore);

    return 1;
}

long SIGNAL_HandleCameraValue(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_SetValue(&theCamera, signal->data.cameraValue.index, signal->data.cameraValue.value);

    return 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_HandleStreamLevel);

long SIGNAL_HandleFogNear(Instance *instance, Signal *signal)
{
    Level *level;

    (void)instance;

    level = STREAM_GetLevelWithID(gameTrackerX.playerInstance->currentStreamUnitID);

    level->fogNear = (unsigned short)signal->data.fogNear;

    SetFogNearFar(level->fogNear, level->fogFar, theCamera.core.projDistance);

    LIGHT_CalcDQPTable(level);

    return 1;
}

long SIGNAL_HandleFogFar(Instance *instance, Signal *signal)
{
    Level *level;

    (void)instance;

    level = STREAM_GetLevelWithID(gameTrackerX.playerInstance->currentStreamUnitID);

    level->fogFar = (unsigned short)signal->data.fogFar;

    SetFogNearFar(level->fogNear, level->fogFar, theCamera.core.projDistance);

    LIGHT_CalcDQPTable(level);

    return 1;
}

long SIGNAL_HandleCameraShake(Instance *instance, Signal *signal)
{
    (void)instance;

    CAMERA_SetShake(&theCamera, signal->data.cameraShake.time, signal->data.cameraShake.scale);

    return 1;
}

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

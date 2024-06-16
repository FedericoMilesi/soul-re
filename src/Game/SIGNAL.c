#include "common.h"
#include "Game/SIGNAL.h"
#include "Game/CAMERA.h"
#include "Game/STREAM.h"
#include "Game/LIGHT3D.h"
#include "Game/GAMELOOP.h"

SignalInfo signalInfoList[27];

extern char D_800D0410[];

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

long SIGNAL_HandleCallSignal(Instance *instance, Signal *signal)
{
    (void)instance;

    SIGNAL_HandleSignal(instance, ((MultiSignal *)(signal->data.callSignal))->signalList, 0);

    return 1;
}

long SIGNAL_HandleStopPlayerControl(Instance *instance, Signal *signal)
{
    (void)instance;
    (void)signal;

    gameTrackerX.gameFlags |= 0x90;

    return 1;
}

long SIGNAL_HandleStartPlayerControl(Instance *instance, Signal *signal)
{
    (void)instance;
    (void)signal;

    gameTrackerX.gameFlags &= ~0x80;
    gameTrackerX.gameFlags &= ~0x10;

    return 1;
}

void SIGNAL_RelocateCameraSpline(Signal *signal, long offset)
{
    signal->data.cameraSpline.intro = (void *)OFFSET_DATA(signal->data.cameraSpline.intro, offset);
}

long SIGNAL_HandleCameraSpline(Instance *instance, Signal *signal)
{
    (void)instance;

    switch (signal->data.cameraSpline.index)
    {
    case 0:
        if (signal->data.cameraSpline.intro != NULL)
        {
            theCamera.Spline00 = ((Intro *)signal->data.cameraSpline.intro)->multiSpline;
        }
        else
        {
            theCamera.Spline00 = NULL;
        }

        break;
    case 1:
        if ((Intro *)signal->data.cameraSpline.intro != NULL)
        {
            theCamera.Spline01 = ((Intro *)signal->data.cameraSpline.intro)->multiSpline;
        }
        else
        {
            theCamera.Spline01 = NULL;
        }
    }

    return 1;
}

long SIGNAL_HandleScreenWipe(Instance *instance, Signal *signal)
{
    (void)instance;

    gameTrackerX.wipeTime = signal->data.screenWipe.time;

    gameTrackerX.maxWipeTime = (signal->data.screenWipe.time < 0) ? -signal->data.screenWipe.time : signal->data.screenWipe.time;

    gameTrackerX.wipeType = signal->data.screenWipe.type;

    return 1;
}

long SIGNAL_HandleBlendStart(Instance *instance, Signal *signal)
{
    (void)instance;
    (void)signal;

    return 1;
}

long SIGNAL_HandleScreenWipeColor(Instance *instance, Signal *signal)
{
    (void)instance;

    gameTrackerX.wipeColor.r = signal->data.color.r;
    gameTrackerX.wipeColor.g = signal->data.color.g;
    gameTrackerX.wipeColor.b = signal->data.color.b;

    return 1;
}

long SIGNAL_HandleSetSlideAngle(Instance *instance, Signal *signal)
{
    int temp; // not from decls.h

    temp = signal->data.slideAngle;

    if (instance != NULL)
    {
        INSTANCE_Post(instance, 0x4000005, temp);
    }

    return 1;
}

long SIGNAL_HandleResetSlideAngle(Instance *instance, Signal *signal)
{
    (void)signal;

    if (instance != NULL)
    {
        INSTANCE_Post(instance, 0x4000006, 0);
    }

    return 1;
}

long SIGNAL_HandleSetCameraTilt(Instance *instance, Signal *signal)
{
    long tilt;

    tilt = signal->data.cameraAdjust;

    if (instance != NULL)
    {
        tilt = -tilt % 360;

        if (tilt < 0)
        {
            tilt += 360;
        }

        CAMERA_Adjust_tilt(&theCamera, (tilt << 12) / 360);
    }

    return 1;
}

long SIGNAL_HandleSetCameraDistance(Instance *instance, Signal *signal)
{
    int temp; // not from decls.h

    temp = signal->data.cameraAdjust;

    if (instance != NULL)
    {
        CAMERA_Adjust_distance(&theCamera, temp);
    }

    return 1;
}

long SIGNAL_HandleEnd(Instance *instance, Signal *signal)
{
    (void)instance;
    (void)signal;

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", COLLIDE_HandleSignal);

long SIGNAL_IsThisStreamAWarpGate(Signal *signal)
{
    long result;
    char areaName[32];
    char *commapos;

    result = 0;

    strcpy(areaName, signal->data.StreamLevel.toname);

    commapos = strchr(areaName, ',');

    if (commapos != NULL)
    {
        *commapos = 0;
    }

    if (strcmpi(areaName, D_800D0410) == 0)
    {
        result = 1;
    }

    return result;
}

long SIGNAL_IsStreamSignal(Signal *signal, long *isWarpGate)
{
    long done;
    long result;
    long signalNumber;

    result = 0;

    done = 0;

    *isWarpGate = 0;

    do
    {
        signalNumber = signal->id & 0x7FFFFFFF;

        if (signalNumber == 15)
        {
            done = 1;
        }
        else if (signalNumber == 18)
        {
            done = 1;

            result = 1;

            if (SIGNAL_IsThisStreamAWarpGate(signal) != 0)
            {
                *isWarpGate = 1;
            }
        }

        if (done == 0)
        {
            signal = (Signal *)((char *)signal + ((signalInfoList[signalNumber].length + 1) * 4));
        }
    } while (done == 0);

    return result;
}

void SIGNAL_HandleSignal(Instance *instance, Signal *signal, int dontForceDoSignal)
{
    COLLIDE_HandleSignal(instance, signal, 1, dontForceDoSignal);
}

MultiSignal *SIGNAL_RelocateSignal(MultiSignal *multiSignal, long offset)
{
    int i;
    Signal *signal;

    signal = multiSignal->signalList;

    for (i = 0; i < multiSignal->numSignals; i++)
    {
        if (signalInfoList[signal->id & 0x7FFFFFFF].signalRelocateFunc != NULL)
        {
            signalInfoList[signal->id & 0x7FFFFFFF].signalRelocateFunc(signal, offset);
        }

        signal = (Signal *)((char *)signal + ((signalInfoList[signal->id & 0x7FFFFFFF].length + 1) * 4));
    }

    return (MultiSignal *)&signal->data.callSignal;
}

MultiSignal *SIGNAL_FindSignal(Level *level, long id)
{
    int i;
    Signal *signal;
    MultiSignal *msignal;
    //long signalNumber; unused

    msignal = level->SignalListStart;

    while (msignal < level->SignalListEnd)
    {
        signal = msignal->signalList;

        if (id == msignal->signalNum)
        {
            break;
        }

        for (i = 0; i < msignal->numSignals; i++)
        {
            signal = (Signal *)((char *)signal + (signalInfoList[signal->id & 0x7FFFFFFF].length + 1) * 4);
        }

        msignal = (MultiSignal *)&signal->data.callSignal;
    }

    if (msignal == level->SignalListEnd)
    {
        msignal = NULL;
    }

    return msignal;
}

void SIGNAL_OutOfWater(Instance *instance)
{
    Level *level;

    level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

    if ((level != NULL) && (level->startGoingOutOfWaterSignal != NULL))
    {
        SIGNAL_HandleSignal(instance, &level->startGoingOutOfWaterSignal->signalList[0], 0);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/SIGNAL", SIGNAL_InWater);

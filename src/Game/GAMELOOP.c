#include "common.h"
#include "Game/GAMELOOP.h"
#include "Game/GAMEPAD.h"
#include "Game/EVENT.h"
#include "Game/LOAD3D.h"
#include "Game/STREAM.h"
#include "Game/STRMLOAD.h"
#include "Game/CAMERA.h"
#include "Game/OBTABLE.h"
#include "Game/INSTANCE.h"
#include "Game/FX.h"
#include "Game/DRAW.h"
#include "Game/MATH3D.h"
#include "Game/SIGNAL.h"
#include "Game/VOICEXA.h"
#include "Game/PSX/MAIN.h"
#include "Game/PSX/SUPPORT.h"
#include "Game/G2/ANIMG2.h"
#include "Game/PLAN/PLANAPI.h"
#include "Game/PLAN/ENMYPLAN.h"
#include "Game/MEMPACK.h"
#include "Game/TIMER.h"

#define FRAMERATE_MULT 1

long cameraMode = 0xD;

long playerCameraMode = 0xD;

Object *fontsObject = NULL;

EXTERN STATIC short pause_redraw_flag;

EXTERN STATIC PrimPool *primPool[2];

STATIC InstanceList *instanceList;

STATIC InstancePool *instancePool;

STATIC void *planningPool;

STATIC void *enemyPlanPool;

FXTracker *fxTracker;

STATIC void *pause_redraw_prim;

STATIC VertexPool *gVertexPool;

STATIC ObjectTracker *GlobalObjects;

STATIC LightInfo *gLightInfo;

STATIC unsigned long **gOt[2];

char *primBase;

STATIC PolytopeList *gPolytopeList;

FXTracker *gFXT;

void GAMELOOP_AllocStaticMemory()
{
    instanceList = (InstanceList *)MEMPACK_Malloc(sizeof(InstanceList), 6);
    instancePool = (InstancePool *)MEMPACK_Malloc(sizeof(InstancePool), 6);

    primBase = MEMPACK_Malloc(216600, 6);

    gOt[0] = (unsigned long **)primBase;
    gOt[1] = (unsigned long **)(primBase + (3072 * 4));

    primPool[0] = (PrimPool *)(primBase + ((3072 * 4) + (3072 * 4)));
    primPool[1] = (PrimPool *)(primBase + ((3072 * 4) + (3072 * 4) + 96012));

    gLightInfo = (LightInfo *)MEMPACK_Malloc(sizeof(LightInfo), 6);

    memset(gLightInfo, 0, sizeof(LightInfo));

    gVertexPool = (VertexPool *)MEMPACK_Malloc(sizeof(VertexPool), 6);

    gPolytopeList = (PolytopeList *)gVertexPool;

    gFXT = fxTracker = (FXTracker *)MEMPACK_Malloc(sizeof(FXTracker), 6);

    planningPool = MEMPACK_Malloc(3000, 6);
    enemyPlanPool = MEMPACK_Malloc(1000, 6);

    GlobalObjects = (ObjectTracker *)MEMPACK_Malloc(1728, 6);

    G2Anim_Install();
}

void GAMELOOP_InitGameTracker()
{
    int i;

    primPool[0]->lastPrim = &primPool[0]->prim[23988];
    primPool[1]->lastPrim = &primPool[1]->prim[23988];

    primPool[0]->nextPrim = &primPool[0]->prim[0];
    primPool[1]->nextPrim = &primPool[1]->prim[0];

    gameTrackerX.instancePool = instancePool;
    gameTrackerX.vertexPool = gVertexPool;
    gameTrackerX.planningPool = planningPool;
    gameTrackerX.enemyPlanPool = enemyPlanPool;

    gameTrackerX.GlobalObjects = GlobalObjects;

    gameTrackerX.instanceList = instanceList;

    gameTrackerX.lightInfo = gLightInfo;

    gameTrackerX.multGameTime = 10;

    gameTrackerX.material_fadeValue = 4096;
    gameTrackerX.spectral_fadeValue = 0;

    gameTrackerX.decoupleGame = 1;

    gameTrackerX.frameRateLock = 1;

    gameTrackerX.primPool = primPool[0];

    gameTrackerX.drawOT = gOt[0];
    gameTrackerX.dispOT = gOt[1];

    gameTrackerX.frameRate24fps = 1;

    for (i = 0; i < 48; i++)
    {
        gameTrackerX.GlobalObjects[i].objectStatus = 0;
    }

    gameTrackerX.gameData.asmData.MorphTime = 1000;

    OBTABLE_ClearObjectReferences();

    EVENT_Init();
}

void GAMELOOP_SystemInit(GameTracker *gameTracker)
{
    (void)gameTracker;

    GAMELOOP_AllocStaticMemory();

    INSTANCE_InitInstanceList(instanceList, instancePool);

    GAMELOOP_InitGameTracker();
}

void GAMELOOP_ResetGameStates()
{
    EVENT_Init();
}

void GAMELOOP_ClearGameTracker()
{
    gameTrackerX.gameData.asmData.MorphTime = 1000;

    gameTrackerX.currentTime = 0;
    gameTrackerX.currentTicks = 0;

    gameTrackerX.gameFlags = 0;

    gameTrackerX.frameCount = 0;
    gameTrackerX.fps30Count = 0;

    gameTrackerX.currentHotSpot = 0;

    gameTrackerX.SwitchToNewStreamUnit = 0;

    gameTrackerX.gameData.asmData.drawBackFaces = 0;

    pause_redraw_flag = 0;
    pause_redraw_prim = NULL;

    gameTrackerX.debugFlags |= 0x40000;
}

void GAMELOOP_CalcGameTime()
{
    long time;

    time = (gameTrackerX.currentTimeOfDayTime * gameTrackerX.multGameTime) / 60000;

    gameTrackerX.timeOfDay = ((((time + 720) / 60) % 24) * 100) + ((time + 720) % 60);
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SetGameTime);

int GAMELOOP_GetTimeOfDay()
{
    int timeOfDay;

    timeOfDay = gameTrackerX.timeOfDay;

    if (((timeOfDay - 601) >= 0) && ((timeOfDay - 601) < 99))
    {
        return 600;
    }
    else if (((timeOfDay - 700) >= 0) && ((timeOfDay - 700) < 1100))
    {
        return 700;
    }
    else if (((timeOfDay - 1800) >= 0) && ((timeOfDay - 1800) < 100))
    {
        return 1800;
    }

    return 1900;
}

int GAMELOOP_GetTimeOfDayIdx(int timeOfDay)
{
    if (((timeOfDay - 601) >= 0) && ((timeOfDay - 601) < 99))
    {
        return 1;
    }

    if (((timeOfDay - 700) >= 0) && ((timeOfDay - 700) < 1100))
    {
        return 2;
    }

    if (((timeOfDay - 1800) >= 0) && ((timeOfDay - 1800) < 100))
    {
        return 3;
    }

    return 0;
}

int GAMELOOP_WaitForLoad()
{
    if ((gameTrackerX.debugFlags & 0x80000))
    {
        VOICEXA_Tick();
    }

    return STREAM_PollLoadQueue();
}

/*TODO: migrate to LoadLevels*/
static char D_800D0718[16] = {0}; // oldArea
StreamUnit *LoadLevels(char *baseAreaName, GameTracker *gameTracker);
INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", LoadLevels);

void GAMELOOP_InitStandardObjects()
{
    static char *sobjects[] = {
        "raziel",
        "paths",
        "glphicon",
        "sreavr",
        "soul",
        "force",
        "particle",
        "healths",
        "eaggot",
        "eaggots"};

    int i;

    LOAD_DumpCurrentDir();

    for (i = 0; (unsigned int)i < ARRAY_COUNT(sobjects); i++)
    {
        InsertGlobalObject(sobjects[i], &gameTrackerX);
    }
}

void GAMELOOP_LevelLoadAndInit(char *baseAreaName, GameTracker *gameTracker)
{
    long i;
    StreamUnit *streamUnit;
    BLK_FILL *temp; // not from SYMDUMP

    G2Anim_ResetInternalState();
    gameTracker->playerInstance = NULL;

    INSTANCE_InitInstanceList(instanceList, instancePool);
    GAMELOOP_ClearGameTracker();
    CAMERA_Initialize(&theCamera);
    PLANAPI_InitPlanning(planningPool);
    ENMYPLAN_InitEnemyPlanPool(enemyPlanPool);
    FX_Init(fxTracker);
    WARPGATE_Init();
    DRAW_InitShadow();
    GAMELOOP_InitStandardObjects();

    streamUnit = LoadLevels(baseAreaName, gameTracker);

    while (STREAM_PollLoadQueue() != 0)
    {
    }

    fontsObject = (Object *)objectAccess[2].object;

    gameTracker->introFX = (Object *)objectAccess[6].object;

    RENDER_currentStreamUnitID = (unsigned short)gameTracker->StreamUnitID;

    for (i = 0; i < streamUnit->level->numIntros; i++)
    {
        if (strcmpi(streamUnit->level->introList[i].name, "raziel") == 0)
        {
            INSTANCE_IntroduceInstance(&streamUnit->level->introList[i], (short)streamUnit->StreamUnitID);
            break;
        }
    }

    gameTracker->playerInstance->data = gameTracker->playerInstance->object->data;

    CAMERA_SetInstanceFocus(&theCamera, gameTracker->playerInstance);

    COPY_SVEC(Position, &theCamera.core.position, Position, &gameTracker->playerInstance->position);

    SetFogNearFar(streamUnit->level->fogNear, streamUnit->level->fogFar, 320);
    SetFarColor(0, 0, 0);

    temp = clearRect;

    temp->r0 = streamUnit->level->backColorR;
    temp->g0 = streamUnit->level->backColorG;
    temp->b0 = streamUnit->level->backColorB;

    temp++;

    temp->r0 = streamUnit->level->backColorR;
    temp->g0 = streamUnit->level->backColorG;
    temp->b0 = streamUnit->level->backColorB;

    gameTracker->wipeType = 10;
    gameTracker->hideBG = 0;
    gameTracker->wipeTime = 30;
    gameTracker->maxWipeTime = 30 * FRAMERATE_MULT;

    if (streamUnit->level->startSignal != NULL)
    {
        streamUnit->level->startSignal->flags |= 0x1;
        SIGNAL_HandleSignal(gameTracker->playerInstance, streamUnit->level->startSignal->signalList, 0);
        EVENT_AddSignalToReset(streamUnit->level->startSignal);
    }

    gameTracker->vblFrames = 0;

    if (streamUnit->level->startUnitMainSignal != NULL && gameTracker->playerInstance != NULL)
    {
        streamUnit->level->startUnitMainSignal->flags |= 0x1;
        SIGNAL_HandleSignal(gameTracker->playerInstance, streamUnit->level->startUnitMainSignal->signalList, 0);
        EVENT_AddSignalToReset(streamUnit->level->startUnitMainSignal);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_StreamLevelLoadAndInit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SetScreenWipe);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_HandleScreenWipes);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", UpdateFogSettings);

int CheckForNoBlend(ColorType *Color)
{
    if ((Color->r < 5) && (Color->g < 5) && (Color->b < 5))
    {
        return 1;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", BlendToColor);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", MainRenderLevel);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", StreamIntroInstancesForUnit);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", StreamRenderLevel);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_FlipScreenAndDraw);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_AddClearPrim);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SwitchTheDrawBuffer);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_SetupRenderFunction);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_GetMainRenderUnit);

/*TODO: migrate to GAMELOOP_DisplayFrame*/
static char D_800D0780[] = "Cameraunit: %s\n";
INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_DisplayFrame);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_DrawSavedOT);

void ResetPrimPool()
{
    ResetDrawPage();

    if (!(gameTrackerX.gameFlags & 0x8000000))
    {
        if (gameTrackerX.primPool == primPool[0])
        {
            gameTrackerX.primPool = primPool[1];
        }
        else
        {
            gameTrackerX.primPool = primPool[0];
        }

        gameTrackerX.primPool->nextPrim = gameTrackerX.primPool->prim;

        gameTrackerX.primPool->numPrims = 0;
    }
    else
    {
        if (gameTrackerX.drawPage != 0)
        {
            gameTrackerX.primPool->nextPrim = &gameTrackerX.primPool->prim[16500];
        }
        else
        {
            gameTrackerX.primPool->nextPrim = &gameTrackerX.primPool->prim[9000];
        }

        gameTrackerX.primPool->numPrims = 0;
    }
}

void Switch_For_Redraw()
{
    unsigned long **temp;

    temp = gameTrackerX.drawOT;

    gameTrackerX.drawOT = gameTrackerX.dispOT;
    gameTrackerX.dispOT = temp;

    if (gameTrackerX.drawPage != 0)
    {
        gameTrackerX.drawPage = 0;

        gameTrackerX.gameData.asmData.dispPage = 1;
    }
    else
    {
        gameTrackerX.drawPage = 1;

        gameTrackerX.gameData.asmData.dispPage = 0;
    }

    if (gameTrackerX.primPool == primPool[0])
    {
        gameTrackerX.primPool = primPool[1];
    }
    else
    {
        gameTrackerX.primPool = primPool[0];
    }

    gameTrackerX.primPool->nextPrim = gameTrackerX.primPool->prim;

    gameTrackerX.primPool->numPrims = 0;
}

void GAMELOOP_Set_Pause_Redraw()
{
    pause_redraw_flag = 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", SaveOT);

void ResetDrawPage()
{
    unsigned long **temp;

    temp = gameTrackerX.drawOT;

    gameTrackerX.drawOT = gameTrackerX.dispOT;
    gameTrackerX.dispOT = temp;

    gameTrackerX.drawPage = 1 - gameTrackerX.drawPage;

    ClearOTagR((unsigned long *)gameTrackerX.drawOT, 3072);
}

void GAMELOOP_Set24FPS()
{
    gameTrackerX.frameRate24fps = 1;
}

void GAMELOOP_Reset24FPS()
{
    gameTrackerX.frameRate24fps = 0;
}

void GAMELOOP_DoTimeProcess()
{
    int holdTime;

    holdTime = TIMER_GetTimeMS();

    if (!(gameTrackerX.gameFlags & 0x10000000))
    {
        gameTrackerX.totalTime = TIMER_TimeDiff(gameTrackerX.currentTicks);

        gameTrackerX.currentTicks = (GetRCnt(0xF2000000) & 0xFFFF) | (gameTimer << 16);

        if (gameTrackerX.frameRateLock <= 0)
        {
            gameTrackerX.frameRateLock = 1;
        }

        if (gameTrackerX.frameRateLock >= 3)
        {
            gameTrackerX.frameRateLock = 2;
        }

        if ((gameTrackerX.decoupleGame == 0) || ((gameTrackerX.gameFlags & 0x10000000)))
        {
            if (gameTrackerX.frameRateLock == 1)
            {
                gameTrackerX.lastLoopTime = 33;
            }
            else if (gameTrackerX.frameRateLock == 2)
            {
                gameTrackerX.lastLoopTime = 50;
            }

            gameTrackerX.timeMult = (gameTrackerX.lastLoopTime << 12) / 33;
        }
        else
        {
            int lockRate;
            unsigned long last;

            lockRate = 33;

            if (gameTrackerX.frameRateLock != 1)
            {
                if (gameTrackerX.frameRateLock == 2)
                {
                    lockRate = 50;
                }
            }

            last = lockRate;

            if (gameTrackerX.lastLoopTime != -1U)
            {
                last = holdTime - gameTrackerX.currentTime;
            }

            if ((gameTrackerX.frameRateLock == 1) && (gameTrackerX.frameRate24fps != 0))
            {
                last -= 9;
            }

            if ((last < (unsigned int)lockRate) || (gameTrackerX.gameData.asmData.MorphTime != 1000))
            {
                last = lockRate;
            }
            else if (last > 66)
            {
                last = 66;
            }

            gameTrackerX.timeMult = (last << 12) / 33;

            gameTrackerX.lastLoopTime = last;
        }

        gameTrackerX.gameFramePassed = 0;

        gameTrackerX.globalTimeMult = gameTrackerX.timeMult;

        gameTrackerX.timeSinceLastGameFrame += gameTrackerX.timeMult;

        while (gameTrackerX.timeSinceLastGameFrame >= 4097)
        {
            gameTrackerX.gameFramePassed = 1;

            gameTrackerX.timeSinceLastGameFrame -= 4096;

            gameTrackerX.fps30Count++;
        }
    }
    else
    {
        gameTrackerX.lastLoopTime = -1;
    }

    gameTrackerX.currentTime = holdTime;
}

/*TODO: migrate to GAMELOOP_Process*/
static char D_800D0790[] = "Processing unit %s\n";
static char D_800D07A4[] = "Military Time %04d\n";
INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_Process);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ModeStartRunning);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ModeStartPause);

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_ChangeMode);

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
/*TODO: migrate to GAMELOOP_RequestLevelChange*/
static char D_800D07B8[] = "%s%d";
INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", GAMELOOP_RequestLevelChange);
#else
void GAMELOOP_RequestLevelChange(char *name, short number, GameTracker *gameTracker)
{
    if (gameTracker->levelChange == 0)
    {
        gameTracker->gameFlags |= 0x1;

        SOUND_ResetAllSound();

        sprintf(gameTracker->baseAreaName, "%s%d", name, number);

        gameTracker->levelChange = 1;

        gameTracker->levelDone = 1;
    }
}
#endif

void PSX_GameLoop(GameTracker *gameTracker)
{
    GAMEPAD_Process(gameTracker);

    GAMELOOP_Process(gameTracker);
}

MATRIX *GAMELOOP_GetMatrices(int numMatrices)
{
    MATRIX *matrix;
    PrimPool *pool;

    pool = gameTrackerX.primPool;

    matrix = (MATRIX *)pool->nextPrim;

    if (&matrix[numMatrices] < (MATRIX *)pool->lastPrim)
    {
        pool->nextPrim = (unsigned long *)&matrix[numMatrices];

        return matrix;
    }

    return NULL;
}

GameTracker *GAMELOOP_GetGT()
{
    return &gameTrackerX;
}

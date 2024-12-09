#include "common.h"
#include "Game/BSP.h"
#include "Game/COLLIDE.h"
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
#include "Game/HASM.h"
#include "Game/DEBUG.h"
#include "Game/SOUND.h"
#include "Game/MENU/MENU.h"
#include "Game/MENU/MENUDEFS.h"
#include "Game/LIGHT3D.h"

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

DebugMenuLine *currentMenu;

DebugMenuLine standardMenu[8924 + 12];

DebugMenuLine pauseMenu[8924 + 7];

int gamePadControllerOut;

GlobalSaveTracker *GlobalSave;

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

void GAMELOOP_SetGameTime(long timeOfDay)
{
    long tim;

    tim = ((timeOfDay / 100) * 60) + (timeOfDay % 100);

    tim -= 720;

    if (tim < 0)
    {
        tim += 1440;
    }

    tim = (tim * 60000) / gameTrackerX.multGameTime;

    gameTrackerX.timeOfDay = timeOfDay;

    gameTrackerX.currentMaterialTime = gameTrackerX.currentTimeOfDayTime = tim;
}

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
    BLK_FILL *temp; // not from decls.h

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
    gameTracker->maxWipeTime = 30;

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

void GAMELOOP_StreamLevelLoadAndInit(char *baseAreaName, GameTracker *gameTracker, int toSignalNum, int fromSignalNum)
{
    (void)toSignalNum;
    (void)fromSignalNum;

    LoadLevels(baseAreaName, gameTracker);
}

void GAMELOOP_SetScreenWipe(int time, int maxTime, int type)
{
    gameTrackerX.maxWipeTime = maxTime;
    gameTrackerX.wipeTime = time;

    gameTrackerX.wipeType = type;
}

void GAMELOOP_HandleScreenWipes(unsigned long **drawot)
{
    long temp;
    PrimPool *primPool;

    primPool = gameTrackerX.primPool;

    if ((GlobalSave->flags & 0x1))
    {
        DRAW_FlatQuad(&gameTrackerX.wipeColor, 0, 0, 512, 0, 0, 30, 512, 30, primPool, drawot);
        DRAW_FlatQuad(&gameTrackerX.wipeColor, 0, 210, 512, 210, 0, 240, 512, 240, primPool, drawot);
    }

    if (gameTrackerX.wipeTime > 0)
    {
        switch (gameTrackerX.wipeType)
        {
        case 10:
            temp = (gameTrackerX.wipeTime * 255) / gameTrackerX.maxWipeTime;

            DRAW_TranslucentQuad(0, 0, 512, 0, 0, 240, 512, 240, (short)temp, (short)temp, (short)temp, 2, primPool, drawot);
            break;
        case 11:
            temp = (gameTrackerX.wipeTime * 255) / gameTrackerX.maxWipeTime;

            DRAW_TranslucentQuad(0, 0, 512, 0, 0, 30, 512, 30, (short)temp, (short)temp, (short)temp, 2, primPool, drawot);
            DRAW_TranslucentQuad(0, 210, 512, 210, 0, 240, 512, 240, (short)temp, (short)temp, (short)temp, 2, primPool, drawot);

            GlobalSave->flags &= ~0x1;
            break;
        }

        if (gameTrackerX.gameFramePassed != 0)
        {
            gameTrackerX.wipeTime--;
        }
    }
    else if (gameTrackerX.wipeTime < -1)
    {
        switch (gameTrackerX.wipeType)
        {
        case 10:
            temp = ((gameTrackerX.maxWipeTime + gameTrackerX.wipeTime + 2) * 255) / gameTrackerX.maxWipeTime;

            DRAW_TranslucentQuad(0, 0, 512, 0, 0, 240, 512, 240, (short)temp, (short)temp, (short)temp, 2, primPool, drawot);
            break;
        case 11:
            temp = ((gameTrackerX.maxWipeTime + gameTrackerX.wipeTime) * 255) / gameTrackerX.maxWipeTime;

            DRAW_TranslucentQuad(0, 0, 512, 0, 0, 30, 512, 30, (short)temp, (short)temp, (short)temp, 2, primPool, drawot);
            DRAW_TranslucentQuad(0, 210, 512, 210, 0, 240, 512, 240, (short)temp, (short)temp, (short)temp, 2, primPool, drawot);

            if (gameTrackerX.wipeTime == -2)
            {
                GlobalSave->flags |= 0x1;
            }

            break;
        }

        if (gameTrackerX.gameFramePassed != 0)
        {
            gameTrackerX.wipeTime++;
        }
    }
    else if (gameTrackerX.wipeTime == -1)
    {
        if (gameTrackerX.wipeType == 11)
        {
            GlobalSave->flags |= 0x1;
        }
        else
        {
            DRAW_FlatQuad(&gameTrackerX.wipeColor, 0, 0, 512, 0, 0, 240, 512, 240, primPool, drawot);
        }
    }
    else
    {
        theCamera.core.screenScale.x = theCamera.core.screenScale.y = theCamera.core.screenScale.z = 4096;
    }
}

void UpdateFogSettings(StreamUnit *currentUnit, Level *level)
{
    int changed;
    int FogFar;
    int FogNear;
    int setflag;

    changed = 0;

    FogNear = currentUnit->TargetFogNear;
    FogFar = currentUnit->TargetFogFar;

    setflag = 0;

    if (level->fogNear > FogNear)
    {
        level->fogNear -= 500;

        changed = 1;

        if (level->fogNear <= FogNear)
        {
            setflag = 1;

            level->fogNear = FogNear;
        }
    }
    else if (level->fogNear < FogNear)
    {
        level->fogNear += 500;

        changed = 1;

        if (level->fogNear >= FogNear)
        {
            setflag = 1;

            level->fogNear = FogNear;
        }
    }
    else
    {
        setflag = 1;
    }

    if (level->fogFar > FogFar)
    {
        level->fogFar -= 500;

        changed = 1;

        if (level->fogFar <= FogFar)
        {
            level->fogFar = FogFar;
        }
        else
        {
            setflag = 0;
        }
    }
    else if (level->fogFar < FogFar)
    {
        level->fogFar += 500;

        changed = 1;

        if (level->fogFar >= FogFar)
        {
            level->fogFar = FogFar;
        }
        else
        {
            setflag = 0;
        }
    }

    if (changed != 0)
    {
        LIGHT_CalcDQPTable(level);

        if (setflag != 0)
        {
            currentUnit->TargetFogNear = level->fogNear;
            currentUnit->TargetFogFar = level->fogFar;
        }
    }
}

int CheckForNoBlend(ColorType *Color)
{
    if ((Color->r < 5) && (Color->g < 5) && (Color->b < 5))
    {
        return 1;
    }

    return 0;
}

void BlendToColor(ColorType *target, ColorType *current, ColorType *dest)
{
    LoadAverageCol((unsigned char *)target, (unsigned char *)current, 512, 3584, (unsigned char *)dest);

    if ((target->r - dest->r) >= 0)
    {
        if ((target->r - dest->r) >= 5)
        {
            dest->code = 0;

            return;
        }
    }
    else if ((dest->r - target->r) >= 5)
    {
        dest->code = 0;

        return;
    }

    if ((target->g - dest->g) >= 0)
    {
        if ((target->g - dest->g) >= 5)
        {
            dest->code = 0;

            return;
        }
    }
    else if ((dest->g - target->g) >= 5)
    {
        dest->code = 0;

        return;
    }

    if ((target->b - dest->b) >= 0)
    {
        if ((target->b - dest->b) >= 5)
        {
            dest->code = 0;

            return;
        }
    }
    else if ((dest->b - target->b) >= 5)
    {
        dest->code = 0;

        return;
    }

    *(int *)dest = *(int *)target;

    dest->code = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", MainRenderLevel);

void StreamIntroInstancesForUnit(StreamUnit *currentUnit)
{
    if (currentUnit->used == 2)
    {
        SBSP_IntroduceInstances(currentUnit->level->terrain, currentUnit->StreamUnitID);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/GAMELOOP", StreamRenderLevel);

void GAMELOOP_FlipScreenAndDraw(GameTracker *gameTracker, unsigned long **drawot)
{
    DrawOTag((unsigned long *)(drawot + 3071));

    while (CheckVolatile(gameTracker->drawTimerReturn) != 0)
        ;

    ResetPrimPool();

    PutDrawEnv(&draw[gameTracker->drawPage]);

    while (CheckVolatile(gameTracker->reqDisp) != 0)
        ;

    gameTracker->usecsStartDraw = (GetRCnt(0xF2000000) & 0xFFFF) | (gameTimer << 16);

    gameTracker->drawTimerReturn = (long *)&gameTracker->drawTime;

    gameTracker->gameData.asmData.dispPage = 1 - gameTracker->gameData.asmData.dispPage;
}

void GAMELOOP_AddClearPrim(unsigned long **drawot, int override)
{
    if ((!(gameTrackerX.gameFlags & 0x8000000)) || (override != 0))
    {
        BLK_FILL *blkfill;
        int *temp; // not from decls.h

        blkfill = (BLK_FILL *)gameTrackerX.primPool->nextPrim;

        *blkfill = clearRect[gameTrackerX.drawPage];

        gameTrackerX.primPool->nextPrim = (unsigned long *)(blkfill + 1);

        // addPrim(drawot[3071], blkfill);

        temp = (int *)&drawot[3071];

        *(int *)blkfill = getaddr(temp) | 0x3000000;
        *(int *)temp = getaddr(&blkfill);
    }
    else
    {
        BLK_FILL *blkfill;

        blkfill = (BLK_FILL *)gameTrackerX.savedOTStart;

        blkfill->y0 = clearRect[gameTrackerX.drawPage].y0;
    }
}

void GAMELOOP_SwitchTheDrawBuffer(unsigned long **drawot)
{
    GAMELOOP_AddClearPrim(drawot, 0);

    DrawSync(0);

    if (gameTrackerX.drawTimerReturn != NULL)
    {
        gameTrackerX.drawTimerReturn = NULL;

        gameTrackerX.reqDisp = (DISPENV *)gameTrackerX.disp + gameTrackerX.gameData.asmData.dispPage;
    }

    PutDrawEnv(&draw[gameTrackerX.drawPage]);
}

void GAMELOOP_SetupRenderFunction(GameTracker *gameTracker)
{
    gameTracker->drawAnimatedModelFunc = &DRAW_AnimatedModel_S;
    gameTracker->drawDisplayPolytopeListFunc = &DRAW_DisplayPolytopeList_S;
}

StreamUnit *GAMELOOP_GetMainRenderUnit()
{
    StreamUnit *streamUnit;
    Instance *focusInstance;
    StreamUnit *cameraUnit;

    if (theCamera.mode == 5)
    {
        streamUnit = STREAM_WhichUnitPointerIsIn(theCamera.data.Cinematic.posSpline);
    }
    else
    {
        focusInstance = theCamera.focusInstance;

        if ((focusInstance == gameTrackerX.playerInstance) && (gameTrackerX.SwitchToNewStreamUnit != 0))
        {
            streamUnit = STREAM_GetStreamUnitWithID(gameTrackerX.moveRazielToStreamID);

            if (streamUnit == NULL)
            {
                return STREAM_GetStreamUnitWithID(focusInstance->currentStreamUnitID);
            }
        }
        else
        {
            streamUnit = STREAM_GetStreamUnitWithID(focusInstance->currentStreamUnitID);
        }

        cameraUnit = COLLIDE_CameraWithStreamSignals(&theCamera);

        if (cameraUnit != NULL)
        {
            streamUnit = cameraUnit;
        }
    }

    return streamUnit;
}

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

void GAMELOOP_ModeStartRunning()
{
    if ((gameTrackerX.gameMode == 4) || (gameTrackerX.gameMode == 6))
    {
        DEBUG_ExitMenus();

        if (gameTrackerX.gameMode == 6)
        {
            currentMenu = standardMenu;

            SOUND_ResumeAllSound();

            VOICEXA_Resume();
        }
    }

    if ((gameTrackerX.gameFlags & 0x8000000))
    {
        gameTrackerX.gameFlags &= ~0x8000000;

        gameTrackerX.savedOTStart = NULL;

        DrawSync(0);
    }

    gameTrackerX.gameMode = 0;
    gameTrackerX.gameFlags &= ~0x10000000;

    gameTrackerX.playerInstance->flags &= ~0x100;

    gameTrackerX.gameMode = 0;

    GAMEPAD_RestoreControllers();

    INSTANCE_Post(gameTrackerX.playerInstance, 0x10000A, 0);
}

void GAMELOOP_ModeStartPause()
{
    gameTrackerX.gameMode = 6;

    INSTANCE_Post(gameTrackerX.playerInstance, 0x10000A, 1);

    currentMenu = pauseMenu;

    menu_set(gameTrackerX.menu, menudefs_pause_menu);

    SOUND_PauseAllSound();

    VOICEXA_Pause();

    SndPlay(5);

    gameTrackerX.gameFlags |= 0x10000000;

    GAMEPAD_SaveControllers();

    gameTrackerX.gameFlags |= 0x8000000;

    if (gameTrackerX.primPool == primPool[0])
    {
        gameTrackerX.primPool = primPool[1];
    }
    else
    {
        gameTrackerX.primPool = primPool[0];
    }

    gameTrackerX.primPool->nextPrim = &gameTrackerX.primPool->prim[0];

    gameTrackerX.primPool->numPrims = 0;

    SaveOT();

    pause_redraw_flag = 1;
}

void GAMELOOP_ChangeMode()
{
    long *controlCommand;
    int temp; // not from decls.h

    controlCommand = gameTrackerX.controlCommand[0];

    if (!(gameTrackerX.debugFlags & 0x40000))
    {
        if (!(gameTrackerX.debugFlags & 0x200000))
        {
            if ((gameTrackerX.controlCommand[0][0] & 0xA01) == 0xA01)
            {
                theCamera.forced_movement = 1;

                gameTrackerX.playerInstance->position.z += 100;

                gameTrackerX.playerInstance->zVel = 0;

                gameTrackerX.cheatMode = 1;

                INSTANCE_Post(gameTrackerX.playerInstance, 0x100010, 1);

                gameTrackerX.playerInstance->flags &= ~0x800;
            }
            else if ((gameTrackerX.controlCommand[0][0] & 0xA02) == 0xA02)
            {
                theCamera.forced_movement = 1;

                gameTrackerX.playerInstance->position.z -= 100;

                gameTrackerX.playerInstance->zVel = 0;

                gameTrackerX.cheatMode = 0;

                INSTANCE_Post(gameTrackerX.playerInstance, 0x100010, 0);

                gameTrackerX.gameMode = 0;
            }
        }
    }

    if ((!(gameTrackerX.debugFlags & 0x40000)) || ((gameTrackerX.playerCheatFlags & 0x2)))
    {
        if (((controlCommand[1] & 0x60) == 0x60) && (!(controlCommand[0] & 0xF)))
        {
            if (gameTrackerX.gameMode == 0)
            {
                gameTrackerX.gameMode = 4;

                currentMenu = (DebugMenuLine *)&standardMenu;

                if ((unsigned char)gameTrackerX.sound.gVoiceOn != 0)
                {
                    gameTrackerX.debugFlags |= 0x80000;
                }
                else
                {
                    gameTrackerX.debugFlags &= ~0x80000;
                }

                if ((unsigned char)gameTrackerX.sound.gMusicOn != 0)
                {
                    gameTrackerX.debugFlags2 |= 0x1000;
                }
                else
                {
                    gameTrackerX.debugFlags2 &= ~0x1000;
                }

                if ((unsigned char)gameTrackerX.sound.gSfxOn != 0)
                {
                    gameTrackerX.debugFlags2 |= 0x2000;
                }
                else
                {
                    gameTrackerX.debugFlags2 &= ~0x2000;
                }
            }
            else if (gameTrackerX.gameMode == 7)
            {
                DEBUG_EndViewVram(&gameTrackerX);

                gameTrackerX.gameMode = 0;
            }
            else
            {
                GAMELOOP_ModeStartRunning();
            }
        }
    }

    if ((((controlCommand[1] & 0x4000)) || (gamePadControllerOut >= 6)) && (gameTrackerX.gameMode == 0) && (!(gameTrackerX.gameFlags & 0x80)) && ((gameTrackerX.wipeTime == 0) || ((gameTrackerX.wipeType != 11) && (gameTrackerX.wipeTime == -1))))
    {
        GAMELOOP_ModeStartPause();
    }
    else
    {
        temp = controlCommand[1] & 0x4000;

        if (((temp != 0) || ((gameTrackerX.gameFlags & 0x40000000))) && (gameTrackerX.gameMode != 0) && (!(gameTrackerX.gameFlags & 0x20000000)) && ((gameTrackerX.wipeTime == 0) || ((gameTrackerX.wipeType != 11) && (gameTrackerX.wipeTime == -1))))
        {
            if (temp != 0)
            {
                if (!(gameTrackerX.gameFlags & 0x40000000))
                {
                    SndPlay(5);
                }
            }

            gameTrackerX.gameFlags &= ~0x40000000;

            GAMELOOP_ModeStartRunning();
        }
    }

    if ((gameTrackerX.controlCommand[0][0] & 0x40000000))
    {
        gameTrackerX.playerInstance->flags |= 0x100;
    }
    else if ((gameTrackerX.controlCommand[0][2] & 0x40000000))
    {
        gameTrackerX.playerInstance->flags &= ~0x100;
    }
}

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

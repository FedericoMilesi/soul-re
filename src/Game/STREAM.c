#include "common.h"
#include "Game/STREAM.h"
#include "Game/STRMLOAD.h"
#include "Game/GAMELOOP.h"
#include "Game/MEMPACK.h"
#include "Game/INSTANCE.h"
#include "Game/OBTABLE.h"
#include "Game/PSX/AADLIB.h"

void STREAM_FillOutFileNames(char *baseAreaName, char *dramName, char *vramName, char *sfxName);
INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_FillOutFileNames);

void STREAM_AbortAreaLoad(char *baseAreaName)
{
    char vramName[80];

    STREAM_FillOutFileNames(baseAreaName, NULL, vramName, NULL);

    LOAD_AbortDirectoryChange(baseAreaName);

    LOAD_AbortFileLoad(vramName, (void *)VRAM_LoadReturn);
}

void STREAM_Init()
{
    int i;

    for (i = 0; i < 16; i++)
    {
        StreamTracker.StreamList[i].used = 0;

        StreamTracker.StreamList[i].flags = 0;

        StreamTracker.StreamList[i].StreamUnitID = 0;
    }
}

int FindObjectName(char *name)
{
    int i;
    ObjectTracker *otr;

    otr = gameTrackerX.GlobalObjects;

    for (i = 0; i < 48; i++, otr++)
    {
        if ((otr->objectStatus != 0) && (strcmpi(otr->name, name) == 0))
        {
            return i;
        }
    }

    return -1;
}

ObjectTracker *FindObjectInTracker(Object *object)
{
    int i;
    ObjectTracker *otr;

    otr = gameTrackerX.GlobalObjects;

    for (i = 0; i < 48; i++, otr++)
    {
        if ((otr->objectStatus != 0) && (otr->object == object))
        {
            return otr;
        }
    }

    return NULL;
}

StreamUnit *FindStreamUnitFromLevel(Level *level)
{
    StreamUnit *ret;
    long i;

    ret = NULL;

    for (i = 0; i < 16; i++)
    {
        if ((StreamTracker.StreamList[i].used == 2) && (StreamTracker.StreamList[i].level == level))
        {
            ret = &StreamTracker.StreamList[i];
            break;
        }
    }

    return ret;
}

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_LoadObjectReturn);

void STREAM_DumpMonster(ObjectTracker *dumpee)
{
    Object *object;
    Instance *instance;

    object = dumpee->object;

    if (dumpee->vramBlock != NULL)
    {
        VRAM_ClearVramBlock((BlockVramEntry *)dumpee->vramBlock);
    }

    OBTABLE_RemoveObjectEntry(object);

    if (((object->oflags2 & 0x800000)) && (object->sfxFileHandle != 0))
    {
        aadFreeDynamicSfx(object->sfxFileHandle);
    }

    instance = gameTrackerX.instanceList->first;

    if (instance != NULL)
    {
        Instance *next;

        while (instance != NULL)
        {
            next = instance->next;

            if (object == instance->object)
            {
                INSTANCE_ReallyRemoveInstance(gameTrackerX.instanceList, instance, 0);
            }

            instance = next;
        }
    }

    MEMPACK_Free((char *)object);

    dumpee->object = NULL;
}

int STREAM_InList(char *name, char **nameList)
{
    char **mon;

    for (mon = nameList; *mon != NULL; mon++)
    {
        if (strcmpi(name, *mon) == 0)
        {
            return 1;
        }
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_IsSpecialMonster);

void STREAM_DumpSomeMonsters()
{
    ObjectTracker *otr;
    int i;

    otr = gameTrackerX.GlobalObjects;

    for (i = 0; i < 48; i++, otr++)
    {
        if (((otr->objectStatus == 2) && (otr->object != NULL)) && (STREAM_IsSpecialMonster((char *)otr) != 0))
        {
            STREAM_DumpMonster(otr);
        }
    }
}

void STREAM_NoMonsters()
{
    gameTrackerX.gameFlags |= 0x4000000;

    STREAM_DumpSomeMonsters();
}

void STREAM_YesMonsters()
{
    gameTrackerX.gameFlags &= ~0x4000000;
}

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_IsMonster);

int STREAM_TryAndDumpANonResidentObject()
{
    ObjectTracker *otr;
    int i;

    otr = gameTrackerX.GlobalObjects;

    for (i = 0; i < 48; i++, otr++)
    {
        if (STREAM_TryAndDumpNonResident(otr) != 0)
        {
            return i;
        }
    }

    return -1;
}

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", InsertGlobalObject);

ObjectTracker *STREAM_GetObjectTracker(char *name)
{
    int i;

    i = InsertGlobalObject(name, &gameTrackerX);

    if (i == -1)
    {
        return NULL;
    }
    else
    {
        return &gameTrackerX.GlobalObjects[i];
    }
}

void LoadLevelObjects(StreamUnit *stream)
{
    int objlist_pos;
    char name[20];
    Level *level;
    int i;

    STREAM_NextLoadAsNormal();

    objlist_pos = 0;

    while (((unsigned char *)stream->level->objectNameList)[objlist_pos] != 255)
    {
        strcpy(name, (char *)stream->level->objectNameList + objlist_pos);

        InsertGlobalObject(name, &gameTrackerX);

        objlist_pos += 16;
    }

    level = stream->level;

    for (i = 0; i < level->numIntros; i++)
    {
        if (FindObjectName(level->introList[i].name) != -1)
        {
            level->introList[i].flags &= ~0x4000;
        }
        else
        {
            level->introList[i].flags |= 0x4000;
        }
    }
}

long STREAM_IsAnInstanceUsingObject(Object *object)
{
    Instance *instance;
    Instance *next;
    long ret;

    instance = gameTrackerX.instanceList->first;

    ret = 0;

    while (instance != NULL)
    {
        next = instance->next;

        if (instance->object == object)
        {
            ret = 1;
            break;
        }

        instance = next;
    }

    return ret;
}

void STREAM_StreamLoadObjectAbort(void *loadData, void *data, void *data2)
{
    ObjectTracker *objectTracker;

    (void)data2;

    objectTracker = (ObjectTracker *)data;

    if (loadData != NULL)
    {
        MEMPACK_Free((char *)loadData);
    }

    objectTracker->objectStatus = 0;
}

void STREAM_DumpLoadingObjects()
{
    int i;
    ObjectTracker *tracker;

    tracker = gameTrackerX.GlobalObjects;

    for (i = 0; i < 48; i++, tracker++)
    {
        if (tracker->objectStatus == 1)
        {
            STREAM_DumpObject(tracker);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_DumpObject);

int STREAM_IsObjectInAnyUnit(ObjectTracker *tracker)
{
    int d;
    unsigned char *objlist;

    for (d = 0; d < 16; d++)
    {
        if ((StreamTracker.StreamList[d].used == 2) && (StreamTracker.StreamList[d].level != NULL))
        {
            for (objlist = (unsigned char *)StreamTracker.StreamList[d].level->objectNameList; *objlist != 255; objlist += 16)
            {
                if (strcmpi(&tracker->name, (char *)objlist) == 0)
                {
                    return 1;
                }
            }
        }
    }

    return 0;
}

void STREAM_RemoveAllObjectsNotInUse()
{
    int i;
    int abort;
    ObjectTracker *tracker;
    ObjectTracker *trackerList;

    trackerList = gameTrackerX.GlobalObjects;

    for (tracker = trackerList, i = 0; i < 48; i++, tracker++)
    {
        Object *object;

        if (tracker->objectStatus == 2)
        {
            object = tracker->object;

            if ((!(object->oflags & 0x2000000)) && (STREAM_IsObjectInAnyUnit(tracker) == 0)
            && (STREAM_IsAnInstanceUsingObject(object) == 0))
            {
                tracker->objectStatus = 3;
            }
        }
    }

    do
    {
        abort = 1;

        for (tracker = trackerList, i = 0; i < 48; i++, tracker++)
        {
            if (tracker->objectStatus == 3)
            {
                int j;

                for (j = 0; j < (char)tracker->numObjectsUsing; j++)
                {
                    if (trackerList[(int)tracker->objectsUsing[j]].objectStatus != 3)
                    {
                        tracker->objectStatus = 2;

                        abort = 0;
                        break;
                    }
                }
            }
        }
    } while (abort == 0);

    for (tracker = trackerList, i = 0; i < 48; i++, tracker++)
    {
        if (tracker->objectStatus == 3)
        {
            int j;
            ObjectTracker *otr;

            for (otr = trackerList, j = 0; j < 48; j++, otr++)
            {
                if ((otr->objectStatus == 1) || (otr->objectStatus == 2) || (otr->objectStatus == 4))
                {
                    int k;

                    for (k = 0; k < (char)otr->numObjectsUsing; k++)
                    {
                        if ((char)otr->objectsUsing[k] == i)
                        {
                            int l;

                            otr->numObjectsUsing--;

                            for (l = k; l < (char)otr->numObjectsUsing; l++)
                            {
                                otr->objectsUsing[l] = otr->objectsUsing[l + 1];
                            }

                            break;
                        }
                    }
                }
            }

            STREAM_DumpObject(tracker);
        }
    }

    for (tracker = trackerList, i = 0; i < 48; i++, tracker++)
    {
        if ((tracker->objectStatus == 1) && (STREAM_IsObjectInAnyUnit(tracker) == 0) && ((char)tracker->numObjectsUsing == 0))
        {
            STREAM_DumpObject(tracker);
        }
    }
}

void RemoveAllObjects(GameTracker *gameTracker)
{
    int i;
    ObjectTracker *tracker;

    for (i = 0, tracker = &gameTracker->GlobalObjects[i]; i < 48; i++, tracker++)
    {
        if (tracker->objectStatus != 0)
        {
            STREAM_DumpObject(tracker);
        }
    }
}

Level *STREAM_GetLevelWithID(long id)
{
    Level *retLevel;
    long i;

    retLevel = NULL;

    for (i = 0; i < 16; i++)
    {
        if ((StreamTracker.StreamList[i].used == 2) && (StreamTracker.StreamList[i].StreamUnitID == id))
        {
            retLevel = StreamTracker.StreamList[i].level;
            break;
        }
    }

    return retLevel;
}

StreamUnit *STREAM_GetStreamUnitWithID(long id)
{
    StreamUnit *retUnit;
    long i;

    retUnit = NULL;

    for (i = 0; i < 16; i++)
    {
        if ((StreamTracker.StreamList[i].used == 2) && (StreamTracker.StreamList[i].StreamUnitID == id))
        {
            retUnit = &StreamTracker.StreamList[i];
            break;
        }
    }

    return retUnit;
}

void STREAM_CalculateWaterLevel(Level *level)
{
    Terrain *terrain;
    int i;
    TFace *tface;
    long waterZLevel;

    waterZLevel = -32767;

    if (level->waterZLevel == 0)
    {
        if ((level->unitFlags & 0x1))
        {
            level->waterZLevel = 32767;
        }
        else
        {
            terrain = level->terrain;

            tface = (TFace *)terrain->faceList;

            for (i = terrain->numFaces; i > 0; i--, tface++)
            {
                if (((tface->attr & 0x8)) && (terrain->vertexList[tface->face.v0].vertex.z == terrain->vertexList[tface->face.v1].vertex.z)
                && (terrain->vertexList[tface->face.v0].vertex.z == terrain->vertexList[tface->face.v2].vertex.z))
                {
                    if (waterZLevel == -32767)
                    {
                        waterZLevel = terrain->vertexList[tface->face.v0].vertex.z;
                    }
                    else if (waterZLevel != terrain->vertexList[tface->face.v0].vertex.z)
                    {
                        break;
                    }
                }
            }

            if (waterZLevel == -32767)
            {
                level->waterZLevel = -32767;
            }
            else
            {
                level->waterZLevel = waterZLevel + level->terrain->BSPTreeArray[0].globalOffset.z;
            }
        }
    }
}

int STREAM_IsMorphInProgress()
{
    return gameTrackerX.gameData.asmData.MorphTime != 1000;
}

long STREAM_GetWaterZLevel(Level *level, Instance *instance)
{
    int waterZLevel;

    if ((instance->flags2 & 0x8000000))
    {
        if ((!(instance->object->oflags2 & 0x2000000)) && (gameTrackerX.gameData.asmData.MorphTime != 1000))
        {
            waterZLevel = level->waterZLevel;
        }
        else
        {
            waterZLevel = -32767;
        }
    }
    else if ((!(instance->object->oflags2 & 0x2000000)) && (gameTrackerX.gameData.asmData.MorphTime != 1000))
    {
        waterZLevel = -32767;
    }
    else
    {
        waterZLevel = level->waterZLevel;
    }

    return waterZLevel;
}

void STREAM_SetMainFog(StreamUnit *streamUnit)
{
    Level *level;

    level = streamUnit->level;

    if (gameTrackerX.gameData.asmData.MorphType != 0)
    {
        streamUnit->UnitFogNear = level->spectralFogNear;
        streamUnit->UnitFogFar = level->spectralFogFar;
    }
    else
    {
        streamUnit->UnitFogNear = level->holdFogNear;
        streamUnit->UnitFogFar = level->holdFogFar;
    }

    streamUnit->TargetFogNear = streamUnit->UnitFogNear;
    streamUnit->TargetFogFar = streamUnit->UnitFogFar;
}

void STREAM_SetStreamFog(StreamUnit *streamUnit, short fogNear, short fogFar)
{
    short unitFogFar;
    int unitFogHold;

    unitFogFar = FindStreamUnitFromLevel(gameTrackerX.level)->UnitFogFar;

    if (fogFar < unitFogFar)
    {
        unitFogFar = fogFar;
    }

    unitFogHold = unitFogFar - 2000;

    streamUnit->TargetFogFar = unitFogFar;
    streamUnit->UnitFogFar = unitFogFar;

    if (fogNear < unitFogHold)
    {
        unitFogHold = fogNear;
    }

    streamUnit->TargetFogNear = unitFogHold;
    streamUnit->UnitFogNear = unitFogHold;
}

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_ConnectStream);

void STREAM_StreamLoadLevelAbort(void *loadData, void *data, void *data2)
{
    StreamUnit *streamUnit;

    (void)data;

    streamUnit = (StreamUnit *)data2;

    if (loadData != NULL)
    {
        MEMPACK_Free((char *)loadData);
    }

    streamUnit->level = NULL;

    streamUnit->used = 0;

    streamUnit->flags = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_DoObjectLoadAndDump);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_FinishLoad);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_LoadLevelReturn);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_StreamLoadLevelReturn);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_UpdateLevelPointer);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_WhichUnitPointerIsIn);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_UpdateObjectPointer);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_UpdateInstanceCollisionInfo);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_LoadMainVram);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_MoveIntoNewStreamUnit);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_LoadLevel);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RemoveIntroducedLights);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_RemoveInstancesWithIDInInstanceList);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_MarkUnitNeeded);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_DumpUnit);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_DumpAllUnitsNotNeeded);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_DumpAllLevels);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_LoadCurrentWarpRoom);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_RelocateLoadedWarpRooms);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_GetWarpRoomIndex);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_UpdateAddToArray);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_RemoveFromArray);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_Init);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_StartUsingWarpgate);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_EndUsingWarpgate);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsWarpgateInUse);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsWarpgateActive);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsWarpgateUsable);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsWarpgateReady);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsWarpgateSpectral);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsObjectOnWarpSide);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsItActive);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IsUnitWarpRoom);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_FixUnit);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_MarkWarpUnitsNeeded);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_IncrementIndex);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_CalcWarpFade);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_DecrementIndex);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", PreloadAllConnectedUnits);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateLevel);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateCameras);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateSavedCameras);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateLevelWithInstances);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateVMObjects);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateBGObjects);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocatePlanPool);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocatePlanMarkers);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateSFXMarkers);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_AdjustMultiSpline);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_RelocateInstance);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_OffsetInstancePosition);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_SetInstancePosition);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateInstances);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", RelocateStreamPortals);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_PackVRAMObject);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_SetupInstanceFlags);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_SetupInstanceListFlags);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_InMorphInstanceListFlags);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_InMorphDoFadeValues);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_UpdateTimeMult);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_UpdateNormals);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_BringBackNormals);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_AddOffsets);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_SubtractOffsets);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_GetComponentsForTrackingPoint);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_AveragePoint);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_UpdateTrackingPoint);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_ToggleMorph);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_DoStep);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_SetFog);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_UpdateTextures);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", MORPH_Continue);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_MORPH_Relocate);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", AddVertex);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", GetPlaneDist);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", CalcVert);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", AddClippedTri);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_GetClipRect);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", GetFogColor);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", DrawFogRectangle);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_RenderAdjacantUnit);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_GetBspTree);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_BlockWarpGateEntrance);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_DrawWarpGateRim);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_HideAllCloudCovers);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_UnHideCloudCoverInUnit);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_RenderWarpGate);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", WARPGATE_RenderWarpUnit);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_DumpNonResidentObjects);

INCLUDE_ASM("asm/nonmatchings/Game/STREAM", STREAM_TryAndDumpNonResident);

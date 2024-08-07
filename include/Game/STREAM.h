#ifndef _STREAM_H_
#define _STREAM_H_

#include "common.h"
#include "Game/STATE.h"
#include "Game/SPLINE.h"

#define OFFSET_DATA(x, offset) (((x) == 0) ? 0 : ((uintptr_t)(x) + offset))
#define IN_BOUNDS(x, level, max) (((uintptr_t)(level) <= (uintptr_t)(x)) && ((uintptr_t)(x) <= (uintptr_t)(max)))

// size: 0x4C
typedef struct Intro {
    // offset: 0000 (16 bytes)
    char name[16];
    // offset: 0010
    long intronum;
    // offset: 0014
    long UniqueID;
    // offset: 0018 (8 bytes)
    struct _Rotation rotation;
    // offset: 0020 (6 bytes)
    struct _Position position;
    // offset: 0026
    short maxRad;
    // offset: 0028
    long maxRadSq;
    // offset: 002C
    long flags;
    // offset: 0030
    void *data;
    // offset: 0034 (668 bytes)
    struct _Instance *instance;
    // offset: 0038
    struct MultiSpline *multiSpline;
    // offset: 003C
    void *dsignal;
    // offset: 0040
    short specturalLightGroup;
    // offset: 0042
    short meshColor;
    // offset: 0044 (6 bytes)
    struct _Position spectralPosition;
    // offset: 004A
    short spad;
} Intro;

// size: 0xC
typedef struct TextureFT3 {
    // offset: 0000
    unsigned char u0;
    // offset: 0001
    unsigned char v0;
    // offset: 0002
    unsigned short clut;
    // offset: 0004
    unsigned char u1;
    // offset: 0005
    unsigned char v1;
    // offset: 0006
    unsigned short tpage;
    // offset: 0008
    unsigned char u2;
    // offset: 0009
    unsigned char v2;
    // offset: 000A
    unsigned short attr;
} TextureFT3;

// size: 0x6
typedef struct _Vertex {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
} Vertex;

// size: 0xC
typedef struct _TVertex {
    // offset: 0000 (6 bytes)
    struct _Vertex vertex;
    // offset: 0006
    unsigned short rgb15;
    // offset: 0008
    unsigned char r0;
    // offset: 0009
    unsigned char g0;
    // offset: 000A
    unsigned char b0;
    // offset: 000B
    unsigned char code;
} TVertex;

typedef struct _MVertex {
    // offset: 0000 (6 bytes)
    struct _Vertex vertex;
    // offset: 0006
    unsigned short normal;
} MVertex;

// size: 0xE
typedef struct _MorphVertex {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
    // offset: 0006
    short vindex;
    // offset: 0008
    short hx;
    // offset: 000A
    short hy;
    // offset: 000C
    short hz;
} MorphVertex;

// size: 0x2
typedef struct _MorphColor {
    short morphColor15;
} MorphColor;

// size: 0x54
typedef struct _Terrain {
    // offset: 0000
    short UnitChangeFlags;
    // offset: 0002
    short spad;
    // offset: 0004
    long lpad2;
    // offset: 0008
    long numIntros;
    // offset: 000C (76 bytes)
    struct Intro *introList;
    // offset: 0010
    long numVertices;
    // offset: 0014
    long numFaces;
    // offset: 0018
    long numNormals;
    // offset: 001C (12 bytes)
    struct _TVertex *vertexList;
    // offset: 0020 (12 bytes)
    struct _TFace *faceList;
    // offset: 0024 (8 bytes)
    struct _Normal *normalList;
    // offset: 0028 (8 bytes)
    struct DrMoveAniTex *aniList;
    // offset: 002C
    long pad;
    // offset: 0030
    void *StreamUnits;
    // offset: 0034 (12 bytes)
    struct TextureFT3 *StartTextureList;
    // offset: 0038 (12 bytes)
    struct TextureFT3 *EndTextureList;
    // offset: 003C (14 bytes)
    struct _MorphVertex *MorphDiffList;
    // offset: 0040 (2 bytes)
    struct _MorphColor *MorphColorList;
    // offset: 0044
    long numBSPTrees;
    // offset: 0048 (36 bytes)
    struct BSPTree *BSPTreeArray;
    // offset: 004C
    short *morphNormalIdx;
    // offset: 0050 (904 bytes)
    struct _MultiSignal *signals;
} Terrain;

// size: 0x4
typedef struct TClassAttr {
    // offset: 0000
    short flags;
    // offset: 0002
    unsigned short sound;
} TClassAttr;

// size: 0x6
typedef struct _VMOffset {
    // offset: 0000
    short dx;
    // offset: 0002
    short dy;
    // offset: 0004
    short dz;
} VMOffset;

// size: 0x3
typedef struct _VMColorOffset {
    // offset: 0000
    char dr;
    // offset: 0001
    char dg;
    // offset: 0002
    char db;
} VMColorOffset;

// size: 0xC
typedef struct _VMOffsetTable {
    // offset: 0000
    long numVMOffsets;
    // offset: 0004 (6 bytes)
    // size: 0x6
    union {
        // offset: 0000 (6 bytes)
        struct _VMOffset moveOffsets;
        // offset: 0000 (3 bytes)
        struct _VMColorOffset colorOffsets;
    } offsets;
} VMOffsetTable;

// size: 0x3C
typedef struct _VMObject {
    // offset: 0000
    unsigned short flags;
    // offset: 0002
    short bspIdx;
    // offset: 0004
    short materialIdx;
    // offset: 0006
    short spectralIdx;
    // offset: 0008
    short currentIdx;
    // offset: 000A
    short timeScale;
    // offset: 000C
    long timer;
    // offset: 0010 (6 bytes)
    struct _Position position;
    // offset: 0016
    short radius;
    // offset: 0018
    long radiusSquared;
    // offset: 001C
    long numVMOffsetTables;
    // offset: 0020 (12 bytes)
    struct _VMOffsetTable **vmoffsetTableList;
    // offset: 0024 (12 bytes)
    struct _VMOffsetTable *curVMOffsetTable;
    // offset: 0028
    long numVMVertices;
    // offset: 002C
    void *vmvertexList;
    // offset: 0030
    long numVMInterpolated;
    // offset: 0034 (8 bytes)
    struct _VMInterpolated *vminterpolatedList;
    // offset: 0038
    char *name;
} VMObject;

// size: 0x188
typedef struct Level {
    // offset: 0000 (84 bytes)
    struct _Terrain *terrain;
    // offset: 0004 (12 bytes)
    struct LightList *lightList;
    // offset: 0008
    long numVMObjects;
    // offset: 000C (60 bytes)
    struct _VMObject *vmobjectList;
    // offset: 0010
    long numSpotLights;
    // offset: 0014 (40 bytes)
    struct SpotLight *spotLightList;
    // offset: 0018
    long numPointLights;
    // offset: 001C (24 bytes)
    struct PointLight *pointLightList;
    // offset: 0020
    long numSpotSpecturalLights;
    // offset: 0024 (40 bytes)
    struct SpotLight *spotSpecturalLightList;
    // offset: 0028
    long numPointSpecturalLights;
    // offset: 002C (24 bytes)
    struct PointLight *pointSpecturalLightList;
    // offset: 0030
    long numBGObjects;
    // offset: 0034 (24 bytes)
    struct _BGObject *bgObjectList;
    // offset: 0038
    long waterZLevel;
    // offset: 003C
    unsigned char backColorR;
    // offset: 003D
    unsigned char backColorG;
    // offset: 003E
    unsigned char backColorB;
    // offset: 003F
    unsigned char cpad1;
    // offset: 0040
    unsigned char specturalColorR;
    // offset: 0041
    unsigned char specturalColorG;
    // offset: 0042
    unsigned char specturalColorB;
    // offset: 0043
    unsigned char cpad2;
    // offset: 0044
    unsigned short fogFar;
    // offset: 0046
    unsigned short fogNear;
    // offset: 0048
    unsigned short spectralFogFar;
    // offset: 004A
    unsigned short spectralFogNear;
    // offset: 004C
    unsigned short waterFogFar;
    // offset: 004E
    unsigned short waterFogNear;
    // offset: 0050
    long depthQBlendStart;
    // offset: 0054 (12 bytes)
    struct LightList *spectrallightList;
    // offset: 0058
    long numCameras;
    // offset: 005C
    void *cameraList;
    // offset: 0060
    long bspPlaneError;
    // offset: 0064
    long numVGroups;
    // offset: 0068 (12 bytes)
    struct _VGroup *vGroupList;
    // offset: 006C
    long deathZ;
    // offset: 0070
    long flags;
    // offset: 0074 (904 bytes)
    struct _MultiSignal *startSignal;
    // offset: 0078
    long numIntros;
    // offset: 007C (76 bytes)
    struct Intro *introList;
    // offset: 0080 (8 bytes)
    struct DrMoveAniTex *bgAniList;
    // offset: 0084
    long numHotSpots;
    // offset: 0088 (8 bytes)
    struct _HotSpot *hotSpotList;
    // offset: 008C
    void *objectNameList;
    // offset: 0090
    long depthQFogStart;
    // offset: 0094
    long morphLastStep;
    // offset: 0098
    char *worldName;
    // offset: 009C (8 bytes)
    struct VramSize vramSize;
    // offset: 00A4
    unsigned short holdFogFar;
    // offset: 00A6
    unsigned short holdFogNear;
    // offset: 00A8
    long numberEnemyUnits;
    // offset: 00AC
    char **enemyUnitsNames;
    // offset: 00B0
    long **timesSignalList;
    // offset: 00B4 (904 bytes)
    struct _MultiSignal *spectralSignal;
    // offset: 00B8 (904 bytes)
    struct _MultiSignal *materialSignal;
    // offset: 00BC (904 bytes)
    struct _MultiSignal *startUnitLoadedSignal;
    // offset: 00C0 (904 bytes)
    struct _MultiSignal *startUnitMainSignal;
    // offset: 00C4 (904 bytes)
    struct _MultiSignal *startGoingIntoWaterSignal;
    // offset: 00C8 (904 bytes)
    struct _MultiSignal *startGoingOutOfWaterSignal;
    // offset: 00CC
    long unitFlags;
    // offset: 00D0 (904 bytes)
    struct _MultiSignal *SignalListStart;
    // offset: 00D4 (904 bytes)
    struct _MultiSignal *SignalListEnd;
    // offset: 00D8
    long numBSPLeaves;
    // offset: 00DC
    struct EventPointers *PuzzleInstances;
    // offset: 00E0
    long NumberOfPlanMarkers;
    // offset: 00E4 (8 bytes)
    struct _PlanMkr *PlanMarkerList;
    // offset: 00E8
    long NumberOfSFXMarkers;
    // offset: 00EC (36 bytes)
    struct _SFXMkr *SFXMarkerList;
    // offset: 00F0
    unsigned long versionNumber;
    // offset: 00F4
    char *dynamicMusicName;
    // offset: 00F8
    long streamUnitID;
    // offset: 00FC (64 bytes)
    struct TClassAttr tClassAttr[16];
    // offset: 013C (24 bytes)
    short TODLighting[3][4];
    // offset: 0154 (12 bytes)
    unsigned char TODbackColor[3][4];
    // offset: 0160 (16 bytes)
    unsigned short TODfogNearFar[2][4];
    // offset: 0170
    short TODRedScale;
    // offset: 0172
    short TODGrnScale;
    // offset: 0174
    short TODBluScale;
    // offset: 0176
    short TODfogNear;
    // offset: 0178
    short TODfogFar;
    // offset: 017A
    short short_pad;
    // offset: 017C
    unsigned char TODbackColorR;
    // offset: 017D
    unsigned char TODbackColorG;
    // offset: 017E
    unsigned char TODbackColorB;
    // offset: 017F
    unsigned char cpad3;
    // offset: 0180 (64 bytes)
    struct LightGroup *razielLightGroup;
    // offset: 0184 (64 bytes)
    struct LightGroup *razielSpectralLightGroup;
} Level;

// size: 0x40
typedef struct _StreamUnit {
    // offset: 0000
    long StreamUnitID;
    // offset: 0004
    short used;
    // offset: 0006
    short flags;
    // offset: 0008 (392 bytes)
    struct Level *level;
    // offset: 000C (16 bytes)
    char baseAreaName[16];
    // offset: 001C
    short toSignal;
    // offset: 001E
    short fromSignal;
    // offset: 0020
    long FrameCount;
    // offset: 0024 (12 bytes)
    short eventVariables[6];
    // offset: 0030
    long FogColor;
    // offset: 0034
    short UnitFogFar;
    // offset: 0036
    short UnitFogNear;
    // offset: 0038
    short TargetFogFar;
    // offset: 003A
    short TargetFogNear;
    // offset: 003C
    short sfxFileHandle;
    // offset: 003E
    short pad;
} StreamUnit;

// size: 0x400
typedef struct STracker {
    // offset: 0000 (1024 bytes)
    struct _StreamUnit StreamList[16];
} STracker;

// size: 0x5C
typedef struct StreamUnitPortal {
    // offset: 0000 (16 bytes)
    char tolevelname[16];
    // offset: 0010
    long MSignalID;
    // offset: 0014
    long streamID;
    // offset: 0018
    short minx;
    // offset: 001A
    short miny;
    // offset: 001C
    short minz;
    // offset: 001E
    short flags;
    // offset: 0020
    short maxx;
    // offset: 0022
    short maxy;
    // offset: 0024
    short maxz;
    // offset: 0026
    short pad2;
    // offset: 0028 (64 bytes)
    struct _StreamUnit *toStreamUnit;
    // offset: 002C (24 bytes)
    struct _SVector t1[3];
    // offset: 0044 (24 bytes)
    struct _SVector t2[3];
} StreamUnitPortal;

// size: 0x14
typedef struct WarpRoom {
    // offset: 0000 (16 bytes)
    char name[16];
    // offset: 0010 (64 bytes)
    struct _StreamUnit *streamUnit;
} WarpRoom;

// size: 0x14
typedef struct WarpGateLoadInformation {
    // offset: 0000
    int warpgate_in_use;
    // offset: 0004
    char loading;
    // offset: 0005
    char blocked;
    // offset: 0006
    short fadeValue;
    // offset: 0008
    long curTime;
    // offset: 000C
    long maxTime;
    // offset: 0010 (668 bytes)
    struct _Instance *warpFaceInstance;
} WarpGateLoadInformation;

STracker StreamTracker;
WarpRoom WarpRoomArray[14];
long CurrentWarpNumber;

Level *STREAM_GetLevelWithID(long id);
void STREAM_RelocateInstance(Instance *instance, SVector *offset);
void MORPH_SetupInstanceFlags(Instance *instance);
void STREAM_SetInstancePosition(Instance *instance, evPositionData *data);
StreamUnit *STREAM_GetStreamUnitWithID(long id);
ObjectTracker *STREAM_GetObjectTracker(char *name);
StreamUnit *FindStreamUnitFromLevel(Level *level);
int STREAM_IsSpecialMonster(char *name);
int STREAM_TryAndDumpNonResident(ObjectTracker *otr);
void STREAM_DumpObject(ObjectTracker *objectTracker);
void STREAM_FinishLoad(StreamUnit *streamUnit);
void STREAM_DumpUnit(StreamUnit *streamUnit, long doSave);
long WARPGATE_IsUnitWarpRoom(StreamUnit *streamUnit);
void WARPGATE_RemoveFromArray(StreamUnit *streamUnit);
void STREAM_ConnectStream(StreamUnit *streamUnit);
void STREAM_DumpAllLevels(long IDNoRemove, int DoSave);
void STREAM_PackVRAMObject(ObjectTracker *objectTracker);
int STREAM_IsMonster(char *name);
void WARPGATE_UpdateAddToArray(StreamUnit *streamUnit);
void MORPH_UpdateNormals(Level *BaseLevel);
void WARPGATE_FixUnit(StreamUnit *streamUnit);
void STREAM_AdjustMultiSpline(MultiSpline *multi, SVector *offset);
StreamUnit *STREAM_LoadLevel(char *baseAreaName, StreamUnitPortal *streamPortal, int loadnext);
void PreloadAllConnectedUnits(StreamUnit *streamUnit, SVector *offset);
void STREAM_OffsetInstancePosition(Instance *instance, SVector *offset, int streamSignalFlag);
long WARPGATE_GetWarpRoomIndex(char *name);
void MORPH_BringBackNormals(Level *BaseLevel);
void WARPGATE_DrawWarpGateRim(StreamUnit *streamUnit, long drawOn);
void WARPGATE_HideAllCloudCovers();
Instance *WARPGATE_UnHideCloudCoverInUnit(long streamUnitID);
void WARPGATE_RenderWarpUnit(unsigned long **mainOT, StreamUnitPortal *curStreamPortal, StreamUnit *mainStreamUnit, RECT *cliprect);
void WARPGATE_BlockWarpGateEntrance(StreamUnit *streamUnit, long collideOn);
long GetFogColor(StreamUnitPortal *portal, StreamUnit *mainStreamUnit, Level *mainLevel);
void DrawFogRectangle(RECT *cliprect, PrimPool *primPool, int otzpos, unsigned long **drawot, long color);
long StreamRenderLevel(StreamUnit *currentUnit, Level *mainLevel, unsigned long **drawot, long portalFogColor);
int AddClippedTri(SVECTOR *iv, RECT *cliprect, int *minz);

#endif

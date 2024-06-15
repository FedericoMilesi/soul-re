#ifndef _SIGNAL_H_
#define _SIGNAL_H_

#include "common.h"

typedef struct Signal 
{
    long id; // size=0, offset=0
    union {
        struct {
            union {
                long l; // size=0, offset=0
                short s[2]; // size=4, offset=0
                char c[4]; // size=4, offset=0
            } size; // size=4, offset=0
        } misc[3]; // size=12, offset=0
        struct _CameraKey* cameraKey; // size=24, offset=0
        struct {
            short x; // size=0, offset=0
            short y; // size=0, offset=2
            short z; // size=0, offset=4
            short zrot; // size=0, offset=6
            struct _SVector offset; // size=8, offset=8
        } teleport; // size=16, offset=0
        struct {
            long index; // size=0, offset=0
            long value; // size=0, offset=4
        } cameraValue; // size=8, offset=0
        struct {
            long index; // size=0, offset=0
            long value; // size=0, offset=4
        } miscValue; // size=8, offset=0
        struct {
            long index; // size=0, offset=0
            long value; // size=0, offset=4
        } logicValue; // size=8, offset=0
        long timer; // size=0, offset=0
        long times; // size=0, offset=0
        long lightGroup; // size=0, offset=0
        long farPlane; // size=0, offset=0
        long cameraAdjust; // size=0, offset=0
        long cameraMode; // size=0, offset=0
        long cameraLock; // size=0, offset=0
        long cameraUnlock; // size=0, offset=0
        long cameraSmooth; // size=0, offset=0
        long cameraTimer; // size=0, offset=0
        struct {
            long time; // size=0, offset=0
            long scale; // size=0, offset=4
        } cameraShake; // size=8, offset=0
        long cameraSave; // size=0, offset=0
        long cameraRestore; // size=0, offset=0
        struct _BGObject* bgObject; // size=24, offset=0
        long value[2]; // size=8, offset=0
        struct {
            long action; // size=0, offset=0
            long value[2]; // size=8, offset=4
        } sound; // size=12, offset=0
        void* intro; // size=0, offset=0
        long deathZ; // size=0, offset=0
        struct {
            void* intro; // size=0, offset=0
            void* data; // size=0, offset=4
        } dsignal; // size=8, offset=0
        void* mirror; // size=0, offset=0
        long fogNear; // size=0, offset=0
        long fogFar; // size=0, offset=0
        struct {
            void* intro; // size=0, offset=0
            long frame; // size=0, offset=4
        } gotoFrame; // size=8, offset=0
        struct {
            void* intro; // size=0, offset=0
            long model; // size=0, offset=4
        } changeModel; // size=8, offset=0
        void* vmObject; // size=0, offset=0
        struct {
            unsigned char target; // size=0, offset=0
            unsigned char source1; // size=0, offset=1
            unsigned char source2; // size=0, offset=2
            unsigned char pad; // size=0, offset=3
            struct Signal* gotoLabel; // size=0, offset=4
        } logic; // size=8, offset=0
        void* callSignal; // size=0, offset=0
        struct _SVector offset; // size=8, offset=0
        struct Signal* gotoLabel; // size=0, offset=0
        struct Signal* gosubLabel; // size=0, offset=0
        struct {
            long timer; // size=0, offset=0
            long action; // size=0, offset=4
        } control; // size=8, offset=0
        struct {
            short index; // size=0, offset=0
            short z; // size=0, offset=2
            struct _MultiSignal* upSignal; // size=0, offset=4
            struct _MultiSignal* downSignal; // size=0, offset=8
        } zSignal; // size=12, offset=0
        struct {
            long currentnum; // size=0, offset=0
            long streamID; // size=0, offset=4
            char toname[16]; // size=16, offset=8
        } StreamLevel; // size=24, offset=0
        struct {
            char num; // size=0, offset=0
            char vel; // size=0, offset=1
            short misc; // size=0, offset=2
            char flags; // size=0, offset=4
            char timeToLive; // size=0, offset=5
            short dummy2; // size=0, offset=6
            struct Object* object; // size=0, offset=8
        } shards; // size=12, offset=0
        struct {
            long index; // size=0, offset=0
            void* intro; // size=0, offset=4
        } cameraSpline; // size=8, offset=0
        struct {
            short type; // size=0, offset=0
            short time; // size=0, offset=2
        } screenWipe; // size=4, offset=0
        long voiceSitId; // size=0, offset=0
        struct {
            long time; // size=0, offset=0
            void* intro; // size=0, offset=4
        } introFX; // size=8, offset=0
        struct {
            void* intro; // size=0, offset=0
            struct Signal* gotoLabel; // size=0, offset=4
        } introActive; // size=8, offset=0
        struct {
            char world[9]; // size=9, offset=0
            char level[9]; // size=9, offset=9
        } levelChange; // size=18, offset=0
        long blendStart; // size=0, offset=0
        struct {
            struct Signal* signal; // size=0, offset=0
            long times; // size=0, offset=4
        } setTimes; // size=8, offset=0
        struct {
            unsigned char r; // size=0, offset=0
            unsigned char g; // size=0, offset=1
            unsigned char b; // size=0, offset=2
            unsigned char pad; // size=0, offset=3
        } color; // size=4, offset=0
        struct {
            short x; // size=0, offset=0
            short y; // size=0, offset=2
            short time; // size=0, offset=4
            short index; // size=0, offset=6
            char* text; // size=0, offset=8
        } print; // size=12, offset=0
        long slideAngle; // size=0, offset=0
    } data; // size=24, offset=4
} Signal;

// size: 0x388
typedef struct _MultiSignal {
	// offset: 0000
	long numSignals;
	// offset: 0004
	short signalNum;
	// offset: 0006
	short flags;
	// offset: 0008 (896 bytes)
	struct Signal signalList[32];
} MultiSignal;

void SIGNAL_HandleSignal(Instance *instance, Signal *signal, int dontForceDoSignal);

#endif

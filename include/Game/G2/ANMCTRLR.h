#ifndef _ANMCTRLR_H_
#define _ANMCTRLR_H_

#include "Game/G2/ANIMG2.h"

typedef struct _G2AnimController_Type
{
    unsigned short next;
    unsigned char type;
    unsigned char segNumber;
    void *callbackData;
    unsigned short flags;
    short duration;
    short elapsedTime;
    struct _G2AnimAlphaTable_Type *alphaTable;
    union {
        struct {
            unsigned long (*function)();
            void *fnData;
        } callback;
        struct {
            struct _G2SVector3_Type base;
            struct _G2SVector3_Type offset;
        } vector;
        struct {
            struct _G2Quat_Type src;
            struct _G2Quat_Type dest;
        } quat;
    } data;
} G2AnimController;

// size: 0x10
typedef struct _G2AnimControllerPool_Type {
    // offset: 0000
    unsigned short blockSize;
    // offset: 0002
    unsigned short stackTop;
    // offset: 0004
    unsigned short stackSize;
    // offset: 0008
    unsigned short *stack;
    // offset: 000C (36 bytes)
    struct _G2AnimController_Type *blockPool;
} G2AnimControllerPool;

G2Bool G2Anim_IsControllerActive(G2Anim *anim, int segNumber, int type);
void G2Anim_DisableController(G2Anim *anim, int segNumber, int type);
void G2Anim_SetControllerAngleOrder(G2Anim *anim, int segNumber, int type, int order);
void G2Anim_EnableController(G2Anim *anim, int segNumber, int type);
void G2Anim_SetController_Vector(G2Anim *anim, int segNumber, int type, G2SVector3 *vector);
void G2Anim_InterpDisableController(G2Anim *anim, int segNumber, int type, short duration);
void _G2AnimController_InsertIntoList(G2AnimController *controller, unsigned short *listPtr);
G2AnimController *_G2AnimController_Create(int segNumber, int type);
G2AnimController *_G2AnimControllerST_FindPtrInList(int segNumber, int type, unsigned short **listPtrPtr);
G2AnimController *_G2AnimController_Destroy(G2AnimController *controller);
G2AnimController *_G2AnimControllerST_RemoveFromList(int segNumber, int type, unsigned short *listPtr);
G2AnimController *_G2AnimControllerST_FindInList(int segNumber, int type, unsigned short *listPtr);
void _G2AnimController_GetSimpleWorldRotQuat(G2AnimController *controller, G2Anim *anim, G2Quat *quat);
void G2Anim_SetInterpController_Quat(G2Anim *anim, int segNumber, int type, G2Quat *quat, int duration);
G2AnimController *_G2Anim_FindController(G2Anim *anim, int segNumber, int type);
void _G2AnimController_GetCurrentInterpQuat(G2AnimController *controller, G2Anim *anim, G2Quat *quat);

#endif

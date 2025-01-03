#ifndef _ANMCTRLR_H_
#define _ANMCTRLR_H_

#include "common.h"

void G2Anim_SetInterpController_Quat(G2Anim *anim, int segNumber, int type, G2Quat *quat, int duration);
G2AnimController *_G2AnimController_Create(int segNumber, int type);
G2AnimController *_G2AnimControllerST_FindPtrInList(int segNumber, int type, unsigned short **listPtrPtr);
G2AnimController *_G2AnimController_Destroy(G2AnimController *controller);
G2AnimController *_G2AnimControllerST_RemoveFromList(int segNumber, int type, unsigned short *listPtr);
G2AnimController *_G2AnimControllerST_FindInList(int segNumber, int type, unsigned short *listPtr);
void _G2AnimController_InsertIntoList(G2AnimController *controller, unsigned short *listPtr);
void _G2AnimController_GetSimpleWorldRotQuat(G2AnimController *controller, G2Anim *anim, G2Quat *quat);
G2AnimController *_G2Anim_FindController(G2Anim *anim, int segNumber, int type);
void _G2AnimController_GetCurrentInterpQuat(G2AnimController *controller, G2Anim *anim, G2Quat *quat);
void _G2AnimSection_ApplyControllersToStoredFrame(G2AnimSection *section);
void _G2AnimController_GetMatrix(G2AnimController *controller, G2Matrix *matrix);
void _G2AnimController_GetVector(G2AnimController *controller, G2SVector3 *vector);
unsigned long _G2AnimController_ApplyToSegValue(G2AnimController *controller, G2AnimSegValue *segValue, G2Matrix *segMatrix, G2Matrix *parentMatrix);
void _G2Anim_BuildTransformsWithControllers(G2Anim *anim);

#endif

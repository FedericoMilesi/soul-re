#ifndef _ANIMG2_H_
#define _ANIMG2_H_

#include "common.h"

void G2Anim_Restore(G2Anim *anim);
void G2Anim_Free(G2Anim *anim);
G2Bool G2Anim_SegmentHasActiveChannels(G2Anim *anim, int segNumber, unsigned short chanMask);
void G2Anim_Init(G2Anim *anim, Model *modelData);
void G2Anim_UpdateStoredFrame(G2Anim *anim);
void G2Anim_GetSegChannelValue(G2Anim *anim, int segIndex, unsigned short *valueTable, unsigned short channelMask);
void G2Anim_BuildTransforms(G2Anim *anim);
G2AnimSection *G2Anim_AddSection(G2Anim *anim, int firstSegID, int segCount);
void G2Anim_SetInterpController_Vector(G2Anim *anim, int segNumber, int type, G2SVector3 *vector, int duration);
void G2Anim_SetControllerCallbackData(G2Anim *anim, int segNumber, int type, void *callbackData);
void G2AnimSection_SwitchToKeylistAtTime(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, short targetTime);
void G2Anim_ResetInternalState();
G2Bool G2Anim_Install();
void G2Anim_SwitchToKeylist(G2Anim *anim, G2AnimKeylist *keylist, int keylistID);
short G2AnimSection_NextKeyframe(G2AnimSection *section);
void G2AnimSection_SetInterpInfo(G2AnimSection *section, G2AnimInterpInfo *newInfoPtr);
void G2Anim_SetCallback(G2Anim *anim, long (*callback)(), void *data);
void G2AnimSection_SetAlphaTable(G2AnimSection *section, G2AnimAlphaTable *table);
void G2AnimSection_InterpToKeylistFrame(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, int targetFrame, int duration);
void G2AnimSection_SetPaused(G2AnimSection *section);
void G2AnimSection_SetUnpaused(G2AnimSection *section);
void G2AnimSection_SetLooping(G2AnimSection *section);
void G2AnimSection_SetNoLooping(G2AnimSection *section);
void G2Anim_SetAlphaTable(G2Anim *anim, G2AnimAlphaTable *table);
void G2Anim_InterpToKeylistFrame(G2Anim *anim, G2AnimKeylist *keylist, int keylistID, int targetFrame, short duration);
void G2Anim_SetPaused(G2Anim *anim);
void G2Anim_SetUnpaused(G2Anim *anim);
void G2Anim_SetLooping(G2Anim *anim);
void G2Anim_SetNoLooping(G2Anim *anim);
int G2AnimKeylist_GetKeyframeCount(G2AnimKeylist *keylist);
int G2AnimSection_GetKeyframeNumber(G2AnimSection *section);
int G2AnimSection_GetStoredKeyframeNumber(G2AnimSection *section);
G2AnimKeylist *G2Anim_GetKeylist(G2Anim *anim);
G2Bool G2AnimSection_IsInInterpolation(G2AnimSection *section);
short G2AnimKeylist_GetDuration(G2AnimKeylist *keylist);
short G2Anim_GetElapsedTime(G2Anim *anim);
void G2Anim_GetRootMotionOverInterval(G2Anim *anim, short intervalStart, short intervalEnd, G2SVector3 *motionVector);
void G2Anim_SetSpeedAdjustment(G2Anim *anim, long adjustment);
G2Bool G2Anim_IsControllerActive(G2Anim *anim, int segNumber, int type);
void G2Anim_DisableController(G2Anim *anim, int segNumber, int type);
void G2Anim_SetControllerAngleOrder(G2Anim *anim, int segNumber, int type, int order);
void G2Anim_EnableController(G2Anim *anim, int segNumber, int type);
void G2Anim_SetController_Vector(G2Anim *anim, int segNumber, int type, G2SVector3 *vector);
void G2Anim_InterpDisableController(G2Anim *anim, int segNumber, int type, short duration);
void G2Anim_AttachControllerToSeg(G2Anim *anim, int segNumber, int type);
void G2Anim_DetachControllerFromSeg(G2Anim *anim, int segNumber, int type);
G2Bool G2Anim_IsControllerInterpolating(G2Anim *anim, int segNumber, int type);

#endif

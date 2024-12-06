#ifndef _ANMG2ILF_H_
#define _ANMG2ILF_H_

#include "common.h"

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
void G2AnimSection_SetLoopRangeAll(G2AnimSection *section);
void G2AnimSection_ClearAlarm(G2AnimSection *section, unsigned long flag);
void G2AnimSection_SetUnpaused(G2AnimSection *section);
void G2AnimSection_SwitchToKeylist(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID);
void G2AnimSection_SetNotRewinding(G2AnimSection *section);
void G2Anim_SetSpeedAdjustment(G2Anim *anim, long adjustment);

#endif

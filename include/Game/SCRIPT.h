#ifndef _SCRIPT_H_
#define _SCRIPT_H_

#include "common.h"
#include "Game/SPLINE.h"

MultiSpline *SCRIPT_GetMultiSpline(Instance *instance, unsigned long *isParent, unsigned long *isClass);
SplineDef *SCRIPT_GetPosSplineDef(Instance *instance, MultiSpline *multi, unsigned long isParent, unsigned long isClass);
int SCRIPT_GetSplineFrameNumber(Instance *instance, SplineDef *splineDef);
void ScriptKillInstance(Instance *instance, int effect);

#endif

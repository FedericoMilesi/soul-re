#ifndef _INSTNCG2_H_
#define _INSTNCG2_H_

#include "common.h"

G2AnimKeylist *G2Instance_GetKeylist(Instance *instance, int id);
void _G2Instance_BuildAnimatedTransforms(Instance *instance);
void _G2Instance_BuildNonAnimatedTransforms(Instance *instance);
void _G2Instance_RebuildAnimatedTransforms(Instance *instance);
void _G2Instance_RebuildNonAnimatedTransforms(Instance *instance);
void _G2Instance_BuildFacadeTransforms(Instance *instance, Segment *segment, MATRIX *segMatrix, MATRIX *matrixPool, long scale_flag);
void _G2Instance_BuildDeactivatedTransforms(Instance *instance);
void G2Instance_BuildTransforms(Instance *instance);
void G2Instance_RebuildTransforms(Instance *instance);
void G2Instance_BuildTransformsForList(Instance *listHead);

#endif

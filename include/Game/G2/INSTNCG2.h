#ifndef _INSTNCG2_H_
#define _INSTNCG2_H_

#include "common.h"
#include "Game/G2/ANIMG2.h"

G2AnimKeylist *G2Instance_GetKeylist(Instance *instance, int id);
void _G2Instance_BuildAnimatedTransforms(Instance *instance);
void _G2Instance_BuildNonAnimatedTransforms(Instance *instance);
void _G2Instance_RebuildAnimatedTransforms(Instance *instance);
void _G2Instance_RebuildNonAnimatedTransforms(Instance *instance);
void _G2Instance_BuildFacadeTransforms(Instance *instance, Segment *segment, MATRIX *segMatrix, MATRIX *matrixPool, long scale_flag);

#endif

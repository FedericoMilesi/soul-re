#ifndef _HASM_H_
#define _HASM_H_

#include "common.h"
#include "Game/G2/QUATG2.h"
#include "Game/PIPE3D.h"

void G2Quat_ToMatrix_S(G2Quat *quat, G2Matrix *matrix);
short MATH3D_racos_S(long a);
long COLLIDE_IntersectLineAndPlane_S(SVector *planePoint, Position *oldPos, Position *position, SVector *normal, long z);
int CheckVolatile(void *);
void G2Quat_FromEuler_S(G2Quat *quatInfo, G2EulerAngles *preQuat);
void COLLIDE_NearestPointOnLine_S(SVector *linePoint, SVECTOR *oldPoint, SVECTOR *newPoint, Position *position);
void G2Quat_FromMatrix_S(G2Quat *quat, G2Matrix *matrix);
unsigned long *DRAW_SplitModel_S(Model *model, Instance *instance, VertexPool *textexPool, MATRIX *transform, PrimPool *primPool, unsigned long **ot);

#endif

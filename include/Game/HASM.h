#ifndef _HASM_H_
#define _HASM_H_

#include "common.h"

void G2Quat_ToMatrix_S(G2Quat *quat, G2Matrix *matrix);
short MATH3D_racos_S(long a);
long COLLIDE_IntersectLineAndPlane_S(SVector *planePoint, Position *oldPos, Position *position, SVector *normal, long z);
void COLLIDE_NearestPointOnPlane_S(SVector *planePoint, SVector *normal, long z, Position *position);
int CheckVolatile(void *);
void G2Quat_FromEuler_S(G2Quat *quatInfo, G2EulerAngles *preQuat);
void COLLIDE_NearestPointOnLine_S(SVector *linePoint, SVECTOR *oldPoint, SVECTOR *newPoint, Position *position);
void G2Quat_FromMatrix_S(G2Quat *quat, G2Matrix *matrix);
unsigned long *DRAW_SplitModel_S(Model *model, Instance *instance, VertexPool *textexPool, MATRIX *transform, PrimPool *primPool, unsigned long **ot);
long PIPE3D_TransformAnimatedInstanceVertices_S(VertexPool *vertexPool, PVertex *poolVertex, Model *model, MATRIX *wcTransform, MATRIX *matrixPool, MATRIX *lm, CVECTOR *vertexColor, CVECTOR *perVertexColor);
int *DRAW_AnimatedModel_S(Model *model, PVertex *poolVertex, PrimPool *primPool, unsigned int **ot, CVECTOR *vertexColor);
unsigned int *DRAW_DisplayPolytopeList_S(PolytopeList *polytopeList, Terrain *terrain, Camera *camera, PrimPool *primPool, unsigned int **drawot, Position *globalOffset);

#endif

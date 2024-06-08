#ifndef _HASM_H_
#define _HASM_H_

#include "common.h"
#include "Game/G2/QUATG2.h"

int rcos(int);
int rsin(int);
void RotMatrix(SVECTOR *, MATRIX *);
void ScaleMatrix(MATRIX *, VECTOR *);
void G2Quat_ToMatrix_S(G2Quat *quat, G2Matrix *matrix);

#endif

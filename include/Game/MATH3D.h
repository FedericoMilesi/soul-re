#ifndef _MATH3D_H_
#define _MATH3D_H_

#include "common.h"

#define abs_diff(a,b) ( a-b<0?b-a:a-b )

#define SET_SVEC(A, B) {\
short _x0;\
short _y0;\
short _z0;\
SVector *_v;\
Position *_v0;\
\
_v0 = B;\
_v = A;\
\
_x0 = _v0->x;\
_y0 = _v0->y;\
_z0 = _v0->z;\
\
\
_v->x = _x0;\
_v->y = _y0;\
_v->z = _z0;\
}

#define SET_SVEC2(A, B, C) {\
short _x0;\
short _y0;\
short _z0;\
short _x1;\
short _y1;\
short _z1;\
SVector *_v;\
Position *_v0;\
Position *_v1;\
\
_v0 = B;\
_v1 = C;\
_v = A;\
\
_x0 = _v0->x;\
_y0 = _v0->y;\
_z0 = _v0->z;\
\
_x1 = _v1->x;\
_y1 = _v1->y;\
_z1 = _v1->z;\
\
_v->x = _x0 + _x1;\
_v->y = _y0 + _y1;\
_v->z = _z0 + _z1;\
}

#define SET_SVEC3(A, B, C) {\
short _x0;\
short _y0;\
short _z0;\
short _x1;\
short _y1;\
short _z1;\
SVector *_v;\
Position *_v0;\
Position *_v1;\
\
_v0 = B;\
_v1 = C;\
_v = A;\
\
_x0 = _v0->x;\
_y0 = _v0->y;\
_z0 = _v0->z;\
\
_x1 = _v1->x;\
_y1 = _v1->y;\
_z1 = _v1->z;\
\
_v->x = _x0 - _x1;\
_v->y = _y0 - _y1;\
_v->z = _z0 - _z1;\
}

long MATH3D_LengthXY(long x, long y);
long MATH3D_FastSqrt0(long square);
long MATH3D_LengthXYZ(long x, long y, long z);
unsigned long MATH3D_SquareLength(long x, long y, long z);
short AngleDiff(short current, short destination);

#endif

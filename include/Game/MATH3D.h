#ifndef _MATH3D_H_
#define _MATH3D_H_

#include "common.h"

typedef enum MATH3D_AXIS {
    AXIS_X = 0,
    AXIS_Y = 1,
    AXIS_Z = 2,
    AXIS_NEG_X = 3,
    AXIS_NEG_Y = 4,
    AXIS_NEG_Z = 5,
} MATH3D_AXIS;

#define abs_diff(a,b) ( a-b<0?b-a:a-b )

#define COPY_VEC(TYPE, TDEST, DEST, TSRC, SRC) {\
TYPE _x1;\
TYPE _y1;\
TYPE _z1;\
TDEST *_v;\
TSRC *_v1;\
\
_v1 = SRC;\
_v = DEST;\
\
_x1 = _v1->x;\
_y1 = _v1->y;\
_z1 = _v1->z;\
\
_v->x = _x1;\
_v->y = _y1;\
_v->z = _z1;\
}

#define COPY_SVEC(TDEST, DEST, TSRC, SRC) COPY_VEC(short, TDEST, DEST, TSRC, SRC) 
#define COPY_LVEC(TDEST, DEST, TSRC, SRC) COPY_VEC(long, TDEST, DEST, TSRC, SRC) 

#define SUB_VEC(TYPE, TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2) {\
TYPE _x0;\
TYPE _y0;\
TYPE _z0;\
TYPE _x1;\
TYPE _y1;\
TYPE _z1;\
TDEST *_v;\
TSRC1 *_v0;\
TSRC2 *_v1;\
\
_v0 = SRC1;\
_v1 = SRC2;\
_v = DEST;\
\
_x0 = _v0->x;\
_y0 = _v0->y;\
_z0 = _v0->z;\
\
_x1 = _v1->x;\
_y1 = _v1->y;\
_z1 = _v1->z;\
\
_x0 -= _x1;\
_y0 -= _y1;\
_z0 -= _z1;\
\
_v->x = _x0;\
_v->y = _y0;\
_v->z = _z0;\
}

#define SUB_SVEC(TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2) SUB_VEC(short, TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2)
#define SUB_LVEC(TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2) SUB_VEC(long, TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2)

#define ADD_VEC(TYPE, TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2) {\
TYPE _x0;\
TYPE _y0;\
TYPE _z0;\
TYPE _x1;\
TYPE _y1;\
TYPE _z1;\
TDEST *_v;\
TSRC1 *_v0;\
TSRC2 *_v1;\
\
_v0 = SRC1;\
_v1 = SRC2;\
_v = DEST;\
\
_x0 = _v0->x;\
_y0 = _v0->y;\
_z0 = _v0->z;\
\
_x1 = _v1->x;\
_y1 = _v1->y;\
_z1 = _v1->z;\
\
_x0 += _x1;\
_y0 += _y1;\
_z0 += _z1;\
\
_v->x = _x0;\
_v->y = _y0;\
_v->z = _z0;\
}

#define ADD_SVEC(TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2) ADD_VEC(short, TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2)
#define ADD_LVEC(TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2) ADD_VEC(long, TDEST, DEST, TSRC1, SRC1, TSRC2, SRC2)

#define hasm_sqrlen1( r0, r1, r2 ) __asm__ (		\
	"mtc2	%0, $9;"					\
	"mtc2	%1, $10;"					\
	"mtc2	%2, $11;"					\
    "nop"					\
	:							\
	: "r"( r0 ), "r"( r1 ), "r"( r2 ) )

#define hasm_sqrlen2(r0, r1, r2) __asm__ (				\
	"mfc2	%0, $25;"					\
	"mfc2	%1, $26;"					\
	"mfc2	%2, $27;"					\
    "add	%0, %0, %1;"					\
    "add	%0, %0, %2"					\
	:							\
	: "r"( r0 ), "r"( r1 ), "r"( r2 ) )

long MATH3D_LengthXY(long x, long y);
long MATH3D_FastSqrt0(long square);
long MATH3D_LengthXYZ(long x, long y, long z);
unsigned long MATH3D_SquareLength(long x, long y, long z);
short AngleDiff(short current, short destination);
void MATH3D_SetUnityMatrix(MATRIX *mat);
long MATH3D_FastSqrt(long square);
short MATH3D_FastAtan2(long y, long x);

#endif

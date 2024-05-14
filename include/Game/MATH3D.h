#include "TYPES.h"

#define SET_SVEC(A, B) {\
short _x0;\
short _y0;\
short _z0;\
struct _SVector *_v;\
struct _Position *_v0;\
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

#define SET_SVEC3(A, B, C) {\
short _x0;\
short _y0;\
short _z0;\
short _x1;\
short _y1;\
short _z1;\
struct _SVector *_v;\
struct _Position *_v0;\
struct _Position *_v1;\
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

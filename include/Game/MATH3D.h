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

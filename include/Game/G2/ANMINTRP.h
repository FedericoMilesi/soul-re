#ifndef _ANMINTRP_H_
#define _ANMINTRP_H_

#include "common.h"

#define GET_XY(a) *(long*)(&a.x);
#define SET_XY(a, c) *(long*)(&a.x) = c;
#define GET_ZW(b) *(long*)(&b.z);
#define SET_ZW(b, c) *(long*)(&b.z) = c;

#define GETP_XY(a) *(long*)(&a->x);
#define SETP_XY(a, c) *(long*)(&a->x) = c;
#define GETP_ZW(b) *(long*)(&b->z);
#define SETP_ZW(b, c) *(long*)(&b->z) = c;

void _G2Anim_FreeInterpStateBlockList(G2AnimInterpStateBlock *block);
void _G2AnimSection_SegValueToQuat(G2AnimSection *section, int zeroOne);
G2AnimInterpStateBlock *_G2Anim_AllocateInterpStateBlockList(G2AnimSection *section);
void _G2AnimSection_InterpStateToQuat(G2AnimSection *section);
void G2AnimSection_InterpToKeylistAtTime(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, short targetTime, short duration);
void _G2AnimSection_UpdateStoredFrameFromQuat(G2AnimSection *section);

#endif

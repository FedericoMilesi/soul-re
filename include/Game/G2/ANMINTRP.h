#ifndef _ANMINTRP_H_
#define _ANMINTRP_H_

#include "common.h"

void G2AnimSection_InterpToKeylistAtTime(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, short targetTime, short duration);
void _G2Anim_FreeInterpStateBlockList(G2AnimInterpStateBlock *block);
void _G2AnimSection_SegValueToQuat(G2AnimSection *section, int zeroOne);
G2AnimInterpStateBlock *_G2Anim_AllocateInterpStateBlockList(G2AnimSection *section);
void _G2AnimSection_InterpStateToQuat(G2AnimSection *section);

#endif

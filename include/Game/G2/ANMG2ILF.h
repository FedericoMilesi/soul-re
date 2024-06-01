#ifndef _ANMG2ILF_H_
#define _ANMG2ILF_H_

#include "common.h"
#include "Game/G2/ANIMG2.h"

void G2Anim_SwitchToKeylist(G2Anim *anim, G2AnimKeylist *keylist, int keylistID);
short G2AnimSection_NextKeyframe(G2AnimSection *section);
void G2AnimSection_SetInterpInfo(G2AnimSection *section, G2AnimInterpInfo *newInfoPtr);

#endif

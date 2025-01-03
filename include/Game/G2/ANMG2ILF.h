#ifndef _ANMG2ILF_H_
#define _ANMG2ILF_H_

#include "common.h"

void G2AnimSection_SetLoopRangeAll(G2AnimSection *section);
void G2AnimSection_SwitchToKeylist(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID);
void G2AnimSection_SetNotRewinding(G2AnimSection *section);

#endif

#ifndef _AADVOICE_H_
#define _AADVOICE_H_

#include "common.h"

void SpuSetVoiceADSR1ADSR2(int vNum, unsigned short adsr1, unsigned short adsr2);
AadSynthVoice *aadAllocateVoice(int priority);

#endif

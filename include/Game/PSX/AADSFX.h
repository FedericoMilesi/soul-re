#ifndef _AADSFX_H_
#define _AADSFX_H_

unsigned long aadSetSfxVolPanPitch(unsigned long handle, int volume, int pan, int pitch);
unsigned long aadPlaySfx(unsigned int toneID, int volume, int pan, int pitchOffset);

#endif

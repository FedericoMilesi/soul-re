#ifndef _AADSFX_H_
#define _AADSFX_H_

unsigned long aadSetSfxVolPanPitch(unsigned long handle, int volume, int pan, int pitch);
unsigned long aadPlaySfx(unsigned int toneID, int volume, int pan, int pitchOffset);
unsigned long aadStopSfx(unsigned long handle);
int aadIsSfxTypePlayingOrRequested(unsigned int sfxToneID);
int aadIsSfxPlayingOrRequested(unsigned long handle);
int aadIsSfxPlaying(unsigned long handle);

#endif

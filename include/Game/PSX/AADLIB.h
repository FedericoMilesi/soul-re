#ifndef _AADLIB_H_
#define _AADLIB_H_

int aadIsSfxLoaded(unsigned int toneID);
int aadFreeDynamicSfx(int handle);
int aadLoadDynamicSfx(char *fileName, long directoryID, long flags);

#endif

#ifndef _SOUND_H_
#define _SOUND_H_

#include "common.h"

// size: 0x3
typedef struct SoundInstance {
    // offset: 0000
    unsigned char channel;
    // offset: 0001
    unsigned char state;
    // offset: 0002
    unsigned char delay;
} SoundInstance;

// size: 0x14
typedef struct gSoundData {
    // offset: 0000
    unsigned long gMasterVol;
    // offset: 0004
    unsigned long gMusicVol;
    // offset: 0008
    unsigned long gSfxVol;
    // offset: 000C
    unsigned long gVoiceVol;
    // offset: 0010
    char gSfxOn;
    // offset: 0011
    char gMusicOn;
    // offset: 0012
    char gVoiceOn;
    // offset: 0013
    char soundsLoaded;
} gSoundData;

unsigned long SOUND_Play3dSound(Position *position, int sfxToneID, int pitch, int maxVolume, int minVolDist);
void SOUND_ProcessInstanceSounds(unsigned char *sfxFileData, SoundInstance *soundInstTbl, Position *position, int livesInOnePlace, int inSpectral, int hidden, int burning, long *triggerFlags);
void SOUND_EndInstanceSounds(unsigned char *sfxFileData, SoundInstance *soundInstTbl);
unsigned long SndPlayVolPan(unsigned int sample, unsigned short vol, unsigned short pan, short pitch);
void SOUND_HandleGlobalValueSignal(int name, long data);
void SOUND_MusicOff();
void SOUND_MusicOn();
void SOUND_SfxOff();
void SOUND_SfxOn();
void SOUND_ShutdownMusic();
void SOUND_SetMusicVolume(int newVolume);
void SOUND_SetSfxVolume(int newVolume);
void SOUND_SetVoiceVolume(int newVolume);
void SOUND_StopAllSound();

#endif

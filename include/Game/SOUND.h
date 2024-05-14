// size: 0x3
struct SoundInstance {
	// offset: 0000
	unsigned char channel;
	// offset: 0001
	unsigned char state;
	// offset: 0002
	unsigned char delay;
};

// size: 0x14
struct gSoundData {
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
};

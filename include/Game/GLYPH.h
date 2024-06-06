#ifndef _GLYPH_H_
#define _GLYPH_H_

#include "Game/STATE.h"

// size: 0x9C
typedef struct __GlyphData {
	// offset: 0000
	void (*process)();
	// offset: 0004 (136 bytes)
	struct __MessageQueue messages;
	// offset: 008C
	short selectedGlyph;
	// offset: 008E
	short glyph_open;
	// offset: 0090
	short glyph_time;
	// offset: 0092
	short glyph_radius;
	// offset: 0094
	short glyph_scale;
	// offset: 0096
	short glyph_rotation;
	// offset: 0098
	short target_glyph_rotation;
	// offset: 009A
	short glyph_movement;
} GlyphData;

#endif

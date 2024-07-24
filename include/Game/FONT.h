#ifndef _FONT_H_
#define _FONT_H_

int FONT_GetStringWidth(char *str);
void FONT_Print(char *fmt);
void FONT_Print2(char *fmt);
void FONT_SetCursor(short x, short y);

// size: 0x6
typedef struct FontChar {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    char c;
    // offset: 0005
    char color;
} FontChar;

// size: 0x620
typedef struct FontTracker {
    // offset: 0000 (1536 bytes)
    struct FontChar font_buffer[256];
    // offset: 0600
    long font_xpos;
    // offset: 0604
    long font_ypos;
    // offset: 0608
    long font_buffIndex;
    // offset: 060C
    short font_tpage;
    // offset: 060E
    short font_clut;
    // offset: 0610
    short font_vramU;
    // offset: 0612
    short font_vramV;
    // offset: 0614
    short font_width;
    // offset: 0616
    short sprite_sort_push;
    // offset: 0618
    short font_vramX;
    // offset: 061A
    short font_vramY;
    // offset: 061C
    char color_global;
    // offset: 061D
    char color_local;
} FontTracker;

FontTracker fontTracker;

unsigned short SpecialFogClut;

void FONT_Flush();

#endif

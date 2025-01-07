#ifndef _FONT_H_
#define _FONT_H_

#include "common.h"

int FONT_GetStringWidth(char *str);
// void FONT_Print(char *fmt);
void FONT_Print(const char *fmt, ...);
void FONT_Print2(char *fmt);
void FONT_SetCursor(short x, short y);
void FONT_FontPrintCentered(char *text, long y);
void FONT_SetColorIndex(int color);

FontTracker fontTracker;

unsigned short SpecialFogClut;

void FONT_Flush();

#endif

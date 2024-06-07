#include "common.h"
#include "Game/GLYPH.h"
#include "Game/CAMERA.h"
#include "Game/GAMELOOP.h"

EXTERN STATIC short HUD_Captured;

EXTERN STATIC short HUD_Count;

EXTERN STATIC short HUD_Count_Overall;

EXTERN STATIC short HUD_Pos_vel;

EXTERN STATIC short HUD_Position;

EXTERN STATIC short HUD_Rot_vel;

EXTERN STATIC short HUD_Rotation;

EXTERN STATIC short HUD_State;

EXTERN STATIC short HUD_Wait;

EXTERN STATIC int warpDraw;

EXTERN STATIC int glowdeg;

int hud_warp_arrow_flash;

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphInit);

void GlyphCollide(void)
{
}

void GlyphProcess(Instance *instance, GameTracker *gameTracker)
{
    GlyphData *data;

    (void)gameTracker;

    data = (GlyphData *)instance->extraData;

    data->process(instance, 0, 0);

    instance->oldPos = instance->parent->position;

    instance->position = instance->oldPos;

    instance->currentStreamUnitID = instance->parent->currentStreamUnitID;

    instance->flags |= 0xC00;
}

unsigned long GlyphQuery(Instance *instance, unsigned long query)
{
    (void)instance;

    switch (query)
    {
    case 24:
        return 0;
    case 1:
        break;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphPost);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphSwitchProcess);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphIsGlyphOpen);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphIsGlyphSet);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphIsGlyphUsable);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphIsAnyGlyphSet);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphCost);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphDefaultProcess);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", HUD_GetPlayerScreenPt);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphDrawMenu);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphTime);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", ShrinkGlyphMenu);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", EnlargeGlyphMenu);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphOffProcess);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphSelectProcess);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", Glyph_StartSpell);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", Glyph_Broadcast);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", Glyph_DoSpell);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", Glyph_EndFX);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", Glyph_DoFX);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphGenericProcess);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphTrigger);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", MANNA_Pickup);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", HEALTHU_Pickup);

void HUD_Damp(short *val, short target, short *vel, short max)
{
    short accl;

    CriticalDampValue(1, val, target, vel, &accl, max);
}

void HUD_Init()
{
    HUD_Rotation = 0;

    HUD_Rot_vel = 0;
    HUD_Pos_vel = 0;

    HUD_State = 0;

    HUD_Wait = 0;

    HUD_Position = -1000;

    HUD_Count = 0;
    HUD_Count_Overall = 0;

    warpDraw = 0;

    glowdeg = 0;

    hud_warp_arrow_flash = 0;
}

void HUD_Setup_Chit_Count(int chits)
{
    HUD_Count_Overall = chits;

    HUD_Count = chits % 5;
}

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", HUD_Update);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", HUD_Draw);

#include "common.h"
#include "Game/GLYPH.h"
#include "Game/CAMERA.h"
#include "Game/GAMELOOP.h"
#include "Game/STATE.h"
#include "Game/DEBUG.h"

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

EXTERN STATIC SVector HUD_Cap_Pos;

EXTERN STATIC SVector HUD_Cap_Vel;

int hud_warp_arrow_flash;

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphInit);

void GlyphCollide()
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

void GlyphPost(Instance *instance, unsigned long message, unsigned long messageData)
{
    GlyphData *data;

    data = (GlyphData *)instance->extraData;

    if (message != 0x100007)
    {
        EnMessageQueueData(&data->messages, message, messageData);
    }
}

void _GlyphSwitchProcess(Instance *instance, void (*process)())
{
    GlyphData *data;

    data = (GlyphData *)instance->extraData;

    PurgeMessageQueue(&data->messages);

    EnMessageQueueData(&data->messages, 0x100004, 0);

    data->process(instance, 0, 0);

    EnMessageQueueData(&data->messages, 0x100001, 0);

    data->process = process;

    data->process(instance, 0, 0);
}

int GlyphIsGlyphOpen(Instance *instance)
{
    GlyphData *data;

    data = (GlyphData *)instance->extraData;

    return data->glyph_open;
}

int _GlyphIsGlyphSet(int glyph)
{
    unsigned long abilities;

    abilities = INSTANCE_Query(gameTrackerX.playerInstance, 36) | debugRazielFlags3;

    return (1 << (glyph + 17)) & abilities;
}

int _GlyphIsGlyphUsable(int glyph)
{
    return (1 << (glyph + 17)) & INSTANCE_Query(gameTrackerX.playerInstance, 19);
}

int _GlyphIsAnyGlyphSet()
{
    unsigned long abilities;

    abilities = INSTANCE_Query(gameTrackerX.playerInstance, 36);

    abilities |= debugRazielFlags3;

    return abilities & 0x1FC0000;
}

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphCost);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphDefaultProcess);

void HUD_GetPlayerScreenPt(DVECTOR *center)
{
    Position position;

    PushMatrix();

    SetRotMatrix(theCamera.core.wcTransform);
    SetTransMatrix(theCamera.core.wcTransform);

    position = gameTrackerX.playerInstance->position;

    position.z += 448;

    gte_ldv0(&position);
    gte_nrtps();
    gte_stsxy(center);

    PopMatrix();
}

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

void HEALTHU_Pickup(Instance *instance)
{
    ApplyMatrixSV(theCamera.core.wcTransform2, (SVECTOR *)&instance->position, (SVECTOR *)&HUD_Cap_Pos);

    HUD_Cap_Pos.x += (short)theCamera.core.wcTransform2->t[0];
    HUD_Cap_Pos.y += (short)theCamera.core.wcTransform2->t[1];
    HUD_Cap_Pos.z += (short)theCamera.core.wcTransform2->t[2];

    HUD_Cap_Vel.z = 0;
    HUD_Cap_Vel.y = 0;
    HUD_Cap_Vel.x = 0;

    INSTANCE_KillInstance(instance);

    HUD_Captured = 1;

    HUD_State = 1;
}

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

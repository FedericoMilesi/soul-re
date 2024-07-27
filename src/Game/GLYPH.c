#include "common.h"
#include "Game/GLYPH.h"
#include "Game/CAMERA.h"
#include "Game/GAMELOOP.h"
#include "Game/STATE.h"
#include "Game/DEBUG.h"
#include "Game/SOUND.h"
#include "Game/FX.h"
#include "Game/MEMPACK.h"
#include "Game/MATH3D.h"
#include "Game/DRAW.h"

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

EXTERN STATIC short fx_going;

EXTERN STATIC int fx_radius_old;

EXTERN STATIC int blast_range;

EXTERN STATIC short glyph_trigger;

EXTERN STATIC short glyph_time;

EXTERN STATIC short glyph_cost;

EXTERN STATIC int MANNA_Pickup_Time;

EXTERN STATIC short MANNA_Position;

EXTERN STATIC short MANNA_Pos_vel;

FXBlastringEffect *fx_blastring;

void GlyphInit(Instance *instance, GameTracker *gameTracker)
{
    GlyphData *data;

    (void)gameTracker;

    if ((instance->flags & 0x20000))
    {
        data = (GlyphData *)instance->extraData;

        MEMPACK_Free((char *)data);
    }
    else
    {
        data = (GlyphData *)MEMPACK_Malloc(sizeof(GlyphData), 29);

        instance->extraData = data;

        InitMessageQueue(&data->messages);

        EnMessageQueueData(&data->messages, 0x100001, 0);

        data->process = &_GlyphOffProcess;

        data->selectedGlyph = 7;

        data->target_glyph_rotation = 3510;

        data->glyph_time = 0;

        glyph_time = 0;

        data->glyph_radius = 0;
        data->glyph_scale = 0;
        data->glyph_movement = 1;
        data->glyph_open = 0;

        glyph_trigger = 0;

        fx_blastring = NULL;

        glyph_cost = -1;

        fx_going = 0;

        data->glyph_rotation = (data->selectedGlyph - 1) * 585;

        instance->flags |= 0x10800;
    }

    HUD_Init();

    MANNA_Pickup_Time = 0;

    MANNA_Position = -64;

    MANNA_Pos_vel = 0;
}

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

int _GlyphCost(GlyphTuneData *glyphtunedata, int glyphNum)
{
    return (unsigned char)glyphtunedata->glyph_costs[glyphNum - 1];
}

void _GlyphDefaultProcess(Instance *instance, int data1, int data2)
{
    Message *Ptr;
    GlyphData *data;

    (void)data1;
    (void)data2;

    data = (GlyphData *)instance->extraData;

    while ((Ptr = PeekMessageQueue(&data->messages)))
    {
        if (Ptr != NULL)
        {
            switch (Ptr->ID)
            {
            case 0x80000010:
                _GlyphSwitchProcess(instance, &_GlyphSelectProcess);

                SndPlayVolPan(17, 127, 64, 0);
                break;
            }

            DeMessageQueue(&data->messages);
        }
    }
}

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

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", GlyphDrawMenu);
#else
void GlyphDrawMenu(Instance *instance)
{
    Position place;
    DVECTOR center;
    int n;
    int rot;
    int radius;
    int glyph_rotation_speed;
    int MANNA_Count;
    GlyphData *data;
    GlyphTuneData *glyphtunedata;

    glyph_rotation_speed = (gameTrackerX.timeMult * 64) >> 12;

    data = (GlyphData *)instance->extraData;

    glyphtunedata = (GlyphTuneData *)instance->object->data;

    MANNA_Count = INSTANCE_Query(gameTrackerX.playerInstance, 32);

    if (data->target_glyph_rotation != data->glyph_rotation)
    {
        int diff;

        diff = AngleDiff(data->target_glyph_rotation, data->glyph_rotation);

        if (glyph_rotation_speed >= ABS(diff))
        {
            data->glyph_rotation = data->target_glyph_rotation;
        }
        else if (data->glyph_movement > 0)
        {
            data->glyph_rotation = (data->glyph_rotation + glyph_rotation_speed) & 0xFFF;
        }
        else
        {
            data->glyph_rotation = (data->glyph_rotation - glyph_rotation_speed) & 0xFFF;
        }
    }

    HUD_GetPlayerScreenPt(&center);

    if (center.vy < 72)
    {
        center.vy = 72;
    }

    radius = data->glyph_radius;

    rot = data->glyph_rotation + 3072;

    for (n = 0; n < 7; rot -= 585, n++)
    {
        int enabled;
        int scale_modify;
        int num;
        int temp; // not from decls.h

        rot &= 0xFFF;

        if (AngleDiff(rot, 3072) >= 0)
        {
            temp = 4096;

            scale_modify = temp - (AngleDiff(rot, 3072) << 1);
        }
        else
        {
            scale_modify = temp + (AngleDiff(rot, 3072) << 1); // bug in the original code?
        }

        if (scale_modify < 1536)
        {
            scale_modify = 1536;
        }

        scale_modify = (data->glyph_scale * scale_modify) / 4096;

        place.x = center.vx + ((rcos(rot) * radius) >> 12);
        place.y = center.vy - (((rsin(rot) * radius) >> 12) / 8);

        if (_GlyphIsGlyphSet(n + 1) != 0)
        {
            num = n;

            if (_GlyphIsGlyphUsable(n + 1) != 0)
            {
                if (_GlyphCost(glyphtunedata, n + 1) <= MANNA_Count)
                {
                    enabled = 1;
                }
                else
                {
                    enabled = 0;
                }
            }
            else
            {
                enabled = 0;
            }
        }
        else if ((n + 1) != 7)
        {
            num = 7;

            enabled = 1;
        }
        else
        {
            num = n;

            enabled = 0;
        }

        FX_MakeGlyphIcon(&place, instance->object, (glyphtunedata->glyph_size * scale_modify) / 8192, num, enabled);
    }

    if ((data->glyph_time == 4096) && (data->target_glyph_rotation == data->glyph_rotation) && (MANNA_Count >= _GlyphCost(glyphtunedata, data->selectedGlyph)))
    {
        Vector f1;

        f1.x = center.vx;
        f1.y = center.vy + (radius / 8);

        DRAW_CreateAGlowingCircle(&f1, 320, gameTrackerX.primPool, gameTrackerX.drawOT, 5, 0x1404040, 20, 24, 0);
    }

    FX_DrawScreenPoly(2, (data->glyph_time / glyphtunedata->glyph_darkness) | (((data->glyph_time / glyphtunedata->glyph_darkness) << 16) | ((data->glyph_time / glyphtunedata->glyph_darkness) << 8)), 32);
}
#endif

long GlyphTime(int time)
{
    time *= time;

    return time / 4096;
}

void ShrinkGlyphMenu(Instance *instance)
{
    GlyphData *data;
    int time;
    short accl;

    data = (GlyphData *)instance->extraData;

    gameTrackerX.streamFlags &= ~0x100000;

    if (data->glyph_time > 0)
    {
        data->glyph_time -= (short)((gameTrackerX.timeMult * 512) >> 12);

        if (data->glyph_time < 0)
        {
            data->glyph_time = 0;
        }

        glyph_time = data->glyph_time;

        time = GlyphTime(data->glyph_time);

        data->glyph_radius = (time * 150) / 4096;

        data->glyph_scale = time;

        if (data->glyph_time > 0)
        {
            GlyphDrawMenu(instance);
        }
    }
    else
    {
        glyph_cost = -1;
    }

    if (MANNA_Pickup_Time <= 0)
    {
        CriticalDampValue(5, &MANNA_Position, -64, &MANNA_Pos_vel, &accl, 12);
    }
    else
    {
        MANNA_Pickup_Time -= gameTrackerX.timeMult;
    }

    data->glyph_open = 0;
}

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", EnlargeGlyphMenu);
#else
void EnlargeGlyphMenu(Instance *instance)
{
    GlyphData *data;
    int time;
    short accl;

    data = (GlyphData *)instance->extraData;

    gameTrackerX.streamFlags |= 0x100000;

    if (data->glyph_time < 4096)
    {
        data->glyph_time += (short)((gameTrackerX.timeMult * 512) >> 12);

        if (data->glyph_time >= 4097)
        {
            data->glyph_time = 4096;
        }

        glyph_time = data->glyph_time;
    }

    time = GlyphTime(data->glyph_time);

    data->glyph_radius = (time * 150) / 4096;

    data->glyph_scale = time;

    GlyphDrawMenu(instance);

    MANNA_Pickup_Time = 0;

    CriticalDampValue(5, &MANNA_Position, 24, &MANNA_Pos_vel, &accl, 12);

    data->glyph_open = 1;
}
#endif

void _GlyphOffProcess(Instance *instance, int data1, int data2)
{
    Message *Ptr;
    GlyphData *data;

    data = (GlyphData *)instance->extraData;

    ShrinkGlyphMenu(instance);

    while ((Ptr = PeekMessageQueue(&data->messages)) != NULL)
    {
        switch (Ptr->ID)
        {
        case 0x100004:
        case 0x100001:
            break;
        case 0x80000010:
            if (data->process == &_GlyphSelectProcess)
            {
                _GlyphSwitchProcess(instance, _GlyphOffProcess);
            }
            else
            {
                _GlyphSwitchProcess(instance, _GlyphSelectProcess);
            }

            break;
        default:
            _GlyphDefaultProcess(instance, data1, data2);
        }

        DeMessageQueue(&data->messages);
    }

    if (data->process == &_GlyphSelectProcess)
    {
        SndPlayVolPan(17, 127, 64, 0);
    }

    Glyph_DoFX(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", _GlyphSelectProcess);

void Glyph_StartSpell(Instance *instance, int glyphnum)
{
    int message;

    (void)instance;

    message = 0;

    switch (glyphnum)
    {
    case 6:
        message = 0x80006;
        break;
    case 4:
        message = 0x80004;
        break;
    case 5:
        message = 0x80005;
        break;
    case 2:
        message = 0x80002;
        break;
    case 1:
        message = 0x80001;
        break;
    case 3:
        message = 0x80003;
        break;
    case 7:
        message = 0x80007;
        break;
    }

    INSTANCE_Post(gameTrackerX.playerInstance, message, 0);
}

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", Glyph_Broadcast);

INCLUDE_ASM("asm/nonmatchings/Game/GLYPH", Glyph_DoSpell);

void Glyph_EndFX()
{
    fx_blastring->lifeTime = 0;

    fx_going = 0;

    fx_blastring = NULL;
}

void Glyph_DoFX(Instance *instance)
{
    if ((gameTrackerX.gameMode != 6) && (!(gameTrackerX.streamFlags & 0x100000)) && (fx_going != 0))
    {
        Glyph_Broadcast(instance, fx_going);

        fx_radius_old = fx_blastring->radius;

        if (fx_blastring->radius > blast_range)
        {
            Glyph_EndFX();
        }

        if (fx_going == 5)
        {
            fx_blastring->height1 -= 60;
            fx_blastring->height3 += 60;
        }
    }
}

void _GlyphGenericProcess(Instance *instance, int data1, int data2)
{
    Message *Ptr;
    GlyphData *data;

    data = (GlyphData *)instance->extraData;

    ShrinkGlyphMenu(instance);

    while (Ptr = PeekMessageQueue(&data->messages), Ptr != NULL)
    {
        switch (Ptr->ID)
        {
        case 0x100001:
            Glyph_StartSpell(instance, data->selectedGlyph);
            break;
        case 0x100004:
            break;
        case 0x80000000:
            _GlyphSwitchProcess(instance, &_GlyphOffProcess);
            break;
        default:
            _GlyphDefaultProcess(instance, data1, data2);
        }

        DeMessageQueue(&data->messages);
    }

    if (glyph_trigger != 0)
    {
        GlyphTuneData *glyphtunedata;

        glyphtunedata = (GlyphTuneData *)instance->object->data;

        Glyph_DoSpell(instance, data->selectedGlyph);

        glyph_trigger = 0;

        INSTANCE_Post(gameTrackerX.playerInstance, 0x40008, _GlyphCost(glyphtunedata, data->selectedGlyph));
    }

    Glyph_DoFX(instance);
}

void GlyphTrigger()
{
    if (fx_going == 0)
    {
        glyph_trigger = 1;
    }
}

void MANNA_Pickup()
{
    MANNA_Pickup_Time = 122880;

    MANNA_Position = 24;
}

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

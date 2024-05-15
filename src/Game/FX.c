#include "common.h"
#include "Game/FX.h"

EXTERN STATIC struct _FX_PRIM *FX_LastUsedPrim;

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Init);

void FX_Die(struct _FX_PRIM *fxPrim, struct _FXTracker *fxTracker)
{
    if (FX_LastUsedPrim == fxPrim)
    {
        FX_LastUsedPrim = (struct _FX_PRIM *)fxPrim->node.prev;

        if (FX_LastUsedPrim->node.prev == NULL)
        {
            FX_LastUsedPrim = NULL;
        }
    }

    fxPrim->flags |= 0x10;

    LIST_DeleteFunc(&fxPrim->node);

    LIST_InsertFunc(&fxTracker->freePrimList, &fxPrim->node);
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetMatrix);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetPrim);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetParticle);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_AniTexSetup);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StandardProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ShatterProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DFacadeProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", _FX_BuildSingleFaceWithModel);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_BuildSingleFaceWithModel);

INCLUDE_ASM("asm/nonmatchings/Game/FX", _FX_SetupLighting);

INCLUDE_ASM("asm/nonmatchings/Game/FX", _FX_DoLighting);

INCLUDE_ASM("asm/nonmatchings/Game/FX", _FX_BuildSegmentedSplinters);

INCLUDE_ASM("asm/nonmatchings/Game/FX", _FX_BuildNonSegmentedSplinters);

INCLUDE_ASM("asm/nonmatchings/Game/FX", _FX_BuildSplinters);

INCLUDE_ASM("asm/nonmatchings/Game/FX", _FX_Build);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Build);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdatePos);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Relocate);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdateTexturePointers);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_RelocateFXPointers);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ProcessList);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawReaver);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawList);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SimpleQuadSetup);

void FX_WaterRingProcess(struct _FX_PRIM *fxPrim, struct _FXTracker *fxTracker)
{
    fxPrim->v0.x -= 8;
    fxPrim->v0.y -= 8;
    fxPrim->v1.x += 8;
    fxPrim->v1.y -= 8;
    fxPrim->v2.x -= 8;
    fxPrim->v2.y += 8;
    fxPrim->v3.x += 8;
    fxPrim->v3.y += 8;

    FX_StandardFXPrimProcess(fxPrim, fxTracker);
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_WaterBubbleProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Sprite_Insert);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetTextureObject);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeWaterBubble);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawScreenPoly);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SetupPolyGT4);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeWarpArrow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeMannaIcon);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeGlyphIcon);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SoulDustProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeSoulDust);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_WaterTrailProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeWaterTrail);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartRibbon);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_RibbonProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ConstrictProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartConstrict);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_EndConstrict);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SubDividePrim);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ContinueRibbon);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StandardFXPrimProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_AttachedParticlePrimProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_FlamePrimProcess);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DFacadeParticleSetup);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Dot);

void FX_Blood(struct _SVector *location, struct _SVector *input_vel, struct _SVector *accel, int amount, long color, long size)
{
    struct _SVector vel;
    int i;

    for (i = amount; i != 0; i--)
    {
        vel.x = ((input_vel->x * i) / 128) + ((rand() & 0x7)) - 4;
        vel.y = ((input_vel->y * i) / 128) + ((rand() & 0x7)) - 4;
        vel.z = ((input_vel->z * i) / 128) + ((rand() & 0x7)) - 4;

        FX_Dot(location, &vel, accel, 0, color, size * 2, 16, 1);
    }
}

void FX_Blood2(struct _SVector *location, struct _SVector *input_vel, struct _SVector *accel, int amount, long color, long dummyCrapShouldRemove)
{
    FX_Blood(location, input_vel, accel, amount, color, 4);
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Blood_Impale);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_BloodCone);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetTorchParticle);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_TorchFlame);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetMorphFadeVal);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ConvertCamPersToWorld);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetRandomScreenPt);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ProcessSnow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ContinueSnow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdateWind);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ProcessRain);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ContinueRain);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeSpark);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ContinueParticle);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdraftPrimModify);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeParticleTexFX);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_MakeHitFX);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ContinueLightning);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SetReaverInstance);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SoulReaverBlade);

void FX_ReaverBladeInit()
{
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SoulReaverWinding);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdateInstanceWaterSplit);

void FX_GetPlaneEquation(struct _SVector *normal, struct _SVector *poPlane, struct _PlaneConstants *plane)
{
    plane->a = normal->x;
    plane->b = normal->y;
    plane->c = normal->z;

    plane->d = -(((plane->a * poPlane->x) + (plane->b * poPlane->y) + (plane->c * poPlane->z)) >> 12);
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DoInstancePowerRing);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdatePowerRing);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdateInstanceSplitRing);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdateGlowEffect);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_InsertGeneralEffect);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DeleteGeneralEffect);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DoInstanceOneSegmentGlow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SetGlowFades);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DoInstanceTwoSegmentGlow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DoInstanceManySegmentGlow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DoInstanceOneSegmentGlowWithTime);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StopAllGlowEffects);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StopGlowEffect);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawLightning);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawAllGeneralEffects);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ContinueBlastRing);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DoBlastRing);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawBlastring);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ContinueFlash);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawFlash);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_RelocateGeneric);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartGenericParticle);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartGenericRibbon);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartGenericGlow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_CreateLightning);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SetLightingPos);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartGenericLightning);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartGenericBlastring);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartGenericFlash);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetHealthColor);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Start_Snow);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Start_Rain);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartLightbeam);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartInstanceEffect);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_EndInstanceEffects);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_EndInstanceParticleEffects);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetSpiralPoint);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetLinePoint);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_CalcSpiral);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Spiral);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Health_Spiral);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Spiral_Init);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawModel);

INCLUDE_ASM("asm/nonmatchings/Game/FX", fx_calc_points);

INCLUDE_ASM("asm/nonmatchings/Game/FX", fx_get_startz);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawRing);

INCLUDE_ASM("asm/nonmatchings/Game/FX", fx_setTex);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawRing2);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawFField);

struct _FXForceFieldEffect *FX_StartFField(struct _Instance *instance, int size, struct _Position *offset, int size_diff, int size_change, int deg_change, long color)
{
    struct _FXForceFieldEffect *field;

    field = (struct _FXForceFieldEffect *)MEMPACK_Malloc(sizeof(struct _FXForceFieldEffect), 13);

    if (field != NULL)
    {
        field->effectType = 134;
        field->instance = instance;
        field->type = 0;
        field->lifeTime = -1;
        field->continue_process = NULL;
        field->size = size;

        SET_SVEC(&field->offset, offset);

        field->size_diff = size_diff;
        field->size_change = (short)size_change;
        field->deg = 0;
        field->deg_change = (short)deg_change;
        field->start_fade = 4096;
        field->end_fade = 0;
        field->color = color;

        FX_InsertGeneralEffect(field);
    }

    return field;
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_EndFField);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Draw_Glowing_Line);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Lightning);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_LightHouse);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartPassthruFX);

void FX_EndPassthruFX(struct _Instance *instance)
{
    FX_EndInstanceEffects(instance);
}

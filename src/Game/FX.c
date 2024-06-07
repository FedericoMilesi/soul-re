#include "common.h"
#include "Game/MATH3D.h"
#include "Game/MEMPACK.h"
#include "Game/DRAW.h"

EXTERN STATIC FXGeneralEffect *FX_GeneralEffectTracker;

EXTERN STATIC short Spiral_Number;

EXTERN STATIC short Spiral_Degrees;

EXTERN STATIC long Spiral_Current;

EXTERN STATIC long Spiral_Max;

EXTERN STATIC FX_PRIM *FX_LastUsedPrim;

EXTERN STATIC DVECTOR Spiral_Array[65];

EXTERN STATIC DVECTOR Spiral_OffsetP[64];

EXTERN STATIC DVECTOR Spiral_OffsetM[64];

EXTERN STATIC int Spiral_Glow_X;

EXTERN STATIC int Spiral_Glow_Y;

EXTERN STATIC int Spiral_Glow_Size;

EXTERN STATIC int Spiral_Mod;

EXTERN STATIC Instance *FX_reaver_instance;

void FX_StandardFXPrimProcess(FX_PRIM *fxPrim, FXTracker *fxTracker);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Init);

void FX_Die(FX_PRIM *fxPrim, FXTracker *fxTracker)
{
    if (FX_LastUsedPrim == fxPrim)
    {
        FX_LastUsedPrim = (FX_PRIM *)fxPrim->node.prev;

        if (FX_LastUsedPrim->node.prev == NULL)
        {
            FX_LastUsedPrim = NULL;
        }
    }

    fxPrim->flags |= 0x10;

    LIST_DeleteFunc(&fxPrim->node);

    LIST_InsertFunc(&fxTracker->freePrimList, &fxPrim->node);
}

FX_MATRIX *FX_GetMatrix(FXTracker *fxTracker)
{
    FX_MATRIX *fxMatrix;

    fxMatrix = (FX_MATRIX *)LIST_GetFunc(&fxTracker->freeMatrixList);

    if (fxMatrix != NULL)
    {
        fxMatrix->flags = 0x1;

        LIST_InsertFunc(&fxTracker->usedMatrixList, &fxMatrix->node);
    }

    return fxMatrix;
}

FX_PRIM *FX_GetPrim(FXTracker *fxTracker)
{
    FX_PRIM *fxPrim;

    fxPrim = (FX_PRIM *)LIST_GetFunc(&fxTracker->freePrimList);

    if (fxPrim == NULL)
    {
        if (FX_LastUsedPrim != NULL)
        {
            fxPrim = FX_LastUsedPrim;

            FX_LastUsedPrim = (FX_PRIM *)fxPrim->node.prev;

            FX_LastUsedPrim->node.next = NULL;

            if (FX_LastUsedPrim->node.prev == NULL)
            {
                FX_LastUsedPrim = NULL;
            }
        }

        if (fxPrim != NULL)
        {
            fxPrim->process = NULL;
            fxPrim->flags = 0;
            fxPrim->matrix = NULL;
        }
    }
    else
    {
        fxPrim->process = NULL;
        fxPrim->flags = 0;
        fxPrim->matrix = NULL;
    }

    return fxPrim;
}

FXParticle *FX_GetParticle(Instance *instance, short startSegment)
{
    FXParticle *particle;

    particle = (FXParticle *)MEMPACK_Malloc(sizeof(FXParticle), 13);

    if (particle != NULL)
    {
        particle->effectType = 1;

        particle->continue_process = FX_ContinueParticle;

        particle->type = 0;

        particle->instance = instance;

        particle->startSegment = startSegment;

        particle->texture = NULL;

        particle->fxprim_process = NULL;
        particle->fxprim_modify_process = NULL;

        particle->startScale = 4096;
        particle->scaleSpeed = 0;

        particle->offset.z = 0;
        particle->offset.y = 0;
        particle->offset.x = 0;

        particle->acceleration.z = 0;
        particle->acceleration.y = 0;
        particle->acceleration.x = 0;

        particle->flag_bits = 0;

        particle->z_undulate = 0;
    }

    return particle;
}

void FX_AniTexSetup(FX_PRIM *fxPrim, MFace *mface, Model *model, FXTracker *fxTracker)
{
    (void)model;
    (void)fxTracker;
    if ((mface->flags & 0x2))
    {
        fxPrim->flags |= 0x1;
        fxPrim->texture = (TextureMT3 *)mface->color;
        fxPrim->color = ((fxPrim->texture->color & 0x3FFFFFF)) | 0x24000000;
    }
    else
    {
        fxPrim->flags &= ~0x1;
        fxPrim->flags &= ~0x4;
        fxPrim->color = ((mface->color & 0x3FFFFFF)) | 0x20000000;
    }
}

void FX_StandardProcess(FX_PRIM *fxPrim, FXTracker *fxTracker)
{
    FX_StandardFXPrimProcess(fxPrim, fxTracker);
}

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

void FX_UpdatePos(FX_PRIM *fxPrim, SVector *offset, int spriteflag)
{
    ADD_SVEC(Position, &fxPrim->position, Position, &fxPrim->position, SVector, offset);

    if ((spriteflag == 0) && ((fxPrim->flags & 0x10000)))
    {
        fxPrim->v0.x += offset->x;
        fxPrim->v0.y += offset->y;
        fxPrim->v0.z += offset->z;

        fxPrim->v1.x += offset->x;
        fxPrim->v1.y += offset->y;
        fxPrim->v1.z += offset->z;

        fxPrim->v2.x += offset->x;
        fxPrim->v2.y += offset->y;
        fxPrim->v2.z += offset->z;

        if ((fxPrim->flags & 0x8))
        {
            fxPrim->v3.x += offset->x;
            fxPrim->v3.y += offset->y;
            fxPrim->v3.z += offset->z;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Relocate);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_UpdateTexturePointers);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_RelocateFXPointers);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_ProcessList);

void FX_DrawReaver(PrimPool *primPool, unsigned long **ot, MATRIX *wcTransform)
{
    if (FX_reaver_instance != NULL)
    {
        FX_SoulReaverWinding(FX_reaver_instance, primPool, ot, wcTransform);
        FX_SoulReaverBlade(FX_reaver_instance, ot);
    }

    FX_reaver_instance = NULL;
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawList);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_SimpleQuadSetup);

void FX_WaterRingProcess(FX_PRIM *fxPrim, FXTracker *fxTracker)
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

void FX_WaterTrailProcess(FX_PRIM *fxPrim, FXTracker *fxTracker)
{
    FX_StandardProcess(fxPrim, fxTracker);

    fxPrim->v0.x = (fxPrim->v0.x * 7) >> 3;
    fxPrim->v0.y = (fxPrim->v0.y * 7) >> 3;
    fxPrim->v0.z = (fxPrim->v0.z * 7) >> 3;

    fxPrim->v1.x = (fxPrim->v1.x * 7) >> 3;
    fxPrim->v1.y = (fxPrim->v1.y * 7) >> 3;
    fxPrim->v1.z = (fxPrim->v1.z * 7) >> 3;

    fxPrim->v2.x = (fxPrim->v2.x * 7) >> 3;
    fxPrim->v2.y = (fxPrim->v2.y * 7) >> 3;
    fxPrim->v2.z = (fxPrim->v2.z * 7) >> 3;

    fxPrim->v3.x = (fxPrim->v3.x * 7) >> 3;
    fxPrim->v3.y = (fxPrim->v3.y * 7) >> 3;
    fxPrim->v3.z = (fxPrim->v3.z * 7) >> 3;
}

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

void FX_Blood(SVector *location, SVector *input_vel, SVector *accel, int amount, long color, long size)
{
    SVector vel;
    int i;

    for (i = amount; i != 0; i--)
    {
        vel.x = ((input_vel->x * i) / 128) + ((rand() & 0x7)) - 4;
        vel.y = ((input_vel->y * i) / 128) + ((rand() & 0x7)) - 4;
        vel.z = ((input_vel->z * i) / 128) + ((rand() & 0x7)) - 4;

        FX_Dot(location, &vel, accel, 0, color, size * 2, 16, 1);
    }
}

void FX_Blood2(SVector *location, SVector *input_vel, SVector *accel, int amount, long color, long dummyCrapShouldRemove)
{
    (void)dummyCrapShouldRemove;
    FX_Blood(location, input_vel, accel, amount, color, 4);
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Blood_Impale);

FXParticle *FX_BloodCone(Instance *instance, short startSegment, long time)
{
    FXParticle *currentParticle;
    Object *particle;

    particle = (Object *)objectAccess[10].object;

    if (particle == NULL)
    {
        return NULL;
    }

    currentParticle = FX_GetParticle(instance, startSegment);

    if (currentParticle != NULL)
    {
        currentParticle->size = 14;

        currentParticle->texture = FX_GetTextureObject(particle, 0, 1);

        currentParticle->birthRadius = 20;

        currentParticle->direction.x = 256;
        currentParticle->direction.y = 256;
        currentParticle->direction.z = 256;

        currentParticle->acceleration.x = 0;
        currentParticle->acceleration.y = 0;
        currentParticle->acceleration.z = -2;

        currentParticle->numberBirthParticles = 10;

        currentParticle->startColor = 0x021800FF;
        currentParticle->endColor = 0;

        currentParticle->lifeTime = time;
        currentParticle->primLifeTime = 10;

        FX_InsertGeneralEffect(currentParticle);
    }

    return currentParticle;
}

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

void FX_MakeSpark(Instance *instance, Model *model, int segment)
{
    FXParticle *currentParticle;
    Object *particle;

    (void)model;

    particle = (Object *)objectAccess[10].object;

    if (particle != NULL)
    {
        currentParticle = FX_GetParticle(instance, segment);

        if (currentParticle != NULL)
        {
            currentParticle->size = 48;

            currentParticle->birthRadius = 50;

            currentParticle->direction.x = 128;
            currentParticle->direction.y = 128;
            currentParticle->direction.z = 160;

            currentParticle->acceleration.x = 0;
            currentParticle->acceleration.y = 0;
            currentParticle->acceleration.z = 1;

            currentParticle->texture = FX_GetTextureObject(particle, 0, 0);

            currentParticle->numberBirthParticles = 2;

            currentParticle->lifeTime = 2;

            currentParticle->startColor = 0x02004960;
            currentParticle->endColor = 0;

            currentParticle->primLifeTime = 4;

            FX_InsertGeneralEffect(currentParticle);
        }
    }
}

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

void FX_GetPlaneEquation(SVector *normal, SVector *poPlane, PlaneConstants *plane)
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

void FX_InsertGeneralEffect(void *ptr);
INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_InsertGeneralEffect);

void FX_DeleteGeneralEffect(FXGeneralEffect *effect);
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

void FX_StartLightbeam(Instance *instance, int startSeg, int endSeg, int color_num)
{
    Object *particle;
    FXLightBeam *beam;
    GenericFXObject *GFXO;
    long color;

    particle = (Object *)objectAccess[10].object;

    if (particle != NULL)
    {
        GFXO = (GenericFXObject *)particle->data;

        color = GFXO->ColorList[color_num];

        beam = (FXLightBeam *)MEMPACK_Malloc(sizeof(FXLightBeam), 13);

        if (beam != NULL)
        {
            beam->effectType = 133;

            beam->instance = instance;

            beam->continue_process = NULL;

            beam->type = 0;

            beam->lifeTime = -1;

            beam->startSeg = startSeg;
            beam->endSeg = endSeg;

            beam->color = color;

            FX_InsertGeneralEffect(beam);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_StartInstanceEffect);

void FX_EndInstanceEffects(Instance *instance)
{
    FXGeneralEffect *currentEffect;
    FXGeneralEffect *nextEffect;

    currentEffect = FX_GeneralEffectTracker;

    while (currentEffect != NULL)
    {
        nextEffect = (FXGeneralEffect *)currentEffect->next;

        if (currentEffect->instance == instance)
        {
            FX_DeleteGeneralEffect(currentEffect);
        }

        currentEffect = nextEffect;
    }
}

void FX_EndInstanceParticleEffects(Instance *instance)
{
    FXGeneralEffect *currentEffect;
    FXGeneralEffect *nextEffect;

    currentEffect = FX_GeneralEffectTracker;

    while (currentEffect != NULL)
    {
        nextEffect = (FXGeneralEffect *)currentEffect->next;

        if ((currentEffect->instance == instance) && (currentEffect->effectType == 1))
        {
            FX_DeleteGeneralEffect(currentEffect);
        }

        currentEffect = nextEffect;
    }
}

void FX_GetSpiralPoint(int radius, int deg, int *x, int *y);
INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_GetSpiralPoint);

void FX_GetLinePoint(int radius, int next_radius, int deg, int next_deg, int *pntx, int *pnty, int part)
{
    int x1;
    int y1;
    int x2;
    int y2;

    FX_GetSpiralPoint(radius, deg, &x1, &y1);
    FX_GetSpiralPoint(next_radius, next_deg, &x2, &y2);

    *pntx = x1 + (((x2 - x1) * part) / 4096);
    *pnty = y1 + (((y2 - y1) * part) / 4096);
}

void FX_CalcSpiral(int degchange);
INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_CalcSpiral);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Spiral);

void FX_Health_Spiral(int number, int current_health, int max_health)
{
    int degchange;

    if (number != 0)
    {
        degchange = Spiral_Mod;

        if (degchange >= 2)
        {
            Spiral_Mod--;

            FX_CalcSpiral(128);
            return;
        }
    }
    else
    {
        degchange = Spiral_Mod;

        if (degchange < 6)
        {
            Spiral_Mod++;

            Spiral_Number = 0;

            FX_CalcSpiral(128);
            return;
        }
    }

    switch (number)
    {
    case 0:
    case 1:
    default:
        degchange = 128;
        break;
    case 2:
        degchange = 160;
        break;
    case 3:
        degchange = 192;
        break;
    case 4:
        degchange = 224;
        break;
    }

    if ((degchange != Spiral_Degrees) || (Spiral_Number != number))
    {
        Spiral_Number = number;

        if (Spiral_Degrees < degchange)
        {
            Spiral_Degrees += 4;

            if (degchange < Spiral_Degrees)
            {
                Spiral_Degrees = degchange;
            }
        }
        else
        {
            if (degchange < Spiral_Degrees)
            {
                Spiral_Degrees -= 4;

                if (Spiral_Degrees < degchange)
                {
                    Spiral_Degrees = degchange;
                }
            }
        }

        FX_CalcSpiral(Spiral_Degrees);
    }

    Spiral_Current = current_health;

    Spiral_Max = max_health;
}

void FX_Spiral_Init()
{
    Spiral_Max = 100000;

    Spiral_Current = 100000;

    Spiral_Number = 1;

    Spiral_Degrees = 128;

    FX_CalcSpiral(128);
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawModel);

INCLUDE_ASM("asm/nonmatchings/Game/FX", fx_calc_points);

INCLUDE_ASM("asm/nonmatchings/Game/FX", fx_get_startz);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawRing);

INCLUDE_ASM("asm/nonmatchings/Game/FX", fx_setTex);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawRing2);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_DrawFField);

FXForceFieldEffect *FX_StartFField(Instance *instance, int size, Position *offset, int size_diff, int size_change, int deg_change, long color)
{
    FXForceFieldEffect *field;

    field = (FXForceFieldEffect *)MEMPACK_Malloc(sizeof(FXForceFieldEffect), 13);

    if (field != NULL)
    {
        field->effectType = 134;
        field->instance = instance;
        field->type = 0;
        field->lifeTime = -1;
        field->continue_process = NULL;
        field->size = size;

        COPY_SVEC(SVector, &field->offset, Position, offset);

        field->size_diff = size_diff;
        field->size_change = size_change;
        field->deg = 0;
        field->deg_change = deg_change;
        field->start_fade = 4096;
        field->end_fade = 0;
        field->color = color;

        FX_InsertGeneralEffect(field);
    }

    return field;
}

void FX_EndFField(Instance *instance)
{
    FXGeneralEffect *currentEffect;
    FXForceFieldEffect *forceField; // not from decls.h

    currentEffect = FX_GeneralEffectTracker;

    while (currentEffect != NULL)
    {
        if ((currentEffect->instance == instance) && (currentEffect->effectType == 134))
        {
            forceField = (FXForceFieldEffect *)currentEffect;

            if (forceField->start_fade != 0)
            {
                forceField->end_fade = 4096 - forceField->start_fade;
                forceField->start_fade = 0;

                if (forceField->end_fade == 0)
                {
                    forceField->end_fade = 1;
                }
            }
            else
            {
                forceField->end_fade = 4096;
            }
        }

        currentEffect = (FXGeneralEffect *)currentEffect->next;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Draw_Glowing_Line);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_Lightning);

INCLUDE_ASM("asm/nonmatchings/Game/FX", FX_LightHouse);

void FX_StartPassthruFX(Instance *instance, SVector *normal, SVector *point)
{
    long color;

    instance->halvePlane.a = normal->x;
    instance->halvePlane.b = normal->y;
    instance->halvePlane.c = normal->z;

    color = 0x20FF40;

    instance->halvePlane.d = -(((normal->x * point->x) + (normal->y * point->y) + (normal->z * point->z)) >> 12);

    FX_DoInstancePowerRing(instance, 8400, &color, 0, 2);
    FX_DoInstancePowerRing(instance, 8400, &color, 0, 1);
}

void FX_EndPassthruFX(Instance *instance)
{
    FX_EndInstanceEffects(instance);
}

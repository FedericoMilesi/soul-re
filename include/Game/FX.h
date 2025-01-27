#ifndef _FX_H_
#define _FX_H_

#include "common.h"

void FX_ContinueParticle(FXParticle *currentParticle, FXTracker *fxTracker);
void FX_SetReaverInstance(Instance *instance);
void FX_EndInstanceEffects(Instance *instance);
FXBlastringEffect *FX_DoBlastRing(Instance *instance, SVector *position, MATRIX *mat, int segment, int radius, int endRadius, int colorChangeRadius, int size1, int size2, int vel, int accl, int height1, int height2, int height3, long startColor, long endColor, int pred_offset, int lifeTime, int sortInWorld);
void FX_ReaverBladeInit();
void FX_DoInstancePowerRing(Instance *instance, long atuTime, long *color, long numColors, int follow_halveplane);
FX_PRIM *FX_Dot(SVector *location, SVector *vel, SVector *accel, int scale_speed, long color, long size, int lifetime, int texture_num);
void FX_StartInstanceEffect(Instance *instance, ObjectEffect *effect, int InitFlag);
void FX_SoulReaverWinding(Instance *instance, PrimPool *primPool, unsigned long **ot, MATRIX *wcTransform);
void FX_SoulReaverBlade(Instance *instance, unsigned long **drawot);
TextureMT3 *FX_GetTextureObject(Object *object, int modelnum, int texnum);
void FX_InsertGeneralEffect(void *ptr);
FXParticle *FX_GetParticle(Instance *instance, short startSegment);
void FX_RelocateFXPointers(Object *oldObject, Object *newObject, long sizeOfObject);
void FX_Relocate(SVector *offset);
void FX_UpdateInstanceWaterSplit(Instance *instance);
void FX_Lightning(MATRIX *wcTransform, unsigned long **ot, MATRIX *mat, short deg, SVector *start, SVector *end, int width, int small_width, int segs, int sine_size, int variation, long color, long glow_color);
FXGlowEffect *FX_DoInstanceTwoSegmentGlow(Instance *instance, long segment, long segmentEnd, long *color, long numColors, long atuColorCycleRate, long height);
void FX_MakeHitFX(SVector *position);
void FX_MakeGlyphIcon(Position *position, Object *glyphObject, int size, int glyphnum, int enabled);
void FX_DrawScreenPoly(int transtype, unsigned long color, int zdepth);
void FX_CalcSpiral(int degchange);
void FX_GetSpiralPoint(int radius, int deg, int *x, int *y);
void FX_DeleteGeneralEffect(FXGeneralEffect *effect);
void FX_StandardFXPrimProcess(FX_PRIM *fxPrim, FXTracker *fxTracker);
long FX_GetHealthColor(int currentHealth);
FXGlowEffect *FX_DoInstanceOneSegmentGlow(Instance *instance, long segment, long *color, long numColors, long atuColorCycleRate, long width, long height);
FXRibbon *FX_StartRibbon(Instance *instance, short startSegment, short endSegment, short type, int ribbonLifeTime, int faceLifeTime, int startFadeValue, long startColor, long endColor);
void FX_StopGlowEffect(FXGlowEffect *glowEffect, int fadeout_time);
void FX_Health_Spiral(int number, int current_health, int max_health);
void FX_StartConstrict(Instance *instance, SVector *constrict_point, short startSegment, short endSegment);
void FX_EndConstrict(int ConstrictEnemyFlag, Instance *instance);
void FX_Init(FXTracker *fxTracker);
void _FX_BuildSplinters(Instance *instance, SVECTOR *center, SVECTOR *vel, SVECTOR *accl, FXSplinter *splintDef, FXTracker *fxTracker, void (*fxSetup)(), void (*fxProcess)(), int shardFlags);
void FX_DrawReaver(PrimPool *primPool, unsigned long **ot, MATRIX *wcTransform);
void FX_DrawList(FXTracker *fxTracker, GameTracker *gameTracker, unsigned long **ot, MATRIX *wcTransform);
void FX_ProcessList(FXTracker *fxTracker);
void FX_Spiral(PrimPool *primPool, unsigned long **ot);
void FX_EndInstanceParticleEffects(Instance *instance);
void FX_DrawAllGeneralEffects(MATRIX *wcTransform, VertexPool *vertexPool, PrimPool *primPool, unsigned long **ot);
void FX_Blood(SVector *location, SVector *input_vel, SVector *accel, int amount, long color, long size);
void FX_MakeWaterBubble(SVector *position, SVector *vel, SVector *accl, long splashZ, BubbleParams *BP);
FXGlowEffect *FX_DoInstanceOneSegmentGlowWithTime(Instance *instance, long segment, long *color, long numColors, long atuColorCycleRate, long width, long height, long ATULifeTime);
void FX_StopAllGlowEffects(Instance *instance, int fadeout_time);
void FX_StartPassthruFX(Instance *instance, SVector *normal, SVector *point);
void FX_EndPassthruFX(Instance *instance);
void FX_MakeSoulDust(Instance *instance, short segment);

#endif

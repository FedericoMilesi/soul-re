#ifndef _LIGHT3D_H_
#define _LIGHT3D_H_

#include "common.h"

void LIGHT_GetAmbient(ColorType *color, Instance *instance);
void LIGHT_CalcDQPTable(Level *level);
void LIGHT_Restore(LightInfo *lightInfo);
void LIGHT_DrawShadow(MATRIX *wcTransform, Instance *instance, PrimPool *primPool, unsigned long **ot);
void LIGHT_SetMatrixForLightGroupInstance(Instance *instance, Level *level);
void LIGHT_PresetInstanceLight(Instance *instance, short attenuate, MATRIX *lm);

#endif

#ifndef _ANMCTRLR_H_
#define _ANMCTRLR_H_

#include "Game/G2/ANIMG2.h"

G2Bool G2Anim_IsControllerActive(G2Anim *anim, int segNumber, int type);
void G2Anim_DisableController(G2Anim *anim, int segNumber, int type);
void G2Anim_SetControllerAngleOrder(G2Anim *anim, int segNumber, int type, int order);
void G2Anim_EnableController(G2Anim *anim, int segNumber, int type);
void G2Anim_SetController_Vector(G2Anim *anim, int segNumber, int type, G2SVector3 *vector);
void G2Anim_InterpDisableController(G2Anim *anim, int segNumber, int type, short duration);

#endif

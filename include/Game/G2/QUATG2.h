#ifndef _QUATG2_H_
#define _QUATG2_H_

#include "common.h"
#include "Game/G2/ANIMG2.h"

void G2EulerAngles_FromMatrix(G2EulerAngles *euler, G2Matrix *matrix, long order);
void G2Quat_ToEuler(G2Quat *quat, G2EulerAngles *euler, int order);

#endif

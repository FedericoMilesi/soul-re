#ifndef _QUATG2_H_
#define _QUATG2_H_

#include "common.h"

#define G2EulSafe "\000\001\002\000"
#define G2EulNext "\001\002\000\001"
#define G2EulFrmR 1
#define G2EulParOdd 1

void G2EulerAngles_FromMatrix(G2EulerAngles *euler, G2Matrix *matrix, long order);
void G2Quat_ToEuler(G2Quat *quat, G2EulerAngles *euler, int order);

#endif

#ifndef _QUATVM_H_
#define _QUATVM_H_

#include "common.h"

void G2Quat_Slerp_VM(long ratio, G2Quat *quatA, G2Quat *quatB, G2Quat *quatOut, int spin);

#endif

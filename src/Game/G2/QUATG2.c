#include "common.h"
#include "Game/G2/QUATG2.h"
#include "Game/HASM.h"

void G2Quat_ToEuler(G2Quat *quat, G2EulerAngles *euler, int order)
{
    G2Matrix tempMatrix;

    G2Quat_ToMatrix_S(quat, &tempMatrix);

    G2EulerAngles_FromMatrix(euler, &tempMatrix, order);
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/QUATG2", G2EulerAngles_FromMatrix);

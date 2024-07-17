#include "common.h"
#include "Game/G2/ANMCTRLR.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/MATH3D.h"
#include "Game/INSTANCE.h"
#include "Game/STATE.h"

EXTERN STATIC int AlgoControlFlag;

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ALGOCTRL", InitAlgorithmicWings);

void DeInitAlgorithmicWings(Instance *instance)
{
    unsigned char i;

    if ((AlgoControlFlag & 0x1))
    {
        for (i = 51; i < 54; i++)
        {
            G2Anim_DisableController(&instance->anim, i, 8);
        }

        for (i = 59; i < 62; i++)
        {
            G2Anim_DisableController(&instance->anim, i, 8);
        }

        AlgoControlFlag &= ~0x1;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ALGOCTRL", AlgorithmicWings);

// Matches 100% on decomp.me but differs on this project
#ifndef NON_MATCHING
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ALGOCTRL", AlgorithmicNeck);
#else
void AlgorithmicNeck(Instance *Player, Instance *Target)
{
    Position From;
    Position To;
    Rotation Rot1;
    int Diff;
    MATRIX matrix;

    Raziel.Senses.Flags &= ~0x8;

    if ((Raziel.Senses.Flags & 0x10))
    {
        evCollideInstanceStatsData data;

        TransposeMatrix(Player->oldMatrix, &matrix);

        if ((INSTANCE_SetStatsData(Player, NULL, &Raziel.Senses.lookAtPoint, &data, &matrix) != 0)
        && (data.distance < 3200) && (MATH3D_ConeDetect(&data.relativePosition, 967, 967) != 0))
        {
            Raziel.Senses.Flags |= 0x8;
        }
    }

    if ((Target == NULL) && (!(Raziel.Senses.Flags & 0x8)))
    {
        if (G2Anim_IsControllerActive(&Player->anim, 17, 8) != G2FALSE)
        {
            G2Anim_InterpDisableController(&Player->anim, 17, 8, 900);
        }

        return;
    }

    if (G2Anim_IsControllerActive(&Player->anim, 17, 8) == G2FALSE)
    {
        G2Anim_EnableController(&Player->anim, 17, 8);
    }

    if ((Raziel.Senses.Flags & 0x8))
    {
        To.x = (short)Raziel.Senses.lookAtPoint.x;
        To.y = (short)Raziel.Senses.lookAtPoint.y;
        To.z = (short)Raziel.Senses.lookAtPoint.z;
    }
    else
    {
        MATRIX *matrix;

        matrix = (MATRIX *)INSTANCE_Query(Target, 12);

        if (matrix == NULL)
        {
            return;
        }

        To.x = (short)matrix->t[0];
        To.y = (short)matrix->t[1];
        To.z = (short)matrix->t[2];
    }

    From.x = (short)Player->matrix[17].t[0];
    From.y = (short)Player->matrix[17].t[1];
    From.z = (short)Player->matrix[17].t[2];

    MATH3D_RotationFromPosToPos(&From, &To, &Rot1);

    Diff = AngleDiff(Player->rotation.z, Rot1.z);

    if (Diff > 512)
    {
        Rot1.z = Player->rotation.z + 512;
    }

    if (Diff < -512)
    {
        Rot1.z = Player->rotation.z - 512;
    }

    if ((unsigned short)(Rot1.x - 513) < 1535U)
    {
        Rot1.x = 512;
    }

    if ((unsigned short)(Rot1.x - 2049) < 1389U)
    {
        Rot1.x = 3438;
    }

    MATH3D_ZYXtoXYZ(&Rot1);

    G2EmulationSetInterpController_Vector(Player, 17, 8, (G2SVector3 *)&Rot1, 3, 0);
}
#endif

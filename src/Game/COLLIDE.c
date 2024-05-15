#include "common.h"
#include "Game/COLLIDE.h"

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointInTriangle);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointInTriangle2DPub);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_GetNormal);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_MakeNormal);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_UpdateAllTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_MoveAllTransforms);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_WithinYZBounds);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_WithinXZBounds);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_WithinXYBounds);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_LineWithBoxFace);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_IntersectLineAndBox);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndTerrainFunc);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndHFace);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndInstance);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndInstanceTrivialReject);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndWorld);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_ClosestPointInBoxToPoint);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndPoint);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndHBox);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_Instance1SpheresToInstance2);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_Instances);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceList);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndHFace);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SAndT);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SphereAndTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_LineWithSignals);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceTerrainSignal);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_CameraWithStreamSignals);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceListWithSignals);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_InstanceListTerrain);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SegmentCollisionOn);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_SegmentCollisionOff);

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_FindCollisionFaceNormal);

short *COLLIDE_GetBSPTreeFlag(struct _CollideInfo *collideInfo);
INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_GetBSPTreeFlag);

void COLLIDE_SetBSPTreeFlag(struct _CollideInfo *collideInfo, short flag)
{
	short* bspTreeFlags;

	bspTreeFlags = COLLIDE_GetBSPTreeFlag(collideInfo);

	*bspTreeFlags |= flag;
}

INCLUDE_ASM("asm/nonmatchings/Game/COLLIDE", COLLIDE_PointAndTfaceFunc);

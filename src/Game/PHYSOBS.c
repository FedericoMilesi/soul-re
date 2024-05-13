#include "common.h"

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_PlayDropSound);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_IsAPushBlockAttached);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_IsAnythingAttached);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckPhysObAbility);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckPhysObFamily);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", GetPhysicalAbility);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", AnyBlocksInMotion);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", SetThrowDirection);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ThrowPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PushPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ResetSwitchPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", SwitchPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", InteractPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ResetOrientation);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", FinishPush);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysOb_AlignPush);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", FlipPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CanBePickedUp);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PickUpPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_BirthCollectible);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_BirthProjectile);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", BirthProjectilePhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_SetLightTable);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_EndLighting);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StartLighting);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StartBurnFX);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StartBurning);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StopLighting);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_StopBurning);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_EndBurning);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", StopPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", InitPhysicalObject);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ProcessPhysicalObject);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysicalObjectQuery);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysicalObjectPost);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysobAnimCallback);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckForceCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", GetObliqueDirection);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CollidePhysicalObject);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysObGetWeapon);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysObGetLight);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysObGetSplinter);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", TurnOnCollisionPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", TurnOffCollisionPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", GetPhysObCollisionType);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteThrow);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteDrag);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteSlideToStop);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteFlip);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckSlope);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckBlockSlope);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_FigureDragForSlope);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckThrownLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDroppedLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDirectedLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_CheckForStackedForwardHits);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_SetNewAnim);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckForEnemyInBlkSpot);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_CheckForValidMove);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteGravitate);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteFollow);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_Normalize);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_MoveTowardsAlign);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_ReAlignFalling);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", DropPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PhysicalRelocateTune);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_CheckObjectAxisAlignment);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckSlide);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckSlide2);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDropOnSlope);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckSlideNormal);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_NormalToAxis);

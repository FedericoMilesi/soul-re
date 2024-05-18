#include "common.h"
#include "Game/STATE.h"

void InitMessageQueue(MessageQueue *In)
{
    In->Head = 0;
    In->Tail = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/STATE", DeMessageQueue);

void PurgeMessageQueue(MessageQueue *In)
{
    In->Tail = 0;
    In->Head = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/STATE", PeekMessageQueue);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", EnMessageQueue);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", EnMessageQueueData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", CIRC_Alloc);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetCollideInfoData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetMonsterHitData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetMonsterThrownData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetMonsterAlarmData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetMonsterSoulSuckData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetMonsterImpaleData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetObjectData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPositionData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsGravityData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsEdgeData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsSwimData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsDropOffData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsSlideData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsWallCrawlData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsLinkedMoveData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetPhysicsDropHeightData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetAnimationControllerDoneData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetAnimationInstanceSwitchData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetFXHitData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetObjectThrowData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetObjectBreakOffData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetControlInitHangData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetControlInitIdleData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetObjectDraftData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetObjectAbsorbData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetControlSaveDataData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetObjectIdleData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetActionPlayHostAnimationData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetObjectBirthProjectileData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetShadowSegmentData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInit);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstancePlayAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulatePlayAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceToInstanceSwitchAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceSwitchAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceSwitchAnimationAlpha);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSwitchAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSwitchAnimationAlpha);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSwitchAnimationSync);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceToInstanceSwitchAnimationCharacter);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSwitchAnimationCharacter);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceSetAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSetAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceSetMode);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSetMode);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceSetAnimSpeed);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceQueryAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationQueryAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceQueryFrame);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceQueryLastFrame);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceQueryPassedFrame);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationQueryFrame);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceQueryMode);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationQueryMode);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceSetStartAndEndSegment);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSetStartAndEndSegment);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceSetTotalSections);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSetTotalSections);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInstanceInitSection);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationSetInterpController_Vector);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", StateSwitchStateDataDefault);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", StateSwitchStateCharacterDataDefault);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", StateSwitchStateData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", StateSwitchStateCharacterData);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", StateGovernState);

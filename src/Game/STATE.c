#include "common.h"
#include "Game/STATE.h"

EXTERN STATIC char circBuf[4096];

EXTERN STATIC void *circWhere;

void InitMessageQueue(MessageQueue *In)
{
    In->Head = 0;
    In->Tail = 0;
}

Message *DeMessageQueue(MessageQueue *In)
{
    int head;

    head = In->Head;

    if (In->Head == In->Tail)
    {
        return NULL;
    }
    else if (++In->Head == 16)
    {
        In->Head = 0;
    }

    return &In->Queue[head];
}

void PurgeMessageQueue(MessageQueue *In)
{
    In->Tail = 0;
    In->Head = 0;
}

Message *PeekMessageQueue(MessageQueue *In)
{
    if (In->Head == In->Tail)
    {
        return NULL;
    }

    return &In->Queue[In->Head];
}

void EnMessageQueue(MessageQueue *In, Message *Element)
{
    EnMessageQueueData(In, Element->ID, Element->Data);
}

void EnMessageQueueData(MessageQueue *In, int ID, int Data)
{
    int i;

    In->Queue[In->Tail].ID = ID;
    In->Queue[In->Tail].Data = Data;

    if (++In->Tail == 16)
    {
        In->Tail = 0;
    }

    i = In->Head;

    if (i == In->Tail)
    {
        do
        {
            if (++i == 16)
            {
                i = 0;
            }
        } while (i != In->Tail);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/STATE", CIRC_Alloc);

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetCollideInfoData);

uintptr_t SetMonsterHitData(Instance *Sender, Instance *lastHit, int Power, int knockBackDistance, int knockBackFrames)
{
    evMonsterHitData *Ptr;

    Ptr = (evMonsterHitData *)CIRC_Alloc(sizeof(evMonsterHitData));

    Ptr->sender = Sender;

    Ptr->lastHit = lastHit;

    Ptr->power = Power;

    Ptr->knockBackDistance = knockBackDistance;
    Ptr->knockBackDuration = knockBackFrames;

    return (uintptr_t)Ptr;
}

uintptr_t SetMonsterThrownData(Instance *Sender, Rotation *Direction, int Power)
{
    evMonsterThrownData *Ptr;

    Ptr = (evMonsterThrownData *)CIRC_Alloc(sizeof(evMonsterThrownData));

    Ptr->sender = Sender;

    Ptr->direction.x = Direction->x;
    Ptr->direction.y = Direction->y;
    Ptr->direction.z = Direction->z;

    Ptr->power = Power;

    return (uintptr_t)Ptr;
}

uintptr_t SetMonsterAlarmData(Instance *sender, Position *position, int type)
{
    evMonsterAlarmData *Ptr;

    Ptr = (evMonsterAlarmData *)CIRC_Alloc(sizeof(evMonsterAlarmData));

    Ptr->sender = sender;

    Ptr->position.x = position->x;
    Ptr->position.y = position->y;
    Ptr->position.z = position->z;

    Ptr->type = type;

    return (uintptr_t)Ptr;
}

uintptr_t SetMonsterSoulSuckData(Instance *Sender, int x, int y, int z)
{
    evMonsterSoulSuckData *Ptr;

    Ptr = (evMonsterSoulSuckData *)CIRC_Alloc(sizeof(evMonsterSoulSuckData));

    Ptr->sender = Sender;

    Ptr->Destination.x = x;
    Ptr->Destination.y = y;
    Ptr->Destination.z = z;

    return (uintptr_t)Ptr;
}

uintptr_t SetMonsterImpaleData(Instance *weapon, Rotation *direction, Position *position, int distance)
{
    evMonsterImpaleData *Ptr;

    Ptr = (evMonsterImpaleData *)CIRC_Alloc(sizeof(evMonsterImpaleData));

    Ptr->weapon = weapon;

    Ptr->direction.x = direction->x;
    Ptr->direction.y = direction->y;
    Ptr->direction.z = direction->z;

    Ptr->position.x = position->x;
    Ptr->position.y = position->y;
    Ptr->position.z = position->z;

    Ptr->distance = distance;

    return (uintptr_t)Ptr;
}

uintptr_t SetObjectData(int x, int y, int PathNumber, Instance *Force, int node)
{
    evObjectData *Ptr;

    Ptr = (evObjectData *)CIRC_Alloc(sizeof(evObjectData));

    Ptr->x = x;
    Ptr->y = y;

    Ptr->PathNumber = PathNumber;

    Ptr->LinkNode = node;

    Ptr->Force = Force;

    return (uintptr_t)Ptr;
}

uintptr_t SetPositionData(int x, int y, int z)
{
    evPositionData *Ptr;

    Ptr = (evPositionData *)CIRC_Alloc(sizeof(evPositionData));

    Ptr->x = x;
    Ptr->y = y;
    Ptr->z = z;

    return (uintptr_t)Ptr;
}

uintptr_t SetPhysicsGravityData(int UpperOffset, int LowerOffset, int x, int y, int z, int slope)
{
    evPhysicsGravityData *Ptr;

    Ptr = (evPhysicsGravityData *)CIRC_Alloc(sizeof(evPhysicsGravityData));

    Ptr->UpperOffset = UpperOffset;
    Ptr->LowerOffset = LowerOffset;

    Ptr->x = x;
    Ptr->y = y;
    Ptr->z = z;

    Ptr->slipSlope = slope;

    return (uintptr_t)Ptr;
}

uintptr_t SetPhysicsEdgeData(int UpperOffset, int ForwardOffset, int AboveOffset, int x, int y, int z, SVector *Normal1, SVector *Normal2, SVector *Delta)
{
    evPhysicsEdgeData *Ptr;

    Ptr = (evPhysicsEdgeData *)CIRC_Alloc(sizeof(evPhysicsEdgeData));

    Ptr->UpperOffset = UpperOffset;
    Ptr->ForwardOffset = ForwardOffset;
    Ptr->AboveOffset = AboveOffset;

    Ptr->XDistance = x;
    Ptr->YDistance = y;
    Ptr->ZDistance = z;

    Ptr->Normal1 = Normal1;
    Ptr->Normal2 = Normal2;

    Ptr->Delta = Delta;

    return (uintptr_t)Ptr;
}

uintptr_t SetPhysicsSwimData(int CheckDepth, SVector *iVelocity, int SwimDepth, int WadeDepth, int TreadDepth)
{
    evPhysicsSwimData *Ptr;

    Ptr = (evPhysicsSwimData *)CIRC_Alloc(sizeof(evPhysicsSwimData));

    Ptr->CheckDepth = CheckDepth;

    Ptr->iVelocity = iVelocity;

    Ptr->SwimDepth = SwimDepth;
    Ptr->WadeDepth = WadeDepth;
    Ptr->TreadDepth = TreadDepth;

    return (uintptr_t)Ptr;
}

uintptr_t SetPhysicsDropOffData(int xOffset, int yOffset, int DropOffset, int slipSlope, int UpperOffset)
{
    evPhysicsDropOffData *Ptr;

    Ptr = (evPhysicsDropOffData *)CIRC_Alloc(sizeof(evPhysicsDropOffData));

    Ptr->xOffset = xOffset;
    Ptr->yOffset = yOffset;

    Ptr->DropOffset = DropOffset;

    Ptr->slipSlope = slipSlope;

    Ptr->UpperOffset = UpperOffset;

    return (uintptr_t)Ptr;
}

uintptr_t SetPhysicsSlideData(int Segment, int ForwardVectorX, int ForwardVectorY, int ForwardVectorZ, int DropOffset, int UpperOffset, int Height)
{
    evPhysicsSlideData *Ptr;

    Ptr = (evPhysicsSlideData *)CIRC_Alloc(sizeof(evPhysicsSlideData));

    Ptr->Segment = Segment;

    Ptr->ForwardVector.x = ForwardVectorX;
    Ptr->ForwardVector.y = ForwardVectorY;
    Ptr->ForwardVector.z = ForwardVectorZ;

    Ptr->DropOffset = DropOffset;
    Ptr->UpperOffset = UpperOffset;

    Ptr->Height = Height;

    return (uintptr_t)Ptr;
}

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

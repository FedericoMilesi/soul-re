#include "common.h"
#include "Game/STATE.h"
#include "Game/G2/ANIMG2.h"
#include "Game/G2/ANMG2ILF.h"

static char circBuf[4096];

static G2AnimAlphaTable *G2AlphaTables[7] = {0};
static void *circWhere = circBuf;

static inline void STATE_ConfigThrowFields(evObjectThrowData *Ptr, SVector *angularVel, long spinType)
{
    if (spinType < 0)
    {
        return;
    }

    if (spinType < 2)
    {
        return;
    }

    if (spinType != 2)
    {
        return;
    }

    if (angularVel == NULL)
    {
        Ptr->spinType = 0;
    }
    else
    {
        Ptr->angularVel = *angularVel;
    }
}

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

void *CIRC_Alloc(int size)
{
    void *ret;

    size = (size + 3) & ~3;

    if ((circBuf + sizeof(circBuf)) < ((char *)circWhere + size))
    {
        ret = circBuf;

        circWhere = circBuf + size;
    }
    else
    {
        ret = (char *)circWhere;

        circWhere = (char *)circWhere + size;
    }

    return ret;
}

INCLUDE_ASM("asm/nonmatchings/Game/STATE", SetCollideInfoData);

intptr_t SetMonsterHitData(Instance *Sender, Instance *lastHit, int Power, int knockBackDistance, int knockBackFrames)
{
    evMonsterHitData *Ptr;

    Ptr = (evMonsterHitData *)CIRC_Alloc(sizeof(evMonsterHitData));

    Ptr->sender = Sender;

    Ptr->lastHit = lastHit;

    Ptr->power = Power;

    Ptr->knockBackDistance = knockBackDistance;
    Ptr->knockBackDuration = knockBackFrames;

    return (intptr_t)Ptr;
}

intptr_t SetMonsterThrownData(Instance *Sender, Rotation *Direction, int Power)
{
    evMonsterThrownData *Ptr;

    Ptr = (evMonsterThrownData *)CIRC_Alloc(sizeof(evMonsterThrownData));

    Ptr->sender = Sender;

    Ptr->direction.x = Direction->x;
    Ptr->direction.y = Direction->y;
    Ptr->direction.z = Direction->z;

    Ptr->power = Power;

    return (intptr_t)Ptr;
}

intptr_t SetMonsterAlarmData(Instance *sender, Position *position, int type)
{
    evMonsterAlarmData *Ptr;

    Ptr = (evMonsterAlarmData *)CIRC_Alloc(sizeof(evMonsterAlarmData));

    Ptr->sender = sender;

    Ptr->position.x = position->x;
    Ptr->position.y = position->y;
    Ptr->position.z = position->z;

    Ptr->type = type;

    return (intptr_t)Ptr;
}

intptr_t SetMonsterSoulSuckData(Instance *Sender, int x, int y, int z)
{
    evMonsterSoulSuckData *Ptr;

    Ptr = (evMonsterSoulSuckData *)CIRC_Alloc(sizeof(evMonsterSoulSuckData));

    Ptr->sender = Sender;

    Ptr->Destination.x = x;
    Ptr->Destination.y = y;
    Ptr->Destination.z = z;

    return (intptr_t)Ptr;
}

intptr_t SetMonsterImpaleData(Instance *weapon, Rotation *direction, Position *position, int distance)
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

    return (intptr_t)Ptr;
}

intptr_t SetObjectData(int x, int y, int PathNumber, Instance *Force, int node)
{
    evObjectData *Ptr;

    Ptr = (evObjectData *)CIRC_Alloc(sizeof(evObjectData));

    Ptr->x = x;
    Ptr->y = y;

    Ptr->PathNumber = PathNumber;

    Ptr->LinkNode = node;

    Ptr->Force = Force;

    return (intptr_t)Ptr;
}

intptr_t SetPositionData(int x, int y, int z)
{
    evPositionData *Ptr;

    Ptr = (evPositionData *)CIRC_Alloc(sizeof(evPositionData));

    Ptr->x = x;
    Ptr->y = y;
    Ptr->z = z;

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsGravityData(int UpperOffset, int LowerOffset, int x, int y, int z, int slope)
{
    evPhysicsGravityData *Ptr;

    Ptr = (evPhysicsGravityData *)CIRC_Alloc(sizeof(evPhysicsGravityData));

    Ptr->UpperOffset = UpperOffset;
    Ptr->LowerOffset = LowerOffset;

    Ptr->x = x;
    Ptr->y = y;
    Ptr->z = z;

    Ptr->slipSlope = slope;

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsEdgeData(int UpperOffset, int ForwardOffset, int AboveOffset, int x, int y, int z, SVector *Normal1, SVector *Normal2, SVector *Delta)
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

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsSwimData(int CheckDepth, SVector *iVelocity, int SwimDepth, int WadeDepth, int TreadDepth)
{
    evPhysicsSwimData *Ptr;

    Ptr = (evPhysicsSwimData *)CIRC_Alloc(sizeof(evPhysicsSwimData));

    Ptr->CheckDepth = CheckDepth;

    Ptr->iVelocity = iVelocity;

    Ptr->SwimDepth = SwimDepth;
    Ptr->WadeDepth = WadeDepth;
    Ptr->TreadDepth = TreadDepth;

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsDropOffData(int xOffset, int yOffset, int DropOffset, int slipSlope, int UpperOffset)
{
    evPhysicsDropOffData *Ptr;

    Ptr = (evPhysicsDropOffData *)CIRC_Alloc(sizeof(evPhysicsDropOffData));

    Ptr->xOffset = xOffset;
    Ptr->yOffset = yOffset;

    Ptr->DropOffset = DropOffset;

    Ptr->slipSlope = slipSlope;

    Ptr->UpperOffset = UpperOffset;

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsSlideData(int Segment, int ForwardVectorX, int ForwardVectorY, int ForwardVectorZ, int DropOffset, int UpperOffset, int Height)
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

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsWallCrawlData(int Segment, int Length, int ForwardOffset, int NormalDistance)
{
    evPhysicsWallCrawlData *Ptr;

    Ptr = (evPhysicsWallCrawlData *)CIRC_Alloc(sizeof(evPhysicsWallCrawlData));

    Ptr->Segment = Segment;

    Ptr->Length = Length;

    Ptr->ForwardOffset = ForwardOffset;

    Ptr->NormalDistance = NormalDistance;

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsLinkedMoveData(Instance *instance, int segment, SVector *posDelta, SVector *rotDelta)
{
    evPhysicsLinkedMoveData *Ptr;

    Ptr = (evPhysicsLinkedMoveData *)CIRC_Alloc(sizeof(evPhysicsLinkedMoveData));

    Ptr->segment = segment;

    Ptr->instance = instance;

    if (posDelta != NULL)
    {
        Ptr->posDelta = *posDelta;
    }

    if (rotDelta != NULL)
    {
        Ptr->rotDelta = *rotDelta;
    }

    return (intptr_t)Ptr;
}

intptr_t SetPhysicsDropHeightData(Position *offset, int dropOffset, int mode)
{
    evPhysicsDropHeightData *ptr;

    ptr = (evPhysicsDropHeightData *)CIRC_Alloc(sizeof(evPhysicsDropHeightData));

    ptr->DropOffset = dropOffset;

    ptr->mode = mode;

    ptr->origin.x = offset->x;
    ptr->origin.y = offset->y;
    ptr->origin.z = offset->z + 25;

    return (intptr_t)ptr;
}

intptr_t SetAnimationControllerDoneData(Instance *instance, long segment, long type, int data)
{
    evAnimationControllerDoneData *Ptr;

    Ptr = (evAnimationControllerDoneData *)CIRC_Alloc(sizeof(evAnimationControllerDoneData));

    Ptr->instance = instance;

    Ptr->segment = segment;

    Ptr->type = type;

    Ptr->data = data;

    return (intptr_t)Ptr;
}

intptr_t SetAnimationInstanceSwitchData(Instance *instance, int anim, int frame, int frames, int mode)
{
    evAnimationInstanceSwitchData *Ptr;

    Ptr = (evAnimationInstanceSwitchData *)CIRC_Alloc(sizeof(evAnimationInstanceSwitchData));

    Ptr->instance = instance;

    Ptr->anim = anim;

    Ptr->frame = frame;

    Ptr->frames = frames;

    Ptr->mode = mode;

    return (intptr_t)Ptr;
}

intptr_t SetFXHitData(Instance *hitter, int segment, int amount, int type)
{
    evFXHitData *Ptr;

    Ptr = (evFXHitData *)CIRC_Alloc(sizeof(evFXHitData));

    Ptr->amount = amount;

    Ptr->type = type;

    if (hitter != NULL)
    {
        Ptr->location.x = hitter->matrix[segment].t[0];
        Ptr->velocity.x = Ptr->location.x - hitter->oldMatrix[segment].t[0];

        Ptr->location.y = hitter->matrix[segment].t[1];
        Ptr->velocity.y = Ptr->location.y - hitter->oldMatrix[segment].t[1];

        Ptr->location.z = hitter->matrix[segment].t[2];
        Ptr->velocity.z = Ptr->location.z - hitter->oldMatrix[segment].t[2];
    }

    return (intptr_t)Ptr;
}

intptr_t SetObjectThrowData(void *target, SVector *angularVel, unsigned short type, unsigned short spinType, int speed, int gravity, int zVel, int initialXRot)
{
    evObjectThrowData *Ptr;
    short temp, temp2, temp3, temp4; // not from decls.h

    temp = speed;

    temp2 = gravity;

    temp3 = zVel;

    temp4 = initialXRot;

    Ptr = (evObjectThrowData *)CIRC_Alloc(sizeof(evObjectThrowData));

    Ptr->type = type;

    Ptr->spinType = spinType;

    if (target == NULL)
    {
        Ptr->type = 0;
    }
    else
    {
        switch (type)
        {
        case 0:
            break;
        case 1:
            Ptr->data.target = (Instance *)target;
            break;
        case 3:
            Ptr->data.direction = *(Rotation *)target;
            break;
        case 2:
        case 4:
            Ptr->data.throwVector = *(Position *)target;
            break;
        }
    }

    STATE_ConfigThrowFields(Ptr, angularVel, spinType);

    Ptr->speed = temp;

    Ptr->gravity = temp2;

    Ptr->zVel = temp3;

    Ptr->initialXRot = temp4;

    return (intptr_t)Ptr;
}

intptr_t SetObjectBreakOffData(Instance *force, short node, short distance, short animation, int frame, int type, int action)
{
    evObjectBreakOffData *Ptr;

    Ptr = (evObjectBreakOffData *)CIRC_Alloc(sizeof(evObjectBreakOffData));

    Ptr->force = force;

    Ptr->node = node;

    Ptr->distance = distance;

    Ptr->animation = animation;

    Ptr->frame = frame;

    Ptr->type = type;

    Ptr->action = action;

    return (intptr_t)Ptr;
}

intptr_t SetControlInitHangData(Instance *instance, long frame, long frames)
{
    evControlInitHangData *Ptr;

    Ptr = (evControlInitHangData *)CIRC_Alloc(sizeof(evControlInitHangData));

    Ptr->instance = instance;

    Ptr->frame = frame;

    Ptr->frames = frames;

    return (intptr_t)Ptr;
}

intptr_t SetControlInitIdleData(int mode, long frame, long frames)
{
    evControlInitIdleData *Ptr;

    Ptr = (evControlInitIdleData *)CIRC_Alloc(sizeof(evControlInitIdleData));

    Ptr->mode = mode;

    Ptr->frame = frame;

    Ptr->frames = frames;

    return (intptr_t)Ptr;
}

intptr_t SetObjectDraftData(short force, unsigned short radius, unsigned short radiusCoef, unsigned short height, int maxVelocity)
{
    evObjectDraftData *Ptr;

    Ptr = (evObjectDraftData *)CIRC_Alloc(sizeof(evObjectDraftData));

    Ptr->force = force;

    Ptr->radius = radius;
    Ptr->radiusCoef = radiusCoef;

    Ptr->height = height;

    Ptr->maxVelocity = maxVelocity;

    return (intptr_t)Ptr;
}

intptr_t SetObjectAbsorbData(Instance *force, unsigned short node, unsigned short steps)
{
    evObjectAbsorbData *Ptr;

    Ptr = (evObjectAbsorbData *)CIRC_Alloc(sizeof(evObjectAbsorbData));

    Ptr->force = force;

    Ptr->node = node;

    Ptr->steps = steps;

    return (intptr_t)Ptr;
}

intptr_t SetControlSaveDataData(long length, void *data)
{
    evControlSaveDataData *Ptr;

    Ptr = (evControlSaveDataData *)CIRC_Alloc(sizeof(evControlSaveDataData));

    Ptr->length = length;

    Ptr->data = data;

    return (intptr_t)Ptr;
}

intptr_t SetObjectIdleData(long mode, Instance *instance)
{
    evObjectIdleData *Ptr;

    Ptr = (evObjectIdleData *)CIRC_Alloc(sizeof(evObjectIdleData));

    Ptr->mode = mode;

    Ptr->instance = instance;

    return (intptr_t)Ptr;
}

intptr_t SetActionPlayHostAnimationData(Instance *instance, Instance *host, int newAnim, int newFrame, int frames, int mode)
{
    evActionPlayHostAnimationData *Ptr;

    Ptr = (evActionPlayHostAnimationData *)CIRC_Alloc(sizeof(evActionPlayHostAnimationData));

    Ptr->instance = instance;

    Ptr->host = host;

    Ptr->newAnim = newAnim;

    Ptr->newFrame = newFrame;

    Ptr->frames = frames;

    Ptr->mode = mode;

    return (intptr_t)Ptr;
}

intptr_t SetObjectBirthProjectileData(Instance *instance, int joint, int type)
{
    evObjectBirthProjectileData *Ptr;

    Ptr = (evObjectBirthProjectileData *)CIRC_Alloc(sizeof(evObjectBirthProjectileData));

    Ptr->instance = instance;

    Ptr->joint = joint;

    Ptr->type = type;

    Ptr->birthInstance = NULL;

    return (intptr_t)Ptr;
}

intptr_t SetShadowSegmentData(unsigned long total)
{
    evShadowSegmentData *Ptr;

    Ptr = (evShadowSegmentData *)CIRC_Alloc(sizeof(evShadowSegmentData));

    Ptr->totalShadowSegments = total;

    return (intptr_t)Ptr;
}

INCLUDE_ASM("asm/nonmatchings/Game/STATE", G2EmulationInit);

void G2EmulationInstancePlayAnimation(Instance *instance)
{
    int i;
    G2Anim *anim;

    anim = &instance->anim;

    for (i = 0; i < anim->sectionCount; i++)
    {
        G2AnimSection_NextKeyframe(&anim->section[i & 0xFF]);
    }
}

void G2EmulatePlayAnimation(CharacterState *In)
{
    G2EmulationInstancePlayAnimation(In->CharacterInstance);
}

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

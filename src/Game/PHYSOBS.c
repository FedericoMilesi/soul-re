#include "common.h"
#include "Game/PHYSOBS.h"
#include "Game/MATH3D.h"
#include "Game/PHYSICS.h"
#include "Game/STATE.h"
#include "Game/STREAM.h"
#include "Game/GLYPH.h"
#include "Game/SCRIPT.h"
#include "Game/G2/ANMG2ILF.h"

void PHYSOB_PlayDropSound(Instance *instance)
{
    PhysObProperties *Prop;
    int sound;

    Prop = (PhysObProperties *)instance->data;

    if (Prop->family == 1)
    {
        sound = (short)((PhysObInteractProperties *)Prop)->auxConditions; // TODO: likely wrong, physob type should be different
    }
    else if (Prop->family == 0)
    {
        sound = (char)((PhysObInteractProperties *)Prop)->razielAuxAnim; // TODO: likely wrong, physob type should be different
    }
    else if (Prop->family == 3)
    {
        sound = 0;

        if (((PhysObInteractProperties *)Prop)->weapon != NULL)
        {
            sound = ((PhysObInteractProperties *)Prop)->weapon->dropSound;
        }
    }
    else
    {
        sound = 0;
    }

    switch (sound)
    {
    case 1:
        SOUND_Play3dSound(&instance->position, 10, -100, 120, 30000);
        break;
    case 2:
        SOUND_Play3dSound(&instance->position, 282, -400, 90, 14000);
        SOUND_Play3dSound(&instance->position, 282, -800, 100, 14000);
        break;
    case 3:
        SOUND_Play3dSound(&instance->position, 178, -800, 120, 30000);
        break;
    }
}

Instance *PHYSOBS_IsAPushBlockAttached(Instance *block)
{
    Instance *instance;
    Instance *next;
    Instance *result;

    result = NULL;

    for (instance = gameTrackerX.instanceList->first; instance != NULL; instance = next)
    {
        next = instance->next;

        if ((instance->attachedID == block->introUniqueID) && (CheckPhysObAbility(instance, 2) != 0))
        {
            result = instance;
            break;
        }
    }

    return result;
}

Instance *PHYSOBS_IsAnythingAttached(Instance *block)
{
    Instance *instance;
    Instance *next;
    Instance *result;

    result = NULL;

    for (instance = gameTrackerX.instanceList->first; instance != NULL; instance = next)
    {
        next = instance->next;

        if (instance->attachedID == block->introUniqueID)
        {
            result = instance;
            break;
        }
    }

    return result;
}

int CheckPhysOb(Instance *instance)
{
    PhysObProperties *Prop;

    Prop = (PhysObProperties *)instance->data;

    if (Prop != NULL)
    {
        return (Prop->ID ^ 0xB00B) == 0;
    }

    return 0;
}

int CheckPhysObAbility(Instance *instance, unsigned short ability)
{
    PhysObProperties *prop;
    PhysObInteractProperties *temp; // not from decls.h 

    prop = (PhysObProperties *)instance->data;

    if (prop != NULL)
    {
        if (prop->ID != 0xB00B)
        {
            return 0;
        }
        else if (prop->family == 3)
        {
            temp = (PhysObInteractProperties *)instance->extraData;

            if (((short)temp->Properties.ID & (ability & 0xFFFF)))
            {
                return 1;
            }
        }
        else if ((prop->Type & ability))
        {
            return 1;
        }
    }

    return 0;
}

int CheckPhysObFamily(Instance *instance, unsigned short family)
{
    PhysObProperties *Prop;

    Prop = (PhysObProperties *)instance->data;

    if (Prop != NULL)
    {
        if (Prop->ID != 0xB00B)
        {
            return 0;
        }

        if (Prop->family == family)
        {
            return 1;
        }
    }

    return 0;
}

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

void PhysicalObjectPost(Instance *instance, unsigned long Message, unsigned long Data)
{
    evObjectData *Ptr;
    PhysObData *PData;

    PData = (PhysObData *)instance->extraData;

    Ptr = (evObjectData *)Data;

    switch (Message)
    {
    case 0x800025:
        break;
    case 0x800000:
        if ((STREAM_IsMorphInProgress() != 0) || (gameTrackerX.gameData.asmData.MorphType == 0))
        {
            Ptr->rc = PushPhysOb(instance, Ptr->x, Ptr->y, Ptr->PathNumber, Ptr->Force);
        }

        break;
    case 0x800001:
        if ((STREAM_IsMorphInProgress() != 0) || (gameTrackerX.gameData.asmData.MorphType == 0))
        {
            Ptr->rc = FlipPhysOb(instance, Ptr->x, Ptr->y, Ptr->Force);
        }

        break;
    case 0x800002:
        if ((STREAM_IsMorphInProgress() != 0) || (gameTrackerX.gameData.asmData.MorphType == 0) || (Ptr->PathNumber == 0))
        {
            Ptr->LinkNode = PickUpPhysOb(instance, Ptr->PathNumber, Ptr->Force, Ptr->LinkNode);

            if ((Ptr->PathNumber == 0) && ((PData->Mode & 0x4000)))
            {
                ExecuteGravitate(instance);
            }
        }

        break;
    case 0x80002E:
        if (CanBePickedUp(instance, Ptr->Force, Ptr->LinkNode) != 0)
        {
            Ptr->LinkNode = 0;
        }

        break;
    case 0x800004:
        StopPhysOb(instance);
        break;
    case 0x800008:
        DropPhysOb(instance, (int)Data);

        if (((int)Data & 0x1))
        {
            PData->Mode |= 0x2000000;
        }

        break;
    case 0x800010:
        ThrowPhysOb(instance, (evObjectThrowData *)Data);
        break;
    case 0x800020:
        SwitchPhysOb(instance);
        break;
    case 0x80002D:
        ResetSwitchPhysOb(instance);
        break;
    case 0x800023:
        if ((STREAM_IsMorphInProgress() != 0) || (gameTrackerX.gameData.asmData.MorphType == 0))
        {
            evObjectBreakOffData *temp; // not from decls.h

            temp = (evObjectBreakOffData *)Data;

            InteractPhysOb(instance, temp->force, temp->node, temp->action);
        }

        break;
    case 0x800021:
    case 0x800022:
    {
        PhysObSwitchProperties *Prop;
        PhysObSwitchProperties *temp; // not from decls.h

        if (CheckPhysOb(instance) != 0)
        {
            Prop = (PhysObSwitchProperties *)instance->data;

            if (CheckPhysObFamily(instance, 2) != 0)
            {
                temp = (PhysObSwitchProperties *)instance->extraData;

                if (Message == 0x800021)
                {
                    temp->Properties.ID |= 0x2;
                }
                else
                {
                    temp->Properties.ID &= ~0x2;
                }

                break;
            }

            if (Prop->Class == 0)
            {
                PhysObData *Data;

                Data = (PhysObData *)instance->extraData;

                if (Message == 0x800021)
                {
                    Data->Mode &= ~0x2000;
                    break;
                }

                Data->Mode |= 0x2000;
            }
        }

        break;
    }
    case 0x100007:
    {
        PhysObSaveData *saveData;

        saveData = ((evControlSaveDataData *)Data)->data;

        *(SwitchData *)&PData->xForce = saveData->switchData; // TODO: very illogical, needs rewriting

        PData->Mode = saveData->Mode & ~0x100800;

        if ((PData->Mode & 0x2000000))
        {
            instance->flags |= 0x20;
        }

        if (CheckPhysObAbility(instance, 32) != 0)
        {
            PhysObLight *pLight;

            pLight = PhysObGetLight(instance);

            if (!(PData->Mode & 0x10000))
            {
                PHYSOB_EndBurning(instance, pLight);
            }
        }

        if (CheckPhysObFamily(instance, 2) != 0)
        {
            PhysObSwitchProperties *Prop;
            PhysObSwitchProperties *temp; // not from decls.h

            temp = (PhysObSwitchProperties *)instance->extraData;

            Prop = (PhysObSwitchProperties *)instance->data;

            if ((temp->Properties.ID & 0x1))
            {
                G2EmulationInstanceSetAnimation(instance, 0, Prop->offAnim, 0, 0);
                G2EmulationInstanceSetMode(instance, 0, 1);

                G2EmulationInstancePlayAnimation(instance);
            }
        }

        if (CheckPhysObFamily(instance, 3) != 0)
        {
            PhysObInteractProperties *temp; // not from decls.h

            temp = (PhysObInteractProperties *)instance->extraData;

            if ((short)temp->Properties.Type != 0)
            {
                G2EmulationInstanceSetAnimation(instance, 0, 0, 0, 0);
                G2EmulationInstanceSetMode(instance, 0, 1);

                G2EmulationInstancePlayAnimation(instance);
            }
        }

        break;
    }
    case 0x100008:
        if (PData != NULL)
        {
            PData->px += Ptr->x;
            PData->py += Ptr->y;
            PData->pz += Ptr->PathNumber;
        }

        break;
    case 0x800026:
    {
        PhysObCollectibleProperties *collectibleProp;

        collectibleProp = (PhysObCollectibleProperties *)instance->data;

        switch (collectibleProp->collectClass)
        {
        case 1:
            HEALTHU_Pickup(instance);
            break;
        case 2:
        case 5:
            MANNA_Pickup();
        case 3:
        case 4:
            INSTANCE_PlainDeath(instance);
            break;
        case 7:
            MANNA_Pickup();
        case 6:
            if ((collectibleProp->collectAnim != 0xFF) && (G2EmulationInstanceQueryAnimation(instance, 0) != collectibleProp->collectAnim))
            {
                printf("Collect %s\n", instance->object->name);

                G2EmulationInstanceSetAnimation(instance, 0, collectibleProp->collectAnim, 0, 0);
                G2EmulationInstanceSetMode(instance, 0, 1);
            }

            break;
        }

        break;
    }
    case 0x800027:
        if ((uintptr_t *)Data != NULL)
        {
            PData->Mode &= ~0x1000;
        }
        else
        {
            PData->Mode |= 0x1000;
        }

        break;
    case 0x80002C:
        PData->Mode |= 0x800000;
        break;
    case 0x200002:
        TurnOnCollisionPhysOb(instance, (int)Data);
        break;
    case 0x200003:
        TurnOffCollisionPhysOb(instance, (int)Data);
        break;
    case 0x200005:
        PData->Mode |= 0x1000000;
        break;
    case 0x200006:
        PData->Mode &= ~0x1000000;
        break;
    case 0x80002b:
        PData->Mode &= ~0x800000;
        break;
    case 0x800029:
    {
        PhysObLight *pLight;

        pLight = PhysObGetLight(instance);

        if (pLight != NULL)
        {
            switch ((unsigned long)Data)
            {
            case 0:
                PHYSOB_StopBurning(instance, pLight);
                break;
            case 1:
                PHYSOB_StartBurning(instance, pLight);
                break;
            case 2:
            {
                PhysObData *podata;

                podata = (PhysObData *)instance->extraData;

                podata->burnAmpl = 0;

                podata->Mode &= ~0x8000;

                PHYSOB_EndBurning(instance, pLight);
                break;
            }
            }
        }

        break;
    }
    case 0x80005:
        ScriptKillInstance(instance, 5);
        break;
    case 0x40002:
        ScriptKillInstance(instance, (int)Data);
        break;
    case 0x80002A:
    {
        PhysObSwitchProperties *temp; // not from decls.h

        if (CheckPhysObFamily(instance, 2) != 0)
        {
            temp = (PhysObSwitchProperties *)instance->extraData;

            temp->Properties.ID = (unsigned short)Data;
        }

        break;
    }
    case 0x8000008:
    {
        evAnimationInstanceSwitchData *temp; // not from decls.h

        temp = (evAnimationInstanceSwitchData *)Data;

        G2EmulationInstanceSetAnimation(instance, 0, temp->anim, temp->frame, temp->frames);
        G2EmulationInstanceSetMode(instance, 0, temp->mode);
        break;
    }
    case 0x4000E:
    {
        PhysObProperties *Prop;

        if ((uintptr_t *)Data != NULL)
        {
            Prop = (PhysObProperties *)instance->data;

            if ((Prop->family == 7) && (instance->parent != NULL) && ((INSTANCE_Query(instance->parent, 1) & 0xA)))
            {
                instance->flags |= 0x20;
            }
        }

        break;
    }
    }
}

long PhysobAnimCallback(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, void *data)
{
    PhysObData *Data;
    Instance *temp; // not from decls.h

    if (message == 1)
    {
        temp = (Instance *)data;

        Data = (PhysObData *)temp->extraData;

        G2AnimSection_SetPaused(&anim->section[sectionID]);

        Data->Mode |= 0x100000;

        if ((Data->Mode & 0x80000))
        {
            INSTANCE_KillInstance(temp);
        }

        return messageDataA;
    }

    return INSTANCE_DefaultAnimCallback(anim, sectionID, message, messageDataA, messageDataB, (Instance *)data);
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckForceCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", GetObliqueDirection);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CollidePhysicalObject);

PhysObWeaponAttributes *PhysObGetWeapon(Instance *instance)
{
    PhysObWeaponAttributes *weapon;

    weapon = NULL;

    if (CheckPhysObFamily(instance, 0) != 0)
    {
        PhysObWeaponProperties *Prop;

        Prop = (PhysObWeaponProperties *)instance->data;

        weapon = &Prop->WeaponAttributes;
    }

    if (CheckPhysObFamily(instance, 3) != 0)
    {
        PhysObInteractProperties *Prop;

        Prop = (PhysObInteractProperties *)instance->data;

        weapon = Prop->weapon;
    }

    if (CheckPhysObFamily(instance, 7) != 0)
    {
        PhysObProjectileProperties *Prop;
        PhysObProjectileData *temp; // not from decls.h
        evObjectBirthProjectileData *temp2; // not from decls.h

        Prop = (PhysObProjectileProperties *)instance->data;

        temp2 = (evObjectBirthProjectileData *)instance->extraData;

        temp = Prop->data;

        weapon = temp[temp2->joint].weapon;
    }

    return weapon;
}

PhysObLight *PhysObGetLight(Instance *instance)
{
    PhysObWeaponAttributes *weapon;
    PhysObLight *pLight;

    pLight = NULL;

    weapon = PhysObGetWeapon(instance);

    if (weapon != NULL)
    {
        pLight = weapon->Light;
    }

    return pLight;
}

PhysObSplinter *PhysObGetSplinter(Instance *instance)
{
    PhysObWeaponAttributes *weapon;
    PhysObSplinter *pSplinter;

    pSplinter = NULL;

    weapon = PhysObGetWeapon(instance);

    if (weapon != NULL)
    {
        pSplinter = &weapon->splinter;
    }

    return pSplinter;
}

void TurnOnCollisionPhysOb(Instance *instance, int coll)
{
    PhysObWeaponAttributes *weapon;
    PhysObData *temp; // not from decls.h

    temp = (PhysObData *)instance->extraData;

    temp->Mode &= ~0x1000000;

    weapon = PhysObGetWeapon(instance);

    if (weapon != NULL)
    {
        if ((coll & 0x2))
        {
            COLLIDE_SegmentCollisionOn(instance, (signed char)weapon->LeftHandSphere);
        }

        if ((coll & 0x1))
        {
            COLLIDE_SegmentCollisionOn(instance, (signed char)weapon->RightHandSphere);
        }

        if ((coll & 0x4))
        {
            COLLIDE_SegmentCollisionOn(instance, (signed char)weapon->ThrowSphere);
        }
    }
}

void TurnOffCollisionPhysOb(Instance *instance, int coll)
{
    PhysObWeaponAttributes *weapon;

    weapon = PhysObGetWeapon(instance);

    if (weapon != NULL)
    {
        if ((coll & 0x2))
        {
            COLLIDE_SegmentCollisionOff(instance, (signed char)weapon->LeftHandSphere);
        }

        if ((coll & 0x1))
        {
            COLLIDE_SegmentCollisionOff(instance, (signed char)weapon->RightHandSphere);
        }

        if ((coll & 0x4))
        {
            COLLIDE_SegmentCollisionOff(instance, (signed char)weapon->ThrowSphere);
        }
    }
}

int GetPhysObCollisionType(Instance *instance)
{
    CollideInfo *collideInfo;
    //HSphere *S; unused
    Instance *target;
    PhysObWeaponAttributes *weapon;
    PhysObData *Data;

    Data = (PhysObData *)instance->extraData;

    collideInfo = (CollideInfo *)instance->collideInfo;

    if (!(Data->Mode & 0x1600001))
    {
        weapon = (PhysObWeaponAttributes *)collideInfo->prim0;

        if ((instance->LinkParent == gameTrackerX.playerInstance) && ((unsigned char)weapon->AltDamage == 9))
        {
            if ((unsigned char)collideInfo->type1 != 3)
            {
                Instance *inst;

                inst = (Instance *)collideInfo->inst1;

                inst->flags |= 0x4;
            }
            else
            {
                COLLIDE_SetBSPTreeFlag(collideInfo, 0x800);
            }

            if ((unsigned char)collideInfo->type1 != 1)
            {
                COLLIDE_SegmentCollisionOff(instance, (unsigned char)collideInfo->segment);

                if (instance->LinkParent == gameTrackerX.playerInstance)
                {
                    INSTANCE_Post(instance->LinkParent, 0x1000024, 0);
                }
            }
        }

        if (((collideInfo->type0 == 1) && (collideInfo->type1 == 1)) && ((unsigned char)weapon->AltDamage == 9)
        && (weapon = (PhysObWeaponAttributes *)collideInfo->prim1, ((HSphere *)weapon)->id == 8)) // TODO: weapon should be S here
        {
            target = (Instance *)collideInfo->inst1;

            weapon = PhysObGetWeapon(instance);

            if (weapon != NULL)
            {
                TurnOffCollisionPhysOb(instance, 7);

                if (instance->LinkParent == NULL)
                {
                    if ((INSTANCE_Query(target, 0) & 0x10000000))
                    {
                        if (weapon->Class == 1)
                        {
                            INSTANCE_Post(target, 0x1000019, (intptr_t)instance);

                            Data->Mode &= ~0x10;
                        }
                        else if ((CheckPhysObAbility(instance, 32) != 0) && ((Data->Mode & 0x10000)))
                        {
                            INSTANCE_Post(target, 0x100000C, 0x20);
                            INSTANCE_Post(instance, 0x800029, 0);
                        }
                        else
                        {
                            INSTANCE_Post(target, 0x1000000, SetMonsterHitData(instance, NULL, weapon->Damage, weapon->knockBackDistance, weapon->knockBackFrames));
                        }
                    }
                    else
                    {
                        INSTANCE_Post(target, 0x1000000, SetMonsterHitData(instance, NULL, weapon->Damage, weapon->knockBackDistance, weapon->knockBackFrames));
                    }

                    if ((gameTrackerX.gameData.asmData.MorphType == 0) && (CheckPhysObFamily(instance, 7) != 0) && (instance->parent == gameTrackerX.playerInstance))
                    {
                        INSTANCE_Post(target, 0x80001, 0);
                    }
                }
                else
                {
                    int damage;

                    damage = weapon->Damage;

                    if (CheckPhysObAbility(instance, 32) != 0)
                    {
                        if (!(Data->Mode & 0x10000))
                        {
                            damage = weapon->AltDamage;
                        }
                    }

                    INSTANCE_Post(instance->LinkParent, 0x2000002, SetMonsterHitData(target, NULL, damage, 0, 0));
                }

                if ((CheckPhysObAbility(instance, 32) != 0) && ((Data->Mode & 0x10000)))
                {
                    INSTANCE_Post(target, 0x400000, SetFXHitData(instance, (unsigned char)collideInfo->segment, weapon->Damage >> 7, 32));
                }
                else
                {
                    INSTANCE_Post(target, 0x400000, SetFXHitData(instance, (unsigned char)collideInfo->segment, weapon->Damage >> 7, 256));
                }

                return 1;
            }
        }
    }

    return 0;
}

void ExecuteThrow(Instance *instance)
{
    PhysObData *Data;

    Data = (PhysObData *)instance->extraData;

    if ((Data->throwFlags & 0x1))
    {
        short angley;
        Position zero;
        Position velocity;

        memset(&zero, 0, sizeof(Position));

        velocity.x = (short)instance->xVel;
        velocity.y = (short)instance->yVel;
        velocity.z = (short)instance->zVel;

        angley = MATH3D_AngleFromPosToPos(&zero, &velocity);

        instance->rotation.x = Data->initialXRot + MATH3D_ElevationFromPosToPos(&zero, &velocity);
        instance->rotation.z = angley;
        instance->rotation.y = 0;

        MATH3D_ZYXtoXYZ(&instance->rotation);
    }
    else
    {
        instance->rotation.x += Data->xRotVel;
        instance->rotation.y += Data->yRotVel;
        instance->rotation.z += Data->zRotVel;
    }

    Data->physObTimer -= gameTrackerX.timeMult;

    if (Data->physObTimer < 0)
    {
        INSTANCE_KillInstance(instance);
    }
}

void ExecuteDrag(Instance *instance)
{
    PhysObData *Data;

    Data = (PhysObData *)instance->extraData;

    if ((Data->Mode & 0x2))
    {
        Data->Mode &= ~0x2;
    }

    if ((Data->Mode & 0x100000))
    {
        Data->Force = NULL;

        FinishPush(instance);

        Data->Mode = (Data->Mode & ~0x10014A) | 0x1;

        instance->initialPos = instance->position;
    }
    else
    {
        G2EmulationInstancePlayAnimation(instance);
    }
}

void ExecuteSlideToStop(Instance *instance)
{
    PhysObData *Data;

    Data = (PhysObData *)instance->extraData;

    if ((Data->Mode & 0x100000))
    {
        if ((Data->Mode & 0x4000000))
        {
            Data->Mode &= ~0x410114A;

            if (!(Data->Mode & 0x4))
            {
                Data->Mode |= 0x1;
            }
        }
        else
        {
            Data->Force = NULL;

            FinishPush(instance);

            Data->Mode = (Data->Mode & ~0x1000) | 0x4000000;

            instance->initialPos = instance->position;
        }
    }
    else
    {
        G2EmulationInstancePlayAnimation(instance);
    }
}

void ExecuteFlip(Instance *instance)
{
    PhysObData *Data;

    Data = (PhysObData *)instance->extraData;

    if ((Data->Mode & 0x2))
    {
        Data->Mode &= ~0x2;
    }

    if ((Data->Mode & 0x100000))
    {
        if ((Data->Mode & 0x4000000))
        {
            Data->Mode &= ~0x410114A;

            if (!(Data->Mode & 0x4))
            {
                Data->Mode |= 0x1;
            }
        }
        else
        {
            if (Data->PathNumber == 14)
            {
                instance->zVel = -50;
            }

            ResetOrientation(instance);

            Data->Force = NULL;

            Data->Mode = (Data->Mode & ~0x1000) | 0x4000000;

            instance->initialPos = instance->position;
        }
    }
    else
    {
        G2EmulationInstancePlayAnimation(instance);
    }
}

int CheckSlope(int Znormal, int Slope, int Slop)
{
    int temp; // not from decls.h

    temp = 0;

    if ((Slope - Slop) < Znormal)
    {
        temp = Znormal < (Slope + Slop);
    }

    return temp;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", CheckBlockSlope);

int PHYSOBS_FigureDragForSlope(Instance *instance, int pathNumber, int *result)
{
    int didSomething;

    didSomething = 0;

    do {} while (0); // garbage code for reodering

    if ((PHYSOBS_IsAPushBlockAttached(instance) != NULL) || (pathNumber == 5) || (pathNumber == 1) || (pathNumber == 7) || (pathNumber == 4) || (pathNumber == 2) || (didSomething = 0, pathNumber == 3))
    {
        *result = 0;

        didSomething = 1;
    }

    return didSomething;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckThrownLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDroppedLineCollision);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckDirectedLineCollision);

long PHYSOBS_CheckForStackedForwardHits(Instance *block, long xoffset, long yoffset)
{
    Instance *attachedBlock;
    long result;

    result = 0;

    attachedBlock = PHYSOBS_IsAPushBlockAttached(block);

    while (attachedBlock != NULL)
    {
        if (PHYSOB_CheckDirectedLineCollision(attachedBlock, xoffset, yoffset, 0) != 0)
        {
            result = 1;
            break;
        }

        attachedBlock = PHYSOBS_IsAPushBlockAttached(attachedBlock);
    }

    return result;
}

void PHYSOBS_SetNewAnim(Instance *instance, PhysObData *Data, unsigned long modeBits, int path, int resetflg)
{
    Data->PathNumber = (short)path;

    Data->Mode = (Data->Mode & ~0x1) | modeBits;

    if (resetflg != 0)
    {
        ResetOrientation(instance);
    }

    PhysOb_AlignPush(instance, (int)Data->xForce, (int)Data->yForce, path, Data);
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_CheckForEnemyInBlkSpot);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOBS_CheckForValidMove);

void ExecuteGravitate(Instance *instance)
{
    PhysObData *Data;
    Instance *Force;
    G2EulerAngles ea;
    Vector Position;
    Model *model;
    MATRIX *forceMatrix;
    int scale;

    Data = (PhysObData *)instance->extraData;

    Force = Data->Force;

    model = instance->object->modelList[0];

    forceMatrix = &Force->matrix[Data->LinkNode];

    if (CheckPhysObAbility(instance, 1) != 0)
    {
        COLLIDE_SegmentCollisionOff(instance, 1);
    }

    if (Data->Steps != 0)
    {
        G2EulerAngles_FromMatrix(&ea, (G2Matrix *)forceMatrix, 21);

        if (Data->Step == 0)
        {
            Data->rx1 = instance->rotation.x;
            Data->ry1 = instance->rotation.y;
            Data->rz1 = instance->rotation.z;

            Data->px = instance->position.x;
            Data->py = instance->position.y;
            Data->pz = instance->position.z;
        }

        instance->rotation.x = Data->rx1 + (((ea.x - Data->rx1) * Data->Step) / Data->Steps);
        instance->rotation.y = Data->ry1 + (((ea.y - Data->ry1) * Data->Step) / Data->Steps);
        instance->rotation.z = Data->rz1 + (((ea.z - Data->rz1) * Data->Step) / Data->Steps);

        ApplyMatrix(&instance->matrix[2], (SVECTOR *)&model->segmentList[2].px, (VECTOR *)&Position);

        Position.x = forceMatrix->t[0] - Position.x;
        Position.y = forceMatrix->t[1] - Position.y;
        Position.z = forceMatrix->t[2] - Position.z;

        instance->position.x = (short)(Data->px + (((Position.x - Data->px) * Data->Step) / Data->Steps));
        instance->position.y = (short)(Data->py + (((Position.y - Data->py) * Data->Step) / Data->Steps));
        instance->position.z = (short)(Data->pz + (((Position.z - Data->pz) * Data->Step) / Data->Steps));

        Data->Step++;
    }

    if ((Data->Mode & 0x20000))
    {
        if (Data->Steps == 0)
        {
            scale = 4096;
        }
        else
        {
            scale = 4096 - ((Data->Step << 12) / Data->Steps);
        }

        instance->scale.x = instance->scale.y = instance->scale.z = scale;
    }

    if (Data->Step == Data->Steps)
    {
        if ((Data->Mode & 0x20000))
        {
            INSTANCE_KillInstance(instance);
        }
        else
        {
            Data->Mode = (Data->Mode & ~0x1024005) | 0x1080;

            TurnOffCollisionPhysOb(instance, 7);

            INSTANCE_LinkToParent(instance, Force, Data->LinkNode);

            Data->Force = NULL;

            Data->Step = 0;
            Data->Steps = 0;

            instance->xVel = 0;
            instance->yVel = 0;
            instance->zVel = 0;

            instance->xAccl = 0;
            instance->yAccl = 0;
            instance->zAccl = 0;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ExecuteFollow);

void PHYSOB_Normalize(SVector *v)
{
    long len;

    len = MATH3D_SquareLength(v->x, v->y, v->z);

    if (len != 0)
    {
        len = MATH3D_FastSqrt0(len);
    }
    else
    {
        len = 1;
    }

    v->x = ((v->x << 12) / len);
    v->y = ((v->y << 12) / len);
    v->z = ((v->z << 12) / len);
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_MoveTowardsAlign);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_ReAlignFalling);

void DropPhysOb(Instance *instance, int flags)
{
    PhysObData *Data;
    Instance *parent;
    int temp; // not from decls.h

    parent = instance->LinkParent;

    Data = (PhysObData *)instance->extraData;

    if (parent != NULL)
    {
        INSTANCE_UnlinkFromParent(instance);
    }
    else
    {
        Data->Mode &= ~0x800000;
    }

    PHYSOB_CheckDroppedLineCollision(instance, parent);

    if ((flags & 0x2))
    {
        Data->Mode = (Data->Mode & ~0x90) | 0x1000;

        instance->zAccl = 0;
    }
    else
    {
        if (!(flags & 0x4))
        {
            temp = 0;

            if (parent != NULL)
            {
                temp = -900;
            }

            PHYSOB_ReAlignFalling(instance, temp);
        }

        Data->throwingInstance = parent;

        Data->Mode = (Data->Mode & ~0x1090) | 0x400004;

        instance->zAccl = -10;
    }

    instance->xVel = 0;
    instance->yVel = 0;
    instance->zVel = 0;

    instance->xAccl = 0;
    instance->yAccl = 0;
}

void PhysicalRelocateTune(Object *object, long offset)
{
    PhysObWeaponProperties *properties;
    PhysObLight *pLight;

    properties = (PhysObWeaponProperties *)object->data;

    if (properties != NULL)
    {
        if (properties->Properties.family == 0)
        {
            pLight = (PhysObLight *)OFFSET_DATA(properties->WeaponAttributes.Light, offset);

            properties->WeaponAttributes.Light = pLight;

            if (pLight != NULL)
            {
                pLight->lightTable = (LightTableEntry *)OFFSET_DATA(pLight->lightTable, offset);
            }

            properties->WeaponAttributes.splinter.splinterData = (void *)OFFSET_DATA(properties->WeaponAttributes.splinter.splinterData, offset);
        }

        if (properties->Properties.family == 3)
        {
            PhysObInteractProperties *prop;
            PhysObWeaponAttributes *weapon;

            prop = (PhysObInteractProperties *)object->data;

            prop->weapon = (PhysObWeaponAttributes *)OFFSET_DATA(prop->weapon, offset);

            weapon = prop->weapon;

            if (weapon != NULL)
            {
                weapon->Light = (PhysObLight *)OFFSET_DATA(weapon->Light, offset);

                pLight = weapon->Light;

                if (pLight != NULL)
                {
                    pLight->lightTable = (LightTableEntry *)OFFSET_DATA(pLight->lightTable, offset);
                }

                weapon->splinter.splinterData = (void *)OFFSET_DATA(weapon->splinter.splinterData, offset);
            }
        }

        if (properties->Properties.family == 7)
        {
            PhysObProjectileProperties *prop;
            PhysObProjectileData *temp; // not from decls.h

            prop = (PhysObProjectileProperties *)object->data;

            prop->data = (PhysObProjectileData *)OFFSET_DATA(prop->data, offset);

            if (prop->data != NULL)
            {
                int i;

                temp = prop->data;

                for (i = 0; i < prop->totalProjectiles; i++)
                {
                    temp[i].weapon = (PhysObWeaponAttributes *)OFFSET_DATA(temp[i].weapon, offset);

                    if (temp[i].weapon != NULL)
                    {
                        pLight = temp[i].weapon->Light;

                        if (pLight != NULL)
                        {
                            pLight->lightTable = (LightTableEntry *)OFFSET_DATA(pLight->lightTable, offset);
                        }
                    }
                }
            }
        }
    }
}

int PHYSOBS_CheckObjectAxisAlignment(MATRIX *m0, MATRIX *m1, SVector *axis)
{
    VECTOR r0;
    VECTOR r1;
    SVector v0;
    SVector v1;

    ApplyMatrix(m0, (SVECTOR *)axis, &r0);
    ApplyMatrix(m1, (SVECTOR *)axis, &r1);

    v0.x = r0.vx;
    v0.y = r0.vy;
    v0.z = r0.vz;

    v1.x = r1.vx;
    v1.y = r1.vy;
    v1.z = r1.vz;

    return (short)(((v0.x * v1.x) + (v0.y * v1.y) + (v0.z * v1.z)) >> 12);
}

int PHYSOB_CheckSlide(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    *data = (evPhysicsSlideData *)SetPhysicsSlideData(1, (short)(x * 704), (short)(y * 704), 0, 640, 640, -160);

    return PhysicsCheckSliding(instance, (intptr_t)*data, 1);
}

int PHYSOB_CheckSlide2(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    *data = (evPhysicsSlideData *)SetPhysicsSlideData(1, (short)(x * 704), (short)(y * 704), 0, 640, 640, -150);

    return PhysicsCheckSliding(instance, (intptr_t)*data, 1);
}

int PHYSOB_CheckDropOnSlope(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    *data = (evPhysicsSlideData *)SetPhysicsSlideData(1, (short)(x * 704), (short)(y * 704), 0, 2560, 640, -160);

    return PhysicsCheckSliding(instance, (intptr_t)*data, 1);
}

int PHYSOB_CheckSlideNormal(Instance *instance, int x, int y, evPhysicsSlideData **data)
{
    PHYSOB_NormalToAxis((short *)&x, (short *)&y);

    return PHYSOB_CheckSlide2(instance, x, y, data);
}

void PHYSOB_NormalToAxis(short *x, short *y)
{
    int x1;
    int y1;

    x1 = *x;
    y1 = *y;

    if (x1 >= 1025)
    {
        *x = 1;
    }
    else if (x1 < -1024)
    {
        *x = -1;
    }
    else
    {
        *x = 0;
    }

    if (y1 >= 1025)
    {
        *y = 1;
        return;
    }

    if (y1 < -1024)
    {
        *y = -1;
        return;
    }

    *y = 0;
}

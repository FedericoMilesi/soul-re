#include "common.h"
#include "Game/PHYSOBS.h"
#include "Game/MATH3D.h"
#include "Game/PHYSICS.h"
#include "Game/STATE.h"
#include "Game/STREAM.h"
#include "Game/GLYPH.h"
#include "Game/SCRIPT.h"
#include "Game/G2/ANMCTRLR.h"
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

int GetPhysicalAbility(Instance *instance)
{
    PhysObProperties *Prop;
    PhysObInteractProperties *temp; // not from decls.h

    Prop = (PhysObProperties *)instance->data;

    if ((Prop != NULL) && (Prop->ID == 0xB00B))
    {
        if (Prop->family == 3)
        {
            temp = (PhysObInteractProperties *)instance->extraData;

            return (short)temp->Properties.ID;
        }

        return Prop->Type;
    }

    return 0;
}

int AnyBlocksInMotion()
{
    Instance *instance;

    for (instance = gameTrackerX.instanceList->first; instance != NULL; instance = instance->next)
    {
        if ((instance->object->oflags2 & 0x40000))
        {
            PhysObProperties *Prop;
            PhysObData *Data;

            Prop = (PhysObProperties *)instance->data;

            if (((Prop->Type & 0x8)) && (Prop->ID == 0xB00B))
            {
                Data = (PhysObData *)instance->extraData;

                if ((Data->Mode & 0x14E))
                {
                    return 1;
                }
            }
        }
    }

    return 0;
}

void SetThrowDirection(Instance *instance, Instance *parent, evObjectThrowData *throwData, PhysObData *Data)
{
    long val;
    Instance *itarget;
    MATRIX *matrix;

    switch (throwData->type)
    {
    case 0:
        if (parent->LinkParent != NULL)
        {
            PhysicsSetVelFromZRot(instance, parent->LinkParent->rotation.z, throwData->speed);
        }
        else
        {
            PhysicsSetVelFromZRot(instance, parent->rotation.z, throwData->speed);
        }

        instance->zVel = throwData->zVel;
        break;
    case 1:
        itarget = throwData->data.target;

        Data->Force = itarget;

        PhysicsSetVelFromZRot(instance, MATH3D_AngleFromPosToPos(&instance->position, &itarget->position), throwData->speed);

        instance->zVel = 0;

        matrix = (MATRIX *)INSTANCE_Query(itarget, 12);

        if (ABS(instance->xVel) > ABS(instance->yVel))
        {
            val = matrix->t[0] - instance->position.x;

            if ((instance->xVel != 0) && (val != 0))
            {
                instance->zVel = (((matrix->t[2] - instance->position.z) * instance->xVel) / val) - (((instance->zAccl * val) / instance->xVel) >> 1);
            }
        }
        else
        {
            val = matrix->t[1] - instance->position.y;

            if ((instance->yVel != 0) && (val != 0))
            {
                instance->zVel = (((matrix->t[2] - instance->position.z) * instance->yVel) / val) - (((instance->zAccl * val) / instance->yVel) >> 1);
            }
        }

        break;
    case 2:
    {
        long val;
        Position *ptarget;

        ptarget = &throwData->data.position;

        PhysicsSetVelFromZRot(instance, MATH3D_AngleFromPosToPos(&instance->position, ptarget), throwData->speed);

        instance->zVel = 0;

        if (ABS(instance->xVel) > ABS(instance->yVel))
        {
            val = ptarget->x - instance->position.x;

            if ((instance->xVel != 0) && (val != 0))
            {
                instance->zVel = (((ptarget->z - instance->position.z) * instance->xVel) / val) - (((instance->zAccl * val) / instance->xVel) >> 1);
            }
        }
        else
        {
            val = ptarget->y - instance->position.y;

            if ((instance->yVel != 0) && (val != 0))
            {
                instance->zVel = (((ptarget->z - instance->position.z) * instance->yVel) / val) - (((instance->zAccl * val) / instance->yVel) >> 1);
            }
        }

        break;
    }
    case 3:
        PhysicsSetVelFromRot(instance, &throwData->data.direction, throwData->speed);
        break;
    case 4:
        instance->xVel = (short)throwData->data.throwVector.x;
        instance->yVel = (short)throwData->data.throwVector.y;
        instance->zVel = (short)throwData->data.throwVector.z;

        instance->zAccl = (short)throwData->gravity;
        break;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ThrowPhysOb);

int PushPhysOb(Instance *instance, short x, short y, short PathNumber, Instance *Force)
{
    PhysObData *Data;
    PhysObProperties *Prop;
    int result;

    Prop = (PhysObProperties *)instance->data;

    result = 0;

    if (((Prop->Type & 0x8)) && (Prop->ID == 0xB00B))
    {
        Data = (PhysObData *)instance->extraData;

        if ((!(Data->Mode & 0x214A)) && (AnyBlocksInMotion() == 0))
        {
            PHYSOB_NormalToAxis(&x, &y);

            Data->Force = Force;

            Data->PathNumber = PathNumber;

            Data->xForce = x;
            Data->yForce = y;

            Data->Mode &= ~0x8;

            instance->zVel = 0;
            instance->yVel = 0;
            instance->xVel = 0;

            instance->zAccl = 0;
            instance->yAccl = 0;
            instance->xAccl = 0;

            result = PHYSOBS_CheckForValidMove(instance);

            if ((result & 0x1))
            {
                if (!(Data->Mode & 0x100))
                {
                    Data->px = instance->position.x;
                    Data->py = instance->position.y;
                    Data->pz = instance->position.z;
                }

                Data->Mode |= 0x1000;

                instance->flags2 |= 0x8;
            }
        }
    }

    return result;
}

void ResetSwitchPhysOb(Instance *instance)
{
    PhysObData *Data;
    PhysObSwitchProperties *Prop;
    PhysObSwitchProperties *temp; // not from decls.h

    if (CheckPhysObFamily(instance, 2) != 0)
    {
        Data = (PhysObData *)instance->extraData;

        Prop = (PhysObSwitchProperties *)instance->data;

        Data->Mode |= 0x800;

        temp = (PhysObSwitchProperties *)instance->extraData;

        if (((temp->Properties.ID & 0x2)) && (Prop->shutAnim != 0))
        {
            G2EmulationInstanceSetAnimation(instance, 0, Prop->shutAnim, 0, 0);
            G2EmulationInstanceSetMode(instance, 0, 1);
        }
    }
}

int SwitchPhysOb(Instance *instance)
{
    PhysObData *Data;
    PhysObSwitchProperties *Prop;
    SwitchData *switchData;
    PhysObSwitchProperties *temp; // not from decls.h

    temp = (PhysObSwitchProperties *)instance->data;

    if (CheckPhysObFamily(instance, 2) != 0)
    {
        Data = (PhysObData *)instance->extraData;

        Data->Mode |= 0x800;

        Prop = (PhysObSwitchProperties *)instance->extraData;

        switchData = (SwitchData *)&Prop->Properties.ID; // TODO: this is probably wrong

        if ((Prop->Properties.ID & 0x1))
        {
            if ((Prop->Properties.ID & 0x2))
            {
                Prop->Properties.ID = (Prop->Properties.ID & ~0x1) | 0x8;

                G2EmulationInstanceSetAnimation(instance, 0, temp->offAnim, 0, 0);
                G2EmulationInstanceSetMode(instance, 0, 1);

                instance->rotation.z += switchData->accumulator;

                if (temp->Class == 7)
                {
                    switchData->accumulator = 1024;
                }
                else
                {
                    switchData->accumulator = 0;
                }

                instance->flags |= 0x8;
            }
            else if (temp->enableAnim != 255)
            {
                G2EmulationInstanceSetAnimation(instance, 0, temp->enableAnim, 0, 0);
                G2EmulationInstanceSetMode(instance, 0, 1);

                Prop->Properties.ID |= 0x2;
            }
        }
        else
        {
            if ((Prop->Properties.ID & 0x2))
            {
                Prop->Properties.ID |= 0x5;

                G2EmulationInstanceSetAnimation(instance, 0, temp->onAnim, 0, 0);

                if (temp->Class == 7)
                {
                    switchData->accumulator = 1024;
                }
                else
                {
                    switchData->accumulator = 0;
                }

                instance->rotation.z += switchData->accumulator;

                instance->flags |= 0x8;
            }
            else if (temp->failedOnAnim != 255)
            {
                G2EmulationInstanceSetAnimation(instance, 0, temp->failedOnAnim, 0, 0);
            }

            G2EmulationInstanceSetMode(instance, 0, 1);
        }

        return 0;
    }

    return 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", InteractPhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", ResetOrientation);

void FinishPush(Instance *instance)
{
    ResetOrientation(instance);
}

void PhysOb_AlignPush(Instance *instance, int x, int y, int path, PhysObData *Data)
{
    G2SVector3 vec;
    int rotZ;
    short temp[3][3];
    short temp2[3][3];
    G2EulerAngles ea;

    G2Anim_EnableController(&instance->anim, 0, 76);
    G2Anim_EnableController(&instance->anim, 2, 14);

    Data->xForce = x;
    Data->yForce = y;

    Data->PathNumber = path;

    Data->Mode &= ~0x100000;

    rotZ = 2048;

    if (y <= 0)
    {
        rotZ = 0;

        if (y >= 0)
        {
            rotZ = 1024;

            if (x < 0)
            {
                rotZ = -1024;
            }
        }
    }

    vec.x = 0;
    vec.y = 0;
    vec.z = rotZ;

    G2Anim_SetController_Vector(&instance->anim, 0, 76, &vec);

    vec.z = -rotZ;

    RotMatrixZYX((SVECTOR *)&vec, (MATRIX *)&temp);

    MulMatrix0((MATRIX *)&temp, &instance->matrix[2], (MATRIX *)&temp2);

    G2EulerAngles_FromMatrix(&ea, (G2Matrix *)&temp2, 21);

    vec.x = ea.x;
    vec.y = ea.y;
    vec.z = ea.z;

    G2Anim_SetController_Vector(&instance->anim, 2, 14, &vec);

    G2Anim_SwitchToKeylist(&instance->anim, instance->object->animList[path], path);
}

int FlipPhysOb(Instance *instance, short x, short y, Instance *Force)
{
    PhysObData *Data;
    PhysObProperties *Prop;
    int result;

    result = 0;

    Prop = (PhysObProperties *)instance->data;

    if (((Prop->Type & 0x2)) && (PHYSOBS_IsAPushBlockAttached(instance) == NULL))
    {
        Data = (PhysObData *)instance->extraData;

        if ((!(Data->Mode & 0x2000)) && (AnyBlocksInMotion() == 0))
        {
            PHYSOB_NormalToAxis(&x, &y);

            Data->PathNumber = 1;

            Data->Force = Force;

            Data->Mode |= 0x8;

            Data->xForce = x;
            Data->yForce = y;

            instance->zVel = 0;
            instance->yVel = 0;
            instance->xVel = 0;

            instance->zAccl = 0;
            instance->yAccl = 0;
            instance->xAccl = 0;

            ResetOrientation(instance);

            result = PHYSOBS_CheckForValidMove(instance);

            if ((result & 0x1))
            {
                Data->px = instance->position.x;
                Data->py = instance->position.y;
                Data->pz = instance->position.z;

                Data->Mode |= 0x1000;

                instance->flags2 |= 0x8;
            }
        }
    }

    return result;
}

int CanBePickedUp(Instance *instance, Instance *Force, int LinkNode)
{
    PCollideInfo pcollideInfo;
    Position newPos;
    Position oldPos;

    if (Force == NULL)
    {
        return 0;
    }
    else if ((Force->object->oflags2 & 0x80000))
    {
        return 1;
    }
    else if (Force->matrix == NULL)
    {
        return 1;
    }

    if (CheckPhysObAbility(instance, 1) != 0)
    {
        if (instance->matrix != NULL)
        {
            oldPos.x = (short)instance->matrix[2].t[0];
            oldPos.y = (short)instance->matrix[2].t[1];
            oldPos.z = (short)instance->matrix[2].t[2];

            newPos.x = (short)Force->matrix[LinkNode].t[0];
            newPos.y = (short)Force->matrix[LinkNode].t[1];
            newPos.z = (short)Force->matrix[LinkNode].t[2];

            pcollideInfo.newPoint = (SVECTOR *)&newPos;
            pcollideInfo.oldPoint = (SVECTOR *)&oldPos;

            if ((CheckPhysObAbility(instance, 32) != 0) && (newPos.z < oldPos.z))
            {
                return 1;
            }

            PHYSICS_CheckLineInWorld(instance, &pcollideInfo);

            if (((pcollideInfo.type < 0) || (pcollideInfo.type >= 2)) && (MATH3D_LengthXYZ(newPos.x - oldPos.x, newPos.y - oldPos.y, newPos.z - oldPos.z) >= 21))
            {
                return 0;
            }
        }

        return 1;
    }

    return 0;
}

int PickUpPhysOb(Instance *instance, short Steps, Instance *Force, int LinkNode)
{
    PhysObData *Data;

    Data = (PhysObData *)instance->extraData;

    if (instance->LinkParent == NULL)
    {
        if ((Data->Mode & 0x2000000))
        {
            return 1;
        }

        TurnOffCollisionPhysOb(instance, 7);

        if (CanBePickedUp(instance, Force, LinkNode) != 0)
        {
            Data->Steps = Steps;
            Data->Step = 0;

            Data->Force = Force;

            Data->LinkNode = LinkNode;

            Data->Mode = (Data->Mode & ~0x600000) | 0x4000;

            if ((CheckPhysObAbility(instance, 32) != 0) && ((Data->Mode & 0x10000)))
            {
                PhysObLight *pLight;

                pLight = PhysObGetLight(instance);

                if (pLight != NULL)
                {
                    PHYSOB_StartLighting(instance, pLight);
                }
            }

            return 0;
        }
    }

    return 1;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_BirthCollectible);

evObjectBirthProjectileData *PHYSOB_BirthProjectile(Instance *parent, int joint, int type)
{
    evObjectBirthProjectileData *rc;

    rc = (evObjectBirthProjectileData *)SetObjectBirthProjectileData(parent, joint, type);

    rc->birthInstance = BirthProjectilePhysOb(parent, joint, type);

    return rc;
}

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", BirthProjectilePhysOb);

INCLUDE_ASM("asm/nonmatchings/Game/PHYSOBS", PHYSOB_SetLightTable);

void PHYSOB_EndLighting(Instance *instance, PhysObLight *pLight)
{
    if ((pLight != NULL) && (gameTrackerX.gameData.asmData.lightInstances[0].lightInstance == instance))
    {
        gameTrackerX.gameData.asmData.lightInstances[0].lightInstance = NULL;
    }
}

void PHYSOB_StartLighting(Instance *instance, PhysObLight *pLight)
{
    PhysObData *Data;

    Data = (PhysObData *)instance->extraData;

    if (Data->burnAmpl < 0)
    {
        Data->burnAmpl = -Data->burnAmpl;
    }

    Data->Mode |= 0x18000;

    if (pLight != NULL)
    {
        LightInstance *li;

        gameTrackerX.gameData.asmData.lightInstances[0].lightInstance = instance;

        li = gameTrackerX.gameData.asmData.lightInstances;

        if (li != NULL)
        {
            PHYSOB_SetLightTable(pLight, li, Data->burnAmpl);
        }
    }
}

void PHYSOB_StartBurnFX(Instance *instance)
{
    PhysObData *Data;
    Object *object;
    int i;

    object = instance->object;

    Data = (PhysObData *)instance->extraData;

    if ((Data->burnAmpl == 0) && (object->numberOfEffects != 0))
    {
        for (i = 0; i < object->numberOfEffects; i++)
        {
            FX_StartInstanceEffect(instance, &object->effectList[i], 1);
        }
    }
}

void PHYSOB_StartBurning(Instance *instance, PhysObLight *pLight)
{
    PHYSOB_StartBurnFX(instance);
    PHYSOB_StartLighting(instance, pLight);
}

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

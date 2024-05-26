#include "common.h"
#include "Game/INSTANCE.h"
#include "Game/SPLINE.h"
#include "Game/OBTABLE.h"
#include "Game/GAMELOOP.h"
#include "Game/COLLIDE.h"
#include "Game/G2/ANIMG2.h"

void INSTANCE_Deactivate(Instance *instance)
{
    Object *object;

    object = instance->object;

    if (!(gameTrackerX.streamFlags & 0x2000000))
    {
        instance->flags2 |= 0x1;

        if ((instance->flags2 & 0x20000000))
        {
            instance->flags |= 0x40000;
        }
        else
        {
            instance->flags &= ~0x40000;
            instance->flags2 |= 0x20000000;
        }

        if ((object->animList != NULL) && (!(object->oflags2 & 0x40000000)))
        {
            G2Anim_Free(&instance->anim);
        }

        instance->waterFace = NULL;
        instance->waterFaceTerrain = NULL;
    }
}

void INSTANCE_Reactivate(Instance *instance)
{
    Object *object;

    object = instance->object;

    instance->flags2 &= ~0x1;

    if ((instance->flags & 0x40000))
    {
        instance->flags &= ~0x40000;
        instance->flags2 |= 0x20000000;
    }
    else
    {
        instance->flags2 &= ~0x20000000;
    }

    if (object->animList != NULL)
    {
        if (!(object->oflags2 & 0x40000000))
        {
            G2Anim_Restore(&instance->anim);
        }
    }
}

void INSTANCE_ForceActive(Instance *instance)
{
    if ((instance->flags2 & 0x1))
    {
        INSTANCE_Reactivate(instance);
    }
}

void INSTANCE_DeactivatedProcess()
{
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DeactivateFarInstances);

void INSTANCE_InitInstanceList(InstanceList *list, InstancePool *pool)
{
    long i;

    pool->numFreeInstances = 60;

    for (i = 1; i < 59; i++)
    {
        pool->instance[i].next = &pool->instance[i + 1];
        pool->instance[i].prev = &pool->instance[i - 1];
    }

    pool->instance[0].next = &pool->instance[1];
    pool->instance[0].prev = NULL;

    pool->instance[59].prev = &pool->instance[58];
    pool->instance[59].next = NULL;

    pool->first_free = &pool->instance[0];

    list->pool = pool;

    list->numInstances = 0;

    list->first = NULL;

    for (i = 0; i < 32; i++)
    {
        list->group[i].next = NULL;
        list->group[i].prev = NULL;
    }

    pool->nextInstanceID = 1;
}

Instance *INSTANCE_NewInstance(InstanceList *list)
{
    Instance *temp;
    Instance *instance;

    if (list->pool->numFreeInstances != 0)
    {
        list->pool->numFreeInstances--;

        instance = list->pool->first_free;

        list->pool->first_free = instance->next;

        temp = list->first;

        list->first = instance;

        instance->next = temp;

        if (instance->next != NULL)
        {
            temp->prev = instance;
        }

        instance->prev = NULL;

        instance->instanceID = list->pool->nextInstanceID++;

        list->numInstances++;

        return instance;
    }

    return NULL;
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InstanceGroupNumber);

void INSTANCE_InsertInstanceGroup(InstanceList *list, Instance *instance)
{
    LIST_InsertFunc(&list->group[INSTANCE_InstanceGroupNumber(instance)], &instance->node);
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ReallyRemoveInstance);

void INSTANCE_CleanUpInstanceList(InstanceList *list, long reset)
{
    Instance *instance;
    Instance *next;

    instance = list->first;

    while (instance != NULL)
    {
        next = instance->next;

        if (!(instance->flags & 0x400))
        {
            if ((instance->flags & 0x20))
            {
                instance->flags |= 0x20;
            }
        }
        else if ((instance->flags & 0x20))
        {
            instance->flags &= ~0x20;
        }

        instance = next;
    }

    instance = list->first;

    while (instance != NULL)
    {
        next = instance->next;

        if ((instance->flags & 0x20))
        {
            INSTANCE_ReallyRemoveInstance(list, instance, reset);
        }

        instance = next;
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Introduced);

INICommand *INSTANCE_GetIntroCommand(INICommand *command, int cmd)
{
    if (command != NULL)
    {
        while (command->command != 0)
        {
            if (command->command != cmd)
            {
                command += command->numParameters + 1;
            }
            else
            {
                return command;
            }
        }
    }

    return 0;
}

INICommand *INSTANCE_FindIntroCommand(Instance *instance, int cmd)
{
    return INSTANCE_GetIntroCommand((INICommand *)instance->introData, cmd);
}

void INSTANCE_ProcessIntro(Instance *instance)
{
    INICommand *command;

    if (instance->introData != NULL)
    {
        command = (INICommand *)instance->introData;

        if (!(instance->flags & 0x2))
        {
            while (command->command != 0)
            {
                if (command->command == 18)
                {
                    instance->currentModel = (short)command->parameter[0];
                }

                command += command->numParameters + 1;
            }
        }
    }
}

void INSTANCE_InitEffects(Instance *instance, Object *object)
{
    int i;

    if ((!(object->oflags2 & 0x100)) && (object->numberOfEffects != 0))
    {
        for (i = 0; i < object->numberOfEffects; i++)
        {
            FX_StartInstanceEffect(instance, &object->effectList[i], 1);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_AdditionalCollideFunctions);

long INSTANCE_GetSplineFrameNumber(Instance *instance, MultiSpline *spline)
{
    return SCRIPT_GetSplineFrameNumber(instance, SCRIPT_GetPosSplineDef(instance, spline, 0, 0));
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ProcessFunctions);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_BirthObject);

void INSTANCE_BuildStaticShadow()
{
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DefaultInit);

void INSTANCE_PlainDeath(Instance *instance)
{
    Instance *oldOn;

    instance->flags &= ~0x400;

    if ((instance->object->oflags2 & 0x4))
    {
        instance->flags2 |= 0x1000;

        SOUND_ProcessInstanceSounds(instance->object->soundData, instance->soundInstanceTbl, &instance->position, instance->object->oflags2 & 0x2000000, instance->flags2 & 0x8000000, 0, 0, &instance->flags2);
        SOUND_ProcessInstanceSounds(instance->object->soundData, instance->soundInstanceTbl, &instance->position, instance->object->oflags2 & 0x2000000, instance->flags2 & 0x8000000, 0, 0, &instance->flags2);
    }

    oldOn = INSTANCE_Find(instance->attachedID);

    if (oldOn != NULL)
    {
        oldOn->flags2 &= ~0x80;
    }

    SAVE_MarkDeadDead(instance);

    instance->flags |= 0x20;
}

void INSTANCE_KillInstance(Instance *instance)
{
    if (!(instance->flags & 0x20))
    {
        INSTANCE_PlainDeath(instance);
    }
}

unsigned long INSTANCE_Query(Instance *Inst, int Query)
{
    unsigned long (*Func)(Instance *, unsigned long);

    Func = Inst->queryFunc;

    if (Func == NULL)
    {
        return 0;
    }

    return Func(Inst, Query);
}

void INSTANCE_Post(Instance *Inst, int Message, int Data)
{
    void (*Func)(Instance *, unsigned long, unsigned long);

    Func = Inst->messageFunc;

    if (Func != NULL)
    {
        INSTANCE_ForceActive(Inst);

        Func(Inst, Message, Data);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Broadcast);

int INSTANCE_InPlane(Instance *instance, int plane)
{
    int ret;

    ret = 0;

    if (instance->object != NULL)
    {
        if (!(instance->object->oflags2 & 0x2000000))
        {
            ret = 1;
        }
        else if (!(instance->flags2 & 0x8000000))
        {
            if (plane == 0)
            {
                ret = 1;
            }
        }
        else if (plane != 0)
        {
            ret = 1;
        }
    }

    return ret;
}

long INSTANCE_FindWithID(long uniqueID)
{
    Instance *instance;
    Instance *next;
    long ret;

    instance = gameTrackerX.instanceList->first;

    ret = 0;

    while (instance != NULL)
    {
        next = instance->next;

        if (instance->introUniqueID == uniqueID)
        {
            ret = 1;
            break;
        }

        instance = next;
    }

    return ret;
}

Instance *INSTANCE_FindWithName(long areaID, char *instanceName, Instance *startInstance)
{
    Instance *instance;
    Instance *ret;
    Instance *next;

    ret = NULL;

    instance = gameTrackerX.instanceList->first;

    if (startInstance != NULL)
    {
        instance = startInstance->next;
    }

    if (areaID != 0)
    {
        while (instance != NULL)
        {
            next = instance->next;

            if ((instance->birthStreamUnitID != areaID) || (strcmpi(instance->introName, instanceName) != 0))
            {
                instance = next;
            }
            else
            {
                ret = instance;
                break;
            }
        }
    }
    else
    {
        while (instance != NULL)
        {
            next = instance->next;

            if (strcmpi(instance->introName, instanceName) != 0)
            {
                instance = next;
            }
            else
            {
                ret = instance;
                break;
            }
        }
    }

    return ret;
}

Intro *INSTANCE_FindIntro(long areaID, long introUniqueID)
{
    Intro *ret;
    long i;
    Level *level;

    ret = NULL;

    level = STREAM_GetLevelWithID(areaID);

    if (level != NULL)
    {
        for (i = 0; i < level->numIntros; i++)
        {
            if (introUniqueID == level->introList[i].UniqueID)
            {
                ret = &level->introList[i];
                break;
            }
        }
    }

    return ret;
}

Instance *INSTANCE_Find(long introUniqueID)
{
    Instance *instance;

    instance = gameTrackerX.instanceList->first;

    while (instance != NULL)
    {
        if (instance->introUniqueID == introUniqueID)
        {
            break;
        }

        instance = instance->next;
    }

    return instance;
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceSavedInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceSavedInstanceWithIntro);

void INSTANCE_SpatialRelationships(InstanceList *instanceList)
{
    Instance *instance;
    int checkMask;
    MATRIX *lookMatrix;
    Instance *checkee;
    MATRIX *mat;
    MATRIX invMatrix;
    evCollideInstanceStatsData data;

    for (instance = instanceList->first; instance != NULL; instance = instance->next)
    {
        if ((instance->flags2 & 0x10000401) == 0x400)
        {
            checkMask = instance->checkMask;

            lookMatrix = (MATRIX *)INSTANCE_Query(instance, 13);

            INSTANCE_Post(instance, 0x200000, 0);

            if (lookMatrix == NULL)
            {
                continue;
            }

            TransposeMatrix(lookMatrix, &invMatrix);

            for (checkee = instanceList->first; checkee != NULL; checkee = checkee->next)
            {
                if ((checkee != instance) && (!(checkee->flags2 & 0x10000000)) && (!(checkee->flags & 0x20)) && ((INSTANCE_Query(checkee, 1) & checkMask)))
                {
                    mat = (MATRIX *)INSTANCE_Query(checkee, 14);

                    if (mat == NULL)
                    {
                        mat = checkee->matrix;
                    }

                    if ((mat != NULL) && (INSTANCE_SetStatsData(instance, checkee, (Vector *)&mat->t[0], &data, &invMatrix) != 0))
                    {
                        INSTANCE_Post(instance, 0x200001, (int)&data);
                    }
                }
            }
        }
    }
}

int INSTANCE_SetStatsData(Instance *instance, Instance *checkee, Vector *checkPoint, evCollideInstanceStatsData *data, MATRIX *mat)
{
    long distance;
    SVECTOR *delta;

    distance = MATH3D_LengthXYZ(instance->position.x - checkPoint->x, instance->position.y - checkPoint->y, instance->position.z - checkPoint->z);

    if ((unsigned)distance < instance->maxCheckDistance)
    {
        delta = (SVECTOR *)getScratchAddr(0);

        delta->vx = (short)checkPoint->x - instance->position.x;
        delta->vy = (short)checkPoint->y - instance->position.y;
        delta->vz = (short)checkPoint->z - instance->position.z;

        ApplyMatrixSV(mat, delta, (SVECTOR *)&data->relativePosition);

        data->instance = checkee;

        data->distance = distance;

        data->zDelta = delta->vz;

        data->xyDistance = MATH3D_LengthXY(delta->vx, delta->vy);

        return 1;
    }

    return 0;
}

void INSTANCE_LinkToParent(Instance *instance, Instance *parent, int node)
{
    instance->LinkSibling = parent->LinkChild;

    parent->LinkChild = instance;

    instance->LinkParent = parent;
    instance->ParentLinkNode = node;

    instance->scale.x = (instance->scale.x << 12) / parent->scale.x;
    instance->scale.y = (instance->scale.y << 12) / parent->scale.y;
    instance->scale.z = (instance->scale.z << 12) / parent->scale.z;

    INSTANCE_UpdateFamilyStreamUnitID(parent);

    INSTANCE_Post(parent, 0x100012, (int)instance);

    instance->flags2 |= 0x8;
}

void INSTANCE_UnlinkFromParent(Instance *instance)
{
    Instance *parent;
    G2EulerAngles ea;
    Instance *sibling;

    parent = instance->LinkParent;

    if (parent != NULL)
    {
        if (parent->LinkChild == instance)
        {
            parent->LinkChild = instance->LinkSibling;
        }
        else
        {
            sibling = parent->LinkChild;

            while (sibling->LinkSibling != instance)
            {
                sibling = sibling->LinkSibling;
            }

            sibling->LinkSibling = instance->LinkSibling;
        }

        instance->LinkSibling = NULL;
        instance->LinkParent = NULL;

        instance->scale.x = (instance->scale.x * parent->scale.x) / 4096;
        instance->scale.y = (instance->scale.y * parent->scale.y) / 4096;
        instance->scale.z = (instance->scale.z * parent->scale.z) / 4096;

        if (parent->matrix != NULL)
        {
            G2EulerAngles_FromMatrix(&ea, (G2Matrix *)(&parent->matrix[instance->ParentLinkNode]), 21);

            instance->rotation.x = ea.x;
            instance->rotation.y = ea.y;
            instance->rotation.z = ea.z;
        }

        INSTANCE_Post(parent, 0x100013, (int)instance);
    }
}

void INSTANCE_UnlinkChildren(Instance *instance)
{
    Instance *child;
    Instance *sibling;

    child = instance->LinkChild;

    while (child != NULL)
    {
        sibling = child->LinkSibling;

        INSTANCE_Post(instance, 0x100013, (int)child);

        child->LinkParent = NULL;
        child->LinkSibling = NULL;

        child = sibling;
    }

    instance->LinkChild = NULL;
}

void INSTANCE_UpdateFamilyStreamUnitID(Instance *instance)
{
    Instance *child;

    child = instance->LinkChild;

    while (child != NULL)
    {
        child->currentStreamUnitID = instance->currentStreamUnitID;

        INSTANCE_UpdateFamilyStreamUnitID(child);

        child = child->LinkSibling;
    }
}

void INSTANCE_ReallyRemoveAllChildren(Instance *instance)
{
    Instance *child;
    Instance *sibling;

    child = instance->LinkChild;

    while (child != NULL)
    {
        sibling = child->LinkSibling;

        INSTANCE_ReallyRemoveAllChildren(child);

        INSTANCE_ReallyRemoveInstance(gameTrackerX.instanceList, child, 0);

        child = sibling;
    }
}

Instance *INSTANCE_GetChildLinkedToSegment(Instance *instance, int segment)
{
    Instance *child;

    child = instance->LinkChild;

    while (child != NULL)
    {
        if (child->ParentLinkNode == segment)
        {
            break;
        }

        child = child->LinkSibling;
    }

    return child;
}

int INSTANCE_Linked(Instance *instance1, Instance *instance2)
{
    while (instance1->LinkParent != NULL)
    {
        instance1 = instance1->LinkParent;
    }

    while (instance2->LinkParent != NULL)
    {
        instance2 = instance2->LinkParent;
    }

    return instance1 == instance2;
}

int INSTANCE_GetFadeValue(Instance *instance)
{
    int fadeValue;

    fadeValue = instance->fadeValue;

    if (gameTrackerX.gameData.asmData.MorphTime != 1000)
    {
        fadeValue = 4096 - fadeValue;

        if (MEMPACK_MemoryValidFunc((char *)instance->object) != 0)
        {
            if (((instance->object->oflags2 & 0x2000000)) || ((instance->LinkParent != NULL) && ((instance->LinkParent->object->oflags2 & 0x2000000))))
            {
                if ((instance->flags2 & 0x8000000))
                {
                    if ((gameTrackerX.spectral_fadeValue * fadeValue) < 0)
                    {
                        fadeValue = ((gameTrackerX.spectral_fadeValue * fadeValue) + 4095) >> 12;
                    }
                    else
                    {
                        fadeValue = (gameTrackerX.spectral_fadeValue * fadeValue) >> 12;
                    }
                }
                else if ((gameTrackerX.material_fadeValue * fadeValue) < 0)
                {
                    fadeValue = ((gameTrackerX.material_fadeValue * fadeValue) + 4095) >> 12;
                }
                else
                {
                    fadeValue = (gameTrackerX.material_fadeValue * fadeValue) >> 12;
                }
            }
        }

        fadeValue = 4096 - fadeValue;
    }

    return fadeValue;
}

unsigned long INSTANCE_DefaultAnimCallback(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, Instance *instance)
{
    AnimSoundData *soundData;
    int id;
    int vol;
    int temp; // not from decls.h

    if (message == G2ANIM_MSG_PLAYEFFECT)
    {
        switch (messageDataA)
        {
        case 0:
            soundData = (AnimSoundData *)messageDataB;

            if (soundData != NULL)
            {
                vol = soundData->volume;

                if (soundData->volume >= 1000)
                {
                    temp = vol / 1000;

                    vol %= 1000;

                    if (temp != HUMAN_TypeOfHuman(instance))
                    {
                        return 0;
                    }
                }

                SOUND_Play3dSound(&instance->position, soundData->sfxToneID, soundData->pitch, vol, soundData->minVolDistance);
            }

            break;
        case 1:
            FX_StartInstanceEffect(instance, (ObjectEffect *)messageDataB, 0);
            break;
        default:
            return messageDataA;
        }
    }

    return messageDataA;
}

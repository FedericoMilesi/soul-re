#include "Game/G2/ANMCTRLR.h"

void G2Anim_AttachControllerToSeg(G2Anim *anim, int segNumber, int type)
{
    _G2AnimController_InsertIntoList(_G2AnimController_Create(segNumber, type), &anim->controllerList);
}

void G2Anim_DetachControllerFromSeg(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;
    unsigned short *controllerNextPtr;

    controllerNextPtr = &anim->controllerList;

    controller = _G2AnimControllerST_FindPtrInList(segNumber, type, &controllerNextPtr);

    if (controller == NULL)
    {
        controllerNextPtr = &anim->disabledControllerList;

        controller = _G2AnimControllerST_FindPtrInList(segNumber, type, &controllerNextPtr);

        if (controller == NULL)
        {
            return;
        }
    }

    controller = _G2AnimController_Destroy(controller);

    *controllerNextPtr = controller - _controllerPool.blockPool;
}

void G2Anim_EnableController(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;
    G2Matrix *segMatrix;

    controller = _G2AnimControllerST_RemoveFromList(segNumber, type, &anim->disabledControllerList);

    if (controller != NULL)
    {
        controller->duration = 0;

        controller->elapsedTime = 0;

        controller->flags = (unsigned char)controller->flags;

        if (controller->type == 8)
        {
            G2Quat_FromMatrix_S(&controller->data.quat.dest, &anim->segMatrices[segNumber]);
        }
        else if (controller->type == 32)
        {
            segMatrix = &anim->segMatrices[segNumber];

            controller->data.quat.src.x = (unsigned short)segMatrix->trans.x;
            controller->data.quat.src.y = (unsigned short)segMatrix->trans.y;
            controller->data.quat.src.z = (unsigned short)segMatrix->trans.z;
        }
        else
        {
            memset(&controller->data.quat.src, 0, sizeof(G2Quat) * 2);
        }

        _G2AnimController_InsertIntoList(controller, &anim->controllerList);
    }
}

void G2Anim_DisableController(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;

    controller = _G2AnimControllerST_RemoveFromList(segNumber, type, &anim->controllerList);

    if (controller != NULL)
    {
        _G2AnimController_InsertIntoList(controller, &anim->disabledControllerList);
    }
}

void G2Anim_InterpDisableController(G2Anim *anim, int segNumber, int type, short duration)
{
    G2SVector3 zeroVector;
    G2Quat targetQuat;
    G2AnimController *controller;

    memset(&zeroVector, 0, sizeof(G2SVector3));

    if ((duration == 0) || (type == 32))
    {
        G2Anim_DisableController(anim, segNumber, type);
    }

    controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->controllerList);

    if (controller != NULL)
    {
        if (controller->type == 8)
        {
            _G2AnimController_GetSimpleWorldRotQuat(controller, anim, &targetQuat);

            G2Anim_SetInterpController_Quat(anim, segNumber, type, &targetQuat, duration);
        }
        else
        {
            G2Anim_SetInterpController_Vector(anim, segNumber, type, &zeroVector, duration);
        }

        controller->flags |= 0x8000;
    }
}

G2Bool G2Anim_IsControllerActive(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;

    controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->controllerList);

    if (controller == NULL)
    {
        return G2FALSE;
    }

    return ((controller->flags & 0x8000) < 0x8000);
}

G2Bool G2Anim_IsControllerInterpolating(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;

    controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->controllerList);

    if ((controller == NULL) || (!(controller->flags & 0x4000)))
    {
        return G2FALSE;
    }
    else
    {
        return ((controller->flags & 0x2000) < 0x2000);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_GetControllerCurrentInterpVector);

void G2Anim_SetControllerCallbackData(G2Anim *anim, int segNumber, int type, void *callbackData)
{
    _G2Anim_FindController(anim, segNumber, type)->callbackData = callbackData;
}

void G2Anim_SetControllerAngleOrder(G2Anim *anim, int segNumber, int type, int order)
{
    G2AnimController *controller;

    controller = _G2Anim_FindController(anim, segNumber, type);

    controller->flags = (controller->flags & 0xFF00) | order;
}

void G2Anim_SetController_Vector(G2Anim *anim, int segNumber, int type, G2SVector3 *vector)
{
    G2AnimController *controller;

    controller = _G2Anim_FindController(anim, segNumber, type);

    controller->data.vector.base = *vector;

    controller->flags = (unsigned char)controller->flags;
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", G2Anim_SetInterpController_Vector);

void G2Anim_SetInterpController_Quat(G2Anim *anim, int segNumber, int type, G2Quat *quat, int duration)
{
    G2AnimController *controller;
    G2Quat *source;
    unsigned long zw;
    unsigned long xy;

    source = quat;

    controller = _G2Anim_FindController(anim, segNumber, type);

    _G2AnimController_GetCurrentInterpQuat(controller, anim, &controller->data.quat.src);

    xy = *(unsigned long *)&source->x;
    zw = *(unsigned long *)&source->z;

    controller->elapsedTime = 0;

    *(unsigned int *)&controller->data.quat.dest.x = xy;
    *(unsigned int *)&controller->data.quat.dest.z = zw;

    controller->flags = (unsigned char)controller->flags | 0x4000;

    controller->duration = duration;
}

void _G2Anim_ApplyControllersToStoredFrame(G2Anim *anim)
{
    int i;

    for (i = 0; i < anim->sectionCount; i++)
    {
        _G2AnimSection_ApplyControllersToStoredFrame(&anim->section[i]);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildTransformsWithControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2Anim_BuildSegTransformWithControllers);

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimController_ApplyToSegValue);

void _G2Anim_UpdateControllers(G2Anim *anim)
{
    G2AnimController *controller;
    G2AnimSection *section;
    short elapsedTime;

    if (anim->controllerList != 0)
    {
        elapsedTime = G2Timer_GetFrameTime();

        controller = &_controllerPool.blockPool[anim->controllerList];

        while (_controllerPool.blockPool < controller)
        {
            if ((controller->flags & 0x4000))
            {
                if (controller->elapsedTime >= controller->duration)
                {
                    if ((controller->flags & 0x8000))
                    {
                        controller->flags &= 0x7FFF;

                        _G2AnimControllerST_RemoveFromList(controller->segNumber, controller->type, &anim->controllerList);

                        _G2AnimController_InsertIntoList(controller, &anim->disabledControllerList);
                    }
                    else if (!(controller->flags & 0x2000))
                    {
                        controller->flags |= 0x2000;

                        section = G2Anim_GetSectionWithSeg(anim, controller->segNumber);

                        if ((section != NULL) && (section->callback != NULL))
                        {
                            section->callback(anim, section->sectionID, G2ANIM_MSG_SEGCTRLR_INTERPDONE, controller->type, controller->segNumber, (Instance *)controller->callbackData);
                        }
                    }
                }
                else
                {
                    controller->elapsedTime += elapsedTime;

                    if (controller->duration < controller->elapsedTime)
                    {
                        controller->elapsedTime = controller->duration;
                    }
                }
            }

            controller = &_controllerPool.blockPool[controller->next];
        }
    }
}

void _G2Anim_CopyVectorWithOrder(G2SVector3 *sourceVector, G2EulerAngles *destVector, int order)
{
    if (order != 1)
    {
        if (order == 21)
        {
            destVector->x = sourceVector->x;
            destVector->y = sourceVector->y;
            destVector->z = sourceVector->z;

            destVector->order = order;
        }
    }
    else
    {
        destVector->x = sourceVector->z;
        destVector->y = sourceVector->y;
        destVector->z = sourceVector->x;

        destVector->order = order;
    }
}

void _G2AnimSection_ApplyControllersToStoredFrame(G2AnimSection *section)
{
    G2Anim *anim;
    G2AnimController *controller;
    G2AnimSegValue *segValue;
    Segment *segment;
    G2Matrix segMatrix;
    G2Matrix parentMatrix;
    G2Matrix invParentMatrix;
    G2EulerAngles eulerAngles;
    int segIndex;
    int segCount;

    anim = _G2AnimSection_GetAnim(section);

    if (anim->controllerList != 0)
    {
        segIndex = section->firstSeg;

        controller = &_controllerPool.blockPool[anim->controllerList];

        segValue = &_segValues[segIndex];

        segCount = segIndex + section->segCount;

        for (segment = anim->modelData->segmentList; segIndex < segCount; segment++, segValue++, segIndex++)
        {
            if (controller->segNumber == segIndex)
            {
                _G2Anim_BuildSegLocalRotMatrix(segValue, &segMatrix);

                if (anim->segMatrices != NULL)
                {
                    parentMatrix = anim->segMatrices[segment->parent];
                }
                else
                {
                    MATH3D_SetUnityMatrix((MATRIX *)&parentMatrix);
                }

                while (controller->segNumber == segIndex)
                {
                    if ((segIndex != 0) || ((controller->type & 0x2)))
                    {
                        if ((controller->type & 0x38) == 8)
                        {
                            _G2AnimController_ApplyToSegValue(controller, segValue, &segMatrix, &parentMatrix);

                            if (!(controller->type & 0x2))
                            {
                                TransposeMatrix((MATRIX *)&parentMatrix, (MATRIX *)&invParentMatrix);

                                MulMatrix2((MATRIX *)&invParentMatrix, (MATRIX *)&segMatrix);
                            }

                            if (segValue->bIsQuat != 0)
                            {
                                G2Quat tempQuat;
                                G2Quat *dest;
                                unsigned long zw;
                                unsigned long xy;

                                dest = &segValue->rotQuat.quat;

                                G2Quat_FromMatrix_S(&tempQuat, &segMatrix);

                                xy = ((int *)&tempQuat)[0];
                                zw = ((int *)&tempQuat)[1];

                                ((int *)dest)[0] = xy;
                                ((int *)dest)[1] = zw;
                            }
                            else
                            {
                                G2SVector3 *dest;
                                unsigned long mask;
                                unsigned short z;
                                // unsigned long xy; // unused

                                dest = &segValue->rotQuat.rot;

                                G2EulerAngles_FromMatrix(&eulerAngles, &segMatrix, 0);

                                z = eulerAngles.z;

                                dest->z = z & 0xFFF;

                                mask = 0xFFF0FFF;

                                ((int *)dest)[0] = ((int *)&eulerAngles)[0] & mask;
                            }
                        }
                        else
                        {
                            _G2AnimController_ApplyToSegValue(controller, segValue, &segMatrix, &parentMatrix);
                        }

                        controller = &_controllerPool.blockPool[controller->next];
                    }
                    else
                    {
                        controller = &_controllerPool.blockPool[controller->next];
                    }
                }
            }
        }
    }
}

unsigned long _G2AnimController_ApplyWorldToParentMatrix(G2AnimController *controller, G2Matrix *parentMatrix)
{
    G2Matrix temparentMatrixatrix;
    G2SVector3 tempSVector;
    G2LVector3 tempLVector;

    switch (controller->type)
    {
    case 8:
        _G2AnimController_GetMatrix(controller, parentMatrix);
        break;
    case 16:
        break;
    case 76:
        _G2AnimController_GetMatrix(controller, &temparentMatrixatrix);

        MulMatrix2((MATRIX *)&temparentMatrixatrix, (MATRIX *)parentMatrix);
        break;
    case 84:
        _G2AnimController_GetVector(controller, &tempSVector);

        tempLVector.x = tempSVector.x;
        tempLVector.y = tempSVector.y;
        tempLVector.z = tempSVector.z;

        ScaleMatrix((MATRIX *)parentMatrix, (VECTOR *)&tempLVector);
        break;
    case 32:
        _G2AnimController_GetVector(controller, &tempSVector);

        parentMatrix->trans.x = tempSVector.x;
        parentMatrix->trans.y = tempSVector.y;
        parentMatrix->trans.z = tempSVector.z;
        break;
    case 100:
        _G2AnimController_GetVector(controller, &tempSVector);

        parentMatrix->trans.x += tempSVector.x;
        parentMatrix->trans.y += tempSVector.y;
        parentMatrix->trans.z += tempSVector.z;
        break;
    }

    return 7;
}

void _G2AnimController_GetMatrix(G2AnimController *controller, G2Matrix *matrix)
{
    G2Quat tempQuat;

    if ((controller->flags & 0x4000))
    {
        if ((controller->flags & 0x2000))
        {
            G2Quat_ToMatrix_S(&controller->data.quat.dest, matrix);
        }
        else
        {
            G2Quat_Slerp_VM(_G2AnimAlphaTable_GetValue(controller->alphaTable, (controller->elapsedTime << 12) / controller->duration), &controller->data.quat.src, &controller->data.quat.dest, &tempQuat, 0);

            G2Quat_ToMatrix_S(&tempQuat, matrix);
        }
    }
    else if ((controller->flags & 0xFF) != 1)
    {
        if ((controller->flags & 0xFF) == 21)
        {
            RotMatrix((SVECTOR *)&controller->data.vector.base, (MATRIX *)matrix);
        }
    }
    else
    {
        RotMatrixZYX((SVECTOR *)&controller->data.vector.base, (MATRIX *)matrix);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/G2/ANIMG2", _G2AnimController_GetVector);

G2AnimController *_G2Anim_FindController(G2Anim *anim, int segNumber, int type)
{
    G2AnimController *controller;

    controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->controllerList);

    if (controller == NULL)
    {
        controller = _G2AnimControllerST_FindInList(segNumber, type, &anim->disabledControllerList);
    }

    return controller;
}

G2AnimController *_G2AnimController_Create(int segNumber, int type)
{
    G2AnimController *controller;

    controller = (G2AnimController *)G2PoolMem_Allocate(&_controllerPool);

    memset(controller, 0, sizeof(G2AnimController));

    controller->next = 0;

    controller->segNumber = segNumber;

    controller->type = type;

    controller->flags = 0x15;

    return controller;
}

G2AnimController *_G2AnimController_Destroy(G2AnimController *controller)
{
    int nextControllerIndex;

    do
    {
        nextControllerIndex = controller->next;

        G2PoolMem_Free(&_controllerPool, controller);

        controller = &_controllerPool.blockPool[nextControllerIndex];

        if (controller <= _controllerPool.blockPool)
        {
            break;
        }
    } while (controller->type == 0);

    return controller;
}

void _G2AnimController_InsertIntoList(G2AnimController *controller, unsigned short *listPtr)
{
    G2AnimController *testController;

    for (testController = &_controllerPool.blockPool[*listPtr]; _controllerPool.blockPool < testController;)
    {
        if ((testController->segNumber <= controller->segNumber) && ((testController->segNumber != controller->segNumber) || (testController->type <= controller->type)))
        {
            listPtr = (unsigned short *)testController;

            testController = &_controllerPool.blockPool[testController->next];
        }
        else
        {
            break;
        }
    }

    *listPtr = controller - _controllerPool.blockPool;

    do
    {
        listPtr = (unsigned short *)controller;

        controller = &_controllerPool.blockPool[*listPtr];
    } while (_controllerPool.blockPool < controller);

    *listPtr = testController - _controllerPool.blockPool;
}

void _G2AnimController_GetCurrentInterpQuat(G2AnimController *controller, G2Anim *anim, G2Quat *quat)
{
    G2EulerAngles eulerVector;

    if ((controller->flags & 0x4000))
    {
        if ((controller->flags & 0x2000))
        {
            *quat = controller->data.quat.dest;
        }
        else
        {
            G2Quat_Slerp_VM(_G2AnimAlphaTable_GetValue(controller->alphaTable, (controller->elapsedTime * 4096) / controller->duration), &controller->data.quat.src, &controller->data.quat.dest, quat, 0);
        }
    }
    else
    {
        if (controller->type == 8)
        {
            G2Quat_FromMatrix_S(quat, &anim->segMatrices[controller->segNumber]);
        }
        else if (controller->type == 76)
        {
            *(unsigned int *)&quat->x = 0;
            *(unsigned int *)&quat->z = 4096 << 16;
        }
        else
        {
            if (controller->type == 14)
            {
                _G2Anim_CopyVectorWithOrder(&controller->data.vector.base, &eulerVector, controller->flags & 0xFF);
            }
            else
            {
                G2Anim_GetSegChannelValue(anim, controller->segNumber, (unsigned short *)&eulerVector, 7);

                eulerVector.order = 0;
            }

            G2Quat_FromEuler_S(quat, &eulerVector);
        }
    }
}

void _G2AnimController_GetSimpleWorldRotQuat(G2AnimController *controller, G2Anim *anim, G2Quat *quat)
{
    Segment *segment;
    G2Matrix *parentMatrix;
    G2Matrix segMatrix;
    int segNumber;

    segNumber = controller->segNumber;

    segment = &anim->modelData->segmentList[segNumber];

    parentMatrix = &anim->segMatrices[segment->parent];

    _G2Anim_BuildSegLocalRotMatrix(&_segValues[segNumber], &segMatrix);

    MulMatrix2((MATRIX *)parentMatrix, (MATRIX *)&segMatrix);

    G2Quat_FromMatrix_S(quat, &segMatrix);
}

G2AnimController *_G2AnimControllerST_FindInList(int segNumber, int type, unsigned short *listPtr)
{
    G2AnimController *controller;

    controller = &_controllerPool.blockPool[*listPtr];

    while (_controllerPool.blockPool < controller)
    {
        if ((controller->segNumber != segNumber) || (controller->type != type))
        {
            controller = &_controllerPool.blockPool[controller->next];
        }
        else
        {
            break;
        }
    }

    if (controller == _controllerPool.blockPool)
    {
        return NULL;
    }

    return controller;
}

G2AnimController *_G2AnimControllerST_FindPtrInList(int segNumber, int type, unsigned short **listPtrPtr)
{
    G2AnimController *controller;

    controller = &_controllerPool.blockPool[**listPtrPtr];

    while (_controllerPool.blockPool < controller)
    {
        if ((controller->segNumber == segNumber) && (controller->type == type))
        {
            break;
        }

        *listPtrPtr = (unsigned short *)controller;

        controller = &_controllerPool.blockPool[controller->next];
    }

    if (controller == _controllerPool.blockPool)
    {
        *listPtrPtr = NULL;

        return NULL;
    }

    return controller;
}

G2AnimController *_G2AnimControllerST_RemoveFromList(int segNumber, int type, unsigned short *listPtr)
{
    G2AnimController *controller;
    G2AnimController *stepController;
    G2AnimController *nextController;

    controller = &_controllerPool.blockPool[*listPtr];

    if (controller > _controllerPool.blockPool)
    {
        while (controller > _controllerPool.blockPool)
        {
            if ((controller->segNumber != segNumber) || (controller->type != type))
            {
                nextController = controller;

                listPtr = (unsigned short *)controller;

                controller = &_controllerPool.blockPool[*listPtr];
            }
            else
            {
                break;
            }
        }

        nextController = controller;

        while (nextController > _controllerPool.blockPool)
        {
            stepController = nextController;

            nextController = &_controllerPool.blockPool[nextController->next];

            *listPtr = stepController->next;

            if ((nextController <= _controllerPool.blockPool) || (nextController->type != 0))
            {
                stepController->next = 0;

                return controller;
            }
        }
    }

    return NULL;
}

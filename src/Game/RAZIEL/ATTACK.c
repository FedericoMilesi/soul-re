#include "common.h"
#include "Game/RAZIEL/ATTACK.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/MATH3D.h"
#include "Game/G2/ANMCTRLR.h"
#include "Game/CAMERA.h"
#include "Game/RAZIEL/RAZLIB.h"
#include "Game/STATE.h"
#include "Game/RAZIEL/STEERING.h"
#include "Game/RAZIEL/HEALTH.h"
#include "Game/RAZIEL/CONTROL.h"
#include "Game/G2/ANMG2ILF.h"
#include "Game/RAZIEL/SWIM.h"
#include "Game/REAVER.h"
#include "Game/FX.h"

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerDecodeHold);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerAttack2);

void StateHandlerCannedReaction(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr;

    while ((Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event)) != NULL)
    {
        switch (Ptr->ID)
        {
        case 0x100001:
            if (CurrentSection == 0)
            {
                Raziel.alarmTable = 4500;

                Raziel.Mode = 0x10000;

                ControlFlag = 0x1041009;

                PhysicsMode = 3;

                SteerSwitchMode(In->CharacterInstance, 0);

                In->CharacterInstance->anim.section[0].swAlarmTable = &Raziel.alarmTable;
            }

            break;
        case 0x100004:
            if (CurrentSection == 1)
            {
                G2EmulationSwitchAnimationSync(In, 2, 1, 4);
            }

            break;
        case 0x100014:
        case 0x8000000:
            StateSwitchStateData(In, CurrentSection, StateHandlerIdle, SetControlInitIdleData(0, 0, 3));

            Raziel.Mode = 1;
            break;
        case 0x8000003:
        {
            Instance *Inst;

            if (CurrentSection == 0)
            {
                Inst = razGetHeldItem();

                if ((Raziel.Senses.EngagedMask & 0x200))
                {
                    INSTANCE_Post(Raziel.Senses.EngagedList[9].instance, 0x100000A, SetMonsterImpaleData(Inst, &In->CharacterInstance->rotation, &In->CharacterInstance->position, 520));
                }
            }

            break;
        }
        case 0x8000004:
        {
            Instance *Inst;

            Inst = razGetHeldItem();

            INSTANCE_Post(Inst, 0x800008, 2);

            razReaverOn();

            if ((Raziel.Senses.EngagedMask & 0x200))
            {
                INSTANCE_Post(Raziel.Senses.EngagedList[9].instance, 0x100000A, SetMonsterImpaleData(Inst, &In->CharacterInstance->rotation, &In->CharacterInstance->position, 520));
            }

            break;
        }
        case 0x1000000:
        case 0x1000001:
        case 0x80000000:
        case 0x80000008:
        case 0x80000020:
            break;
        default:
            DefaultStateHandler(In, CurrentSection, Data);
        }

        DeMessageQueue(&In->SectionList[CurrentSection].Event);
    }
}

void StateHandlerStumble(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr;
    int temp; // not from decls.h

    while ((Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event)) != NULL)
    {
        switch (Ptr->ID)
        {
        case 0x100001:
            if (CurrentSection == 0)
            {
                ControlFlag = 0x8;

                SetPhysics(In->CharacterInstance, -16, 0, 0, 0);

                PhysicsMode = 0;

                SteerSwitchMode(In->CharacterInstance, 0);

                razResetMotion(In->CharacterInstance);

                if (Ptr->Data != 0)
                {
                    temp = ((Ptr->Data * 16) - Ptr->Data) * 2;

                    SetTimer(temp / 4096);
                }
                else
                {
                    SetTimer(1);
                }
            }

            G2Anim_SetSpeedAdjustment(&In->CharacterInstance->anim, 2048);

            G2EmulationSwitchAnimation(In, CurrentSection, 128, 0, 3, 2);
            break;
        case 0x100004:
            G2Anim_SetSpeedAdjustment(&In->CharacterInstance->anim, 4096);
            break;
        case 0x100000:
            if (((*PadData & RazielCommands[5])) && ((*PadData & RazielCommands[4])))
            {
                Raziel.returnState = StateHandlerIdle;

                StateSwitchStateCharacterData(In, StateHandlerIdle, SetControlInitIdleData(0, 0, 12));
                StateSwitchStateCharacterData(In, StateHandlerLookAround, 0);
            }
            else
            {
                StateSwitchStateCharacterData(In, StateHandlerIdle, SetControlInitIdleData(0, 0, 12));
            }

            break;
        case 0x4000001:
            break;
        case 0x10000000:
            if (In->SectionList[CurrentSection].Data2 == 1)
            {
                In->SectionList[CurrentSection].Data2 = 0;
                In->SectionList[CurrentSection].Data1 -= 512;
            }

            break;
        case 0:
            In->SectionList[CurrentSection].Data2 = 1;
            break;
        case 0x40003:
            if (CurrentSection == 0)
            {
                evActionPlayHostAnimationData *data;

                data = (evActionPlayHostAnimationData *)Ptr->Data;

                G2EmulationInstanceToInstanceSwitchAnimationCharacter(data->instance, data->host, data->newAnim, data->newFrame, data->frames, data->mode);
            }

            break;
        case 0x1000000:
            if ((gameTrackerX.debugFlags2 & 0x800))
            {
                evMonsterHitData *data;

                data = (evMonsterHitData *)Ptr->Data;

                LoseHealth(data->power);
            }

            break;
        case 0x100015:
            if (STREAM_IsMorphInProgress() == 0)
            {
                EnMessageQueueData(&Raziel.State.SectionList[CurrentSection].Defer, 0x100000, 0);
            }
            else
            {
                EnMessageQueueData(&Raziel.State.SectionList[CurrentSection].Defer, 0x100015, 0);
            }

            break;
        case 0x40005:
        case 0x100009:
        case 0x1000001:
        case 0x2000000:
        case 0x80000000:
        case 0x80000008:
        case 0x80000020:
            break;
        default:
            DefaultStateHandler(In, CurrentSection, Data);
        }

        DeMessageQueue(&In->SectionList[CurrentSection].Event);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerHitReaction);

void StateHandlerThrow2(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr;
    int Anim;

    Anim = G2EmulationQueryAnimation(In, CurrentSection);

    while ((Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event)) != NULL)
    {
        switch (Ptr->ID)
        {
        case 0x100001:
            if (CurrentSection == 0)
            {
                ControlFlag = 0x41001;

                if (!(Raziel.Mode & 0x40000))
                {
                    SteerSwitchMode(In->CharacterInstance, 0);

                    ControlFlag |= 0x8;
                }
                else
                {
                    SteerSwitchMode(In->CharacterInstance, 11);
                }

                PhysicsMode = 3;

                Raziel.Mode |= 0x20000;

                In->SectionList[CurrentSection].Data1 = 0;

                if (razGetHeldWeapon() != NULL)
                {
                    Raziel.throwInstance = razGetHeldItem();

                    switch (Raziel.Senses.heldClass)
                    {
                    case 0x1:
                        Raziel.throwData = PlayerData->throwList[0];
                        break;
                    case 0x2:
                        Raziel.throwData = PlayerData->throwList[1];
                        break;
                    case 0x3:
                        Raziel.throwData = PlayerData->throwList[2];
                        break;
                    case 0x1000:
                        Raziel.throwInstance = NULL;
                        Raziel.throwData = PlayerData->throwList[5];

                        INSTANCE_Post(Raziel.soulReaver, 0x800104, 0);

                        Raziel.effectsFlags |= 0x4;

                        razSetupSoundRamp(In->CharacterInstance, (SoundRamp *)&Raziel.soundHandle, 12, -100, 0, 50, 85, 184320, 10000);

                        Raziel.soundTimerNext = 0;
                        Raziel.soundTimerData = 0;
                        break;
                    case 0x8:
                        In->SectionList[CurrentSection].Data1 = 1;

                        Raziel.throwData = PlayerData->throwList[4];
                        Raziel.throwInstance = NULL;
                        break;
                    }
                }

                Raziel.throwMode = 0;
            }

            if (CurrentSection == 2)
            {
                if ((Raziel.Mode & 0x40000))
                {
                    G2EmulationSwitchAnimation(In, 2, 61, 0, 3, 2);
                }
                else
                {
                    G2EmulationSwitchAnimation(In, 2, 0, 0, 3, 2);
                }
            }
            else if ((!(Raziel.Mode & 0x40000)) || (CurrentSection != 0))
            {
                if (Raziel.throwData[0].prepAnim != 0)
                {
                    G2EmulationSwitchAnimationAlpha(In, CurrentSection, Raziel.throwData[0].prepAnim, 0, Raziel.throwData[0].prepAnimFramesIn, 1, Raziel.throwData[0].prepAnimAlphaIn);
                }
                else
                {
                    G2EmulationSwitchAnimationAlpha(In, CurrentSection, Raziel.throwData[0].coilAnim, 0, Raziel.throwData[0].coilAnimFramesIn, 1, Raziel.throwData[0].coilAnimAlphaIn);
                }
            }
            else if (Anim != 63)
            {
                G2EmulationSwitchAnimation(In, 0, 63, 0, 16, 2);
            }

            In->SectionList[CurrentSection].Data2 = 1;
            break;
        case 0x100004:
            G2Anim_InterpDisableController(&In->CharacterInstance->anim, 14, 14, 300);

            if ((Raziel.effectsFlags & 0x2))
            {
                razSetFadeEffect(In->CharacterInstance->fadeValue, 0, -PlayerData->throwFadeOutRate);
            }

            if ((CurrentSection == 0) && (Raziel.soundHandle != 0))
            {
                SndEndLoop(Raziel.soundHandle);

                Raziel.soundHandle = 0;
            }

            if (Raziel.Senses.heldClass == 0x8)
            {
                INSTANCE_PlainDeath(razGetHeldItem());
            }

            if (Raziel.Senses.heldClass == 0x1000)
            {
                INSTANCE_Post(Raziel.soulReaver, 0x800105, 0);
            }

            break;
        case 0x1000001:
        case 0x4020000:
        case 0x20000002:
        case 0x80000000:
        case 0x80000020:
            break;
        case 0x80000008:
            if (Raziel.throwInstance != NULL)
            {
                EnMessageQueueData(&In->SectionList[CurrentSection].Event, 0x100000, 0);
            }

            break;
        case 0x100000:
            if ((Raziel.Mode & 0x40000))
            {
                StateSwitchStateData(In, CurrentSection, StateHandlerSwim, 0);
                break;
            }

            StateSwitchStateData(In, CurrentSection, StateHandlerIdle, SetControlInitIdleData(0, 0, Raziel.throwData->framesOut));

            if (((*PadData & RazielCommands[5])) && ((*PadData & RazielCommands[4])))
            {
                Raziel.returnState = StateHandlerIdle;

                StateSwitchStateData(In, CurrentSection, StateHandlerLookAround, 0);
            }

            break;
        case 0x1000000:
            if (CurrentSection == 0)
            {
                if ((Raziel.Mode & 0x40000))
                {
                    evMonsterHitData *data;

                    data = (evMonsterHitData *)Ptr->Data;

                    if ((gameTrackerX.debugFlags2 & 0x800))
                    {
                        LoseHealth(data->power);
                    }
                }
                else if ((!(ControlFlag & 0x4000)) && (Raziel.invincibleTimer == 0))
                {
                    StateSwitchStateCharacterDataDefault(In, StateHandlerHitReaction, Ptr->Data);

                    CAMERA_ForceEndLookaroundMode(&theCamera);
                }
            }

            break;
        case 0x8000000:
            Raziel.throwMode &= ~0x4;

            if (Anim == Raziel.throwData->prepAnim)
            {
                if ((!(Raziel.Mode & 0x40000)) || (CurrentSection != 0))
                {
                    G2EmulationSwitchAnimationAlpha(In, CurrentSection, Raziel.throwData->coilAnim, 0, Raziel.throwData->coilAnimFramesIn, 1, Raziel.throwData->coilAnimAlphaIn);
                }
            }
            else if ((Anim == Raziel.throwData->throwAnim) && (CurrentSection == 1))
            {
                INSTANCE_Post(In->CharacterInstance, 0x100000, 0);
            }

            break;
        case 0x20000020:
            if (In->SectionList[CurrentSection].Data2 != 0)
            {
                if (Anim == Raziel.throwData->coilAnim)
                {
                    if ((!(Raziel.Mode & 0x40000)) || (CurrentSection != 0))
                    {
                        G2EmulationSwitchAnimation(In, CurrentSection, Raziel.throwData->throwAnim, 0, Raziel.throwData->throwAnimFramesInFactor, 1);
                    }

                    if (CurrentSection == 1)
                    {
                        Raziel.alarmTable = Raziel.throwData->throwFrameToLaunch * 100;

                        In->CharacterInstance->anim.section[1].swAlarmTable = &Raziel.alarmTable;
                    }

                    In->SectionList[CurrentSection].Data2 = 0;

                    if ((Raziel.playerEvent & 0x200))
                    {
                        razSetPlayerEventHistory(0x200);
                    }
                }
                else
                {
                    EnMessageQueueData(&In->SectionList[CurrentSection].Defer, 0x20000020, 0);
                }
            }

            break;
        case 0x8000004:
        {
            Instance *weaponInst;

            weaponInst = razGetHeldWeapon();

            if (weaponInst != NULL)
            {
                int spin_type;

                spin_type = Raziel.throwData->selfAdjustingFlag != 0;

                if ((Raziel.throwMode & 0x2))
                {
                    INSTANCE_Post(weaponInst, 0x800010, SetObjectThrowData(&Raziel.throwTarget, NULL, 4, spin_type, Raziel.throwData->velocity, Raziel.throwData->gravity, 0, 0));
                }
                else if ((Raziel.Senses.EngagedMask & 0x80))
                {
                    Position To;
                    Rotation Rot;
                    MATRIX *matrix;

                    INSTANCE_Post(weaponInst, 0x800010, SetObjectThrowData(Raziel.Senses.EngagedList[7].instance, NULL, 1, spin_type, (unsigned short)Raziel.throwData->velocity, Raziel.throwData->gravity, 0, 0));

                    matrix = (MATRIX *)INSTANCE_Query(Raziel.Senses.EngagedList[7].instance, 12);

                    To.x = (short)matrix->t[0];
                    To.y = (short)matrix->t[1];
                    To.z = (short)matrix->t[2];

                    PointAt(In->CharacterInstance, &To, &Rot);
                }
                else
                {
                    INSTANCE_Post(weaponInst, 0x800010, SetObjectThrowData(NULL, NULL, 0, spin_type, Raziel.throwData->velocity, 0, 0, 0));
                }

                razSetFadeEffect(In->CharacterInstance->fadeValue, 0, -PlayerData->throwFadeOutRate);

                razReaverOn();
            }

            break;
        }
        case 0x4000001:
            if (CurrentSection == 0)
            {
                SetDropPhysics(In->CharacterInstance, &Raziel);
            }

            G2EmulationSwitchAnimation(In, CurrentSection, 36, 0, 4, 1);

            StateSwitchStateData(In, CurrentSection, StateHandlerFall, 0);
            break;
        case 0x100009:
            if (CurrentSection == 1)
            {
                if (CurrentSection == Ptr->Data)
                {
                    if ((Raziel.Senses.heldClass != 0x1000) && (Raziel.Senses.heldClass != 0x8))
                    {
                        razSetFadeEffect(In->CharacterInstance->fadeValue, PlayerData->throwFadeValue, PlayerData->throwFadeInRate);
                    }

                    Raziel.returnState = StateHandlerIdle;

                    Raziel.throwMode = 2;
                }
                else
                {
                    razSetFadeEffect(In->CharacterInstance->fadeValue, 0, -PlayerData->throwFadeInRate);

                    G2Anim_InterpDisableController(&In->CharacterInstance->anim, 14, 14, 600);

                    Raziel.throwMode = 0;
                }
            }

            break;
        default:
            DefaultStateHandler(In, CurrentSection, Data);
        }

        DeMessageQueue(&In->SectionList[CurrentSection].Event);
    }

    if ((CurrentSection == 1) && ((Raziel.Senses.EngagedMask & 0x80)))
    {
        Position To;
        Rotation Rot;
        MATRIX *matrix;

        matrix = (MATRIX *)INSTANCE_Query(Raziel.Senses.EngagedList[7].instance, 12);

        To.x = (short)matrix->t[0];
        To.y = (short)matrix->t[1];
        To.z = (short)matrix->t[2];

        PointAt(In->CharacterInstance, &To, &Rot);
    }
}

void PointAt(Instance *instance, Position *Target, Rotation *Rot1)
{
    Position From;
    SVECTOR v1;
    VECTOR v3;
    MATRIX *tempMat;

    tempMat = instance->matrix;

    v1.vx = Raziel.throwData->launchPointX;
    v1.vy = Raziel.throwData->launchPointY;
    v1.vz = Raziel.throwData->launchPointZ;

    ApplyMatrix(tempMat, &v1, &v3);

    v3.vx += instance->position.x;
    v3.vy += instance->position.y;
    v3.vz += instance->position.z;

    From.x = (short)v3.vx;
    From.y = (short)v3.vy;
    From.z = (short)v3.vz;

    MATH3D_RotationFromPosToPos(&From, Target, Rot1);

    Rot1->z -= instance->rotation.z;
    Rot1->y = 0;

    LimitRotation(Rot1);

    if (G2Anim_IsControllerActive(&instance->anim, 14, 14) == G2FALSE)
    {
        G2Anim_EnableController(&instance->anim, 14, 14);
    }

    MATH3D_ZYXtoXYZ(Rot1);

    G2Anim_SetController_Vector(&instance->anim, 14, 14, (G2SVector3 *)Rot1);
}

void ThrowSetFocusPoint(Instance *instance, Rotation *rot)
{
    MATRIX *pTempMat;
    Instance *weaponInstance;
    SVECTOR v1;
    VECTOR v4;

    rot->x = -rot->x;

    pTempMat = theCamera.core.cwTransform2;

    weaponInstance = razGetHeldWeapon();

    if ((weaponInstance != NULL) && (weaponInstance->matrix != NULL))
    {
        v1.vx = 0;
        v1.vy = 0;
        v1.vz = Raziel.throwData->velocity;

        ApplyMatrix(pTempMat, &v1, &v4);

        Raziel.throwTarget.x = (short)v4.vx;
        Raziel.throwTarget.y = (short)v4.vy;
        Raziel.throwTarget.z = (short)v4.vz;

        if (G2Anim_IsControllerActive(&instance->anim, 14, 14) == G2FALSE)
        {
            G2Anim_EnableController(&instance->anim, 14, 14);
        }

        MATH3D_ZYXtoXYZ(rot);

        G2Anim_SetController_Vector(&instance->anim, 14, 14, (G2SVector3 *)rot);

        v4.vx = weaponInstance->matrix[1].t[0];
        v4.vy = weaponInstance->matrix[1].t[1];
        v4.vz = weaponInstance->matrix[1].t[2];

        CAMERA_SetLookFocusAndDistance(&theCamera, &v4, PlayerData->throwManualDistance);
    }
}

void LimitRotation(Rotation *rot)
{
    rot->z &= 0xFFF;
    rot->x &= 0xFFF;

    while (rot->z >= 4097)
    {
        rot->z -= 4096;
    }

    if (rot->z > 0)
    {
        if (rot->z < 2048)
        {
            if (rot->z > Raziel.throwData->maxZRotation)
            {
                rot->z = Raziel.throwData->maxZRotation;
            }
        }
        else if (rot->z < Raziel.throwData->minZRotation)
        {
            rot->z = Raziel.throwData->minZRotation;
        }
    }
    else
    {
        rot->z += 4096;

        if (rot->z < Raziel.throwData->minZRotation)
        {
            rot->z = Raziel.throwData->minZRotation;
        }
    }

    while (rot->x >= 4097)
    {
        rot->x -= 4096;
    }

    if (rot->x > 0)
    {
        if (rot->x < 2048)
        {
            if (rot->x > Raziel.throwData->maxXRotation)
            {
                rot->x = Raziel.throwData->maxXRotation;
            }
        }
        else if (rot->x < Raziel.throwData->minXRotation)
        {
            rot->x = Raziel.throwData->minXRotation;
        }
    }
    else
    {
        rot->x += 4096;

        if (rot->x < Raziel.throwData->minXRotation)
        {
            rot->x = Raziel.throwData->minXRotation;
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/ATTACK", StateHandlerGrab);

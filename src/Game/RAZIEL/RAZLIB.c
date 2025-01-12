#include "Game/FONT.h"
#include "Game/FX.h"
#include "Game/STREAM.h"
#include "Game/PHYSOBS.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/RAZIEL/RAZLIB.h"
#include "Game/G2/INSTNCG2.h"
#include "Game/G2/TIMERG2.h"
#include "Game/RAZIEL/CONTROL.h"

void razAlignYMoveRot(Instance *dest, short distance, Position *position, Rotation *rotation, int extraZ)
{
    SVECTOR d;
    SVECTOR dd;
    MATRIX mat;
    int temp; // not from decls.h

    temp = 2048;

    d.vx = 0;
    d.vy = -distance;
    d.vz = 0;

    rotation->z = ((evPositionData *)INSTANCE_Query(dest, 7))->z + (extraZ + temp);

    MATH3D_SetUnityMatrix(&mat);

    RotMatrixZ(rotation->z, &mat);

    ApplyMatrixSV(&mat, &d, &dd);

    position->x = dest->position.x + dd.vx;
    position->y = dest->position.y + dd.vy;
}

void razAlignYRotMove(Instance *dest, short distance, Position *position, Rotation *rotation, int extraZ)
{
    SVECTOR d;
    SVECTOR dd;
    SVECTOR rot;
    MATRIX mat;

    memset(&rot, 0, sizeof(SVECTOR));

    rot.vz = rotation->z = MATH3D_AngleFromPosToPos(position, &dest->position) + extraZ;

    RotMatrix(&rot, &mat);

    d.vx = 0;
    d.vz = 0;
    d.vy = distance;

    ApplyMatrixSV(&mat, &d, &dd);

    position->x = dest->position.x + dd.vx;
    position->y = dest->position.y + dd.vy;
}

// void razAlignYRotMoveInterp(struct _Instance *source, struct _Instance *dest, short distance, unsigned char segNumber, int Frames, int extraZ)
void razAlignYRotMoveInterp(Instance *source, Instance *dest, short distance, unsigned char segNumber, int Frames, short extraZ)
{
    Position position;
    Rotation rotation;
    G2SVector3 v;

    position = source->position;

    razAlignYRotMove(dest, distance, &position, &rotation, extraZ);

    v.x = position.x;
    v.y = position.y;
    v.z = position.z;

    source->position = position;

    v.x = 0;
    v.y = 0;
    v.z = rotation.z;

    G2Anim_EnableController(&source->anim, segNumber, 8);

    G2EmulationSetInterpController_Vector(source, segNumber, 8, &v, Frames, 0);

    source->rotation.z = rotation.z;
}

void razAlignYRotInterp(Instance *source, Position *dest, unsigned char segNumber, int Frames)
{
    (void)segNumber;
    (void)Frames;

    source->rotation.z = MATH3D_AngleFromPosToPos(&source->position, dest);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razConstrictAngle);

void razRotateUpperBody(Instance *instance, evActionLookAroundData *data)
{
    int tx;
    int tz;
    G2SVector3 Rot;

    if (*data->rotx < data->minx)
    {
        *data->rotx = data->minx;
    }
    else if (*data->rotx > data->maxx)
    {
        *data->rotx = data->maxx;
    }

    if (*data->rotz < data->minz)
    {
        *data->rotz = data->minz;
    }
    else if (*data->rotz > data->maxz)
    {
        *data->rotz = data->maxz;
    }

    tx = *data->rotx;
    tz = *data->rotz;

    Rot.x = -tx / 2;
    Rot.y = 0;
    Rot.z = tz / 2;

    MATH3D_ZYXtoXYZ((Rotation *)&Rot);

    G2Anim_SetController_Vector((G2Anim *)&instance->anim, 14, 14, &Rot);

    Rot.x = (-tx * 30) / 100;
    Rot.y = 0;
    Rot.z = (tz * 30) / 100;

    MATH3D_ZYXtoXYZ((Rotation *)&Rot);

    G2Anim_SetController_Vector((G2Anim *)&instance->anim, 16, 14, &Rot);

    Rot.x = -tx / 5;
    Rot.y = 0;
    Rot.z = tz / 5;

    MATH3D_ZYXtoXYZ((Rotation *)&Rot);

    G2Anim_SetController_Vector((G2Anim *)&instance->anim, 17, 14, &Rot);
}

void razSetFadeEffect(short source, short dest, int steps)
{
    Raziel.effectsFadeSource = source;
    Raziel.effectsFadeDest = dest;

    Raziel.effectsFadeSteps = 0;
    Raziel.effectsFadeStep = steps;

    Raziel.effectsFlags |= 0x3;
}

int razPlaneShift(Instance *instance)
{
    (void)instance;

    if (!(gameTrackerX.streamFlags & 0x40000))
    {
        if (Raziel.CurrentPlane == 1)
        {
            razSpectralShift();

            return 1;
        }
        else
        {
            razMaterialShift();

            return 1;
        }
    }

    return 0;
}

void razSpectralShift()
{
    Instance *inst;

    if (!(gameTrackerX.streamFlags & 0x40000))
    {
        if (Raziel.CurrentPlane == 1)
        {
            inst = razGetHeldItem();

            if (inst != NULL)
            {
                INSTANCE_Post(inst, 0x800008, 4);

                razSetFadeEffect(4096, 0, 256);
            }

            gameTrackerX.playerInstance->flags2 |= 0x8000000;

            INSTANCE_Post(gameTrackerX.playerInstance, 0x100014, 0);

            if (Raziel.HitPoints == GetMaxHealth())
            {
                Raziel.HitPoints = 100000;
            }
            else
            {
                Raziel.HitPoints = 83334;
            }

            Raziel.CurrentPlane = 2;

            razReaverOn();

            if (gameTrackerX.gameData.asmData.MorphType == 0)
            {
                MORPH_ToggleMorph();

                if ((Raziel.State.SectionList[0].Process != StateHandlerGlyphs) && (Raziel.State.SectionList[0].Process != StateHandlerPuppetShow))
                {
                    INSTANCE_Post(gameTrackerX.playerInstance, 0x40005, 0);
                }
            }
        }
    }
}

void razMaterialShift()
{
    if (Raziel.CurrentPlane == 2)
    {
        if (Raziel.HitPoints == 100000)
        {
            Raziel.CurrentPlane = 1;

            gameTrackerX.playerInstance->flags2 &= ~0x8000000;

            Raziel.HitPoints = GetMaxHealth();

            Raziel.DamageFrequency = 0;

            razReaverOn();

            if (gameTrackerX.gameData.asmData.MorphType != 0)
            {
                MORPH_ToggleMorph();

                if ((Raziel.State.SectionList[0].Process != StateHandlerGlyphs) && (Raziel.State.SectionList[0].Process != StateHandlerPuppetShow))
                {
                    INSTANCE_Post(gameTrackerX.playerInstance, 0x40005, 0);
                }

                if (Raziel.Senses.Portal != NULL)
                {
                    FX_EndInstanceParticleEffects(Raziel.Senses.Portal);
                }
            }
        }
    }
}

int RAZIEL_OkToShift()
{
    if (Raziel.CurrentPlane == 2)
    {
        if (Raziel.HitPoints == GetMaxHealth())
        {
            if ((Raziel.Abilities & 0x40))
            {
                if (!(Raziel.Abilities & 0x10))
                {
                    FONT_Print("\nYOU CAN NOT HAVE SHIFT ANYTIME WITHOUT THE SWIM ABILITY");
                    FONT_Print("\nBEAT THE ALUKA BOSS THEN WIN THE SECOND KAIN ENCOUNTER");

                    return 0;
                }
            }
            else
            {
                return (Raziel.Senses.Flags & 0x40) > 0;
            }
        }
        else
        {
            return 0;
        }
    }

    return 1;
}

int razPickupAndGrab(CharacterState *In, int CurrentSection)
{
    int index;

    if (!(Raziel.Senses.EngagedMask & 0x20))
    {
        return 1;
    }

    if ((razGetHeldItem() == NULL) && (Raziel.CurrentPlane == 1) && (!(Raziel.Senses.Flags & 0x80)))
    {
        evObjectData *objData;

        if (CurrentSection != 1)
        {
            return 0;
        }

        if (Raziel.Senses.EngagedList[5].instance->LinkParent != NULL)
        {
            INSTANCE_Query(Raziel.Senses.EngagedList[5].instance->LinkParent, 0);
        }

        objData = (evObjectData *)SetObjectData(0, 0, 8, In->CharacterInstance, CurrentSection);

        INSTANCE_Post(Raziel.Senses.EngagedList[5].instance, 0x80002E, (intptr_t)objData);

        if (objData->LinkNode == 0)
        {
            if (Raziel.Senses.EngagedList[5].instance->LinkParent != NULL)
            {
                INSTANCE_Post(Raziel.Senses.EngagedList[5].instance->LinkParent, 0x100001B, 0);

                INSTANCE_UnlinkFromParent(Raziel.Senses.EngagedList[5].instance);
            }

            objData = (evObjectData *)SetObjectData(0, 0, 8, In->CharacterInstance, 49);

            INSTANCE_Post(Raziel.Senses.EngagedList[5].instance, 0x800002, (intptr_t)objData);

            if (objData->LinkNode == 0)
            {
                CharacterState *temp; // not from decls.h

                Raziel.Senses.Flags |= 0x80;

                temp = (CharacterState *)&In->SectionList[0].Data1;

                razReaverOff();

                temp->SectionList[0].Data1 = 0; // TODO: double-check, something looks a bit off here

                index = INSTANCE_Query(Raziel.Senses.EngagedList[5].instance, 4);

                if ((Raziel.Mode & 0x40000))
                {
                    return 0;
                }

                G2EmulationSwitchAnimation(In, 1, PickupList[index], 0, 3, CurrentSection);

                Raziel.returnState = temp->SectionList[0].Process;

                StateSwitchStateData(In, 1, StateHandlerPickupObject, 0);
            }
        }

        return 0;
    }

    return 1;
}

int razZeroAxis(long *x, long *y, int radius)
{
    unsigned long distance;

    distance = MATH3D_SquareLength(*x, *y, 0);

    if (distance < (unsigned int)radius)
    {
        distance = 0;

        *x = 0;
        *y = 0;
    }

    return distance;
}

int razAdjustSpeed(Instance *instance, int minSpeed)
{
    long adjustment;
    // int data; unused

    (void)minSpeed;

    if (Raziel.Magnitude > Raziel.movementMaxAnalog)
    {
        adjustment = Raziel.movementMaxRate;
    }
    else if (Raziel.Magnitude < Raziel.movementMinAnalog)
    {
        adjustment = Raziel.movementMinRate;
    }
    else
    {
        adjustment = Raziel.movementMaxRate - (((Raziel.movementMaxRate - Raziel.movementMinRate) * (Raziel.movementMaxAnalog - Raziel.Magnitude)) / (Raziel.movementMaxAnalog - Raziel.movementMinAnalog));
    }

    G2Anim_SetSpeedAdjustment(&instance->anim, adjustment);

    return adjustment;
}

void razLaunchForce(Instance *instance)
{
    PHYSOB_BirthProjectile(instance, 49, ((char *)&Raziel.Abilities)[1] & 0x1); // TODO: reverify that the third function parameter is not fake

    Raziel.effectsFlags |= 0x4;

    razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 12, PlayerData->forceMinPitch, PlayerData->forceMaxPitch, PlayerData->forceMinVolume, PlayerData->forceMaxVolume, PlayerData->forceRampTime * 30, 10000);

    Raziel.soundTimerNext = 0;
    Raziel.soundTimerData = 0;
}

Instance *razGetHeldItem()
{
    Instance *instance;

    instance = Raziel.State.CharacterInstance->LinkChild;

    if ((Raziel.soulReaver != NULL) && (instance == Raziel.soulReaver) && (instance != NULL))
    {
        return instance->LinkSibling;
    }

    return instance;
}

Instance *razGetHeldWeapon()
{
    Instance *instance;

    instance = razGetHeldItem();

    if (instance == NULL)
    {
        if (Raziel.Senses.heldClass != 0)
        {
            return Raziel.soulReaver;
        }
    }
    else if ((INSTANCE_Query(instance, 1) & 0x20))
    {
        return instance;
    }

    return NULL;
}

void razReaverBladeOff()
{
    if (Raziel.soulReaver != NULL)
    {
        INSTANCE_Post(Raziel.soulReaver, 0x800109, 0);
    }
}

void razReaverBladeOn()
{
    if ((Raziel.soulReaver != NULL) && (razGetHeldItem() == NULL))
    {
        INSTANCE_Post(Raziel.soulReaver, 0x800108, 0);
    }
}

int razReaverOff()
{
    Instance *HeldWeapon;

    if ((Raziel.soulReaver != NULL) && (Raziel.Senses.heldClass == 0x1000))
    {
        HeldWeapon = razGetHeldWeapon();

        if ((INSTANCE_Query(Raziel.soulReaver, 40) & 0x1))
        {
            INSTANCE_Post(Raziel.soulReaver, 0x800101, 0);
        }

        if (HeldWeapon == Raziel.soulReaver)
        {
            Raziel.Senses.heldClass = 0;
        }

        return 1;
    }

    return 0;
}

int razReaverOn()
{
    if ((Raziel.soulReaver != NULL) && (razGetHeldItem() == NULL) && ((Raziel.HitPoints == GetMaxHealth()) || (Raziel.CurrentPlane == 2)))
    {
        if (!(INSTANCE_Query(Raziel.soulReaver, 40) & 0x1))
        {
            INSTANCE_Post(Raziel.soulReaver, 0x800100, 0);
        }

        Raziel.Senses.heldClass = 0x1000;

        if ((Raziel.CurrentPlane == 2) && (Raziel.currentSoulReaver != 1))
        {
            razReaverImbue(1);
        }

        if ((Raziel.CurrentPlane == 1) && (Raziel.currentSoulReaver == 1))
        {
            razReaverImbue(2);
        }

        return 1;
    }

    return 0;
}

void razReaverPickup(Instance *instance, Instance *soulReaver)
{
    INSTANCE_Post(soulReaver, 0x800002, (intptr_t)instance);

    Raziel.soulReaver = soulReaver;

    if (razGetHeldItem() != NULL)
    {
        razReaverOff();
    }

    Raziel.Abilities |= 0x8;

    if (Raziel.CurrentPlane == 1)
    {
        Raziel.currentSoulReaver = 2;

        Raziel.Abilities |= 0xC08;

        debugRazielFlags2 = 0x800;

        debugRazielFlags1 = Raziel.Abilities;

        INSTANCE_Post(soulReaver, 0x800103, Raziel.currentSoulReaver);
    }
    else
    {
        Raziel.currentSoulReaver = 1;

        Raziel.Abilities |= 0xC08;

        debugRazielFlags2 = 0x400;

        debugRazielFlags1 = Raziel.Abilities;

        INSTANCE_Post(soulReaver, 0x800103, Raziel.currentSoulReaver);
    }
}

void razReaverImbue(int reaverType)
{
    Raziel.currentSoulReaver = reaverType;

    debugRazielFlags2 = 1 << (reaverType + 9);

    INSTANCE_Post(Raziel.soulReaver, 0x800103, reaverType);
}

int razGetReaverFromMask(int reaverMask)
{
    int rc;

    reaverMask = ((unsigned int)reaverMask >> 10) & 0xFF;

    for (rc = 0; reaverMask != 0; rc++)
    {
        reaverMask >>= 1;
    }

    return rc;
}

void razReaverScale(int scale)
{
    Instance *Inst;

    Inst = razGetHeldWeapon();

    if ((Raziel.soulReaver != NULL) && (Inst == Raziel.soulReaver) && ((INSTANCE_Query(Inst, 40) & 0x2)))
    {
        INSTANCE_Post(Inst, 0x800107, scale);
    }
}

void razGetForwardNormal(Instance *inst, Instance *target)
{
    PCollideInfo CInfo;
    SVECTOR Old;
    SVECTOR New;

    CInfo.oldPoint = &Old;
    CInfo.newPoint = &New;

    Old.vx = (short)inst->matrix[1].t[0];
    Old.vy = (short)inst->matrix[1].t[1];
    Old.vz = (short)inst->matrix[1].t[2];

    New.vx = (short)target->matrix[1].t[0];
    New.vy = (short)target->matrix[1].t[1];
    New.vz = (short)target->matrix[1].t[2];

    PHYSICS_CheckLineInWorld(inst, &CInfo);

    if ((CInfo.type == 2) || (CInfo.type == 3) || (CInfo.type == 5))
    {
        Raziel.Senses.ForwardNormal.x = CInfo.wNormal.vx;
        Raziel.Senses.ForwardNormal.y = CInfo.wNormal.vy;
        Raziel.Senses.ForwardNormal.z = CInfo.wNormal.vz;
    }
}

void razGetRotFromNormal(SVector *normal, Rotation *rot)
{
    Position a;
    Position b;

    a.x = normal->x;
    a.y = normal->y;
    a.z = normal->z;

    b.z = 0;
    b.y = 0;
    b.x = 0;

    MATH3D_RotationFromPosToPos(&a, &b, rot);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razCenterWithBlock);

void razSetPauseTranslation(Instance *instance)
{
    G2SVector3 Vec;

    if (G2Anim_IsControllerActive(&instance->anim, 0, 34) == G2FALSE)
    {
        G2Anim_EnableController(&instance->anim, 0, 34);
    }

    Vec.x = 0;
    Vec.y = 0;
    Vec.z = 0;

    G2Anim_SetController_Vector(&instance->anim, 0, 34, &Vec);

    ControlFlag |= 0x20000000;
}

void razResetPauseTranslation(Instance *instance)
{
    if (G2Anim_IsControllerActive(&instance->anim, 0, 34) != G2FALSE)
    {
        G2Anim_DisableController(&instance->anim, 0, 34);
    }

    ControlFlag &= ~0x20000000;
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSelectMotionAnim);

int razApplyMotion(CharacterState *In, int CurrentSection)
{
    G2SVector3 Vec;
    G2AnimSection *animSection;
    int adjustment;

    memset(&Vec, 0, sizeof(G2SVector3));

    if (CurrentSection == 0)
    {
        animSection = In->CharacterInstance->anim.section;

        if (animSection->keylist == G2Instance_GetKeylist(In->CharacterInstance, 2))
        {
            Vec.y = -60;
        }
        else if (animSection->keylist == G2Instance_GetKeylist(In->CharacterInstance, 124))
        {
            Vec.y = -35;
        }
        else if (animSection->keylist == G2Instance_GetKeylist(In->CharacterInstance, 123))
        {
            Vec.y = -16;
        }
        else if (G2Anim_IsControllerActive(&In->CharacterInstance->anim, 0, 34) != G2FALSE)
        {
            G2Anim_DisableController(&In->CharacterInstance->anim, 0, 34);
        }

        if (Vec.y != 0)
        {
            if (G2Anim_IsControllerActive(&In->CharacterInstance->anim, 0, 34) == G2FALSE)
            {
                G2Anim_EnableController(&In->CharacterInstance->anim, 0, 34);
            }

            adjustment = In->CharacterInstance->anim.section->speedAdjustment;

            Vec.y = ((Vec.y * G2Timer_GetFrameTime() * adjustment) >> 12) / 100;

            G2Anim_SetController_Vector(&In->CharacterInstance->anim, 0, 34, &Vec);
        }
    }

    return -Vec.y;
}

void razResetMotion(Instance *instance)
{
    if (G2Anim_IsControllerActive(&instance->anim, 0, 34) != G2FALSE)
    {
        G2Anim_DisableController(&instance->anim, 0, 34);
    }

    Raziel.passedMask = 0;

    G2Anim_SetSpeedAdjustment(&instance->anim, 4096);
}

void razSetDampingPhysics(Instance *instance)
{
    Raziel.RotationSegment = 0;

    Raziel.extraRot.x = 0;

    PhysicsMode = 4;

    SetDampingPhysics(instance, PlayerData->SwimPhysicsFallDamping);
}

void razEnterWater(CharacterState *In, int CurrentSection, evPhysicsSwimData *SwimData)
{
    Instance *Inst;

    Inst = razGetHeldWeapon();

    if ((SwimData->rc & 0x10))
    {
        if ((Raziel.CurrentPlane == 1) && (!(Raziel.Abilities & 0x10)))
        {
            Raziel.HitPoints = 65536 | 34464;

            SetPhysics(In->CharacterInstance, -16, 0, 0, 0);

            PhysicsMode = 0;
        }
        else if ((Inst != NULL) && (INSTANCE_Query(Inst, 4) == 3))
        {
            G2Anim_SetSpeedAdjustment(&In->CharacterInstance->anim, 2048);
        }
        else if ((!(Raziel.Mode & 0x40000)) && (Raziel.CurrentPlane == 1))
        {
            if (PhysicsMode != 4)
            {
                razSetDampingPhysics(In->CharacterInstance);
            }

            if ((In->CharacterInstance->zVel == 0) || ((Raziel.Mode & 0x400004)))
            {
                razResetMotion(In->CharacterInstance);

                StateSwitchStateCharacterData(In, StateHandlerSwim, 0);
            }

            TrailWaterFX(In->CharacterInstance, 9, 1, 1);
            TrailWaterFX(In->CharacterInstance, 13, 1, 1);
            TrailWaterFX(In->CharacterInstance, 31, 1, 1);
            TrailWaterFX(In->CharacterInstance, 41, 1, 1);
        }
    }

    if (((SwimData->rc & 0x800)) && (Raziel.Senses.heldClass == 0x1))
    {
        if (CurrentSection == 2)
        {
            G2EmulationSwitchAnimation(In, CurrentSection, 61, 0, 3, 2);
        }
        else
        {
            G2EmulationSwitchAnimation(In, CurrentSection, 63, 0, 16, 2);
        }
    }

    if (((SwimData->rc & 0x100)) && (CurrentSection == 0))
    {
        if (Inst != NULL)
        {
            INSTANCE_Query(Inst, 4);
        }
        else
        {
            razSetDampingPhysics(In->CharacterInstance);
        }

        PurgeMessageQueue(&In->SectionList[CurrentSection].Event);

        TrailWaterFX(In->CharacterInstance, 9, 4, 1);
        TrailWaterFX(In->CharacterInstance, 13, 4, 1);
    }
}

void razSetSwimVelocity(Instance *instance, int vel, int accl)
{
    instance->yAccl = 0;
    instance->xAccl = 0;

    instance->yVel = 0;
    instance->xVel = 0;

    Raziel.swimTargetSpeed = (vel * instance->anim.section->speedAdjustment) / 4096;

    if (instance->zVel > vel)
    {
        instance->zAccl = -accl;
    }
    else
    {
        instance->zAccl = accl;
    }
}

void razSetWallCrawlNodes(Instance *instance, evPhysicsWallCrawlData *data)
{
    G2SVector3 vec;

    if ((data->rc & 0x8))
    {
        if ((long)MATH3D_SquareLength(data->NewPosition.x, data->NewPosition.y, data->NewPosition.z) > 100)
        {
            instance->position.x -= data->NewPosition.x;
            instance->position.y -= data->NewPosition.y;
        }

        vec.x = data->DropRotation.x;
        vec.y = data->DropRotation.y;
        vec.z = data->DropRotation.z;

        G2Anim_SetController_Vector(&instance->anim, 0, 8, &vec);
    }

    if (data->rc == 10)
    {
        vec.x = -data->ForwardXRotation;
        vec.y = 0;
        vec.z = 0;

        G2EmulationSetInterpController_Vector(instance, 14, 14, &vec, 3, 0);
    }
}

/*TODO: migrate to razSwitchVAnimCharacterGroup + razSwitchVAnimCharacterSingle*/
int D_800D1D98[3] = {-1, -1, -1}; /*int temp[3]*/
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnimCharacterGroup);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnimGroup);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnimCharacterSingle);

void razSwitchVAnimSingle(Instance *instance, int section, int anim, int frame, int frames)
{
    razSwitchVAnim(instance, section, &PlayerData->virtualAnimSingle[anim], frame, frames);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnim);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razProcessSAnim);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchStringAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", CheckStringAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razLaunchBubbles);

void razSetCowlNoDraw(int mode)
{
    unsigned short *temp; // not from decls.h

    temp = (unsigned short *)&cowlList;

    do
    {
        if (mode != 0)
        {
            gameTrackerX.playerInstance->object->modelList[gameTrackerX.playerInstance->currentModel]->faceList[*temp].flags |= 0x10;
        }
        else
        {
            gameTrackerX.playerInstance->object->modelList[gameTrackerX.playerInstance->currentModel]->faceList[*temp].flags &= ~0x10;
        }

        temp++;
    } while ((intptr_t)temp < (intptr_t)&cowlList[19]);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razAttachControllers);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetPlayerEvent);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razClearPlayerEvent);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetPlayerEventHistory);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSideMoveSpiderCheck);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RAZIEL_QueryEngagedInstance);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razUpdateSoundRamp);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetupSoundRamp);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RAZIEL_SetInteractiveMusic);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RAZIEL_DebugHurtRaziel);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RAZIEL_StartNewGame);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razInBaseArea);

void razPrepGlyph()
{
    Instance *heldInst;

    razReaverOff();
    heldInst = razGetHeldItem();
    if (heldInst != NULL)
    {
        razSetFadeEffect(0, 0x1000, 0x100);
        Raziel.throwInstance = heldInst;
    }
    ControlFlag |= 0x4000;
}

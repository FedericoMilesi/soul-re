#include "Game/FONT.h"
#include "Game/FX.h"
#include "Game/STREAM.h"
#include "Game/PHYSOBS.h"

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
    
    rotation->z = ((evPositionData*)INSTANCE_Query(dest, 7))->z + (extraZ + temp);
    
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

//void razAlignYRotMoveInterp(struct _Instance *source, struct _Instance *dest, short distance, unsigned char segNumber, int Frames, int extraZ)
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
    
    MATH3D_ZYXtoXYZ((Rotation*)&Rot);
    
    G2Anim_SetController_Vector((G2Anim*)&instance->anim, 14, 14, &Rot);
    
    Rot.x = (-tx * 30) / 100;
    Rot.y = 0;
    Rot.z = (tz * 30) / 100;
    
    MATH3D_ZYXtoXYZ((Rotation*)&Rot);
    
    G2Anim_SetController_Vector((G2Anim*)&instance->anim, 16, 14, &Rot);
    
    Rot.x = -tx / 5;
    Rot.y = 0;
    Rot.z = tz / 5; 
    
    MATH3D_ZYXtoXYZ((Rotation*)&Rot);
    
    G2Anim_SetController_Vector((G2Anim*)&instance->anim, 17, 14, &Rot);
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

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSpectralShift);

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

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razPickupAndGrab);

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
	//int data; unused

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
	PHYSOB_BirthProjectile(instance, 49, ((char*)&Raziel.Abilities)[1] & 0x1); // TODO: reverify that the third function parameter is not fake
    
	Raziel.effectsFlags |= 0x4;
    
	razSetupSoundRamp(instance, (SoundRamp*)&Raziel.soundHandle, 12, PlayerData->forceMinPitch, PlayerData->forceMaxPitch, PlayerData->forceMinVolume, PlayerData->forceMaxVolume, PlayerData->forceRampTime * 30, 10000);
    
	Raziel.soundTimerNext = 0;
	Raziel.soundTimerData = 0;
}

Instance *razGetHeldItem()
{
	Instance* instance;

	instance = Raziel.State.CharacterInstance->LinkChild;

	if ((Raziel.soulReaver != NULL) && (instance == Raziel.soulReaver) && (instance != NULL))
	{
		return instance->LinkSibling;
	}

	return instance;
}

Instance *razGetHeldWeapon()
{
	Instance* instance;

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

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razReaverBladeOff);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razReaverBladeOn);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razReaverOff);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razReaverOn);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razReaverPickup);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razReaverImbue);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razGetReaverFromMask);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razReaverScale);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razGetForwardNormal);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razGetRotFromNormal);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razCenterWithBlock);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetPauseTranslation);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razResetPauseTranslation);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSelectMotionAnim);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razApplyMotion);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razResetMotion);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetDampingPhysics);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razEnterWater);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetSwimVelocity);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetWallCrawlNodes);

/*TODO: migrate to razSwitchVAnimCharacterGroup + razSwitchVAnimCharacterSingle*/
int D_800D1D98[3] = {-1, -1, -1}; /*int temp[3]*/
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnimCharacterGroup);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnimGroup);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnimCharacterSingle);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnimSingle);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchVAnim);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razProcessSAnim);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSwitchStringAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", CheckStringAnimation);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razLaunchBubbles);

void razSetCowlNoDraw(int mode)
{
    unsigned short *temp; // not from SYMDUMP

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

void razPrepGlyph(void)
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

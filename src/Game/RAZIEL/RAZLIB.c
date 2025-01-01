INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razAlignYMoveRot);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razAlignYRotMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razAlignYRotMoveInterp);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razAlignYRotInterp);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razConstrictAngle);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razRotateUpperBody);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razSetFadeEffect);

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

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razMaterialShift);

/*TODO: migrate to RAZIEL_OkToShift*/
static char D_800D1D24[0x39] = "\nYOU CAN NOT HAVE SHIFT ANYTIME WITHOUT THE SWIM ABILITY";
static char D_800D1D60[0x38] = "\nBEAT THE ALUKA BOSS THEN WIN THE SECOND KAIN ENCOUNTER";
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RAZIEL_OkToShift);

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

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razAdjustSpeed);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razLaunchForce);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razGetHeldItem);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", razGetHeldWeapon);

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

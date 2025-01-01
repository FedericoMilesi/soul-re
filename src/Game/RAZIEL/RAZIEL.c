#include "common.h"
#include "Game/FX.h"
#include "Game/COLLIDE.h"
#include "Game/GLYPH.h"
#include "Game/STREAM.h"
#include "Game/DEBUG.h"
#include "Game/SOUND.h"
#include "Game/GAMELOOP.h"
#include "Game/PHYSICS.h"
#include "Game/RAZCNTRL.h"
#include "Game/MATH3D.h"
#include "Game/STATE.h"
#include "Game/REAVER.h"
#include "Game/CAMERA.h"
#include "Game/GAMEPAD.h"
#include "Game/INSTANCE.h"
#include "Game/MONSTER/MONLIB.h"
#include "Game/G2/ANIMG2.h"
#include "Game/G2/QUATG2.h"
#include "Game/RAZIEL/CONTROL.h"
#include "Game/RAZIEL/RAZIEL.h"

/*.sbss*/
STATIC Player Raziel;

STATIC RazielData *PlayerData;

STATIC G2AnimInterpInfo razInterpInfo[3];

STATIC FitPoint constrictData[32];

STATIC MATRIX TempMat; /*unused*/

STATIC GameTracker *gameTracker;

STATIC long *PadData;

STATIC G2SVector3 ExtraRotData;

STATIC G2SVector3 *ExtraRot;

STATIC Force ExternalForces[4];

STATIC int PhysicsMode;

STATIC EngagedInstance EngagedList[15];

STATIC Normal Norm;

STATIC int LastRC;

STATIC int AutoFaceAngle;

int ControlFlag;

/*.sdata*/
int LoopCounter = 0;
static int WaterStatus = 0;
static unsigned char PickupList[4] = {0, 11, 11, 97};
static unsigned short cowlList[19] = {
    0x153,
    0x154,
    0x155,
    0x3A,
    0x3B,
    0x3C,
    0x3D,
    0x55,
    0x56,
    0x57,
    0x58,
    0xEB,
    0xEC,
    0xED,
    0xEE,
    0x1C6,
    0x1C7,
    0x1C8,
    0x1C9,
};

razController controllerList[24] = {
    {0, 0x26},
    {0, 0x64},
    {0, 0x20},
    {0, 0x22},
    {0, 0x8},
    {0, 0xE},
    {0x1, 0x26},
    {0x1, 0xE},
    {0x1, 0xA},
    {0x11, 0xE},
    {0x11, 0x8},
    {0x10, 0xE},
    {0xF, 0xE},
    {0xE, 0xE},
    {0xE, 0x8},
    {0x30, 0x8},
    {0x32, 0x4C},
    {0x33, 0x8},
    {0x34, 0x8},
    {0x35, 0x8},
    {0x3A, 0x4C},
    {0x3B, 0x8},
    {0x3C, 0x8},
    {0x3D, 0x8},
};

CannedSound cannedSound[4] = {
    {0, 51, -100, -100, 120, 0, 368640, 3500},
    {0, 353, 0, 0, 80, 0, 368640, 3500},
    {0, 8, -260, -260, 90, 90, 0, 3500},
    {0, 418, -200, -200, 95, 95, 0, 3500},
};

void StateHandlerIdle(CharacterState *In, int CurrentSection, intptr_t Data);
void DefaultStateHandler(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerLookAround(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerFall(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerMove(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerStopMove(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerAutoFace(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerCompression(CharacterState *In, int CurrentSection, intptr_t Data);
void DisableWristCollision(Instance *instance, int Side);
void StateHandlerGlyphs(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerSoulSuck(CharacterState *In, int CurrentSection, intptr_t Data);
void SetTimer(int ticks);
long RazielAnimCallback(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, void *data);
void InitGlyphSystem(Instance *instance);
void RazielCollide(Instance *instance, GameTracker *gameTracker);
void RelocateConstrict(SVector *offset);
void StateHandlerWallGrab(CharacterState *In, int CurrentSection, intptr_t Data);
void SteerSwitchMode(Instance *instance, int mode);
void StateHandlerSwim(CharacterState *In, int CurrentSection, intptr_t Data);
void LimitRotation(Rotation *rot);
void StateHandlerHitReaction(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerGrab(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerCannedReaction(CharacterState *In, int CurrentSection, intptr_t Data);
void StateHandlerThrow2(CharacterState *In, int CurrentSection, intptr_t Data);
int StateHandlerDecodeHold(int *Message, int *Data);
void SetMana(int amount);
int GetMaxHealth();
void LoseHealth(int amount);
void BumpUpHealth();
Instance *razGetHeldWeapon();
void razSetupSoundRamp(Instance *instance, SoundRamp *sound, int sfx, int startPitch, int endPitch, int startVolume, int endVolume, int timer, int distance);
void razSpectralShift();
void razSetPlayerEventHistory(unsigned long event);
int razReaverOn();
Instance *razGetHeldItem();
void razResetMotion(Instance *instance);
void razSetFadeEffect(short source, short dest, int steps);
void razResetPauseTranslation(Instance *instance);
void razSetPauseTranslation(Instance *instance);
int razSwitchVAnimCharacterGroup(Instance *instance, int animGroup, int *frame, int *frames);
void razLaunchForce(Instance *instance);
void razSwitchVAnimCharacterSingle(Instance *instance, int anim, int *frame, int *frames);
void razAlignYRotMoveInterp(Instance *source, Instance *dest, short distance, unsigned char segNumber, int Frames, int extraZ);
void razMaterialShift();
int razInBaseArea(char *name, int length);
void razReaverImbue(int reaverType);
int razReaverOff();
int razPlaneShift(Instance *instance);
void razReaverBladeOff();
void razSetWallCrawlNodes(Instance *instance, evPhysicsWallCrawlData *data);
int razZeroAxis(long *x, long *y, int radius);
void razReaverPickup(Instance *instance, Instance *soulReaver);
int razConstrictAngle(Instance *instance);
void razLaunchBubbles(int segments, int count, int type);
void razSetSwimVelocity(Instance *instance, int vel, int accl);
int razPickupAndGrab(CharacterState *In, int CurrentSection);
int razGetReaverFromMask(int reaverMask);
void razReaverBladeOn();
void razSetCowlNoDraw(int mode);
void razAttachControllers();
int razApplyMotion(CharacterState *In, int CurrentSection);

#include "Game/RAZIEL/PUPPET.c"
#include "Game/RAZIEL/ATTACK.c"
#include "Game/RAZIEL/SWIM.c"
#include "Game/RAZIEL/SPIDER.c"
#include "Game/RAZIEL/ALGOCTRL.c"
#include "Game/RAZIEL/STEERING.c"
#include "Game/RAZIEL/RAZDBUG.c"
#include "Game/RAZIEL/SENSES.c"
#include "Game/RAZIEL/HEALTH.c"
#include "Game/RAZIEL/RAZLIB.c"

Idle **currentIdleList = NULL;
int currentIdleListCount = 0;
int currentIdleCount = 0;

static int BlockCount = 0;
static int LastBlock = 0;

void InitStates(Instance *PlayerInstance)
{
    unsigned char i;
    G2AnimSection *animSection;
    typedef long fn(G2Anim *, int, G2AnimCallbackMsg, long, long, Instance *); // not from SYMDUMP

    if (Raziel.footPrint == 0)
    {
        Raziel.footPrint = (intptr_t)PlayerInstance->object;
    }

    PlayerInstance->InstanceState = &Raziel.State.CharacterInstance;
    Raziel.State.CharacterInstance = PlayerInstance;
    PlayerData = (RazielData *)PlayerInstance->data;

    G2EmulationSetTotalSections(&Raziel.State, 3);
    G2EmulationSetStartAndEndSegment(&Raziel.State, 0, 0, 13);
    G2EmulationSetStartAndEndSegment(&Raziel.State, 1, 14, 49);
    G2EmulationSetStartAndEndSegment(&Raziel.State, 2, 50, 65);

    for (i = 0; i < 3; i++)
    {
        animSection = &PlayerInstance->anim.section[i];
        animSection->callback = (fn *)&RazielAnimCallback;
        animSection->callbackData = NULL;

        Raziel.State.SectionList[i].Process = &StateHandlerIdle;

        InitMessageQueue(&Raziel.State.SectionList[i].Event);
        InitMessageQueue(&Raziel.State.SectionList[i].Defer);
    }

    G2AnimSection_SetInterpInfo(&PlayerInstance->anim.section[0], &razInterpInfo[0]);
    G2AnimSection_SetInterpInfo(&PlayerInstance->anim.section[1], &razInterpInfo[1]);
    G2AnimSection_SetInterpInfo(&PlayerInstance->anim.section[2], &razInterpInfo[2]);

    Raziel.Mode = 1;

    gameTrackerX.debugFlags2 |= 0x800;

    InitHealthSystem();

    Raziel.Abilities = 0x1000000;
    debugRazielFlags1 = Raziel.Abilities;

    Raziel.GlyphManaBalls = 0;
    Raziel.GlyphManaMax = 0;
    Raziel.Abilities = 0;
    Raziel.RotationSegment = 0;
    Raziel.extraRot.x = 0;
    Raziel.blankPad = 0;

    PlayerInstance->rotation.y = 0;
    PlayerInstance->rotation.x = 0;

    Raziel.Senses.EngagedList = &EngagedList[0];
    Raziel.constrictData = &constrictData[0];
    Raziel.dropOffHeight = 256;
    Raziel.Senses.EngagedMask = 0;
    Raziel.idleInstance = NULL;
    Raziel.soulReaver = NULL;
    Raziel.fallZVelocity = -32;

    G2EmulationSetAnimation(&Raziel.State, 0, 0, 0, 0);
    G2EmulationSetMode(&Raziel.State, 0, 2);

    G2EmulationSetAnimation(&Raziel.State, 1, 0, 0, 0);
    G2EmulationSetMode(&Raziel.State, 1, 2);

    G2EmulationSetAnimation(&Raziel.State, 2, 0, 0, 0);
    G2EmulationSetMode(&Raziel.State, 2, 2);

    ControlFlag = 0x519;

    PlayerInstance->maxXVel = 256;
    PlayerInstance->maxYVel = 256;
    PlayerInstance->maxZVel = 256;

    razSetCowlNoDraw(1);

    InitExternalForces(&ExternalForces[0], 4);

    ResetPhysics(PlayerInstance, -16);

    ExtraRot = NULL;

    CAMERA_ChangeToOutOfWater(&theCamera, PlayerInstance);

    razAttachControllers();

    INSTANCE_Post(PlayerInstance, 0x100006, 0);

    PlayerInstance->checkMask = 0x803E002E;
    PlayerInstance->flags2 |= 0x400;

    G2EmulationInit();

    InitGlyphSystem(PlayerInstance);

    Raziel.slipSlope = 2896;
    Raziel.terminator = -1;

    gameTrackerX.raziel_collide_override = 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateInitIdle);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerIdle);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerLookAround);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerCrouch);

void StateHandlerDropAction(CharacterState *In, int CurrentSection, intptr_t Data);
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerDropAction);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerSoulSuck);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerStartTurn);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateInitStartMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerStartMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateInitMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerStopMove);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerCompression);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerJump);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerFall);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerSlide);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerBlock);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerDeCompression);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerGlide);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerHang);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerPushObject);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerBreakOff);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerPullSwitch);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerDragObject);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerPickupObject);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerAutoFace);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerGlyphs);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", DefaultStateHandler);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielAnimCallback);

long RazielAnimCallbackDuringPause(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, void *data);
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielAnimCallbackDuringPause);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielQuery);

void RazielPost(Instance *instance, unsigned long Message, uintptr_t Data)
{
    int i;
    typedef long fn(G2Anim *, int, G2AnimCallbackMsg, long, long, Instance *);

    switch (Message)
    {
    case 0x200001:
        if (!((ControlFlag & 0x40000)) && (HealthCheckForLowHealth() == 0))
        {
            UpdateEngagementList((evCollideInstanceStatsData *)Data, &Raziel);
        }

        break;
    case 0x200000:
        if (!(ControlFlag & 0x40000))
        {
            Raziel.Senses.EngagedMask = 0;
        }

        Raziel.Senses.Flags &= ~0x20;
        Raziel.Senses.Flags &= ~0x40;
        break;
    case 0x200004:
        if ((ControlFlag & 0x40000000))
        {
            instance->collideInfo = (CollideInfo *)Data;

            ((CollideInfo *)Data)->offset.z = 0;

            RazielCollide(instance, &gameTrackerX);

            COLLIDE_UpdateAllTransforms(razGetHeldItem(), (SVECTOR *)&((CollideInfo *)instance->collideInfo)->offset);
        }

        break;
    case 0x100007:
    {
        PlayerSaveData *data;

        data = (PlayerSaveData *)((evControlSaveDataData *)Data)->data;

        Raziel.Abilities = data->abilities;

        debugRazielFlags1 = Raziel.Abilities;

        if ((razInBaseArea("under", 5)) != 0)
        {
            Raziel.CurrentPlane = 2;
        }
        else
        {
            Raziel.CurrentPlane = data->currentPlane;
        }

        Raziel.HealthScale = (short)data->healthScale;
        Raziel.HealthBalls = (short)data->healthBalls;

        HUD_Setup_Chit_Count(data->healthBalls);

        Raziel.GlyphManaBalls = data->manaBalls;
        Raziel.GlyphManaMax = data->manaMax;

        Raziel.soulReaver = NULL;

        if ((Raziel.Abilities & 0x8))
        {
            debugRazielFlags2 = 0;
        }

        Raziel.playerEventHistory = data->playerEventHistory;

        if (!(Raziel.playerEventHistory & 0x1000))
        {
            Raziel.HitPoints = 100;
        }
        else
        {
            Raziel.HitPoints = GetMaxHealth();
        }

        break;
    }
    case 0x4000005:
        Raziel.slipSlope = Data;
        break;
    case 0x4000006:
        Raziel.slipSlope = 2896;
        break;
    case 0x4000001:
        if (((ControlFlag & 8)) && (!(Raziel.Senses.Flags & 2)))
        {
            for (i = 0; i < 3; i++)
            {
                EnMessageQueueData(&Raziel.State.SectionList[i].Defer, Message, Data);
            }
        }

        break;
    case 0x40001:
        instance->currentStreamUnitID = Data;
        instance->tface = NULL;

        Raziel.GlyphSystem->currentStreamUnitID = Data;
        Raziel.GlyphSystem->tface = NULL;

        if (Raziel.soulReaver != NULL)
        {
            Raziel.soulReaver->currentStreamUnitID = Data;
            Raziel.soulReaver->tface = NULL;
        }

        break;
    case 0x800024:
        Raziel.idleInstance = ((evObjectIdleData *)Data)->instance;
        break;
    case 0x40006:
        DrainHealth(Data);
        break;
    case 0x40008:
        DrainMana(Data);
        break;
    case 0x40019:
        SetMana(Data);
        break;
    case 0x40004:
        G2EmulationSwitchAnimationCharacter(&Raziel.State, 128, 0, 3, 1);

        StateSwitchStateCharacterData(&Raziel.State, &StateHandlerCannedReaction, 0);
        break;
    case 0x100008:
        if ((ControlFlag & 0x200000))
        {
            RelocateConstrict((SVector *)Data);
        }

        Raziel.puppetMoveToPoint.x += ((SVector *)Data)->x;
        Raziel.puppetMoveToPoint.y += ((SVector *)Data)->y;
        Raziel.puppetMoveToPoint.z += ((SVector *)Data)->z;

        STREAM_MORPH_Relocate();
        break;
    case 0x10000A:
        if (Data != 0)
        {
            G2AnimSection *animSection;

            for (i = 0; i < 3; i++)
            {
                animSection = &instance->anim.section[i];

                animSection->callback = (fn *)&RazielAnimCallbackDuringPause;
                animSection->callbackData = NULL;
            }

            DeInitAlgorithmicWings(instance);

            razResetPauseTranslation(instance);
        }
        else
        {
            G2AnimSection *animSection;

            for (i = 0; i < 3; i++)
            {
                animSection = &instance->anim.section[i];

                animSection->callback = (fn *)&RazielAnimCallback;
                animSection->callbackData = NULL;
            }

            InitAlgorithmicWings(instance);
        }

        break;
    case 0x100010:
        if (Data != 0)
        {
            if (!(Raziel.Mode & 0x40000000))
            {
                Raziel.Mode = 0x40000000;

                ResetPhysics(instance, -16);

                for (i = 0; i < 3; i++)
                {
                    StateSwitchStateData(&Raziel.State, i, &StateHandlerIdle, SetControlInitIdleData(0, 0, 3));
                }
            }
        }
        else if ((Raziel.Mode & 0x40000000))
        {
            Raziel.Mode &= ~0x40000000;
        }

        break;
    case 0x40011:
        HealthInstantDeath(instance);
        break;
    case 0x40012:
        StateSwitchStateCharacterData(&Raziel.State, &StateHandlerDropAction, 0);
        break;
    case 0x10002000:
        razPlaneShift(instance);
        break;
    case 0x40015:
        Raziel.Abilities = Raziel.Abilities | Data;

        debugRazielFlags1 = Raziel.Abilities;

        RAZIEL_DebugHealthFillUp();

        if ((Data & 0x3FC00) && (Raziel.soulReaver != NULL))
        {
            razReaverOn();

            razReaverImbue(razGetReaverFromMask(Data));
        }

        break;
    case 0x100011:
        EnMessageQueueData(&Raziel.State.SectionList[0].Defer, 0x100011, Data);
        break;
    case 0x100012:
        Raziel.Senses.heldClass = INSTANCE_Query((Instance *)Data, 4);

        if (Raziel.Senses.heldClass != 0x8)
        {
            razReaverBladeOff();
        }

        Raziel.Mode &= ~0x800;

        Raziel.Senses.Flags &= ~0x80;
        break;
    case 0x100013:
        if (Data != (uintptr_t)Raziel.soulReaver)
        {
            if (razReaverOn() == 0)
            {
                Raziel.Senses.heldClass = 0;
            }

            razReaverBladeOn();
        }

        Raziel.Senses.Flags &= ~0x80;
        break;
    case 0x40022:
        Raziel.forcedGlideSpeed = Data;
        break;
    case 0x40024:
        if (SndTypeIsPlayingOrRequested(1) == 0)
        {
            SOUND_Play3dSound(&gameTrackerX.playerInstance->position, 1, 0, 75, 3500);
        }

        break;
    case 0x4000E:
        if (Data != 0)
        {
            int i;
            Instance *heldWeapon;

            Raziel.returnState = StateHandlerPuppetShow;

            StateSwitchStateCharacterDataDefault(&Raziel.State, &StateHandlerPuppetShow, 0);

            InitAlgorithmicWings(instance);

            for (i = 0; i < 3; i++)
            {
                PurgeMessageQueue(&Raziel.State.SectionList[i].Event);

                PurgeMessageQueue(&Raziel.State.SectionList[i].Defer);
            }

            GAMELOOP_Reset24FPS();

            heldWeapon = razGetHeldWeapon();

            if ((heldWeapon != NULL) && (heldWeapon != Raziel.soulReaver))
            {
                razSetFadeEffect(0, 4096, 10);
            }
        }
        else
        {
            Instance *heldWeapon;

            Raziel.Senses.Flags &= ~0x10;

            ControlFlag &= ~0x20000;

            StateSwitchStateCharacterDataDefault(&Raziel.State, &StateHandlerIdle, SetControlInitIdleData(0, 0, 3));

            for (i = 0; i < 3; i++)
            {
                PurgeMessageQueue(&Raziel.State.SectionList[i].Event);

                PurgeMessageQueue(&Raziel.State.SectionList[i].Defer);
            }

            GAMELOOP_Set24FPS();

            heldWeapon = razGetHeldWeapon();

            if ((heldWeapon != NULL) && (heldWeapon != Raziel.soulReaver))
            {
                razSetFadeEffect(4096, 0, 10);
            }
        }

        break;
    case 0x100016:
        razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 51, -200, -200, 120, 120, Data << 12, 3500);

        Raziel.soundTimerNext = Data << 12;
        Raziel.soundTimerData = 0;
        break;
    default:
        for (i = 0; i < 3; i++)
        {
            EnMessageQueueData(&Raziel.State.SectionList[i].Defer, Message, Data);
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", SetStates);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", ProcessConstrict);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RelocateConstrict);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", ProcessEffects);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", ProcessHints);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", ProcessInteractiveMusic);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", ProcessTimers);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", SetTimer);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", ProcessSpecialAbilities);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", GetControllerMessages);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielAdditionalCollide);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", GetEngageEvent);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", SetupReaction);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", CheckHolding);

void DisableWristCollision(Instance *instance, int Side)
{
	if ((Side & 0x1))
	{
		COLLIDE_SegmentCollisionOff(instance, 31);
	}

	if ((Side & 0x2))
	{
		COLLIDE_SegmentCollisionOff(instance, 41);
	}
}

void EnableWristCollision(Instance *instance, int Side)
{
	if ((Side & 0x1))
	{
		COLLIDE_SegmentCollisionOn(instance, 31);
	}

	if ((Side & 0x2))
	{
		COLLIDE_SegmentCollisionOn(instance, 41);
	}
}

/*TODO: migrate to GetCollisionType*/
static char D_800D1DB8[0xA] = "MultiHit\n";
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", GetCollisionType);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", InitGlyphSystem);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", mdRazielProcess);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielProcess);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielInit);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielCollide);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RAZIEL_TurnHead);

void RAZIEL_SetLookAround(Instance* instance)
{
	G2Anim_EnableController(&instance->anim, 17, 14);
	G2Anim_EnableController(&instance->anim, 16, 14);
	G2Anim_EnableController(&instance->anim, 14, 14);

	INSTANCE_Post(instance, 0x100009, 1);

	Raziel.throwXRot = 0;
	Raziel.throwZRot = 0;
}

void RAZIEL_ResetLookAround(Instance *instance)
{
	G2Anim_InterpDisableController(&instance->anim, 17, 14, 300);
	G2Anim_InterpDisableController(&instance->anim, 16, 14, 300);
	G2Anim_InterpDisableController(&instance->anim, 14, 14, 300);

	INSTANCE_Post(instance, 0x100009, 0);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RAZIEL_OkToLookAround);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", TrailWaterFX);

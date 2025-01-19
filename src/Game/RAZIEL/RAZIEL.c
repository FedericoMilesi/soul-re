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
#include "Game/OBTABLE.h"
#include "Game/RAZIEL/HEALTH.h"
#include "Game/RAZIEL/SWIM.h"
#include "Game/RAZIEL/STEERING.h"
#include "Game/RAZIEL/SPIDER.h"
#include "Game/G2/ANMG2ILF.h"
#include "Game/EVENT.h"
#include "Game/RAZIEL/RAZLIB.h"

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
    typedef long fn(G2Anim *, int, G2AnimCallbackMsg, long, long, Instance *); // not from decls.h

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

long RazielAnimCallbackDuringPause(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, void *data)
{
    evAnimationControllerDoneData *ControllerData;

    (void)anim;
    (void)sectionID;

    if (message == G2ANIM_MSG_SEGCTRLR_INTERPDONE)
    {
        ControllerData = (evAnimationControllerDoneData *)SetAnimationControllerDoneData(Raziel.State.CharacterInstance, messageDataB, messageDataA, (intptr_t)data);

        if (ControllerData->data == 2)
        {
            AlgorithmicWings(Raziel.State.CharacterInstance, ControllerData);
        }
        else if (ControllerData->data == 0)
        {
            G2Anim_InterpDisableController(&ControllerData->instance->anim, ControllerData->segment, ControllerData->type, 300);
        }
        else if (ControllerData->data == 4)
        {
            G2Anim_DisableController(&ControllerData->instance->anim, ControllerData->segment, ControllerData->type);
        }
    }

    return messageDataA;
}

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

void ProcessConstrict()
{
    if ((Raziel.constrictFlag & 0x1))
    {
        Raziel.constrictIndex = 0;

        Raziel.constrictFlag = (Raziel.constrictFlag & ~0x1) | 0x4;

        Raziel.constrictWaitIndex = 0;

        Raziel.constrictXTotal = 0;
        Raziel.constrictYTotal = 0;

        Raziel.constrictGoodCircle = 0;
    }

    Raziel.constrictXTotal += Raziel.State.CharacterInstance->position.x;
    Raziel.constrictYTotal += Raziel.State.CharacterInstance->position.y;

    Raziel.constrictData[Raziel.constrictIndex].x = Raziel.State.CharacterInstance->position.x;
    Raziel.constrictData[Raziel.constrictIndex].y = Raziel.State.CharacterInstance->position.y;

    Raziel.constrictIndex++;

    if (Raziel.constrictIndex >= 32)
    {
        Raziel.constrictIndex = 0;
    }

    if ((Raziel.constrictFlag & 0x4))
    {
        if (Raziel.constrictWaitIndex == Raziel.constrictIndex)
        {
            Raziel.constrictFlag |= 0x22;
        }
        else
        {
            Raziel.constrictFlag &= ~0x20;
        }
    }

    if ((Raziel.constrictFlag & 0x2))
    {
        int i;

        Raziel.constrictCenter.x = Raziel.constrictXTotal / 32;
        Raziel.constrictCenter.y = Raziel.constrictYTotal / 32;
        Raziel.constrictCenter.z = Raziel.State.CharacterInstance->position.z + 256;

        Raziel.constrictXTotal -= Raziel.constrictData[Raziel.constrictIndex].x;
        Raziel.constrictYTotal -= Raziel.constrictData[Raziel.constrictIndex].y;

        Raziel.constrictGoodCircle = 1;

        for (i = 0; i < 32; i++)
        {
            if ((MATH3D_SquareLength(Raziel.constrictData[i].x - Raziel.constrictCenter.x, Raziel.constrictData[i].y - Raziel.constrictCenter.y, 0) - 1) > 819198)
            {
                Raziel.constrictGoodCircle = 0;
            }
        }

        if (Raziel.constrictGoodCircle != 0)
        {
            int thisIndex;
            int nextIndex;

            thisIndex = Raziel.constrictIndex - 1;
            nextIndex = Raziel.constrictIndex;

            if (thisIndex < 0)
            {
                thisIndex = 31;
            }

            if (MATH3D_SquareLength(Raziel.constrictData[thisIndex].x - Raziel.constrictData[nextIndex].x, Raziel.constrictData[thisIndex].y - Raziel.constrictData[nextIndex].y, 0) > 1440000)
            {
                Raziel.constrictGoodCircle = 0;
            }

            if (Raziel.constrictGoodCircle != 0)
            {
                Raziel.constrictXTotal = 0;
                Raziel.constrictYTotal = 0;

                Raziel.constrictFlag = (Raziel.constrictFlag & ~0x2) | 0x1C;

                Raziel.constrictWaitIndex = Raziel.constrictIndex;

                if (Raziel.constrictGoodCircle >= 2)
                {
                    gameTrackerX.streamFlags |= 0x4;

                    FX_EndConstrict(0x1, NULL);

                    Raziel.constrictFlag = 0x1;
                }

                Raziel.constrictGoodCircle++;
                return;
            }
        }

        Raziel.constrictGoodCircle = 1;

        Raziel.constrictFlag &= ~0x10;

        FX_EndConstrict(0, NULL);
    }
}

void RelocateConstrict(SVector *offset)
{
    int i;

    Raziel.constrictXTotal = 0;
    Raziel.constrictYTotal = 0;

    if ((Raziel.constrictFlag & 0x2))
    {
        for (i = 0; i < 32; i++)
        {
            Raziel.constrictData[i].x += offset->x;
            Raziel.constrictData[i].y += offset->y;

            Raziel.constrictXTotal += Raziel.constrictData[i].x;
            Raziel.constrictYTotal += Raziel.constrictData[i].y;
        }
    }
    else
    {
        i = Raziel.constrictWaitIndex + 1;

        if (i == 32)
        {
            i = 0;
        }

        for (; i != Raziel.constrictIndex;)
        {
            Raziel.constrictData[i].x += offset->x;
            Raziel.constrictData[i].y += offset->y;

            Raziel.constrictXTotal += Raziel.constrictData[i].x;
            Raziel.constrictYTotal += Raziel.constrictData[i].y;

            i++;

            if (i == 32)
            {
                i = 0;
            }
        }
    }
}

void ProcessEffects(Instance *instance)
{
    Instance *heldInst;
    int step;

    heldInst = razGetHeldItem();

    if (((Raziel.effectsFlags & 0x4)) && (razUpdateSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle) == 0))
    {
        SndEndLoop(Raziel.soundHandle);

        Raziel.soundHandle = 0;

        Raziel.effectsFlags &= ~0x4;
    }

    if (((Raziel.effectsFlags & 0x8)) && (razUpdateSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle2) == 0))
    {
        SndEndLoop(Raziel.soundHandle2);

        Raziel.soundHandle2 = 0;

        Raziel.effectsFlags &= ~0x8;
    }

    if ((Raziel.effectsFlags & 0x2))
    {
        if (Raziel.throwInstance != NULL)
        {
            instance = Raziel.throwInstance;
        }
        else if (heldInst != NULL)
        {
            if ((Raziel.Senses.heldClass == 0x1) || (Raziel.Senses.heldClass == 0x2) || (Raziel.Senses.heldClass == 0x3))
            {
                instance = heldInst;
            }
            else
            {
                Raziel.effectsFlags &= ~0x2;

                Raziel.throwInstance = NULL;
            }
        }
    }

    if ((Raziel.effectsFlags & 0x1))
    {
        Raziel.effectsFadeSteps += Raziel.effectsFadeStep * gameTrackerX.timeMult;

        step = Raziel.effectsFadeSteps / 4096;

        instance->fadeValue += step;

        if (step > 0)
        {
            if (instance->fadeValue > Raziel.effectsFadeDest)
            {
                instance->fadeValue = Raziel.effectsFadeDest;

                Raziel.effectsFlags &= ~0x1;

                if (instance == Raziel.throwInstance)
                {
                    Raziel.effectsFlags &= ~0x2;
                }
            }
        }
        else if ((step < 0) && (instance->fadeValue < Raziel.effectsFadeDest))
        {
            instance->fadeValue = Raziel.effectsFadeDest;

            Raziel.effectsFlags &= ~0x1;

            if (instance == Raziel.throwInstance)
            {
                Raziel.effectsFlags &= ~0x2;

                Raziel.throwInstance = NULL;
            }
        }
    }
}

void ProcessHints()
{
    long hint;

    hint = HINT_GetCurrentHint();

    if (!(Raziel.playerEventHistory & 0x2000))
    {
        if ((Raziel.playerEvent & 0x2000))
        {
            if (hint == -1)
            {
                HINT_StartHint(12);
            }

            if ((hint == 12) && (Raziel.State.SectionList->Process == StateHandlerGlyphs))
            {
                HINT_KillSpecificHint(hint);

                HINT_StartHint(40);
            }

            if ((hint == 40) && (Raziel.State.SectionList->Process != StateHandlerGlyphs))
            {
                HINT_KillSpecificHint(hint);

                HINT_StartHint(12);
            }
        }
        else if (hint == 12)
        {
            HINT_KillSpecificHint(hint);
        }
    }
    else if (hint == 12)
    {
        HINT_KillSpecificHint(hint);
    }
    else if (hint == 40)
    {
        HINT_KillSpecificHint(hint);
    }

    if (!(Raziel.playerEventHistory & 0x10000))
    {
        if ((Raziel.playerEvent & 0x10000))
        {
            if (hint == -1)
            {
                HINT_StartHint(32);
            }
        }
        else if (hint == 32)
        {
            HINT_KillSpecificHint(hint);
        }
    }
}

void ProcessInteractiveMusic(Instance *instance)
{
    Level *level;
    int temp; // not from decls.h

    level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

    RAZIEL_SetInteractiveMusic(6, level->unitFlags & 0x2);
    RAZIEL_SetInteractiveMusic(9, level->unitFlags & 0x200);
    RAZIEL_SetInteractiveMusic(10, level->unitFlags & 0x100);
    RAZIEL_SetInteractiveMusic(7, level->unitFlags & 0x40);
    RAZIEL_SetInteractiveMusic(8, level->unitFlags & 0x80);
    RAZIEL_SetInteractiveMusic(11, level->unitFlags & 0x400);
    RAZIEL_SetInteractiveMusic(14, level->unitFlags & 0x4000);

    if ((level->unitFlags & 0x2))
    {
        if (!(level->unitFlags & 0xC0))
        {
            temp = GAMELOOP_GetTimeOfDay();

            RAZIEL_SetInteractiveMusic(7, temp != 1900);
            RAZIEL_SetInteractiveMusic(8, temp == 1900);
        }
    }

    RAZIEL_SetInteractiveMusic(12, Raziel.CurrentPlane == 2);
    RAZIEL_SetInteractiveMusic(5, Raziel.Mode & 0x40000);

    if (((level->unitFlags & 0x10)) || ((Raziel.Mode & 0x2000000)))
    {
        Raziel.soundModifier &= ~0x1E;

        RAZIEL_SetInteractiveMusic(3, 1);
        return;
    }

    if (((level->unitFlags & 0x8)) || ((Raziel.Senses.Flags & 0x20)))
    {
        Raziel.soundModifier &= ~0x1E;

        RAZIEL_SetInteractiveMusic(2, 1);
        return;
    }

    if ((level->unitFlags & 0x4))
    {
        Raziel.soundModifier &= ~0x1E;

        RAZIEL_SetInteractiveMusic(1, 1);
        return;
    }

    if ((level->unitFlags & 0x20))
    {
        Raziel.soundModifier &= ~0x1E;

        RAZIEL_SetInteractiveMusic(4, 1);
        return;
    }

    Raziel.soundModifier &= ~0x1E;

    SOUND_SetMusicModifier(0);
}

void ProcessTimers(Instance *instance)
{
    if (Raziel.timeAccumulator > 0)
    {
        Raziel.timeAccumulator -= gameTrackerX.timeMult;

        if (Raziel.timeAccumulator <= 0)
        {
            INSTANCE_Post(instance, 0x100015, -Raziel.timeAccumulator);

            Raziel.timeAccumulator = 0;
        }
    }

    if (Raziel.soundTimerNext > 0)
    {
        Raziel.soundTimerNext -= gameTrackerX.timeMult;

        if (Raziel.soundTimerNext <= 0)
        {
            Raziel.soundTimerNext = 0;

            switch (Raziel.soundTimerData)
            {
            case 1:
                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 19, 1000, 1000, 120, 120, 4096, 3500);
                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle2, 20, 1030, 1030, 120, 120, 4096, 3500);

                Raziel.soundTimerNext = 122880;
                Raziel.soundTimerData = 2;

                Raziel.effectsFlags |= 0x8;
                break;
            case 2:
                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 19, 1000, 1000, 120, 0, 245760, 3500);
                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle2, 20, 1030, 1030, 120, 0, 245760, 3500);

                Raziel.soundTimerNext = 0;
                Raziel.soundTimerData = 0;
                break;
            case 3:
                if (Raziel.soundHandle != 0)
                {
                    SndEndLoop(Raziel.soundHandle);
                }

                Raziel.soundHandle = 0;

                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 13, 0, 0, 100, 100, 4096, 3500);

                Raziel.soundTimerNext = 40960;
                Raziel.soundTimerData = 4;
                break;
            case 4:
                if (Raziel.soundHandle2 != 0)
                {
                    SndEndLoop(Raziel.soundHandle2);
                }

                Raziel.soundHandle2 = 0;

                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle2, 13, 50, 50, 95, 95, 4096, 3500);

                Raziel.soundTimerNext = 28672;
                Raziel.soundTimerData = 5;

                Raziel.effectsFlags |= 0x8;
                break;
            case 5:
                if (Raziel.soundHandle != 0)
                {
                    SndEndLoop(Raziel.soundHandle);
                }

                Raziel.soundHandle = 0;

                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 13, -20, -20, 80, 80, 4096, 3500);

                Raziel.soundTimerNext = 32768;
                Raziel.soundTimerData = 6;
                break;
            case 6:
                if (Raziel.soundHandle2 != 0)
                {
                    SndEndLoop(Raziel.soundHandle2);
                }

                Raziel.soundHandle2 = 0;

                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle2, 13, 100, 100, 75, 75, 4096, 3500);

                Raziel.soundTimerNext = 40960;
                Raziel.soundTimerData = 7;
                break;
            case 7:
                if (Raziel.soundHandle != 0)
                {
                    SndEndLoop(Raziel.soundHandle);
                }

                Raziel.soundHandle = 0;

                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 13, -100, -100, 65, 65, 4096, 3500);

                Raziel.soundTimerNext = 20480;
                Raziel.soundTimerData = 8;
                break;
            case 8:
                if (Raziel.soundHandle2 != 0)
                {
                    SndEndLoop(Raziel.soundHandle2);
                }

                Raziel.soundHandle2 = 0;

                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle2, 13, 30, 30, 60, 60, 4096, 3500);

                Raziel.soundTimerNext = 40960;
                Raziel.soundTimerData = 9;
                break;
            case 9:
                if (Raziel.soundHandle != 0)
                {
                    SndEndLoop(Raziel.soundHandle);
                }

                Raziel.soundHandle = 0;

                if (Raziel.soundHandle2 != 0)
                {
                    SndEndLoop(Raziel.soundHandle2);
                }

                Raziel.soundHandle2 = 0;

                Raziel.effectsFlags &= ~0x4;
                Raziel.effectsFlags &= ~0x8;
                break;
            case 10:
                razSetupSoundRamp(instance, (SoundRamp *)&Raziel.soundHandle, 51, -200, -200, 120, 0, 245760, 3500);

                Raziel.soundTimerNext = 0;
                Raziel.soundTimerData = 0;
                break;
            default:
                if (Raziel.soundHandle != 0)
                {
                    SndEndLoop(Raziel.soundHandle);
                }
            }
        }
    }
}

void SetTimer(int ticks)
{
    Raziel.timeAccumulator = ticks << 12;
}

void ProcessSpecialAbilities(Instance *instance)
{
    unsigned long reaver;

    if ((Raziel.Abilities & 0x8))
    {
        if (debugRazielFlags2 != 0)
        {
            unsigned long temp;

            temp = 1 << (Raziel.currentSoulReaver + 9);

            if (temp != debugRazielFlags2)
            {
                temp = debugRazielFlags2 & ~temp;

                debugRazielFlags2 = temp;
            }

            reaver = razGetReaverFromMask(temp);
        }
        else if (Raziel.CurrentPlane == 1)
        {
            reaver = 2;

            debugRazielFlags2 = 0x800;
        }
        else
        {
            reaver = 1;

            debugRazielFlags2 = 0x400;
        }

        if (Raziel.soulReaver == NULL)
        {
            Object *soulReaverOb;

            soulReaverOb = (Object *)objectAccess[22].object;

            if (soulReaverOb != NULL)
            {
                razReaverPickup(instance, INSTANCE_BirthObject(instance, soulReaverOb, 0));

                RAZIEL_DebugHealthFillUp();
            }
        }
        else if (Raziel.currentSoulReaver != reaver)
        {
            INSTANCE_Post(Raziel.soulReaver, 0x800103, reaver);

            Raziel.currentSoulReaver = reaver;
        }
        else if (reaver == 6)
        {
            Level *level;

            level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

            if (instance->waterFace != NULL)
            {
                if (instance->matrix == NULL)
                {
                    return;
                }

                if (instance->matrix[41].t[2] < instance->splitPoint.z)
                {
                    razReaverImbue(2);
                }
            }
            else
            {
                if (instance->matrix == NULL)
                {
                    return;
                }

                if (instance->matrix[41].t[2] < level->waterZLevel)
                {
                    razReaverImbue(2);
                }
            }
        }
    }
    else if (Raziel.soulReaver != NULL)
    {
        INSTANCE_UnlinkFromParent(Raziel.soulReaver);

        INSTANCE_KillInstance(Raziel.soulReaver);

        Raziel.soulReaver = NULL;
        Raziel.currentSoulReaver = 0;

        debugRazielFlags2 = 0;

        Raziel.Senses.heldClass = 0;
    }
}

int GetControllerMessages(long *controlCommand)
{
    if ((controlCommand[1] & RazielCommands[2]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x80000000, 0);
    }
    else if ((controlCommand[2] & RazielCommands[2]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x20000000, 0);
    }

    if ((controlCommand[1] & RazielCommands[1]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x80000002, 0);
    }
    else if ((controlCommand[2] & RazielCommands[1]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x20000002, 0);
    }

    if ((controlCommand[1] & RazielCommands[3]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x80000001, 0);
    }
    else if ((controlCommand[2] & RazielCommands[3]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x20000001, 0);
    }

    if ((controlCommand[1] & RazielCommands[7]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x80000004, 0);
    }
    else if ((controlCommand[2] & RazielCommands[7]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x20000004, 0);
    }

    if ((controlCommand[1] & RazielCommands[6]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x80000008, 0);
    }
    else if ((controlCommand[2] & RazielCommands[6]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x20000008, 0);
    }

    if ((controlCommand[1] & RazielCommands[9]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x80000020, 0);
    }
    else if ((controlCommand[2] & RazielCommands[9]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x20000020, 0);
    }

    if ((controlCommand[1] & RazielCommands[0]))
    {
        EnMessageQueueData(&Raziel.padCommands, 0x80000010, 0);
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielAdditionalCollide);

int GetEngageEvent(Instance *instance)
{
    int Ability;

    if (instance != NULL)
    {
        Ability = INSTANCE_Query(instance, 2);

        if ((Ability & 0x8))
        {
            return 0x2000000;
        }

        if ((Ability & 0x1))
        {
            return 0x2000001;
        }

        if ((Ability & 0x2))
        {
            return 0x2000004;
        }
    }

    return 0;
}

int SetupReaction(Instance *player, Instance *instance)
{
    int FaceAngle;
    int isEvent;

    player->yVel = 0;
    player->xVel = 0;

    player->work3 = (long)instance;

    isEvent = GetEngageEvent(instance) != 0x2000001;

    FaceAngle = player->position.z;

    if (isEvent != 0)
    {
        PhysicsCheckEdgeGrabbing(player, gameTracker, SetPhysicsEdgeData(400, -256, 144, 0, -196, 498, &Raziel.Senses.ForwardNormal, &Raziel.Senses.AboveNormal, &Raziel.Senses.Delta), 1);

        PhysicsDefaultEdgeGrabResponse(player, (evPhysicsEdgeData *)SetPhysicsEdgeData(0, 0, 0, 0, -141, 0, &Raziel.Senses.ForwardNormal, NULL, &Raziel.Senses.Delta), 1);
    }

    player->position.z = FaceAngle;

    return FaceAngle;
}

int CheckHolding(Instance *instance)
{
    return instance->LinkChild != NULL;
}

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

/* TODO: migrate to GetCollisionType*/
static char D_800D1DB8[0xA] = "MultiHit\n";
INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", GetCollisionType);

void InitGlyphSystem(Instance *instance)
{
    Object *GlyphOb;
    Instance *iGlyph;

    GlyphOb = (Object *)objectAccess[20].object;

    if (GlyphOb != NULL)
    {
        iGlyph = INSTANCE_BirthObject(instance, GlyphOb, 0);

        if (iGlyph != NULL)
        {
            Raziel.GlyphSystem = iGlyph;
        }
    }
}

void mdRazielProcess(Instance *playerInstance, GameTracker *gameTracker, long *controlCommand)
{
    ProcessTimers(playerInstance);

    razClearPlayerEvent();

    ProcessRazControl(controlCommand);

    SetStates(playerInstance, gameTracker, controlCommand, -1);

    ProcessHints();

    CAMERA_Control(&theCamera, playerInstance);

    playerInstance->offset.x = 0;
    playerInstance->offset.y = 0;
    playerInstance->offset.z = 0;

    Raziel.collisionEdgeOffset.x = 0;
    Raziel.collisionEdgeOffset.y = 0;
    Raziel.collisionEdgeOffset.z = 0;

    Raziel.Senses.HitMonster = NULL;

    if (Raziel.GlyphSystem != NULL)
    {
        GlyphProcess(Raziel.GlyphSystem, gameTracker);
    }

    Raziel.Abilities = debugRazielFlags1;

    debugRazielFlags1 |= debugRazielFlags2;
}

void RazielProcess(Instance *playerInstance, GameTracker *gameTracker)
{
    mdRazielProcess(gameTracker->playerInstance, gameTracker, &gameTracker->controlCommand[0][0]);

    DebugProcess(playerInstance, &Raziel);

    Norm.z = 0;
    Norm.y = 0;
    Norm.x = 0;
}

void RazielInit(Instance *instance, GameTracker *gameTracker)
{
    instance->data = instance->object->data;

    gameTracker->playerInstance = instance;

    instance->intro = NULL;

    instance->zVel = 0;
    instance->zAccl = 0;

    instance->yVel = 0;
    instance->yAccl = 0;

    instance->work0 = 0;
    instance->work1 = 0;

    instance->offset.x = 0;
    instance->offset.y = 0;
    instance->offset.z = 0;

    instance->currentMainState = 0;
    instance->currentSubState = 0;

    instance->matrix = NULL;

    instance->maxZVel = 0;

    instance->work3 = 0;

    instance->lightGroup = 0;

    instance->flags = ((instance->flags | 0x400) & ~0x100) | 0x80;
    instance->flags2 |= 0x84;

    OBTABLE_GetInstanceCollideFunc(instance);
    OBTABLE_GetInstanceProcessFunc(instance);

    DisableWristCollision(instance, 2);
    DisableWristCollision(instance, 1);

    InitStates(instance);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", RazielCollide);

void RAZIEL_TurnHead(Instance *instance, short *rotx, short *rotz, GameTracker *gameTracker)
{
    Rotation rot;
    evActionLookAroundData data;
    short rx;
    short rz;

    (void)gameTracker;

    if (((Raziel.Mode & 0x20000)) && (!(Raziel.throwMode & 0x4)))
    {
        *rotx += gameTrackerX.controlData[0][4] / 8;
        *rotz -= gameTrackerX.controlData[0][3] / 6;

        if ((Raziel.extraRot.x != 0) && (*rotx != 0))
        {
            *rotx -= Raziel.throwData->coilRot;
        }

        *rotx += Raziel.extraRot.x - 4096;

        rot.x = *rotx;
        rot.y = 0;
        rot.z = *rotz;

        LimitRotation(&rot);

        *rotx = rot.x - (Raziel.extraRot.x - 4096);
        *rotz = rot.z;

        ThrowSetFocusPoint(instance, &rot);

        if (Raziel.extraRot.x != 0)
        {
            CAMERA_SetLookRot(&theCamera, *rotx + Raziel.throwData->coilRot, *rotz);
        }
    }
    else
    {
        *rotx += gameTrackerX.controlData[0][4] / 4;
        *rotz -= gameTrackerX.controlData[0][3] / 3;

        rx = *rotx & 0xFFF;

        if (rx > 2048)
        {
            rx |= ~0xFFF;
        }

        *rotx = rx;

        rz = *rotz & 0xFFF;

        if (rz > 2048)
        {
            rz |= ~0xFFF;
        }

        *rotz = rz;

        data.minx = -768;
        data.maxx = 512;

        data.rotx = rotx;
        data.rotz = rotz;

        data.minz = -1024;
        data.maxz = 1024;

        razRotateUpperBody(instance, &data);
    }
}

void RAZIEL_SetLookAround(Instance *instance)
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

long RAZIEL_OkToLookAround(Instance *playerInstance)
{
    (void)playerInstance;

    if (((Raziel.Senses.Flags & 0x4)) && ((Raziel.State.SectionList[0].Process == StateHandlerIdle) || (Raziel.State.SectionList[0].Process == StateHandlerThrow2)))
    {
        return 1;
    }

    if ((Raziel.State.SectionList[1].Process == StateHandlerSwim) || (Raziel.State.SectionList[1].Process == StateHandlerSwimTread))
    {
        return 1;
    }

    return 0;
}

void TrailWaterFX(Instance *instance, int Segment, int Bubbles, int Type)
{
    SVector Pos;
    SVector Vel;
    SVector Accl = {0};
    int i;
    int j;
    Level *level;
    BubbleParams BP;
    int temp, temp2; // not from decls.h

    level = STREAM_GetLevelWithID(instance->currentStreamUnitID);

    BP.DisperseFrames = 5;

    BP.KillScale = 128;

    BP.MinSplashSize = 2048;

    BP.MaxSpeed = 24;
    BP.MaxSpeedRange = 24;

    BP.ScaleRate = 32;
    BP.ScaleRateRange = 16;

    BP.UniqueBubbles = 4;

    if ((instance->matrix != NULL) && (instance->oldMatrix != NULL))
    {
        for (i = 0; i < 2; i++)
        {
            Pos.x = instance->oldMatrix[Segment].t[0] + (((instance->matrix[Segment].t[0] - instance->oldMatrix[Segment].t[0]) * i) / 2);
            Pos.y = instance->oldMatrix[Segment].t[1] + (((instance->matrix[Segment].t[1] - instance->oldMatrix[Segment].t[1]) * i) / 2);
            Pos.z = instance->oldMatrix[Segment].t[2] + (((instance->matrix[Segment].t[2] - instance->oldMatrix[Segment].t[2]) * i) / 2);

            for (j = 0; j < Bubbles; j++)
            {
                Vel.x = Pos.x - instance->oldMatrix[Segment].t[0] + (rand() % 20) - 10;
                Vel.y = Pos.y - instance->oldMatrix[Segment].t[1] + (rand() % 20) - 10;

                if (Type == 0)
                {
                    Vel.z = Pos.z - instance->oldMatrix[Segment].t[2] + (rand() % 10);

                    if ((Vel.z << 16) <= 0)
                    {
                        Vel.z = 1;
                    }

                    Accl.z = 0;

                    BP.StartScale = 3072;
                    BP.StartScaleRange = 256;

                    FX_MakeWaterBubble(&Pos, &Vel, &Accl, level->waterZLevel, &BP);
                }
                else if (Type == 1)
                {
                    Vel.z = (rand() % 20) + 6;

                    // TODO: the following temp vars aren't really needed, have to find the actual arithmetic operations
                    temp2 = rand();

                    temp = temp2;

                    if (temp < 0)
                    {
                        temp2 = temp + 3;
                    }

                    Accl.z = (temp - ((temp2 >> 2) << 2)) + 1;

                    BP.StartScale = 4096;
                    BP.StartScaleRange = 2048;

                    FX_MakeWaterBubble(&Pos, &Vel, &Accl, level->waterZLevel, &BP);
                }
            }
        }
    }
}

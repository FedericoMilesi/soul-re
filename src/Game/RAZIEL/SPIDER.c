#include "common.h"
#include "Game/RAZIEL/SPIDER.h"
#include "Game/RAZIEL/RAZIEL.h"
#include "Game/RAZIEL/RAZLIB.h"
#include "Game/RAZIEL/STEERING.h"
#include "Game/RAZIEL/CONTROL.h"
#include "Game/STATE.h"

void StateHandlerWallGrab(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr;
    evPhysicsWallCrawlData *data;

    while ((Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event)) != NULL)
    {
        switch (Ptr->ID)
        {
        case 0x100001:
            if (CurrentSection == 0)
            {
                Raziel.Mode = 0x4000000;

                SteerSwitchMode(In->CharacterInstance, 7);

                ControlFlag = 0x80A1101;

                In->CharacterInstance->tface = NULL;

                PhysicsMode = 3;

                ResetPhysics(In->CharacterInstance, -16);

                razReaverBladeOff();
            }

            G2EmulationSwitchAnimation(In, CurrentSection, 75, 0, 3, 1);

            PurgeMessageQueue(&In->SectionList[CurrentSection].Event);

            In->CharacterInstance->flags2 &= ~0x40;
            break;
        case 0x8000000:
            if (CurrentSection == 0)
            {
                StateSwitchStateCharacterData(In, StateHandlerWallIdle, 0);
            }

            break;
        case 0x100004:
        case 0x1000001:
        case 0x80000000:
        case 0x80000008:
        case 0x80000020:
            break;
        case 0x4010011:
            data = (evPhysicsWallCrawlData *)Ptr->Data;

            if (data->rc == 0)
            {
                In->CharacterInstance->rotation.x = 0;
                In->CharacterInstance->rotation.y = 0;
                In->CharacterInstance->rotation.z = 0;

                StateSwitchStateData(In, CurrentSection, StateHandlerIdle, SetControlInitIdleData(0, 0, 3));

                In->CharacterInstance->flags2 |= 0x40;
            }
            else if (CurrentSection == 0)
            {
                razSetWallCrawlNodes(In->CharacterInstance, data);
            }

            break;
        default:
            DefaultStateHandler(In, CurrentSection, Data);
        }

        DeMessageQueue(&In->SectionList[CurrentSection].Event);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/SPIDER", StateHandlerWallIdle);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/SPIDER", StateHandlerWallDismount);

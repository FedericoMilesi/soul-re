void StateHandlerMoveToPosition(CharacterState *In, int CurrentSection, intptr_t Data);
void DefaultPuppetStateHandler(CharacterState *In, int CurrentSection, intptr_t Data);

void StateHandlerPuppetShow(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr;

    while ((Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event)) != NULL)
    {
        switch (Ptr->ID)
        {
        case 0x1000001:
        case 0x4000001:
            break;
        case 0x100001:
            if (Ptr->Data != 0)
            {
                G2EmulationSwitchAnimation(In, CurrentSection, 0, 0, 3, 2);
            }

            Raziel.Mode = 1;
            Raziel.idleCount = 0;

            ControlFlag = 0x1020008;

            PhysicsMode = 0;

            SteerSwitchMode(In->CharacterInstance, 0);

            ResetPhysics(In->CharacterInstance, -16);

            Raziel.movementMinRate = 0;

            if (CurrentSection == 0)
            {
                Raziel.constrictGoodCircle = 0;
            }

            break;
        case 0x40003:
            if (CurrentSection == 0)
            {
                evActionPlayHostAnimationData *data1;

                data1 = (evActionPlayHostAnimationData *)Ptr->Data;

                G2EmulationInstanceToInstanceSwitchAnimationCharacter(data1->instance, data1->host, data1->newAnim, data1->newFrame, data1->frames, data1->mode);
            }

            break;
        case 0x40014:
            G2EmulationSwitchAnimation(In, CurrentSection, 0, 0, 3, 2);
            break;
        case 0x8000008:
            if (CurrentSection == 0)
            {
                evAnimationInstanceSwitchData *data2;

                data2 = (evAnimationInstanceSwitchData *)Ptr->Data;

                G2EmulationSwitchAnimationCharacter(In, data2->anim, data2->frame, data2->frames, data2->mode);
            }

            break;
        case 0x40016:
            G2EmulationSwitchAnimation(In, CurrentSection, 123, 0, 4, 2);
        case 0x4000C:
            StateSwitchStateData(In, CurrentSection, StateHandlerMoveToPosition, Ptr->Data);
            break;
        case 0x4000D:
            if (CurrentSection == 0)
            {
                evPositionData *data3;

                data3 = (evPositionData *)Ptr->Data;

                Raziel.puppetRotToPoint.z = data3->z;

                SteerSwitchMode(In->CharacterInstance, 13);
            }

            break;
        case 0x40021:
            Raziel.steeringVelocity = Ptr->Data;
            break;
        case 0x40018:
            if (CurrentSection == 0)
            {
                evPositionData *data4;

                data4 = (evPositionData *)Ptr->Data;

                COPY_SVEC(Position, &Raziel.puppetRotToPoint, evPositionData, data4);

                SteerSwitchMode(In->CharacterInstance, 12);
            }

            break;
        case 0x40010:
            Raziel.Senses.Flags &= ~0x10;

            ControlFlag &= ~0x20000;
            break;
        default:
            DefaultPuppetStateHandler(In, CurrentSection, Data);
        }

        DeMessageQueue(&In->SectionList[CurrentSection].Event);
    }

    razApplyMotion(In, CurrentSection);
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerMoveToPosition);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", DefaultPuppetStateHandler);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerWarpGate);

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerForcedGlide);

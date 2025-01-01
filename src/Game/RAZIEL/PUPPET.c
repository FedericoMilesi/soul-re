#include "Game/RAZIEL/RAZIEL.h"
#include "Game/RAZIEL/RAZLIB.h"
#include "Game/STREAM.h"
#include "Game/LOAD3D.h"

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

void StateHandlerMoveToPosition(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr; 
    long distance; 
    int motion; 
    int applyMotion;
    
    applyMotion = 1;
    
    while ((Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event)) != NULL)
    {
        switch (Ptr->ID) 
        {         
        case 0x1000000:
        case 0x4010400:
            break;
        case 0x100001:
            if (CurrentSection == 0) 
            {
                evPositionData *moveToPoint; 
                
                moveToPoint = (evPositionData*)Ptr->Data;
                
                COPY_SVEC(Position, &Raziel.puppetMoveToPoint, evPositionData, moveToPoint);
                
                razAlignYRotInterp(In->CharacterInstance, &Raziel.puppetMoveToPoint, 0, 4);
                
                PhysicsMode = 0;
                
                SteerSwitchMode(In->CharacterInstance, 0);
            }
                
            break;
        case 0x100000:
            StateSwitchStateData(In, CurrentSection, StateHandlerPuppetShow, SetControlInitIdleData(0, 0, 3));
                
            applyMotion = 0;
            break;
        case 0x40016:
            G2EmulationSwitchAnimation(In, CurrentSection, 123, 0, 4, 2);
        case 0x4000C:
        {
            evPositionData *moveToPoint; 
                
            moveToPoint = (evPositionData*)Ptr->Data;
                
            COPY_SVEC(Position, &Raziel.puppetMoveToPoint, evPositionData, moveToPoint);
            break;
        }
        case 0x4000001:
            PhysicsMode = 0;
                
            SetDropPhysics(In->CharacterInstance, &Raziel);
            break;
        case 0x4020000:
            break;
        default:
            DefaultPuppetStateHandler(In, CurrentSection, Data);
        }
        
        DeMessageQueue(&In->SectionList[CurrentSection].Event);
    }
    
    if (applyMotion != 0) 
    {
        if (CurrentSection == 0) 
        {
            razAlignYRotInterp(In->CharacterInstance, &Raziel.puppetMoveToPoint, 0, 4);
        }
        
        distance = MATH3D_LengthXYZ(In->CharacterInstance->position.x - Raziel.puppetMoveToPoint.x, In->CharacterInstance->position.y - Raziel.puppetMoveToPoint.y, In->CharacterInstance->position.z - Raziel.puppetMoveToPoint.z);
        
        motion = razApplyMotion(In, CurrentSection) * 2;
        
        if ((CurrentSection == 0) && (distance < motion)) 
        {
            INSTANCE_Post(In->CharacterInstance, 0x100000, 0);
        }
    }
}

void DefaultPuppetStateHandler(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr;

    Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event);
    
    if (Ptr != NULL) 
    {
        switch (Ptr->ID) 
        {
        case 0x100004: 
            razResetMotion(gameTrackerX.playerInstance);
            break;
        case 0x4000A:
            STREAM_SetInstancePosition(gameTrackerX.playerInstance, (evPositionData*)Ptr->Data);
            break;
        case 0x4000B:
        {
            evPositionData *data; 
            
            if (CurrentSection == 0) 
            {
                data = (evPositionData*)Ptr->Data;
                
                gameTrackerX.playerInstance->rotation.z = data->z;
            }
            
            break;
        }
        case 0x4000F:
        {
            evPositionData *data; 
            
            data = (evPositionData*)Ptr->Data; 
            
            COPY_LVEC(Vector, &Raziel.Senses.lookAtPoint, evPositionData, data);
            
            Raziel.Senses.Flags |= 0x10;
            
            ControlFlag |= 0x20000;
            break;
        }
        case 0x40020:
            if (CurrentSection == 0) 
            {
                G2Anim_SetSpeedAdjustment(&gameTrackerX.playerInstance->anim, Ptr->Data);
            }
            
            break;
        case 0x800027:
            if (Data != 0) 
            {
                ControlFlag |= 0x8;
            }
            else 
            {
                ControlFlag &= ~0x8; 
            }
            
            break;
        case 0x10002002:
            razMaterialShift();
            break;
        case 0x10002001:
            razSpectralShift();
            break;
        case 0x100009:
        case 0x1000001:
        case 0x4010200:
        case 0x8000000:
        case 0x80000000:
        case 0x80000008:
        case 0x80000010:
        case 0x80000020:
            break; 
        default:
            DefaultStateHandler(In, CurrentSection, Data);
        }
    }
}

void StateHandlerWarpGate(CharacterState *In, int CurrentSection, intptr_t Data)
{
    Message *Ptr; 
    int anim; 

    anim = G2EmulationQueryAnimation(In, CurrentSection);
    
    while ((Ptr = PeekMessageQueue(&In->SectionList[CurrentSection].Event)) != NULL)
    {
        switch (Ptr->ID) 
        {
        case 0x100001:
            StateInitIdle(In, CurrentSection, SetControlInitIdleData(0, 0, 3));
            
            ControlFlag = 0x20008;
            
            Raziel.Mode = 0x80000000;
            
            PhysicsMode = 3;
            
            Raziel.idleCount = 0;
            
            if (CurrentSection == 0) 
            {
                Raziel.puppetRotToPoint.z = Raziel.Senses.EngagedList[14].instance->rotation.z;
                
                SteerSwitchMode(In->CharacterInstance, 13);
                
                In->CharacterInstance->position = Raziel.Senses.EngagedList[14].instance->position;
                
                razSetPlayerEventHistory(0x800);
                
                WARPGATE_StartUsingWarpgate();
            }
            
            break;
        case 0x2000000:
        case 0x80000000:
            if (anim != 123) 
            {
                EnMessageQueueData(&In->SectionList[CurrentSection].Defer, 0x100000, 0);
                
                WARPGATE_EndUsingWarpgate();
            }
            
            break;
        case 0x10000000:
            if ((CurrentSection == 0) && (anim != 123)) 
            {
                if ((*PadData & 0x4)) 
                {
                    WARPGATE_IncrementIndex();
                }
                
                if ((*PadData & 0x8)) 
                {
                    WARPGATE_DecrementIndex();
                }
                
                if ((*PadData & 0x1)) 
                {
                    if (WARPGATE_IsWarpgateUsable() != 0) 
                    {
                        Instance *heldInst; 
                        
                        SetTimer(75);
                        
                        heldInst = razGetHeldItem();
                        
                        if (heldInst != NULL) 
                        {
                            INSTANCE_Post(heldInst, 0x800008, 0);
                        }
                        
                        G2EmulationSwitchAnimationCharacter(In, 123, 0, 6, 2);
                        
                        if (WARPGATE_IsWarpgateSpectral() != 0) 
                        {
                            razSpectralShift();
                        }
                        
                        break;
                    }
                    
                    if ((!(Raziel.playerEventHistory & 0x20000)) && (WARPGATE_IsWarpgateReady() != 0)) 
                    {
                        LOAD_PlayXA(239);
                        
                        razSetPlayerEventHistory(0x20000);
                    }
                }
            }
            
            break;
        case 0x100000:
            if (WARPGATE_IsWarpgateActive() != 0) 
            {
                EnMessageQueueData(&In->SectionList[CurrentSection].Defer, 0x100000, 0);
            }
            else 
            {
                StateSwitchStateCharacterData(In, StateHandlerIdle, SetControlInitIdleData(0, 0, 3));
            }
            
            break;
        case 0x100015:
            if (CurrentSection == 0) 
            {
                EnMessageQueueData(&In->SectionList[CurrentSection].Defer, 0x100000, 0);
                
                WARPGATE_EndUsingWarpgate();
            }
            
            StateInitIdle(In, CurrentSection, SetControlInitIdleData(0, 0, 3));
            break;
        case 0x40005:
        case 0x100004:
        case 0x100014:
        case 0x1000001:
        case 0x8000000:
        case 0x10002001:
        case 0x10002002:
        case 0x80000008:
        case 0x80000010:
        case 0x80000020:
            break;
        default:
            DefaultStateHandler(In, CurrentSection, Data);
        }
        
        DeMessageQueue(&In->SectionList[CurrentSection].Event);
    }
    
    if (CurrentSection == 0) 
    {
        razApplyMotion(In, 0);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/RAZIEL/RAZIEL", StateHandlerForcedGlide);

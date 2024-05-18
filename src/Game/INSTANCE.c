#include "common.h"
#include "Game/INSTANCE.h"

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Deactivate);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Reactivate);

void INSTANCE_ForceActive(struct _Instance *instance)
{
    if ((instance->flags2 & 0x1))
    {
        INSTANCE_Reactivate(instance);
    }
}

void INSTANCE_DeactivatedProcess(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DeactivateFarInstances);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InitInstanceList);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_NewInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InstanceGroupNumber);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InsertInstanceGroup);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ReallyRemoveInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_CleanUpInstanceList);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Introduced);

struct INICommand *INSTANCE_GetIntroCommand(struct INICommand *command, int cmd)
{
    if (command != NULL)
    {
        while (command->command != 0)
        {
            if (command->command != cmd)
            {
                command += command->numParameters + 1;
            }
            else
            {
                return command;
            }
        }
    }

    return 0;
}

struct INICommand *INSTANCE_FindIntroCommand(struct _Instance *instance, int cmd)
{
    return INSTANCE_GetIntroCommand((struct INICommand *)instance->introData, cmd);
}

void INSTANCE_ProcessIntro(struct _Instance *instance)
{
    struct INICommand *command;

    if (instance->introData != NULL)
    {
        command = (struct INICommand *)instance->introData;

        if (!(instance->flags & 0x2))
        {
            while (command->command != 0)
            {
                if (command->command == 18)
                {
                    instance->currentModel = (short)command->parameter[0];
                }

                command += command->numParameters + 1;
            }
        }
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InitEffects);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_AdditionalCollideFunctions);

long INSTANCE_GetSplineFrameNumber(struct _Instance *instance, struct MultiSpline *spline)
{
    return SCRIPT_GetSplineFrameNumber(instance, SCRIPT_GetPosSplineDef(instance, spline, 0, 0));
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ProcessFunctions);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_BirthObject);

void INSTANCE_BuildStaticShadow(void)
{
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DefaultInit);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_PlainDeath);

void INSTANCE_KillInstance(struct _Instance *instance)
{
    if (!(instance->flags & 0x20))
    {
        INSTANCE_PlainDeath(instance);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Query);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Post);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Broadcast);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_InPlane);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_FindWithID);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_FindWithName);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_FindIntro);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Find);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceSavedInstance);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_IntroduceSavedInstanceWithIntro);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_SpatialRelationships);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_SetStatsData);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_LinkToParent);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_UnlinkFromParent);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_UnlinkChildren);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_UpdateFamilyStreamUnitID);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_ReallyRemoveAllChildren);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_GetChildLinkedToSegment);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_Linked);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_GetFadeValue);

INCLUDE_ASM("asm/nonmatchings/Game/INSTANCE", INSTANCE_DefaultAnimCallback);

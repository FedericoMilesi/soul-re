#include "common.h"
#include "Game/STATE.h"
#include "Game/MONSTER/MONMSG.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/MONSTER/MONLIB.h"

int MON_GroundMoveQueueHandler(Instance *instance)
{
    MonsterVars *mv;
    Message *message;
    int ret;

    ret = 0;

    mv = (MonsterVars *)instance->extraData;

    while (1)
    {
        message = DeMessageQueue(&mv->messageQueue);

        if (message == NULL)
        {
            break;
        }

        if (message->ID == 0x4010080)
        {
            ret = 0x4010080;
        }
        else
        {
            MON_IdleMessageHandler(instance, message);
        }
    }

    return ret;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_PupateMessageHandler);

void MON_IdleMessageHandler(Instance *instance, Message *message)
{
    MonsterVars *mv;
    long id;
    char temp; // not from decls.h

    temp = 0;

    id = message->ID;

    mv = (MonsterVars *)instance->extraData;

    switch (id)
    {
    case 0x1000002:
    case 0x100000A:
    case 0x1000023:
        if (message != NULL) // garbage code for reodering 
        {
            temp = -temp;
        }

        if (message->Data == 0)
        {
            MON_SwitchState(instance, MONSTER_STATE_PARRY);
        }

        MON_DefaultMessageHandler(instance, message);
        break;
    case 0x100000E:
        if (!(mv->mvFlags & 0x4))
        {
            MonsterIR *mir;

            mir = (MonsterIR *)message->Data;

            if ((INSTANCE_Query(mir->instance, 1) & 0x1))
            {
                MON_ChangeBehavior(instance, mv->triggeredBehavior);
            }

            MON_SwitchState(instance, MONSTER_STATE_SURPRISED);
        }

        break;
    case 0x1000012:
        if (!(mv->mvFlags & 0x4))
        {
            MonsterIR *mir;

            mir = (MonsterIR *)message->Data;

            if ((INSTANCE_Query(mir->instance, 1) & 0x1))
            {
                MON_ChangeBehavior(instance, mv->triggeredBehavior);
            }

            MON_SwitchState(instance, MONSTER_STATE_NOTICE);
        }

        break;
    default:
        MON_DefaultMessageHandler(instance, message);
    }
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_DefaultMessageHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_PupateQueueHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_IdleQueueHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_DefaultQueueHandler);

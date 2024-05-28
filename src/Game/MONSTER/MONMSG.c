#include "common.h"
#include "Game/STATE.h"
#include "Game/MONSTER/MONMSG.h"
#include "Game/MONSTER/MONAPI.h"

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

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_IdleMessageHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_DefaultMessageHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_PupateQueueHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_IdleQueueHandler);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONMSG", MON_DefaultQueueHandler);

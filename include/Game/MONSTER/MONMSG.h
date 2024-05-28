#ifndef _MONMSG_H_
#define _MONMSG_H_

#include "common.h"
#include "Game/STATE.h"

void MON_IdleMessageHandler(Instance *instance, Message *message);
void MON_DefaultMessageHandler(Instance *instance, Message *message);
void MON_DefaultQueueHandler(Instance *instance);
void MON_PupateMessageHandler(Instance *instance, Message *message);

#endif

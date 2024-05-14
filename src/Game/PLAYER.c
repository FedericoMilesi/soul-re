#include "common.h"
#include "Game/INSTANCE.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAYER", PLAYER_TurnHead);

INCLUDE_ASM("asm/nonmatchings/Game/PLAYER", PLAYER_OkToLookAround);

INCLUDE_ASM("asm/nonmatchings/Game/PLAYER", PLAYER_SetLookAround);

void PLAYER_ReSetLookAround(struct _Instance *instance)
{
	if ((INSTANCE_Query(instance, 1) & 0x1))
	{
		RAZIEL_ResetLookAround(instance);
	}
	else
	{
		MONAPI_ResetLookAround(instance);
	}
}

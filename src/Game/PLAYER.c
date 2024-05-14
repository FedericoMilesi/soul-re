#include "common.h"
#include "Game/INSTANCE.h"

INCLUDE_ASM("asm/nonmatchings/Game/PLAYER", PLAYER_TurnHead);

long PLAYER_OkToLookAround(struct _Instance* instance)
{
	if ((INSTANCE_Query(instance, 1) & 0x1))
	{
		return RAZIEL_OkToLookAround(instance);
	}
	else
	{
		return MONAPI_OkToLookAround(instance);
	}
}

void PLAYER_SetLookAround(struct _Instance* instance)
{
	if ((INSTANCE_Query(instance, 1) & 0x1))
	{
		RAZIEL_SetLookAround(instance);
	}
	else
	{
		MONAPI_SetLookAround(instance);
	}
}

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

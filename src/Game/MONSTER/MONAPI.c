#include "common.h"
#include "Game/INSTANCE.h"

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterProcess);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterInit);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", SendHitObject);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterCollide);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterAdditionalCollide);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterQuery);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterMessage);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", AnimDistanceAndVel);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", TranslateAnimList);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterTranslateAnim);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterRelocateTune);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MonsterRelocateInstanceObject);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_TurnHead);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_SetLookAround);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_ResetLookAround);

long MONAPI_OkToLookAround(Instance *instance)
{
    return instance->currentMainState == 2;
}

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_DeleteRegen);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_ProcessGenerator);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_AddToGenerator);

INCLUDE_ASM("asm/nonmatchings/Game/MONSTER/MONAPI", MONAPI_CheckGenerator);

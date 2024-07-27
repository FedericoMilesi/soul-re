#include "common.h"
#include "Game/PSX/PSX_G2/MAINVM.h"
#include "Game/PSX/MAIN.h"

static G2AppDataVM _appDataVM;

int main()
{
    ClearBss();

    MainG2(&_appDataVM);
}

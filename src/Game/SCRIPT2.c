#include "common.h"
#include "Game/SCRIPT2.h"
#include "Game/INSTANCE.h"
#include "Game/GAMELOOP.h"

void LitShaftInit(struct _Instance *instance, struct GameTracker *gameTracker)
{
    struct LitShaftProperties *Prop;

    Prop = (struct LitShaftProperties *)instance->data;

    if (Prop != NULL)
    {
        int curTimeOfDay;

        curTimeOfDay = GAMELOOP_GetTimeOfDay();

        switch (curTimeOfDay)
        {
        case 1900:
        case 600:
            instance->fadeValue = 4096;
            break;
        case 700:
        case 1800:
            instance->fadeValue = Prop->fadeValue;
            break;
        }
    }
}

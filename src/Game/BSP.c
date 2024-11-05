#include "common.h"
#include "Game/CAMERA.h"
#include "Game/LIGHT3D.h"
#include "Game/INSTANCE.h"

void SBSP_IntroduceInstances(Terrain *terrain, int unitID)
{
    int i;
    Intro *intro;

    intro = terrain->introList;

    for (i = terrain->numIntros; i != 0; i--)
    {
        if (!(intro->flags & 0x4008))
        {
            INSTANCE_IntroduceInstance(intro, unitID);
        }

        intro++;
    }
}

void SBSP_IntroduceInstancesAndLights(Terrain *terrain, CameraCore *cameraCore, LightInfo *lightInfo, int unitID)
{
    (void)cameraCore;
    (void)lightInfo;
    SBSP_IntroduceInstances(terrain, unitID);
}

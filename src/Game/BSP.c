#include "common.h"
#include "Game/STREAM.h"
#include "Game/CAMERA.h"
#include "Game/LIGHT3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/BSP", SBSP_IntroduceInstances);

void SBSP_IntroduceInstancesAndLights(Terrain *terrain, CameraCore *cameraCore, LightInfo *lightInfo, int unitID)
{
    SBSP_IntroduceInstances(terrain, unitID);
}

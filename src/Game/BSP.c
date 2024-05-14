#include "common.h"
#include "Game/STREAM.h"
#include "Game/CAMERA.h"
#include "Game/LIGHT3D.h"

INCLUDE_ASM("asm/nonmatchings/Game/BSP", SBSP_IntroduceInstances);

void SBSP_IntroduceInstancesAndLights(struct _Terrain *terrain, struct _CameraCore_Type *cameraCore, struct LightInfo *lightInfo, int unitID)
{
	SBSP_IntroduceInstances(terrain, unitID);
}

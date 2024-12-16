#ifndef _BSP_H_
#define _BSP_H_

#include "common.h"

void SBSP_IntroduceInstances(Terrain *terrain, int unitID);
void SBSP_IntroduceInstancesAndLights(Terrain *terrain, CameraCore *cameraCore, LightInfo *lightInfo, int unitID);

#endif

#ifndef STEERING_H_
#define STEERING_H_

#include "common.h"

void razDeinitWallCrawlSteering(Instance *instance);
void razInitWallCrawlSteering(Instance *instance);
void SteerTurn(Instance *instance, int rc);
void SteerMove(Instance *instance, int rc);
void SteerDisableAutoFace(Instance *instance);
int SteerAutoFace(Instance *instance, long *controlCommand);
void SteerSwim(Instance *instance);
void SteerWallcrawling(Instance *instance);
void SteerSwitchMode(Instance *instance, int mode);

#endif

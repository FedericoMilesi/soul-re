#ifndef RAZLIB_H_
#define RAZLIB_H_

#include "common.h"

Instance *razGetHeldWeapon();
void razSetupSoundRamp(Instance *instance, SoundRamp *sound, int sfx, int startPitch, int endPitch, int startVolume, int endVolume, int timer, int distance);
void razSpectralShift();
void razSetPlayerEventHistory(unsigned long event);
int razReaverOn();
Instance *razGetHeldItem();
void razResetMotion(Instance *instance);
void razSetFadeEffect(short source, short dest, int steps);
void razResetPauseTranslation(Instance *instance);
void razSetPauseTranslation(Instance *instance);
int razSwitchVAnimCharacterGroup(Instance *instance, int animGroup, int *frame, int *frames);
void razLaunchForce(Instance *instance);
void razSwitchVAnimCharacterSingle(Instance *instance, int anim, int *frame, int *frames);
void razAlignYRotMoveInterp(Instance *source, Instance *dest, short distance, unsigned char segNumber, int Frames, int extraZ);
void razMaterialShift();
int razInBaseArea(char *name, int length);
void razReaverImbue(int reaverType);
int razReaverOff();
int razPlaneShift(Instance *instance);
void razReaverBladeOff();
void razSetWallCrawlNodes(Instance *instance, evPhysicsWallCrawlData *data);
int razZeroAxis(long *x, long *y, int radius);
void razReaverPickup(Instance *instance, Instance *soulReaver);
int razConstrictAngle(Instance *instance);
Instance *RAZIEL_QueryEngagedInstance(int index);
void razLaunchBubbles(int segments, int count, int type);
void razSetSwimVelocity(Instance *instance, int vel, int accl);
int razPickupAndGrab(CharacterState *In, int CurrentSection);

#endif

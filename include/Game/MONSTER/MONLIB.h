#ifndef _MONLIB_H_
#define _MONLIB_H_

#include "common.h"
#include "Game/MONSTER/MONAPI.h"
#include "Game/SAVEINFO.h"

unsigned long MON_GetTime(Instance *instance);
void MON_PlayRandomIdle(Instance *instance, int mode);
void MON_TurnOnBodySpheres(Instance *instance);
void MON_PlayAnimFromList(Instance *instance, char *animList, int animtype, int mode);
void MON_SwitchState(Instance *instance, MonsterState state);
int MON_TurnToPosition(Instance *instance, Position *position, short turnspeed);
void MON_KillMonster(Instance *instance);
void MON_TurnOffBodySpheres(Instance *instance);
int MON_GetRandomDestinationInWorld(Instance *instance, Position *in, short r);
void MON_StartSpecialFade(Instance *instance, int fadeLevel, int fadeTime);
void MON_PlayAnim(Instance *instance, MonsterAnim animtype, int mode);
void MON_ApplyPhysics(Instance *instance);
void MON_BirthMana(Instance *instance);
void MON_DisableHeadMove(Instance *instance);
void MON_EnableHeadMove(Instance *instance);
void MON_CheckEnvironment(Instance *instance);
void MON_PlayAnimID(Instance *instance, int index, int mode);
void MON_TurnOffWeaponSpheres(Instance *instance);
void MON_ProcessLookAt(Instance *instance);
void MON_ProcessSpecialFade(Instance *instance);
void MON_ChangeBehavior(Instance *instance, int behavior);
void MON_ProcessIntro(Instance *instance);
void MON_TurnOnAllSpheres(Instance *instance);
void MON_AnimInit(Instance *instance);
int MON_ValidUnit(Instance *instance, unsigned long unitId);
int MON_ValidPosition(Instance *instance);
Intro *MON_TestForTerrainImpale(Instance *instance, Terrain *terrain);
void MON_CheckTerrainAndRespond(Instance *instance, BSPTree *bsp, TFace *tface);
void MON_SetUpSaveInfo(Instance *instance, MonsterSaveInfo *saveData);
void MON_GetSaveInfo(Instance *instance, MonsterSaveInfo *saveData);
void MON_SwitchStateDoEntry(Instance *instance, MonsterState state);
void MON_RelocateCoords(Instance *instance, SVector *offset);
void MON_LookInDirection(Instance *instance, short tx, short tz);
long MON_AnimCallback(G2Anim *anim, int sectionID, G2AnimCallbackMsg message, long messageDataA, long messageDataB, void *data);
unsigned long MON_CheckTerrain(Instance *instance, BSPTree *bsp, TFace *tface);
void MON_SetDefaults(Instance *instance);
int MON_SetVelocityTowardsImpalingObject(Instance *instance, int checkOrientation);
void MON_TurnOffSphereCollisions(Instance *instance);
void MON_TurnOnSphereCollisions(Instance *instance);
void MON_TurnOffAllSpheres(Instance *instance);
void MON_BirthSoul(Instance *instance, int link);
void MON_ChangeHumanOpinion(Instance *instance);
void MON_DropAllObjects(Instance *instance);
int MON_AnimPlaying(Instance *instance, MonsterAnim animtype);
void MON_PlayCombatIdle(Instance *instance, int mode);
int MON_ShouldIFlee(Instance *instance);
void MON_GetPlanSlot(MonsterVars *mv);

#endif

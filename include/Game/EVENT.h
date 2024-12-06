#ifndef _EVENT_H_
#define _EVENT_H_

#include "common.h"

void EVENT_Init();
void EVENT_AddInstanceToInstanceList(Instance *instance);
void EVENT_RemoveInstanceFromInstanceList(Instance *instance);
void EVENT_SaveEventsFromLevel(long levelID, Level *level);
void EVENT_RemoveStreamToInstanceList(StreamUnit *stream);
void EVENT_UpdateResetSignalArrayAndWaterMovement(Level *oldLevel, Level *newLevel, long sizeOfLevel);
void EVENT_LoadEventsForLevel(long levelID, Level *level);
void EVENT_AddSignalToReset(MultiSignal *mSignal);
void EVENT_AddStreamToInstanceList(StreamUnit *stream);
void EVENT_PrintVars();
void EVENT_ProcessMovingWater();
void EVENT_ProcessTimers();

#endif

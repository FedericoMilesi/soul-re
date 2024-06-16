#ifndef _PLAN_H_
#define _PLAN_H_

// size: 0x1C
typedef struct PlanningNode {
	// offset: 0000 (6 bytes)
	struct _Position pos;
	// offset: 0006
	unsigned short flags;
	// offset: 0008
	unsigned long connectionStatus;
	// offset: 000C
	unsigned long connections;
	// offset: 0010
	unsigned short cost;
	// offset: 0012
	unsigned short parent;
	// offset: 0014
	unsigned short nodeType;
	// offset: 0016
	unsigned short id;
	// offset: 0018
	long streamUnitID;
} PlanningNode;

#endif

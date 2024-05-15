#ifndef _STREAM_H_
#define _STREAM_H_

#include "Game/TYPES.h"

// size: 0x4C
struct Intro {
	// offset: 0000 (16 bytes)
	char name[16];
	// offset: 0010
	long intronum;
	// offset: 0014
	long UniqueID;
	// offset: 0018 (8 bytes)
	struct _Rotation rotation;
	// offset: 0020 (6 bytes)
	struct _Position position;
	// offset: 0026
	short maxRad;
	// offset: 0028
	long maxRadSq;
	// offset: 002C
	long flags;
	// offset: 0030
	void *data;
	// offset: 0034 (668 bytes)
	struct _Instance *instance;
	// offset: 0038
	struct MultiSpline *multiSpline;
	// offset: 003C
	void *dsignal;
	// offset: 0040
	short specturalLightGroup;
	// offset: 0042
	short meshColor;
	// offset: 0044 (6 bytes)
	struct _Position spectralPosition;
	// offset: 004A
	short spad;
};

// size: 0x54
struct _Terrain {
	// offset: 0000
	short UnitChangeFlags;
	// offset: 0002
	short spad;
	// offset: 0004
	long lpad2;
	// offset: 0008
	long numIntros;
	// offset: 000C (76 bytes)
	struct Intro *introList;
	// offset: 0010
	long numVertices;
	// offset: 0014
	long numFaces;
	// offset: 0018
	long numNormals;
	// offset: 001C (12 bytes)
	struct _TVertex *vertexList;
	// offset: 0020 (12 bytes)
	struct _TFace *faceList;
	// offset: 0024 (8 bytes)
	struct _Normal *normalList;
	// offset: 0028 (8 bytes)
	struct DrMoveAniTex *aniList;
	// offset: 002C
	long pad;
	// offset: 0030
	void *StreamUnits;
	// offset: 0034 (12 bytes)
	struct TextureFT3 *StartTextureList;
	// offset: 0038 (12 bytes)
	struct TextureFT3 *EndTextureList;
	// offset: 003C (14 bytes)
	struct _MorphVertex *MorphDiffList;
	// offset: 0040 (2 bytes)
	struct _MorphColor *MorphColorList;
	// offset: 0044
	long numBSPTrees;
	// offset: 0048 (36 bytes)
	struct BSPTree *BSPTreeArray;
	// offset: 004C
	short *morphNormalIdx;
	// offset: 0050 (904 bytes)
	struct _MultiSignal *signals;
};

#endif

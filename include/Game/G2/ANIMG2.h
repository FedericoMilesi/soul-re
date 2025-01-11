#ifndef _ANIMG2_H_
#define _ANIMG2_H_

#include "common.h"

#define SET_QUAT_FAST(q, _x, _y, _z, _w)        \
    {                                           \
        G2Quat *quat = q;                       \
        *(int *)&quat->x = ((_x) | (_y << 16)); \
        *(int *)&quat->z = ((_z) | (_w << 16)); \
    }

#define SET_SVEC3_FAST(v, _x, _y, _z)          \
    {                                          \
        *(int *)&(v)->x = ((_x) | (_y << 16)); \
        (v)->z = (_z);                         \
    }

#define COPY_SVEC3_FAST(_tgt, _src)           \
    {                                         \
        G2SVector3 *src = _src;               \
        G2SVector3 *tgt = _tgt;               \
        unsigned long xy = *(int *)&src->x;   \
        unsigned long zpad = *(int *)&src->z; \
        *(int *)&tgt->x = xy;                 \
        *(int *)&tgt->z = zpad & 0xFFFF;      \
    }

#define GET_XY(a) *(long *)(&a.x);
#define SET_XY(a, c) *(long *)(&a.x) = c;
#define GET_ZW(b) *(long *)(&b.z);
#define SET_ZW(b, c) *(long *)(&b.z) = c;

#define GETP_XY(a) *(long *)(&a->x);
#define SETP_XY(a, c) *(long *)(&a->x) = c;
#define GETP_ZW(b) *(long *)(&b->z);
#define SETP_ZW(b, c) *(long *)(&b->z) = c;

void G2Anim_Restore(G2Anim *anim);
void G2Anim_Free(G2Anim *anim);
G2Bool G2Anim_SegmentHasActiveChannels(G2Anim *anim, int segNumber, unsigned short chanMask);
void G2Anim_Init(G2Anim *anim, Model *modelData);
void G2Anim_UpdateStoredFrame(G2Anim *anim);
void G2Anim_GetSegChannelValue(G2Anim *anim, int segIndex, unsigned short *valueTable, unsigned short channelMask);
void G2Anim_BuildTransforms(G2Anim *anim);
G2AnimSection *G2Anim_AddSection(G2Anim *anim, int firstSegID, int segCount);
void G2AnimSection_SwitchToKeylistAtTime(G2AnimSection *section, G2AnimKeylist *keylist, int keylistID, short targetTime);
void G2Anim_ResetInternalState();
G2Bool G2Anim_Install();
void _G2Anim_FreeChanStatusBlockList(G2AnimChanStatusBlock *block);
void _G2Anim_BuildSegLocalRotMatrix(G2AnimSegValue *segValue, G2Matrix *segMatrix);
void _G2Anim_BuildTransformsNoControllers(G2Anim *anim);
long _G2AnimAlphaTable_GetValue(G2AnimAlphaTable *table, long trueAlpha);
void _G2AnimSection_UpdateStoredFrameFromData(G2AnimSection *section, G2Anim *anim);
G2Anim *_G2AnimSection_GetAnim(G2AnimSection *section);
short G2AnimSection_AdvanceOverInterval(G2AnimSection *section, short interval);
short G2AnimSection_RewindOverInterval(G2AnimSection *section, short interval);
void G2AnimSection_JumpToTime(G2AnimSection *section, short targetTime);
G2AnimSection *G2Anim_GetSectionWithSeg(G2Anim *anim, int segNumber);
short G2AnimSection_UpdateOverInterval(G2AnimSection *section, short interval);
void G2Anim_GetRootMotionFromTimeForDuration(G2Anim *anim, short durationStart, short duration, G2SVector3 *motionVector);
void FooBar(G2AnimSection *section, G2Anim *anim, int decompressedKey, int targetKey, long timeOffset);
void _G2AnimSection_InitStatus(G2AnimSection *section, G2Anim *anim);

#endif

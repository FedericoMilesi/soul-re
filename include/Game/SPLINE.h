#ifndef _SPLINE_H_
#define _SPLINE_H_

// size: 0x8
typedef struct SplineDef {
    // offset: 0000
    short currkey;
    // offset: 0002
    unsigned short denomFlag;
    // offset: 0004
    long fracCurr;
}SplineDef;

typedef struct MultiSpline MultiSpline;

#endif

#ifndef _SDK_H_
#define _SDK_H_

/*TODO: Remove LIBS/ when adding PSYQ headers*/

#ifndef MIN
#define MIN(a,b) (((a)<(b))?(a):(b))
#endif

#ifndef MAX
#define MAX(a,b) (((a)>(b))?(a):(b))
#endif

#ifndef ABS
#define ABS(a) ((a) < 0 ? -(a) : (a))
#endif

#define getScratchAddr(offset)  ((unsigned long *)(0x1f800000+(offset)*4))

// GTE macros

#define gte_SetRotMatrix(r0) __asm__ ( \
        "lw    $12, 0(%0);" \
        "lw    $13, 4(%0);" \
        "ctc2    $12, $0;" \
        "ctc2    $13, $1;" \
        "lw    $12, 8(%0);" \
        "lw    $13, 12(%0);" \
        "lw    $14, 16(%0);" \
        "ctc2    $12, $2;" \
        "ctc2    $13, $3;" \
        "ctc2    $14, $4" \
        : : "r"(r0) \
        : "$12", "$13", "$14" \
    )

#define gte_ldv0(r0) __asm__ ( \
        "lwc2    $0, 0(%0);" \
        "lwc2    $1, 4(%0)" \
        : : "r"(r0) \
    )

#define gte_nmvmva(sf, mx, v, cv, lm) __asm__ ( \
        "nop;" \
        "nop;" \
        ".word %0" \
        : : "g"(0x4A400012 | ((sf) & 0x1) << 19 | ((mx) & 0x3) << 17 | ((v) & 0x3) << 15 | ((cv) & 0x3) << 13 | ((lm) & 0x1) << 10) \
    )

#define gte_mvmva(sf, mx, v, cv, lm) __asm__ ( \
        ".word %0" \
        : : "g"(0x4A400012 | ((sf) & 0x1) << 19 | ((mx) & 0x3) << 17 | ((v) & 0x3) << 15 | ((cv) & 0x3) << 13 | ((lm) & 0x1) << 10) \
    )

#define gte_stlvnl(r0) __asm__ ( \
        "swc2    $25, 0(%0);" \
        "swc2    $26, 4(%0);" \
        "swc2    $27, 8(%0)" \
        : : "r"(r0) \
        : "memory" \
    )

#define gte_nrtv0() gte_nmvmva(1, 0, 0, 3, 0)

#define gte_ldlvl(r0) __asm__ ( \
        "lwc2    $9, 0(%0);" \
        "lwc2    $10, 4(%0);" \
        "lwc2    $11, 8(%0)" \
        : : "r"(r0) \
    )

#define gte_nsqr(sf) __asm__ ( \
        "nop;" \
        "nop;" \
        ".word %0" \
        : : "g"(0x4AA00428 | ((sf) & 0x1) << 19) \
    )

#define gte_nsqr0() gte_nsqr(0)

int rand();
void ApplyMatrix(MATRIX *, SVECTOR *, VECTOR *);
void ApplyMatrixSV(MATRIX *, SVECTOR *, SVECTOR *);
void ApplyMatrixLV(MATRIX *, VECTOR *, VECTOR *);
void TransposeMatrix(MATRIX *, MATRIX *);
void EnterCriticalSection();
void ExitCriticalSection();
int GetRCnt(int);
void ClearOTagR(unsigned long *, int);
void RotMatrix(SVECTOR *, MATRIX *);
long ratan2(long y, long x);
MATRIX *RotMatrixX(long r, MATRIX *m);
MATRIX *RotMatrixY(long r, MATRIX *m);
MATRIX *RotMatrixZ(long r, MATRIX *m);
MATRIX *RotMatrixZYX(SVECTOR *r, MATRIX *m);
MATRIX *MulMatrix2(MATRIX *m0, MATRIX *m1);
void SetBackColor(long rbk, long gbk, long bbk);
void SetGeomScreen(long h);
void SetFogNearFar(long a, long b, long h);

#endif

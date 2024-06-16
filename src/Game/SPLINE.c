#include "common.h"
#include "Game/SPLINE.h"

void _SplineS2Pos(vecS *p, long s, SplineKey *key, SplineKey *key2)
{
    long s2;
    long s3;
    long h0;
    long h1;
    long h2;
    long h3;
    int temp, temp2; // not from decls.h

    if (s != 0)
    {
        s2 = (s * s) >> 15;

        temp = s2 * 2;

        s3 = (s2 * s) >> 15;

        temp2 = s3 * 2;

        h0 = (temp2 - (s2 * 3)) + 32768;

        h1 = (temp - temp2) + s2;

        h2 = (s3 - temp) + s;

        h3 = s3 - s2;

        p->x = (short)(((key->point.x * h0) + (key2->point.x * h1) + (key->dd.x * h2) + (key2->ds.x * h3)) >> 15);
        p->y = (short)(((key->point.y * h0) + (key2->point.y * h1) + (key->dd.y * h2) + (key2->ds.y * h3)) >> 15);
        p->z = (short)(((key->point.z * h0) + (key2->point.z * h1) + (key->dd.z * h2) + (key2->ds.z * h3)) >> 15);
    }
    else
    {
        p->x = key->point.x;
        p->y = key->point.y;
        p->z = key->point.z;
    }
}

void SplineSetDefDenom(Spline *spline, SplineDef *def, int denomFlag)
{
    unsigned long denom;

    if (def->denomFlag != denomFlag)
    {
        if (def->fracCurr != 0)
        {
            if (spline->type == 1)
            {
                denom = ((RSpline *)spline)->key[def->currkey].count;
            }
            else
            {
                denom = spline->key[def->currkey].count;
            }

            if (denom == 0)
            {
                denom = 1;
            }

            if (denomFlag != 0)
            {
                def->fracCurr = (def->fracCurr * denom) >> 15;
            }
            else
            {
                def->fracCurr = (def->fracCurr << 15) / denom;
            }
        }

        def->denomFlag = denomFlag;
    }
}

unsigned short SplineGetFrameNumber(Spline *spline, SplineDef *def)
{
    unsigned short frame;
    unsigned int i;
    SplineKey *key;
    SplineDef temp;

    if ((spline == NULL) || (def == NULL))
    {
        frame = 0xFFFF;
    }
    else
    {
        key = spline->key;

        temp = *def;

        frame = 0;

        for (i = 0; i < (unsigned)def->currkey; i++, key++)
        {
            frame += key->count;
        }

        temp.currkey = i;

        SplineSetDefDenom(spline, &temp, 0);

        frame += (unsigned short)(temp.fracCurr >> 12);
    }

    return frame & 0xFFFF;
}

short SplineSetDef2FrameNumber(Spline *spline, SplineDef *def, unsigned short frame_number)
{
    unsigned long isRot;
    short status;
    SplineKey *key;
    SplineRotKey *rkey;
    unsigned short frame;
    short deltaFrame;
    int temp; // not from decls.h

    status = 0;

    frame = 0;

    def->currkey = 0;

    def->fracCurr = 0;

    if ((spline == NULL) || (def == NULL))
    {
        status = -1;
    }
    else
    {
        rkey = (SplineRotKey *)spline->key;

        isRot = spline->type == 1;

        key = (SplineKey *)rkey;

        while (frame < frame_number)
        {
            if (def->currkey < spline->numkeys)
            {
                deltaFrame = frame_number - frame;

                if (deltaFrame < ((isRot != 0) ? rkey->count : key->count))
                {
                    def->fracCurr = deltaFrame << 12;
                    break;
                }
                else
                {
                    temp = frame;

                    if (isRot != 0)
                    {
                        temp += rkey->count;

                        frame = temp;
                    }
                    else
                    {
                        temp += key->count;

                        frame = temp;
                    }

                    def->currkey = (def->currkey + 1) % spline->numkeys;

                    key += 1;

                    if (def->currkey != 0)
                    {
                        rkey += 1;
                    }
                    else
                    {
                        rkey = (SplineRotKey *)spline->key;

                        key = (SplineKey *)rkey;
                    }
                }
            }
            else
            {
                break;
            }
        }

        def->denomFlag = 0;
    }

    return status;
}

short SplineIsWhere(Spline *spline, SplineDef *def)
{
    short curr;

    curr = (short)(def->fracCurr >> 12);

    if ((curr == 0) && (def->currkey == 0))
    {
        return -1;
    }

    if ((curr == (spline->numkeys - 1)) && (def->currkey == 0))
    {
        return 1;
    }

    return 0;
}

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineMultiIsWhere);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetFirstRot);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetFirstPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetNextPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetPreviousPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetNearestPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetData);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetQuatData);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetNext);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetPrev);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetNext);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetPrev);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetNextPoint);

INCLUDE_ASM("asm/nonmatchings/Game/SPLINE", SplineGetOffsetPreviousPoint);

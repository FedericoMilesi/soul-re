#ifndef _ANIMG2_H_
#define _ANIMG2_H_

typedef enum _G2AnimCallbackMsg_Enum {
    G2ANIM_MSG_DONE = 1,
    G2ANIM_MSG_LOOPPOINT = 2,
    G2ANIM_MSG_SECTION_INTERPDONE = 3,
    G2ANIM_MSG_SEGCTRLR_INTERPDONE = 4,
    G2ANIM_MSG_SWALARMSET = 5,
    G2ANIM_MSG_PLAYEFFECT = 6,
} G2AnimCallbackMsg;

// size: 0x6
typedef struct _G2SVector3_Type {
    // offset: 0000
    short x;
    // offset: 0002
    short y;
    // offset: 0004
    short z;
} G2SVector3;

// size: 0x30
typedef struct _G2AnimSection_Type {
    // offset: 0000
    unsigned char flags;
    // offset: 0001
    unsigned char sectionID;
    // offset: 0002
    unsigned char firstSeg;
    // offset: 0003
    unsigned char segCount;
    // offset: 0004
    short elapsedTime;
    // offset: 0006
    short storedTime;
    // offset: 0008
    short loopStartTime;
    // offset: 000A
    short loopEndTime;
    // offset: 000C
    short *swAlarmTable;
    // offset: 0010
    long speedAdjustment;
    // offset: 0014
    unsigned short keylistID;
    // offset: 0018
    unsigned long alarmFlags;
    // offset: 001C
    long (*callback)();
    // offset: 0020
    void *callbackData;
    // offset: 0024 (20 bytes)
    struct _G2AnimKeylist_Type *keylist;
    // offset: 0028 (36 bytes)
    struct _G2AnimChanStatusBlock_Type *chanStatusBlockList;
    // offset: 002C (12 bytes)
    struct _G2AnimInterpInfo_Type *interpInfo;
} G2AnimSection;

// size: 0xB4
typedef struct _G2Anim_Type {
    // offset: 0000
    unsigned char sectionCount;
    // offset: 0001
    unsigned char masterSection;
    // offset: 0002
    unsigned short controllerList;
    // offset: 0004
    unsigned short disabledControllerList;
    // offset: 0006
    unsigned short pad;
    // offset: 0008 (6 bytes)
    struct _G2SVector3_Type rootTrans;
    // offset: 000E
    unsigned short flags;
    // offset: 0010
    struct _Model *modelData;
    // offset: 0014 (32 bytes)
    struct _G2Matrix_Type *segMatrices;
    // offset: 0018 (12 bytes)
    unsigned long disabledBits[3];
    // offset: 0024 (144 bytes)
    struct _G2AnimSection_Type section[3];
} G2Anim;

// size: 0x8
typedef struct _AnimSoundData_Type {
    // offset: 0000
    short sfxToneID;
    // offset: 0002
    short volume;
    // offset: 0004
    short pitch;
    // offset: 0006
    short minVolDistance;
} AnimSoundData;

#endif

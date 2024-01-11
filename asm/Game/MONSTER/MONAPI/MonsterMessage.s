.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterMessage
/* 6F058 8007E858 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6F05C 8007E85C 1800B2AF */  sw         $s2, 0x18($sp)
/* 6F060 8007E860 21908000 */  addu       $s2, $a0, $zero
/* 6F064 8007E864 1400B1AF */  sw         $s1, 0x14($sp)
/* 6F068 8007E868 2188A000 */  addu       $s1, $a1, $zero
/* 6F06C 8007E86C 2000BFAF */  sw         $ra, 0x20($sp)
/* 6F070 8007E870 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6F074 8007E874 1000B0AF */  sw         $s0, 0x10($sp)
/* 6F078 8007E878 6C01508E */  lw         $s0, 0x16C($s2)
/* 6F07C 8007E87C 00000000 */  nop
/* 6F080 8007E880 95000012 */  beqz       $s0, .L8007EAD8
/* 6F084 8007E884 2198C000 */   addu      $s3, $a2, $zero
/* 6F088 8007E888 1000023C */  lui        $v0, (0x100007 >> 16)
/* 6F08C 8007E88C 07004234 */  ori        $v0, $v0, (0x100007 & 0xFFFF)
/* 6F090 8007E890 1B002212 */  beq        $s1, $v0, .L8007E900
/* 6F094 8007E894 2B105100 */   sltu      $v0, $v0, $s1
/* 6F098 8007E898 07004014 */  bnez       $v0, .L8007E8B8
/* 6F09C 8007E89C 0001023C */   lui       $v0, (0x1000020 >> 16)
/* 6F0A0 8007E8A0 0400023C */  lui        $v0, (0x40026 >> 16)
/* 6F0A4 8007E8A4 26004234 */  ori        $v0, $v0, (0x40026 & 0xFFFF)
/* 6F0A8 8007E8A8 08002212 */  beq        $s1, $v0, .L8007E8CC
/* 6F0AC 8007E8AC 00000000 */   nop
/* 6F0B0 8007E8B0 43FA0108 */  j          .L8007E90C
/* 6F0B4 8007E8B4 00000000 */   nop
.L8007E8B8:
/* 6F0B8 8007E8B8 20004234 */  ori        $v0, $v0, (0x1000020 & 0xFFFF)
/* 6F0BC 8007E8BC 07002212 */  beq        $s1, $v0, .L8007E8DC
/* 6F0C0 8007E8C0 00000000 */   nop
/* 6F0C4 8007E8C4 43FA0108 */  j          .L8007E90C
/* 6F0C8 8007E8C8 00000000 */   nop
.L8007E8CC:
/* 6F0CC 8007E8CC 36C3010C */  jal        PurgeMessageQueue
/* 6F0D0 8007E8D0 08000426 */   addiu     $a0, $s0, 0x8
/* 6F0D4 8007E8D4 43FA0108 */  j          .L8007E90C
/* 6F0D8 8007E8D8 00000000 */   nop
.L8007E8DC:
/* 6F0DC 8007E8DC C400038E */  lw         $v1, 0xC4($s0)
/* 6F0E0 8007E8E0 00000000 */  nop
/* 6F0E4 8007E8E4 09006010 */  beqz       $v1, .L8007E90C
/* 6F0E8 8007E8E8 00000000 */   nop
/* 6F0EC 8007E8EC 16006294 */  lhu        $v0, 0x16($v1)
/* 6F0F0 8007E8F0 00000000 */  nop
/* 6F0F4 8007E8F4 FFEF4230 */  andi       $v0, $v0, 0xEFFF
/* 6F0F8 8007E8F8 43FA0108 */  j          .L8007E90C
/* 6F0FC 8007E8FC 160062A4 */   sh        $v0, 0x16($v1)
.L8007E900:
/* 6F100 8007E900 0400658E */  lw         $a1, 0x4($s3)
/* 6F104 8007E904 420B020C */  jal        MON_GetSaveInfo
/* 6F108 8007E908 21204002 */   addu      $a0, $s2, $zero
.L8007E90C:
/* 6F10C 8007E90C 1800428E */  lw         $v0, 0x18($s2)
/* 6F110 8007E910 0004033C */  lui        $v1, (0x4000000 >> 16)
/* 6F114 8007E914 24104300 */  and        $v0, $v0, $v1
/* 6F118 8007E918 6F004014 */  bnez       $v0, .L8007EAD8
/* 6F11C 8007E91C 0400023C */   lui       $v0, (0x40013 >> 16)
/* 6F120 8007E920 13004234 */  ori        $v0, $v0, (0x40013 & 0xFFFF)
/* 6F124 8007E924 5C002212 */  beq        $s1, $v0, .L8007EA98
/* 6F128 8007E928 2B105100 */   sltu      $v0, $v0, $s1
/* 6F12C 8007E92C 11004014 */  bnez       $v0, .L8007E974
/* 6F130 8007E930 2000023C */   lui       $v0, (0x200000 >> 16)
/* 6F134 8007E934 0400023C */  lui        $v0, (0x4000B >> 16)
/* 6F138 8007E938 0B004234 */  ori        $v0, $v0, (0x4000B & 0xFFFF)
/* 6F13C 8007E93C 35002212 */  beq        $s1, $v0, .L8007EA14
/* 6F140 8007E940 2B105100 */   sltu      $v0, $v0, $s1
/* 6F144 8007E944 06004014 */  bnez       $v0, .L8007E960
/* 6F148 8007E948 0400023C */   lui       $v0, (0x4000A >> 16)
/* 6F14C 8007E94C 0A004234 */  ori        $v0, $v0, (0x4000A & 0xFFFF)
/* 6F150 8007E950 2B002212 */  beq        $s1, $v0, .L8007EA00
/* 6F154 8007E954 08000426 */   addiu     $a0, $s0, 0x8
/* 6F158 8007E958 B4FA0108 */  j          .L8007EAD0
/* 6F15C 8007E95C 21282002 */   addu      $a1, $s1, $zero
.L8007E960:
/* 6F160 8007E960 0E004234 */  ori        $v0, $v0, (0x4000E & 0xFFFF)
/* 6F164 8007E964 34002212 */  beq        $s1, $v0, .L8007EA38
/* 6F168 8007E968 08000426 */   addiu     $a0, $s0, 0x8
/* 6F16C 8007E96C B4FA0108 */  j          .L8007EAD0
/* 6F170 8007E970 21282002 */   addu      $a1, $s1, $zero
.L8007E974:
/* 6F174 8007E974 14002212 */  beq        $s1, $v0, .L8007E9C8
/* 6F178 8007E978 2B105100 */   sltu      $v0, $v0, $s1
/* 6F17C 8007E97C 07004014 */  bnez       $v0, .L8007E99C
/* 6F180 8007E980 2000023C */   lui       $v0, (0x200001 >> 16)
/* 6F184 8007E984 1000023C */  lui        $v0, (0x100008 >> 16)
/* 6F188 8007E988 08004234 */  ori        $v0, $v0, (0x100008 & 0xFFFF)
/* 6F18C 8007E98C 17002212 */  beq        $s1, $v0, .L8007E9EC
/* 6F190 8007E990 08000426 */   addiu     $a0, $s0, 0x8
/* 6F194 8007E994 B4FA0108 */  j          .L8007EAD0
/* 6F198 8007E998 21282002 */   addu      $a1, $s1, $zero
.L8007E99C:
/* 6F19C 8007E99C 01004234 */  ori        $v0, $v0, (0x200001 & 0xFFFF)
/* 6F1A0 8007E9A0 0D002212 */  beq        $s1, $v0, .L8007E9D8
/* 6F1A4 8007E9A4 0001023C */   lui       $v0, (0x1000024 >> 16)
/* 6F1A8 8007E9A8 24004234 */  ori        $v0, $v0, (0x1000024 & 0xFFFF)
/* 6F1AC 8007E9AC 47002216 */  bne        $s1, $v0, .L8007EACC
/* 6F1B0 8007E9B0 08000426 */   addiu     $a0, $s0, 0x8
/* 6F1B4 8007E9B4 0000028E */  lw         $v0, 0x0($s0)
/* 6F1B8 8007E9B8 00000000 */  nop
/* 6F1BC 8007E9BC 40004234 */  ori        $v0, $v0, 0x40
/* 6F1C0 8007E9C0 B6FA0108 */  j          .L8007EAD8
/* 6F1C4 8007E9C4 000002AE */   sw        $v0, 0x0($s0)
.L8007E9C8:
/* 6F1C8 8007E9C8 AD19020C */  jal        MONSENSE_StartMonsterIRList
/* 6F1CC 8007E9CC 21204002 */   addu      $a0, $s2, $zero
/* 6F1D0 8007E9D0 B6FA0108 */  j          .L8007EAD8
/* 6F1D4 8007E9D4 00000000 */   nop
.L8007E9D8:
/* 6F1D8 8007E9D8 21204002 */  addu       $a0, $s2, $zero
/* 6F1DC 8007E9DC 3019020C */  jal        MONSENSE_SenseInstance
/* 6F1E0 8007E9E0 21286002 */   addu      $a1, $s3, $zero
/* 6F1E4 8007E9E4 B6FA0108 */  j          .L8007EAD8
/* 6F1E8 8007E9E8 00000000 */   nop
.L8007E9EC:
/* 6F1EC 8007E9EC 21204002 */  addu       $a0, $s2, $zero
/* 6F1F0 8007E9F0 1D0D020C */  jal        MON_RelocateCoords
/* 6F1F4 8007E9F4 21286002 */   addu      $a1, $s3, $zero
/* 6F1F8 8007E9F8 B6FA0108 */  j          .L8007EAD8
/* 6F1FC 8007E9FC 00000000 */   nop
.L8007EA00:
/* 6F200 8007EA00 21204002 */  addu       $a0, $s2, $zero
/* 6F204 8007EA04 E270010C */  jal        STREAM_SetInstancePosition
/* 6F208 8007EA08 21286002 */   addu      $a1, $s3, $zero
/* 6F20C 8007EA0C B6FA0108 */  j          .L8007EAD8
/* 6F210 8007EA10 00000000 */   nop
.L8007EA14:
/* 6F214 8007EA14 00006296 */  lhu        $v0, 0x0($s3)
/* 6F218 8007EA18 00000000 */  nop
/* 6F21C 8007EA1C 740042A6 */  sh         $v0, 0x74($s2)
/* 6F220 8007EA20 02006296 */  lhu        $v0, 0x2($s3)
/* 6F224 8007EA24 00000000 */  nop
/* 6F228 8007EA28 760042A6 */  sh         $v0, 0x76($s2)
/* 6F22C 8007EA2C 04006296 */  lhu        $v0, 0x4($s3)
/* 6F230 8007EA30 B6FA0108 */  j          .L8007EAD8
/* 6F234 8007EA34 780042A6 */   sh        $v0, 0x78($s2)
.L8007EA38:
/* 6F238 8007EA38 04006012 */  beqz       $s3, .L8007EA4C
/* 6F23C 8007EA3C FBFF0324 */   addiu     $v1, $zero, -0x5
/* 6F240 8007EA40 0000028E */  lw         $v0, 0x0($s0)
/* 6F244 8007EA44 96FA0108 */  j          .L8007EA58
/* 6F248 8007EA48 04004234 */   ori       $v0, $v0, 0x4
.L8007EA4C:
/* 6F24C 8007EA4C 0000028E */  lw         $v0, 0x0($s0)
/* 6F250 8007EA50 00000000 */  nop
/* 6F254 8007EA54 24104300 */  and        $v0, $v0, $v1
.L8007EA58:
/* 6F258 8007EA58 000002AE */  sw         $v0, 0x0($s0)
/* 6F25C 8007EA5C 9801438E */  lw         $v1, 0x198($s2)
/* 6F260 8007EA60 01000224 */  addiu      $v0, $zero, 0x1
/* 6F264 8007EA64 07006210 */  beq        $v1, $v0, .L8007EA84
/* 6F268 8007EA68 05000224 */   addiu     $v0, $zero, 0x5
/* 6F26C 8007EA6C 05006210 */  beq        $v1, $v0, .L8007EA84
/* 6F270 8007EA70 1C000224 */   addiu     $v0, $zero, 0x1C
/* 6F274 8007EA74 03006210 */  beq        $v1, $v0, .L8007EA84
/* 6F278 8007EA78 13000224 */   addiu     $v0, $zero, 0x13
/* 6F27C 8007EA7C 16006214 */  bne        $v1, $v0, .L8007EAD8
/* 6F280 8007EA80 00000000 */   nop
.L8007EA84:
/* 6F284 8007EA84 21204002 */  addu       $a0, $s2, $zero
/* 6F288 8007EA88 D0FE010C */  jal        MON_SwitchStateDoEntry
/* 6F28C 8007EA8C 02000524 */   addiu     $a1, $zero, 0x2
/* 6F290 8007EA90 B6FA0108 */  j          .L8007EAD8
/* 6F294 8007EA94 00000000 */   nop
.L8007EA98:
/* 6F298 8007EA98 06006012 */  beqz       $s3, .L8007EAB4
/* 6F29C 8007EA9C 0800033C */   lui       $v1, (0x80000 >> 16)
/* 6F2A0 8007EAA0 0000028E */  lw         $v0, 0x0($s0)
/* 6F2A4 8007EAA4 00000000 */  nop
/* 6F2A8 8007EAA8 25104300 */  or         $v0, $v0, $v1
/* 6F2AC 8007EAAC B6FA0108 */  j          .L8007EAD8
/* 6F2B0 8007EAB0 000002AE */   sw        $v0, 0x0($s0)
.L8007EAB4:
/* 6F2B4 8007EAB4 F7FF033C */  lui        $v1, (0xFFF7FFFF >> 16)
/* 6F2B8 8007EAB8 0000028E */  lw         $v0, 0x0($s0)
/* 6F2BC 8007EABC FFFF6334 */  ori        $v1, $v1, (0xFFF7FFFF & 0xFFFF)
/* 6F2C0 8007EAC0 24104300 */  and        $v0, $v0, $v1
/* 6F2C4 8007EAC4 B6FA0108 */  j          .L8007EAD8
/* 6F2C8 8007EAC8 000002AE */   sw        $v0, 0x0($s0)
.L8007EACC:
/* 6F2CC 8007EACC 21282002 */  addu       $a1, $s1, $zero
.L8007EAD0:
/* 6F2D0 8007EAD0 4EC3010C */  jal        EnMessageQueueData
/* 6F2D4 8007EAD4 21306002 */   addu      $a2, $s3, $zero
.L8007EAD8:
/* 6F2D8 8007EAD8 2000BF8F */  lw         $ra, 0x20($sp)
/* 6F2DC 8007EADC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 6F2E0 8007EAE0 1800B28F */  lw         $s2, 0x18($sp)
/* 6F2E4 8007EAE4 1400B18F */  lw         $s1, 0x14($sp)
/* 6F2E8 8007EAE8 1000B08F */  lw         $s0, 0x10($sp)
/* 6F2EC 8007EAEC 0800E003 */  jr         $ra
/* 6F2F0 8007EAF0 2800BD27 */   addiu     $sp, $sp, 0x28
.size MonsterMessage, . - MonsterMessage

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUL_ReanimateEntry
/* 7F10C 8008E90C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7F110 8008E910 1400B1AF */  sw         $s1, 0x14($sp)
/* 7F114 8008E914 21888000 */  addu       $s1, $a0, $zero
/* 7F118 8008E918 1800BFAF */  sw         $ra, 0x18($sp)
/* 7F11C 8008E91C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7F120 8008E920 6C01308E */  lw         $s0, 0x16C($s1)
/* 7F124 8008E924 00000000 */  nop
/* 7F128 8008E928 D800048E */  lw         $a0, 0xD8($s0)
/* 7F12C 8008E92C 62D2000C */  jal        INSTANCE_Find
/* 7F130 8008E930 00000000 */   nop
/* 7F134 8008E934 5C004394 */  lhu        $v1, 0x5C($v0)
/* 7F138 8008E938 00000000 */  nop
/* 7F13C 8008E93C 240103A6 */  sh         $v1, 0x124($s0)
/* 7F140 8008E940 5E004394 */  lhu        $v1, 0x5E($v0)
/* 7F144 8008E944 00000000 */  nop
/* 7F148 8008E948 260103A6 */  sh         $v1, 0x126($s0)
/* 7F14C 8008E94C 60004294 */  lhu        $v0, 0x60($v0)
/* 7F150 8008E950 21202002 */  addu       $a0, $s1, $zero
/* 7F154 8008E954 A0004224 */  addiu      $v0, $v0, 0xA0
/* 7F158 8008E958 24FE010C */  jal        MON_TurnOffBodySpheres
/* 7F15C 8008E95C 280102A6 */   sh        $v0, 0x128($s0)
/* 7F160 8008E960 1800BF8F */  lw         $ra, 0x18($sp)
/* 7F164 8008E964 1400B18F */  lw         $s1, 0x14($sp)
/* 7F168 8008E968 1000B08F */  lw         $s0, 0x10($sp)
/* 7F16C 8008E96C 0800E003 */  jr         $ra
/* 7F170 8008E970 2000BD27 */   addiu     $sp, $sp, 0x20
.size SOUL_ReanimateEntry, . - SOUL_ReanimateEntry

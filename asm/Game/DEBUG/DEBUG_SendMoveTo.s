.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_SendMoveTo
/* 3908 80013108 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 390C 8001310C 1400BFAF */  sw         $ra, 0x14($sp)
/* 3910 80013110 3AF2020C */  jal        rand
/* 3914 80013114 1000B0AF */   sw        $s0, 0x10($sp)
/* 3918 80013118 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 391C 8001311C 00000000 */  nop
/* 3920 80013120 5C007084 */  lh         $s0, 0x5C($v1)
/* 3924 80013124 FF074230 */  andi       $v0, $v0, 0x7FF
/* 3928 80013128 21800202 */  addu       $s0, $s0, $v0
/* 392C 8001312C 3AF2020C */  jal        rand
/* 3930 80013130 00FC1026 */   addiu     $s0, $s0, -0x400
/* 3934 80013134 21200002 */  addu       $a0, $s0, $zero
/* 3938 80013138 F4BD838F */  lw         $v1, %gp_rel(gameTrackerX + 0x2C)($gp)
/* 393C 8001313C FF074230 */  andi       $v0, $v0, 0x7FF
/* 3940 80013140 5E006584 */  lh         $a1, 0x5E($v1)
/* 3944 80013144 60006684 */  lh         $a2, 0x60($v1)
/* 3948 80013148 2128A200 */  addu       $a1, $a1, $v0
/* 394C 8001314C 3CC4010C */  jal        SetPositionData
/* 3950 80013150 00FCA524 */   addiu     $a1, $a1, -0x400
/* 3954 80013154 21200000 */  addu       $a0, $zero, $zero
/* 3958 80013158 0E000524 */  addiu      $a1, $zero, 0xE
/* 395C 8001315C 0400063C */  lui        $a2, (0x4000C >> 16)
/* 3960 80013160 0C00C634 */  ori        $a2, $a2, (0x4000C & 0xFFFF)
/* 3964 80013164 BAD1000C */  jal        INSTANCE_Broadcast
/* 3968 80013168 21384000 */   addu      $a3, $v0, $zero
/* 396C 8001316C 1400BF8F */  lw         $ra, 0x14($sp)
/* 3970 80013170 1000B08F */  lw         $s0, 0x10($sp)
/* 3974 80013174 0800E003 */  jr         $ra
/* 3978 80013178 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_SendMoveTo, . - DEBUG_SendMoveTo

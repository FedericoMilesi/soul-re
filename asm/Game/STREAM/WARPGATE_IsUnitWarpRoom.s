.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel WARPGATE_IsUnitWarpRoom
/* 4BE04 8005B604 0800828C */  lw         $v0, 0x8($a0)
/* 4BE08 8005B608 00000000 */  nop
/* 4BE0C 8005B60C 0000428C */  lw         $v0, 0x0($v0)
/* 4BE10 8005B610 21200000 */  addu       $a0, $zero, $zero
/* 4BE14 8005B614 3000428C */  lw         $v0, 0x30($v0)
/* 4BE18 8005B618 21288000 */  addu       $a1, $a0, $zero
/* 4BE1C 8005B61C 0000468C */  lw         $a2, 0x0($v0)
/* 4BE20 8005B620 00000000 */  nop
/* 4BE24 8005B624 0B00C018 */  blez       $a2, .L8005B654
/* 4BE28 8005B628 04004324 */   addiu     $v1, $v0, 0x4
.L8005B62C:
/* 4BE2C 8005B62C 1E006294 */  lhu        $v0, 0x1E($v1)
/* 4BE30 8005B630 00000000 */  nop
/* 4BE34 8005B634 01004230 */  andi       $v0, $v0, 0x1
/* 4BE38 8005B638 02004010 */  beqz       $v0, .L8005B644
/* 4BE3C 8005B63C 00000000 */   nop
/* 4BE40 8005B640 01000524 */  addiu      $a1, $zero, 0x1
.L8005B644:
/* 4BE44 8005B644 01008424 */  addiu      $a0, $a0, 0x1
/* 4BE48 8005B648 2A108600 */  slt        $v0, $a0, $a2
/* 4BE4C 8005B64C F7FF4014 */  bnez       $v0, .L8005B62C
/* 4BE50 8005B650 5C006324 */   addiu     $v1, $v1, 0x5C
.L8005B654:
/* 4BE54 8005B654 0800E003 */  jr         $ra
/* 4BE58 8005B658 2110A000 */   addu      $v0, $a1, $zero
.size WARPGATE_IsUnitWarpRoom, . - WARPGATE_IsUnitWarpRoom

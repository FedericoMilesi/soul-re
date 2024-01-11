.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_GetNodeWithID
/* 89B74 80099374 ECF5828F */  lw         $v0, %gp_rel(poolManagementData)($gp)
/* 89B78 80099378 00000000 */  nop
/* 89B7C 8009937C 01004290 */  lbu        $v0, 0x1($v0)
/* 89B80 80099380 00000000 */  nop
/* 89B84 80099384 14004010 */  beqz       $v0, .L800993D8
/* 89B88 80099388 21180000 */   addu      $v1, $zero, $zero
/* 89B8C 8009938C 21404000 */  addu       $t0, $v0, $zero
.L80099390:
/* 89B90 80099390 14008294 */  lhu        $v0, 0x14($a0)
/* 89B94 80099394 00000000 */  nop
/* 89B98 80099398 0B004514 */  bne        $v0, $a1, .L800993C8
/* 89B9C 8009939C 00000000 */   nop
/* 89BA0 800993A0 16008294 */  lhu        $v0, 0x16($a0)
/* 89BA4 800993A4 00000000 */  nop
/* 89BA8 800993A8 07004614 */  bne        $v0, $a2, .L800993C8
/* 89BAC 800993AC 00000000 */   nop
/* 89BB0 800993B0 1800828C */  lw         $v0, 0x18($a0)
/* 89BB4 800993B4 00000000 */  nop
/* 89BB8 800993B8 04004714 */  bne        $v0, $a3, .L800993CC
/* 89BBC 800993BC 01006324 */   addiu     $v1, $v1, 0x1
/* 89BC0 800993C0 0800E003 */  jr         $ra
/* 89BC4 800993C4 21108000 */   addu      $v0, $a0, $zero
.L800993C8:
/* 89BC8 800993C8 01006324 */  addiu      $v1, $v1, 0x1
.L800993CC:
/* 89BCC 800993CC 2A106800 */  slt        $v0, $v1, $t0
/* 89BD0 800993D0 EFFF4014 */  bnez       $v0, .L80099390
/* 89BD4 800993D4 1C008424 */   addiu     $a0, $a0, 0x1C
.L800993D8:
/* 89BD8 800993D8 0800E003 */  jr         $ra
/* 89BDC 800993DC 21100000 */   addu      $v0, $zero, $zero
.size PLANPOOL_GetNodeWithID, . - PLANPOOL_GetNodeWithID

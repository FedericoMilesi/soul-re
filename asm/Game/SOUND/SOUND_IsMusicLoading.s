.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_IsMusicLoading
/* 31210 80040A10 2CC3838F */  lw         $v1, %gp_rel(musicInfo)($gp)
/* 31214 80040A14 01000224 */  addiu      $v0, $zero, 0x1
/* 31218 80040A18 06006210 */  beq        $v1, $v0, .L80040A34
/* 3121C 80040A1C 21200000 */   addu      $a0, $zero, $zero
/* 31220 80040A20 03000224 */  addiu      $v0, $zero, 0x3
/* 31224 80040A24 03006210 */  beq        $v1, $v0, .L80040A34
/* 31228 80040A28 07000224 */   addiu     $v0, $zero, 0x7
/* 3122C 80040A2C 02006214 */  bne        $v1, $v0, .L80040A38
/* 31230 80040A30 00000000 */   nop
.L80040A34:
/* 31234 80040A34 01000424 */  addiu      $a0, $zero, 0x1
.L80040A38:
/* 31238 80040A38 0800E003 */  jr         $ra
/* 3123C 80040A3C 21108000 */   addu      $v0, $a0, $zero
.size SOUND_IsMusicLoading, . - SOUND_IsMusicLoading

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANPOOL_CountBitsSetInLong
/* 89A20 80099220 05008010 */  beqz       $a0, .L80099238
/* 89A24 80099224 21180000 */   addu      $v1, $zero, $zero
.L80099228:
/* 89A28 80099228 FFFF8224 */  addiu      $v0, $a0, -0x1
/* 89A2C 8009922C 24208200 */  and        $a0, $a0, $v0
/* 89A30 80099230 FDFF8014 */  bnez       $a0, .L80099228
/* 89A34 80099234 01006324 */   addiu     $v1, $v1, 0x1
.L80099238:
/* 89A38 80099238 0800E003 */  jr         $ra
/* 89A3C 8009923C 21106000 */   addu      $v0, $v1, $zero
.size PLANPOOL_CountBitsSetInLong, . - PLANPOOL_CountBitsSetInLong

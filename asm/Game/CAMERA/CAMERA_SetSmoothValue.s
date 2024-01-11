.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CAMERA_SetSmoothValue
/* 7588 80016D88 1100A014 */  bnez       $a1, .L80016DD0
/* 758C 80016D8C C40185A4 */   sh        $a1, 0x1C4($a0)
/* 7590 80016D90 F0008394 */  lhu        $v1, 0xF0($a0)
/* 7594 80016D94 00000000 */  nop
/* 7598 80016D98 F4FF6224 */  addiu      $v0, $v1, -0xC
/* 759C 80016D9C 0200422C */  sltiu      $v0, $v0, 0x2
/* 75A0 80016DA0 05004014 */  bnez       $v0, .L80016DB8
/* 75A4 80016DA4 00140300 */   sll       $v0, $v1, 16
/* 75A8 80016DA8 03140200 */  sra        $v0, $v0, 16
/* 75AC 80016DAC 10000324 */  addiu      $v1, $zero, 0x10
/* 75B0 80016DB0 07004314 */  bne        $v0, $v1, .L80016DD0
/* 75B4 80016DB4 00000000 */   nop
.L80016DB8:
/* 75B8 80016DB8 AD018688 */  lwl        $a2, 0x1AD($a0)
/* 75BC 80016DBC AA018698 */  lwr        $a2, 0x1AA($a0)
/* 75C0 80016DC0 AE018784 */  lh         $a3, 0x1AE($a0)
/* 75C4 80016DC4 030186A8 */  swl        $a2, 0x103($a0)
/* 75C8 80016DC8 000186B8 */  swr        $a2, 0x100($a0)
/* 75CC 80016DCC 040187A4 */  sh         $a3, 0x104($a0)
.L80016DD0:
/* 75D0 80016DD0 0800E003 */  jr         $ra
/* 75D4 80016DD4 00000000 */   nop
.size CAMERA_SetSmoothValue, . - CAMERA_SetSmoothValue

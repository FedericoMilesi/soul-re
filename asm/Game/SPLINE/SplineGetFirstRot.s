.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetFirstRot
/* 31F10 80041710 07008010 */  beqz       $a0, .L80041730
/* 31F14 80041714 00000000 */   nop
/* 31F18 80041718 0400A0AC */  sw         $zero, 0x4($a1)
/* 31F1C 8004171C 0000A0A4 */  sh         $zero, 0x0($a1)
/* 31F20 80041720 0200A0A4 */  sh         $zero, 0x2($a1)
/* 31F24 80041724 0000828C */  lw         $v0, 0x0($a0)
/* 31F28 80041728 0800E003 */  jr         $ra
/* 31F2C 8004172C 02004224 */   addiu     $v0, $v0, 0x2
.L80041730:
/* 31F30 80041730 0800E003 */  jr         $ra
/* 31F34 80041734 21100000 */   addu      $v0, $zero, $zero
.size SplineGetFirstRot, . - SplineGetFirstRot

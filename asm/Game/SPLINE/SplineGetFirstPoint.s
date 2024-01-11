.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SplineGetFirstPoint
/* 31F38 80041738 07008010 */  beqz       $a0, .L80041758
/* 31F3C 8004173C 00000000 */   nop
/* 31F40 80041740 0400A0AC */  sw         $zero, 0x4($a1)
/* 31F44 80041744 0000A0A4 */  sh         $zero, 0x0($a1)
/* 31F48 80041748 0200A0A4 */  sh         $zero, 0x2($a1)
/* 31F4C 8004174C 0000828C */  lw         $v0, 0x0($a0)
/* 31F50 80041750 0800E003 */  jr         $ra
/* 31F54 80041754 02004224 */   addiu     $v0, $v0, 0x2
.L80041758:
/* 31F58 80041758 0800E003 */  jr         $ra
/* 31F5C 8004175C 21100000 */   addu      $v0, $zero, $zero
.size SplineGetFirstPoint, . - SplineGetFirstPoint

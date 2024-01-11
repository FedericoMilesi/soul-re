.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RelocatePlanMarkers
/* 4C8D8 8005C0D8 0000C994 */  lhu        $t1, 0x0($a2)
/* 4C8DC 8005C0DC 0200C894 */  lhu        $t0, 0x2($a2)
/* 4C8E0 8005C0E0 0400C694 */  lhu        $a2, 0x4($a2)
/* 4C8E4 8005C0E4 0F00A010 */  beqz       $a1, .L8005C124
/* 4C8E8 8005C0E8 21388000 */   addu      $a3, $a0, $zero
/* 4C8EC 8005C0EC 04008424 */  addiu      $a0, $a0, 0x4
.L8005C0F0:
/* 4C8F0 8005C0F0 0000E294 */  lhu        $v0, 0x0($a3)
/* 4C8F4 8005C0F4 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 4C8F8 8005C0F8 21104900 */  addu       $v0, $v0, $t1
/* 4C8FC 8005C0FC 0000E2A4 */  sh         $v0, 0x0($a3)
/* 4C900 8005C100 0800E724 */  addiu      $a3, $a3, 0x8
/* 4C904 8005C104 FEFF8294 */  lhu        $v0, -0x2($a0)
/* 4C908 8005C108 00008394 */  lhu        $v1, 0x0($a0)
/* 4C90C 8005C10C 21104800 */  addu       $v0, $v0, $t0
/* 4C910 8005C110 21186600 */  addu       $v1, $v1, $a2
/* 4C914 8005C114 FEFF82A4 */  sh         $v0, -0x2($a0)
/* 4C918 8005C118 000083A4 */  sh         $v1, 0x0($a0)
/* 4C91C 8005C11C F4FFA014 */  bnez       $a1, .L8005C0F0
/* 4C920 8005C120 08008424 */   addiu     $a0, $a0, 0x8
.L8005C124:
/* 4C924 8005C124 0800E003 */  jr         $ra
/* 4C928 8005C128 00000000 */   nop
.size RelocatePlanMarkers, . - RelocatePlanMarkers

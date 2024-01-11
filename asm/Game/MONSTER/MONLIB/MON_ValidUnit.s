.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ValidUnit
/* 73D00 80083500 6C01828C */  lw         $v0, 0x16C($a0)
/* 73D04 80083504 00000000 */  nop
/* 73D08 80083508 74014384 */  lh         $v1, 0x174($v0)
/* 73D0C 8008350C 00000000 */  nop
/* 73D10 80083510 03006014 */  bnez       $v1, .L80083520
/* 73D14 80083514 74014424 */   addiu     $a0, $v0, 0x174
.L80083518:
/* 73D18 80083518 0800E003 */  jr         $ra
/* 73D1C 8008351C 01000224 */   addiu     $v0, $zero, 0x1
.L80083520:
/* 73D20 80083520 FFFFA530 */  andi       $a1, $a1, 0xFFFF
.L80083524:
/* 73D24 80083524 00008294 */  lhu        $v0, 0x0($a0)
/* 73D28 80083528 00000000 */  nop
/* 73D2C 8008352C FAFFA210 */  beq        $a1, $v0, .L80083518
/* 73D30 80083530 02008424 */   addiu     $a0, $a0, 0x2
/* 73D34 80083534 00008284 */  lh         $v0, 0x0($a0)
/* 73D38 80083538 00000000 */  nop
/* 73D3C 8008353C F9FF4014 */  bnez       $v0, .L80083524
/* 73D40 80083540 21100000 */   addu      $v0, $zero, $zero
/* 73D44 80083544 0800E003 */  jr         $ra
/* 73D48 80083548 00000000 */   nop
.size MON_ValidUnit, . - MON_ValidUnit

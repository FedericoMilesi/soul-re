.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceQueryMode
/* 62FFC 800727FC FF00A530 */  andi       $a1, $a1, 0xFF
/* 63000 80072800 40100500 */  sll        $v0, $a1, 1
/* 63004 80072804 21104500 */  addu       $v0, $v0, $a1
/* 63008 80072808 00110200 */  sll        $v0, $v0, 4
/* 6300C 8007280C 21104400 */  addu       $v0, $v0, $a0
/* 63010 80072810 EC014390 */  lbu        $v1, 0x1EC($v0)
/* 63014 80072814 00000000 */  nop
/* 63018 80072818 01006230 */  andi       $v0, $v1, 0x1
/* 6301C 8007281C 07004014 */  bnez       $v0, .L8007283C
/* 63020 80072820 21100000 */   addu      $v0, $zero, $zero
/* 63024 80072824 02000224 */  addiu      $v0, $zero, 0x2
/* 63028 80072828 24186200 */  and        $v1, $v1, $v0
/* 6302C 8007282C 03006014 */  bnez       $v1, .L8007283C
/* 63030 80072830 00000000 */   nop
/* 63034 80072834 0800E003 */  jr         $ra
/* 63038 80072838 01000224 */   addiu     $v0, $zero, 0x1
.L8007283C:
/* 6303C 8007283C 0800E003 */  jr         $ra
/* 63040 80072840 00000000 */   nop
.size G2EmulationInstanceQueryMode, . - G2EmulationInstanceQueryMode

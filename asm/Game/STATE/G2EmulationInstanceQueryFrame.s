.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceQueryFrame
/* 62EC8 800726C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 62ECC 800726CC FF00A530 */  andi       $a1, $a1, 0xFF
/* 62ED0 800726D0 40100500 */  sll        $v0, $a1, 1
/* 62ED4 800726D4 21104500 */  addu       $v0, $v0, $a1
/* 62ED8 800726D8 00110200 */  sll        $v0, $v0, 4
/* 62EDC 800726DC EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62EE0 800726E0 1000BFAF */  sw         $ra, 0x10($sp)
/* 62EE4 800726E4 F03F020C */  jal        G2AnimSection_GetKeyframeNumber
/* 62EE8 800726E8 21208200 */   addu      $a0, $a0, $v0
/* 62EEC 800726EC 1000BF8F */  lw         $ra, 0x10($sp)
/* 62EF0 800726F0 00000000 */  nop
/* 62EF4 800726F4 0800E003 */  jr         $ra
/* 62EF8 800726F8 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationInstanceQueryFrame, . - G2EmulationInstanceQueryFrame

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FONT_Get2DImageIndex
/* 1D910 8002D110 FF008430 */  andi       $a0, $a0, 0xFF
/* 1D914 8002D114 F4908227 */  addiu      $v0, $gp, %gp_rel(fontTransTable)
/* 1D918 8002D118 21208200 */  addu       $a0, $a0, $v0
/* 1D91C 8002D11C 00008290 */  lbu        $v0, 0x0($a0)
/* 1D920 8002D120 0800E003 */  jr         $ra
/* 1D924 8002D124 00000000 */   nop
.size FONT_Get2DImageIndex, . - FONT_Get2DImageIndex

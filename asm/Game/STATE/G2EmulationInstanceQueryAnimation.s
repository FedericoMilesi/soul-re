.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceQueryAnimation
/* 62E84 80072684 FF00A530 */  andi       $a1, $a1, 0xFF
/* 62E88 80072688 40100500 */  sll        $v0, $a1, 1
/* 62E8C 8007268C 21104500 */  addu       $v0, $v0, $a1
/* 62E90 80072690 00110200 */  sll        $v0, $v0, 4
/* 62E94 80072694 21104400 */  addu       $v0, $v0, $a0
/* 62E98 80072698 00024294 */  lhu        $v0, 0x200($v0)
/* 62E9C 8007269C 0800E003 */  jr         $ra
/* 62EA0 800726A0 00000000 */   nop
.size G2EmulationInstanceQueryAnimation, . - G2EmulationInstanceQueryAnimation

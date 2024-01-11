.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceSetAnimSpeed
/* 62E68 80072668 FF00A530 */  andi       $a1, $a1, 0xFF
/* 62E6C 8007266C 40100500 */  sll        $v0, $a1, 1
/* 62E70 80072670 21104500 */  addu       $v0, $v0, $a1
/* 62E74 80072674 00110200 */  sll        $v0, $v0, 4
/* 62E78 80072678 21104400 */  addu       $v0, $v0, $a0
/* 62E7C 8007267C 0800E003 */  jr         $ra
/* 62E80 80072680 FC0146AC */   sw        $a2, 0x1FC($v0)
.size G2EmulationInstanceSetAnimSpeed, . - G2EmulationInstanceSetAnimSpeed

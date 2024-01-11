.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceQueryLastFrame
/* 62EFC 800726FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 62F00 80072700 FF00A530 */  andi       $a1, $a1, 0xFF
/* 62F04 80072704 40100500 */  sll        $v0, $a1, 1
/* 62F08 80072708 21104500 */  addu       $v0, $v0, $a1
/* 62F0C 8007270C 00110200 */  sll        $v0, $v0, 4
/* 62F10 80072710 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62F14 80072714 1000BFAF */  sw         $ra, 0x10($sp)
/* 62F18 80072718 0740020C */  jal        G2AnimSection_GetStoredKeyframeNumber
/* 62F1C 8007271C 21208200 */   addu      $a0, $a0, $v0
/* 62F20 80072720 1000BF8F */  lw         $ra, 0x10($sp)
/* 62F24 80072724 00000000 */  nop
/* 62F28 80072728 0800E003 */  jr         $ra
/* 62F2C 8007272C 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2EmulationInstanceQueryLastFrame, . - G2EmulationInstanceQueryLastFrame

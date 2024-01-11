.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RESOLVE_Pointers
/* 2D484 8003CC84 0000878C */  lw         $a3, 0x0($a0)
/* 2D488 8003CC88 0400848C */  lw         $a0, 0x4($a0)
/* 2D48C 8003CC8C 0900E010 */  beqz       $a3, .L8003CCB4
/* 2D490 8003CC90 00000000 */   nop
.L8003CC94:
/* 2D494 8003CC94 0000838C */  lw         $v1, 0x0($a0)
/* 2D498 8003CC98 FFFFE724 */  addiu      $a3, $a3, -0x1
/* 2D49C 8003CC9C 2118A300 */  addu       $v1, $a1, $v1
/* 2D4A0 8003CCA0 0000628C */  lw         $v0, 0x0($v1)
/* 2D4A4 8003CCA4 04008424 */  addiu      $a0, $a0, 0x4
/* 2D4A8 8003CCA8 21104600 */  addu       $v0, $v0, $a2
/* 2D4AC 8003CCAC F9FFE014 */  bnez       $a3, .L8003CC94
/* 2D4B0 8003CCB0 000062AC */   sw        $v0, 0x0($v1)
.L8003CCB4:
/* 2D4B4 8003CCB4 0800E003 */  jr         $ra
/* 2D4B8 8003CCB8 00000000 */   nop
.size RESOLVE_Pointers, . - RESOLVE_Pointers

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MONSENSE_GetMonsterIR
/* 76FC8 800867C8 6C01828C */  lw         $v0, 0x16C($a0)
/* 76FCC 800867CC 00000000 */  nop
/* 76FD0 800867D0 04004010 */  beqz       $v0, .L800867E4
/* 76FD4 800867D4 21184000 */   addu      $v1, $v0, $zero
/* 76FD8 800867D8 0000628C */  lw         $v0, 0x0($v1)
/* 76FDC 800867DC FA190208 */  j          .L800867E8
/* 76FE0 800867E0 6C0182AC */   sw        $v0, 0x16C($a0)
.L800867E4:
/* 76FE4 800867E4 21180000 */  addu       $v1, $zero, $zero
.L800867E8:
/* 76FE8 800867E8 0800E003 */  jr         $ra
/* 76FEC 800867EC 21106000 */   addu      $v0, $v1, $zero
.size MONSENSE_GetMonsterIR, . - MONSENSE_GetMonsterIR

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_SetupFileToDoBufferedCDReading
/* 27F48 80037748 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 27F4C 8003774C 94BB868F */  lw         $a2, %gp_rel(loadStatus)($gp)
/* 27F50 80037750 A0BB838F */  lw         $v1, %gp_rel(loadStatus + 0xC)($gp)
/* 27F54 80037754 06000224 */  addiu      $v0, $zero, 0x6
/* 27F58 80037758 A8BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x14)($gp)
/* 27F5C 8003775C 01000224 */  addiu      $v0, $zero, 0x1
/* 27F60 80037760 1800BFAF */  sw         $ra, 0x18($sp)
/* 27F64 80037764 E8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x54)($gp)
/* 27F68 80037768 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27F6C 8003776C ECBB83AF */  sw         $v1, %gp_rel(loadStatus + 0x58)($gp)
/* 27F70 80037770 0200C104 */  bgez       $a2, .L8003777C
/* 27F74 80037774 00000000 */   nop
/* 27F78 80037778 FF07C624 */  addiu      $a2, $a2, 0x7FF
.L8003777C:
/* 27F7C 8003777C F0BB848F */  lw         $a0, %gp_rel(loadStatus + 0x5C)($gp)
/* 27F80 80037780 C3120600 */  sra        $v0, $a2, 11
/* 27F84 80037784 21208200 */  addu       $a0, $a0, $v0
/* 27F88 80037788 28BC84AF */  sw         $a0, %gp_rel(loadStatus + 0x94)($gp)
/* 27F8C 8003778C 15FC020C */  jal        func_800BF054
/* 27F90 80037790 1000A527 */   addiu     $a1, $sp, 0x10
/* 27F94 80037794 06000424 */  addiu      $a0, $zero, 0x6
/* 27F98 80037798 1000A527 */  addiu      $a1, $sp, 0x10
/* 27F9C 8003779C 50F8020C */  jal        func_800BE140
/* 27FA0 800377A0 21300000 */   addu      $a2, $zero, $zero
/* 27FA4 800377A4 6FF7000C */  jal        TIMER_GetTimeMS
/* 27FA8 800377A8 00000000 */   nop
/* 27FAC 800377AC 1800BF8F */  lw         $ra, 0x18($sp)
/* 27FB0 800377B0 CCBB82AF */  sw         $v0, %gp_rel(loadStatus + 0x38)($gp)
/* 27FB4 800377B4 0800E003 */  jr         $ra
/* 27FB8 800377B8 2000BD27 */   addiu     $sp, $sp, 0x20
.size LOAD_SetupFileToDoBufferedCDReading, . - LOAD_SetupFileToDoBufferedCDReading

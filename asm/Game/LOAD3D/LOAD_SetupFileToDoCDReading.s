.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_SetupFileToDoCDReading
/* 27ECC 800376CC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 27ED0 800376D0 94BB868F */  lw         $a2, %gp_rel(loadStatus)($gp)
/* 27ED4 800376D4 A0BB838F */  lw         $v1, %gp_rel(loadStatus + 0xC)($gp)
/* 27ED8 800376D8 03000224 */  addiu      $v0, $zero, 0x3
/* 27EDC 800376DC A8BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x14)($gp)
/* 27EE0 800376E0 01000224 */  addiu      $v0, $zero, 0x1
/* 27EE4 800376E4 1800BFAF */  sw         $ra, 0x18($sp)
/* 27EE8 800376E8 E8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x54)($gp)
/* 27EEC 800376EC C8BB80AF */  sw         $zero, %gp_rel(loadStatus + 0x34)($gp)
/* 27EF0 800376F0 C0BB82AF */  sw         $v0, %gp_rel(loadStatus + 0x2C)($gp)
/* 27EF4 800376F4 A4BB83AF */  sw         $v1, %gp_rel(loadStatus + 0x10)($gp)
/* 27EF8 800376F8 ECBB83AF */  sw         $v1, %gp_rel(loadStatus + 0x58)($gp)
/* 27EFC 800376FC 0200C104 */  bgez       $a2, .L80037708
/* 27F00 80037700 00000000 */   nop
/* 27F04 80037704 FF07C624 */  addiu      $a2, $a2, 0x7FF
.L80037708:
/* 27F08 80037708 F0BB848F */  lw         $a0, %gp_rel(loadStatus + 0x5C)($gp)
/* 27F0C 8003770C C3120600 */  sra        $v0, $a2, 11
/* 27F10 80037710 21208200 */  addu       $a0, $a0, $v0
/* 27F14 80037714 28BC84AF */  sw         $a0, %gp_rel(loadStatus + 0x94)($gp)
/* 27F18 80037718 15FC020C */  jal        func_800BF054
/* 27F1C 8003771C 1000A527 */   addiu     $a1, $sp, 0x10
/* 27F20 80037720 06000424 */  addiu      $a0, $zero, 0x6
/* 27F24 80037724 1000A527 */  addiu      $a1, $sp, 0x10
/* 27F28 80037728 50F8020C */  jal        func_800BE140
/* 27F2C 8003772C 21300000 */   addu      $a2, $zero, $zero
/* 27F30 80037730 6FF7000C */  jal        TIMER_GetTimeMS
/* 27F34 80037734 00000000 */   nop
/* 27F38 80037738 1800BF8F */  lw         $ra, 0x18($sp)
/* 27F3C 8003773C CCBB82AF */  sw         $v0, %gp_rel(loadStatus + 0x38)($gp)
/* 27F40 80037740 0800E003 */  jr         $ra
/* 27F44 80037744 2000BD27 */   addiu     $sp, $sp, 0x20
.size LOAD_SetupFileToDoCDReading, . - LOAD_SetupFileToDoCDReading

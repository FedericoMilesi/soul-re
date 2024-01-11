.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MAIN_InitVolume
/* 29844 80039044 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 29848 80039048 1000BFAF */  sw         $ra, 0x10($sp)
/* 2984C 8003904C 7647010C */  jal        aadInitVolume
/* 29850 80039050 00000000 */   nop
/* 29854 80039054 00010524 */  addiu      $a1, $zero, 0x100
/* 29858 80039058 78BF848F */  lw         $a0, %gp_rel(gameTrackerX + 0x1B0)($gp)
/* 2985C 8003905C 8F47010C */  jal        aadStartMasterVolumeFade
/* 29860 80039060 21300000 */   addu      $a2, $zero, $zero
/* 29864 80039064 01000224 */  addiu      $v0, $zero, 0x1
/* 29868 80039068 8BBF82A3 */  sb         $v0, %gp_rel(gameTrackerX + 0x1C3)($gp)
/* 2986C 8003906C 2653010C */  jal        aadSetNoUpdateMode
/* 29870 80039070 21200000 */   addu      $a0, $zero, $zero
/* 29874 80039074 1000BF8F */  lw         $ra, 0x10($sp)
/* 29878 80039078 00000000 */  nop
/* 2987C 8003907C 0800E003 */  jr         $ra
/* 29880 80039080 1800BD27 */   addiu     $sp, $sp, 0x18
.size MAIN_InitVolume, . - MAIN_InitVolume

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LOAD_InitCd
/* 27AC8 800372C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 27ACC 800372CC 1000BFAF */  sw         $ra, 0x10($sp)
/* 27AD0 800372D0 61F9020C */  jal        CdInit
/* 27AD4 800372D4 00000000 */   nop
/* 27AD8 800372D8 9FE6020C */  jal        ResetCallback
/* 27ADC 800372DC 00000000 */   nop
/* 27AE0 800372E0 31F8020C */  jal        CdSetDebug
/* 27AE4 800372E4 21200000 */   addu      $a0, $zero, $zero
/* 27AE8 800372E8 1000BF8F */  lw         $ra, 0x10($sp)
/* 27AEC 800372EC 00000000 */  nop
/* 27AF0 800372F0 0800E003 */  jr         $ra
/* 27AF4 800372F4 1800BD27 */   addiu     $sp, $sp, 0x18
.size LOAD_InitCd, . - LOAD_InitCd

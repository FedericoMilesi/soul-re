.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_CleanUp
/* 6D7AC 8007CFAC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6D7B0 8007CFB0 1000BFAF */  sw         $ra, 0x10($sp)
/* 6D7B4 8007CFB4 CC33020C */  jal        MON_CleanUp
/* 6D7B8 8007CFB8 00000000 */   nop
/* 6D7BC 8007CFBC 1000BF8F */  lw         $ra, 0x10($sp)
/* 6D7C0 8007CFC0 00000000 */  nop
/* 6D7C4 8007CFC4 0800E003 */  jr         $ra
/* 6D7C8 8007CFC8 1800BD27 */   addiu     $sp, $sp, 0x18
.size HUMAN_CleanUp, . - HUMAN_CleanUp

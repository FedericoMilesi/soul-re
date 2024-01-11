.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel RAZIEL_DebugHurtRaziel
/* 98660 800A7E60 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 98664 800A7E64 1000BFAF */  sw         $ra, 0x10($sp)
/* 98668 800A7E68 7391020C */  jal        LoseHealth
/* 9866C 800A7E6C 00100424 */   addiu     $a0, $zero, 0x1000
/* 98670 800A7E70 1000BF8F */  lw         $ra, 0x10($sp)
/* 98674 800A7E74 00000000 */  nop
/* 98678 800A7E78 0800E003 */  jr         $ra
/* 9867C 800A7E7C 1800BD27 */   addiu     $sp, $sp, 0x18
.size RAZIEL_DebugHurtRaziel, . - RAZIEL_DebugHurtRaziel

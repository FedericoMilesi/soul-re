.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_UpdateMana
/* 37B0 80012FB0 5C80848F */  lw         $a0, %gp_rel(debugManaLevel)($gp)
/* 37B4 80012FB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 37B8 80012FB8 1000BFAF */  sw         $ra, 0x10($sp)
/* 37BC 80012FBC AF93020C */  jal        RAZIEL_DebugManaSetMax
/* 37C0 80012FC0 00000000 */   nop
/* 37C4 80012FC4 1000BF8F */  lw         $ra, 0x10($sp)
/* 37C8 80012FC8 00000000 */  nop
/* 37CC 80012FCC 0800E003 */  jr         $ra
/* 37D0 80012FD0 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_UpdateMana, . - DEBUG_UpdateMana

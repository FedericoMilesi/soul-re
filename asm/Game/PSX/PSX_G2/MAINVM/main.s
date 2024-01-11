.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel main
/* 86C00 80096400 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 86C04 80096404 1000BFAF */  sw         $ra, 0x10($sp)
/* 86C08 80096408 A8DA020C */  jal        __main
/* 86C0C 8009640C 00000000 */   nop
/* 86C10 80096410 6B94000C */  jal        ClearBss
/* 86C14 80096414 00000000 */   nop
/* 86C18 80096418 98F58427 */  addiu      $a0, $gp, %gp_rel(_appDataVM)
/* 86C1C 8009641C FFE4000C */  jal        MainG2
/* 86C20 80096420 00000000 */   nop
/* 86C24 80096424 1000BF8F */  lw         $ra, 0x10($sp)
/* 86C28 80096428 00000000 */  nop
/* 86C2C 8009642C 0800E003 */  jr         $ra
/* 86C30 80096430 1800BD27 */   addiu     $sp, $sp, 0x18
.size main, . - main

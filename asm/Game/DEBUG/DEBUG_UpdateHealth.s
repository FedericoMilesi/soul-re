.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_UpdateHealth
/* 378C 80012F8C 5880848F */  lw         $a0, %gp_rel(debugHealthLevel)($gp)
/* 3790 80012F90 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3794 80012F94 1000BFAF */  sw         $ra, 0x10($sp)
/* 3798 80012F98 9993020C */  jal        RAZIEL_DebugHealthSetScale
/* 379C 80012F9C 00000000 */   nop
/* 37A0 80012FA0 1000BF8F */  lw         $ra, 0x10($sp)
/* 37A4 80012FA4 00000000 */  nop
/* 37A8 80012FA8 0800E003 */  jr         $ra
/* 37AC 80012FAC 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_UpdateHealth, . - DEBUG_UpdateHealth

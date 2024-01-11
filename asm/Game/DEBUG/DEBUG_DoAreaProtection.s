.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DEBUG_DoAreaProtection
/* 527C 80014A7C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5280 80014A80 1000BFAF */  sw         $ra, 0x10($sp)
.L80014A84:
/* 5284 80014A84 F2F2020C */  jal        checkagain
/* 5288 80014A88 00000000 */   nop
/* 528C 80014A8C FDFF4014 */  bnez       $v0, .L80014A84
/* 5290 80014A90 00000000 */   nop
/* 5294 80014A94 1000BF8F */  lw         $ra, 0x10($sp)
/* 5298 80014A98 00000000 */  nop
/* 529C 80014A9C 0800E003 */  jr         $ra
/* 52A0 80014AA0 1800BD27 */   addiu     $sp, $sp, 0x18
.size DEBUG_DoAreaProtection, . - DEBUG_DoAreaProtection

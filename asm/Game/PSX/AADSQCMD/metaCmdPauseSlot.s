.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdPauseSlot
/* 469A8 800561A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 469AC 800561AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 469B0 800561B0 3C05A490 */  lbu        $a0, 0x53C($a1)
/* 469B4 800561B4 7652010C */  jal        aadPauseSlot
/* 469B8 800561B8 00000000 */   nop
/* 469BC 800561BC 1000BF8F */  lw         $ra, 0x10($sp)
/* 469C0 800561C0 00000000 */  nop
/* 469C4 800561C4 0800E003 */  jr         $ra
/* 469C8 800561C8 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdPauseSlot, . - metaCmdPauseSlot

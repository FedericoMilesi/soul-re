.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdStopSlot
/* 46984 80056184 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46988 80056188 1000BFAF */  sw         $ra, 0x10($sp)
/* 4698C 8005618C 3C05A490 */  lbu        $a0, 0x53C($a1)
/* 46990 80056190 1352010C */  jal        aadStopSlot
/* 46994 80056194 00000000 */   nop
/* 46998 80056198 1000BF8F */  lw         $ra, 0x10($sp)
/* 4699C 8005619C 00000000 */  nop
/* 469A0 800561A0 0800E003 */  jr         $ra
/* 469A4 800561A4 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdStopSlot, . - metaCmdStopSlot

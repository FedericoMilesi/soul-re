.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdResumeSlot
/* 469CC 800561CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 469D0 800561D0 1000BFAF */  sw         $ra, 0x10($sp)
/* 469D4 800561D4 3C05A490 */  lbu        $a0, 0x53C($a1)
/* 469D8 800561D8 8A52010C */  jal        aadResumeSlot
/* 469DC 800561DC 00000000 */   nop
/* 469E0 800561E0 1000BF8F */  lw         $ra, 0x10($sp)
/* 469E4 800561E4 00000000 */  nop
/* 469E8 800561E8 0800E003 */  jr         $ra
/* 469EC 800561EC 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdResumeSlot, . - metaCmdResumeSlot

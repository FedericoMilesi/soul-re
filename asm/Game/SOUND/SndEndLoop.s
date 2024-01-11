.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SndEndLoop
/* 31070 80040870 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 31074 80040874 1000BFAF */  sw         $ra, 0x10($sp)
/* 31078 80040878 D75B010C */  jal        aadStopSfx
/* 3107C 8004087C 00000000 */   nop
/* 31080 80040880 1000BF8F */  lw         $ra, 0x10($sp)
/* 31084 80040884 00000000 */  nop
/* 31088 80040888 0800E003 */  jr         $ra
/* 3108C 8004088C 1800BD27 */   addiu     $sp, $sp, 0x18
.size SndEndLoop, . - SndEndLoop

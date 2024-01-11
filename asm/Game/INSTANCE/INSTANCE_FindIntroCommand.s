.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_FindIntroCommand
/* 23480 80032C80 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 23484 80032C84 1000BFAF */  sw         $ra, 0x10($sp)
/* 23488 80032C88 2800848C */  lw         $a0, 0x28($a0)
/* 2348C 80032C8C 0CCB000C */  jal        INSTANCE_GetIntroCommand
/* 23490 80032C90 00000000 */   nop
/* 23494 80032C94 1000BF8F */  lw         $ra, 0x10($sp)
/* 23498 80032C98 00000000 */  nop
/* 2349C 80032C9C 0800E003 */  jr         $ra
/* 234A0 80032CA0 1800BD27 */   addiu     $sp, $sp, 0x18
.size INSTANCE_FindIntroCommand, . - INSTANCE_FindIntroCommand

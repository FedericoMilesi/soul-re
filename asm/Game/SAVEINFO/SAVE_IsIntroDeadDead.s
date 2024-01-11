.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_IsIntroDeadDead
/* A6D78 800B6578 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A6D7C 800B657C 1000BFAF */  sw         $ra, 0x10($sp)
/* A6D80 800B6580 1400848C */  lw         $a0, 0x14($a0)
/* A6D84 800B6584 33D9020C */  jal        SAVE_IsUniqueIDDeadDead
/* A6D88 800B6588 00000000 */   nop
/* A6D8C 800B658C 1000BF8F */  lw         $ra, 0x10($sp)
/* A6D90 800B6590 00000000 */  nop
/* A6D94 800B6594 0800E003 */  jr         $ra
/* A6D98 800B6598 1800BD27 */   addiu     $sp, $sp, 0x18
.size SAVE_IsIntroDeadDead, . - SAVE_IsIntroDeadDead

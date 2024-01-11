.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SAVE_MarkDeadDead
/* A6DCC 800B65CC 1400828C */  lw         $v0, 0x14($a0)
/* A6DD0 800B65D0 8000033C */  lui        $v1, (0x800000 >> 16)
/* A6DD4 800B65D4 25104300 */  or         $v0, $v0, $v1
/* A6DD8 800B65D8 0800E003 */  jr         $ra
/* A6DDC 800B65DC 140082AC */   sw        $v0, 0x14($a0)
.size SAVE_MarkDeadDead, . - SAVE_MarkDeadDead

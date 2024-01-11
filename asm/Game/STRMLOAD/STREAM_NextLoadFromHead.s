.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_NextLoadFromHead
/* 50780 8005FF80 01000224 */  addiu      $v0, $zero, 0x1
/* 50784 8005FF84 E0A382AF */  sw         $v0, %gp_rel(loadFromHead)($gp)
/* 50788 8005FF88 0800E003 */  jr         $ra
/* 5078C 8005FF8C 00000000 */   nop
.size STREAM_NextLoadFromHead, . - STREAM_NextLoadFromHead

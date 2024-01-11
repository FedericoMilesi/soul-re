.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_IsMorphInProgress
/* 4A248 80059A48 D0BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4A24C 80059A4C 00000000 */  nop
/* 4A250 80059A50 E8034238 */  xori       $v0, $v0, 0x3E8
/* 4A254 80059A54 0800E003 */  jr         $ra
/* 4A258 80059A58 2B100200 */   sltu      $v0, $zero, $v0
.size STREAM_IsMorphInProgress, . - STREAM_IsMorphInProgress

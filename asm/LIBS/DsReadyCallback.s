.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel DsReadyCallback
/* B8118 800C7918 0E80033C */  lui        $v1, %hi(GlobalCallback + 0x4)
/* B811C 800C791C 34FE6324 */  addiu      $v1, $v1, %lo(GlobalCallback + 0x4)
/* B8120 800C7920 0000628C */  lw         $v0, 0x0($v1)
/* B8124 800C7924 0800E003 */  jr         $ra
/* B8128 800C7928 000064AC */   sw        $a0, 0x0($v1)
.size DsReadyCallback, . - DsReadyCallback

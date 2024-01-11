.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_HandleBlendStart
/* EA38 8001E238 0800E003 */  jr         $ra
/* EA3C 8001E23C 01000224 */   addiu     $v0, $zero, 0x1
.size SIGNAL_HandleBlendStart, . - SIGNAL_HandleBlendStart

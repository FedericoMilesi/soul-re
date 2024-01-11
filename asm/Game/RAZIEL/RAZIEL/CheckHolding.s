.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckHolding
/* A428C 800B3A8C 4C01828C */  lw         $v0, 0x14C($a0)
/* A4290 800B3A90 0800E003 */  jr         $ra
/* A4294 800B3A94 2B100200 */   sltu      $v0, $zero, $v0
.size CheckHolding, . - CheckHolding

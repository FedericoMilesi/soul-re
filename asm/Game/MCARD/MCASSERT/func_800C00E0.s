.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C00E0
/* B08E0 800C00E0 0800E003 */  jr         $ra
/* B08E4 800C00E4 21108003 */   addu      $v0, $gp, $zero
/* B08E8 800C00E8 00000000 */  nop
/* B08EC 800C00EC 00000000 */  nop
.size func_800C00E0, . - func_800C00E0

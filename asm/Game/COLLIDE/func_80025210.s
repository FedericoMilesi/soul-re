.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025210
/* 15A10 80025210 21108000 */  addu       $v0, $a0, $zero
/* 15A14 80025214 0800E003 */  jr         $ra
/* 15A18 80025218 00000000 */   nop
.size func_80025210, . - func_80025210

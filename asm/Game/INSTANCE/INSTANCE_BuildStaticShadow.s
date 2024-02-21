.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_BuildStaticShadow
/* 24920 80034120 0800E003 */  jr         $ra
/* 24924 80034124 00000000 */   nop
.size INSTANCE_BuildStaticShadow, . - INSTANCE_BuildStaticShadow

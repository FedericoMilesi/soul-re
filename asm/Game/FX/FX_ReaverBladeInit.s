.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_ReaverBladeInit
/* 3B42C 8004AC2C 0800E003 */  jr         $ra
/* 3B430 8004AC30 00000000 */   nop
.size FX_ReaverBladeInit, . - FX_ReaverBladeInit

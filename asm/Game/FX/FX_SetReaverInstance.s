.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_SetReaverInstance
/* 3B030 8004A830 7C9A84AF */  sw         $a0, %gp_rel(FX_reaver_instance)($gp)
/* 3B034 8004A834 0800E003 */  jr         $ra
/* 3B038 8004A838 00000000 */   nop
.size FX_SetReaverInstance, . - FX_SetReaverInstance

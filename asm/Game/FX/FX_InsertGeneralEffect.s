.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_InsertGeneralEffect
/* 3BC6C 8004B46C 649A828F */  lw         $v0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3BC70 8004B470 649A84AF */  sw         $a0, %gp_rel(FX_GeneralEffectTracker)($gp)
/* 3BC74 8004B474 0800E003 */  jr         $ra
/* 3BC78 8004B478 000082AC */   sw        $v0, 0x0($a0)
.size FX_InsertGeneralEffect, . - FX_InsertGeneralEffect

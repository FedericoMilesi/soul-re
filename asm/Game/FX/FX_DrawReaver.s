.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_DrawReaver
/* 35718 80044F18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3571C 80044F1C 21108000 */  addu       $v0, $a0, $zero
/* 35720 80044F20 1000B0AF */  sw         $s0, 0x10($sp)
/* 35724 80044F24 2180A000 */  addu       $s0, $a1, $zero
/* 35728 80044F28 7C9A848F */  lw         $a0, %gp_rel(FX_reaver_instance)($gp)
/* 3572C 80044F2C 2138C000 */  addu       $a3, $a2, $zero
/* 35730 80044F30 07008010 */  beqz       $a0, .L80044F50
/* 35734 80044F34 1400BFAF */   sw        $ra, 0x14($sp)
/* 35738 80044F38 21284000 */  addu       $a1, $v0, $zero
/* 3573C 80044F3C 0D2B010C */  jal        FX_SoulReaverWinding
/* 35740 80044F40 21300002 */   addu      $a2, $s0, $zero
/* 35744 80044F44 7C9A848F */  lw         $a0, %gp_rel(FX_reaver_instance)($gp)
/* 35748 80044F48 0F2A010C */  jal        FX_SoulReaverBlade
/* 3574C 80044F4C 21280002 */   addu      $a1, $s0, $zero
.L80044F50:
/* 35750 80044F50 1400BF8F */  lw         $ra, 0x14($sp)
/* 35754 80044F54 1000B08F */  lw         $s0, 0x10($sp)
/* 35758 80044F58 7C9A80AF */  sw         $zero, %gp_rel(FX_reaver_instance)($gp)
/* 3575C 80044F5C 0800E003 */  jr         $ra
/* 35760 80044F60 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_DrawReaver, . - FX_DrawReaver

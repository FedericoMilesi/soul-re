.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PlayAnimFromListIfNotPlaying
/* 70680 8007FE80 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 70684 8007FE84 1400B1AF */  sw         $s1, 0x14($sp)
/* 70688 8007FE88 21888000 */  addu       $s1, $a0, $zero
/* 7068C 8007FE8C 2128A600 */  addu       $a1, $a1, $a2
/* 70690 8007FE90 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 70694 8007FE94 1800B2AF */  sw         $s2, 0x18($sp)
/* 70698 8007FE98 1000B0AF */  sw         $s0, 0x10($sp)
/* 7069C 8007FE9C 0000B080 */  lb         $s0, 0x0($a1)
/* 706A0 8007FEA0 2190E000 */  addu       $s2, $a3, $zero
/* 706A4 8007FEA4 79FF010C */  jal        MON_AnimIDPlaying
/* 706A8 8007FEA8 21280002 */   addu      $a1, $s0, $zero
/* 706AC 8007FEAC 04004014 */  bnez       $v0, .L8007FEC0
/* 706B0 8007FEB0 21202002 */   addu      $a0, $s1, $zero
/* 706B4 8007FEB4 21280002 */  addu       $a1, $s0, $zero
/* 706B8 8007FEB8 01FF010C */  jal        MON_PlayAnimID
/* 706BC 8007FEBC 21304002 */   addu      $a2, $s2, $zero
.L8007FEC0:
/* 706C0 8007FEC0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 706C4 8007FEC4 1800B28F */  lw         $s2, 0x18($sp)
/* 706C8 8007FEC8 1400B18F */  lw         $s1, 0x14($sp)
/* 706CC 8007FECC 1000B08F */  lw         $s0, 0x10($sp)
/* 706D0 8007FED0 0800E003 */  jr         $ra
/* 706D4 8007FED4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_PlayAnimFromListIfNotPlaying, . - MON_PlayAnimFromListIfNotPlaying

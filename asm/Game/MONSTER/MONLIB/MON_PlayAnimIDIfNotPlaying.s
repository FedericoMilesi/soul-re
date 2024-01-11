.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_PlayAnimIDIfNotPlaying
/* 70608 8007FE08 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7060C 8007FE0C 1000B0AF */  sw         $s0, 0x10($sp)
/* 70610 8007FE10 21808000 */  addu       $s0, $a0, $zero
/* 70614 8007FE14 1400B1AF */  sw         $s1, 0x14($sp)
/* 70618 8007FE18 2188A000 */  addu       $s1, $a1, $zero
/* 7061C 8007FE1C 1800B2AF */  sw         $s2, 0x18($sp)
/* 70620 8007FE20 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 70624 8007FE24 79FF010C */  jal        MON_AnimIDPlaying
/* 70628 8007FE28 2190C000 */   addu      $s2, $a2, $zero
/* 7062C 8007FE2C 04004014 */  bnez       $v0, .L8007FE40
/* 70630 8007FE30 21200002 */   addu      $a0, $s0, $zero
/* 70634 8007FE34 21282002 */  addu       $a1, $s1, $zero
/* 70638 8007FE38 01FF010C */  jal        MON_PlayAnimID
/* 7063C 8007FE3C 21304002 */   addu      $a2, $s2, $zero
.L8007FE40:
/* 70640 8007FE40 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 70644 8007FE44 1800B28F */  lw         $s2, 0x18($sp)
/* 70648 8007FE48 1400B18F */  lw         $s1, 0x14($sp)
/* 7064C 8007FE4C 1000B08F */  lw         $s0, 0x10($sp)
/* 70650 8007FE50 0800E003 */  jr         $ra
/* 70654 8007FE54 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_PlayAnimIDIfNotPlaying, . - MON_PlayAnimIDIfNotPlaying

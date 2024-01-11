.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceSwitchAnimation
/* 62720 80071F20 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 62724 80071F24 2000B2AF */  sw         $s2, 0x20($sp)
/* 62728 80071F28 2190C000 */  addu       $s2, $a2, $zero
/* 6272C 80071F2C 40100500 */  sll        $v0, $a1, 1
/* 62730 80071F30 21104500 */  addu       $v0, $v0, $a1
/* 62734 80071F34 21284002 */  addu       $a1, $s2, $zero
/* 62738 80071F38 2400B3AF */  sw         $s3, 0x24($sp)
/* 6273C 80071F3C 2198E000 */  addu       $s3, $a3, $zero
/* 62740 80071F40 1800B0AF */  sw         $s0, 0x18($sp)
/* 62744 80071F44 4800B08F */  lw         $s0, 0x48($sp)
/* 62748 80071F48 00110200 */  sll        $v0, $v0, 4
/* 6274C 80071F4C 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 62750 80071F50 4C00B58F */  lw         $s5, 0x4C($sp)
/* 62754 80071F54 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 62758 80071F58 2800B4AF */  sw         $s4, 0x28($sp)
/* 6275C 80071F5C 21A08200 */  addu       $s4, $a0, $v0
/* 62760 80071F60 3000BFAF */  sw         $ra, 0x30($sp)
/* 62764 80071F64 4154020C */  jal        G2Instance_GetKeylist
/* 62768 80071F68 1C00B1AF */   sw        $s1, 0x1C($sp)
/* 6276C 80071F6C 21208002 */  addu       $a0, $s4, $zero
/* 62770 80071F70 21280000 */  addu       $a1, $zero, $zero
/* 62774 80071F74 4240020C */  jal        G2AnimSection_SetAlphaTable
/* 62778 80071F78 21884000 */   addu      $s1, $v0, $zero
/* 6277C 80071F7C 21208002 */  addu       $a0, $s4, $zero
/* 62780 80071F80 21282002 */  addu       $a1, $s1, $zero
/* 62784 80071F84 21304002 */  addu       $a2, $s2, $zero
/* 62788 80071F88 21386002 */  addu       $a3, $s3, $zero
/* 6278C 80071F8C 40101000 */  sll        $v0, $s0, 1
/* 62790 80071F90 21105000 */  addu       $v0, $v0, $s0
/* 62794 80071F94 C0100200 */  sll        $v0, $v0, 3
/* 62798 80071F98 21105000 */  addu       $v0, $v0, $s0
/* 6279C 80071F9C 80140200 */  sll        $v0, $v0, 18
/* 627A0 80071FA0 03140200 */  sra        $v0, $v0, 16
/* 627A4 80071FA4 0F40020C */  jal        G2AnimSection_InterpToKeylistFrame
/* 627A8 80071FA8 1000A2AF */   sw        $v0, 0x10($sp)
/* 627AC 80071FAC 0500A016 */  bnez       $s5, .L80071FC4
/* 627B0 80071FB0 00000000 */   nop
/* 627B4 80071FB4 7B40020C */  jal        G2AnimSection_SetPaused
/* 627B8 80071FB8 21208002 */   addu      $a0, $s4, $zero
/* 627BC 80071FBC FCC70108 */  j          .L80071FF0
/* 627C0 80071FC0 00000000 */   nop
.L80071FC4:
/* 627C4 80071FC4 8040020C */  jal        G2AnimSection_SetUnpaused
/* 627C8 80071FC8 21208002 */   addu      $a0, $s4, $zero
/* 627CC 80071FCC 02000224 */  addiu      $v0, $zero, 0x2
/* 627D0 80071FD0 0500A216 */  bne        $s5, $v0, .L80071FE8
/* 627D4 80071FD4 00000000 */   nop
/* 627D8 80071FD8 5540020C */  jal        G2AnimSection_SetLooping
/* 627DC 80071FDC 21208002 */   addu      $a0, $s4, $zero
/* 627E0 80071FE0 FCC70108 */  j          .L80071FF0
/* 627E4 80071FE4 00000000 */   nop
.L80071FE8:
/* 627E8 80071FE8 7140020C */  jal        G2AnimSection_SetNoLooping
/* 627EC 80071FEC 21208002 */   addu      $a0, $s4, $zero
.L80071FF0:
/* 627F0 80071FF0 3000BF8F */  lw         $ra, 0x30($sp)
/* 627F4 80071FF4 2C00B58F */  lw         $s5, 0x2C($sp)
/* 627F8 80071FF8 2800B48F */  lw         $s4, 0x28($sp)
/* 627FC 80071FFC 2400B38F */  lw         $s3, 0x24($sp)
/* 62800 80072000 2000B28F */  lw         $s2, 0x20($sp)
/* 62804 80072004 1C00B18F */  lw         $s1, 0x1C($sp)
/* 62808 80072008 1800B08F */  lw         $s0, 0x18($sp)
/* 6280C 8007200C 0800E003 */  jr         $ra
/* 62810 80072010 3800BD27 */   addiu     $sp, $sp, 0x38
.size G2EmulationInstanceSwitchAnimation, . - G2EmulationInstanceSwitchAnimation

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceToInstanceSwitchAnimation
/* 62628 80071E28 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 6262C 80071E2C 2000B2AF */  sw         $s2, 0x20($sp)
/* 62630 80071E30 2190E000 */  addu       $s2, $a3, $zero
/* 62634 80071E34 40100600 */  sll        $v0, $a2, 1
/* 62638 80071E38 21104600 */  addu       $v0, $v0, $a2
/* 6263C 80071E3C 00110200 */  sll        $v0, $v0, 4
/* 62640 80071E40 2400B3AF */  sw         $s3, 0x24($sp)
/* 62644 80071E44 4800B38F */  lw         $s3, 0x48($sp)
/* 62648 80071E48 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 6264C 80071E4C 2800B4AF */  sw         $s4, 0x28($sp)
/* 62650 80071E50 21A08200 */  addu       $s4, $a0, $v0
/* 62654 80071E54 1800B0AF */  sw         $s0, 0x18($sp)
/* 62658 80071E58 4C00B08F */  lw         $s0, 0x4C($sp)
/* 6265C 80071E5C 2120A000 */  addu       $a0, $a1, $zero
/* 62660 80071E60 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 62664 80071E64 5000B58F */  lw         $s5, 0x50($sp)
/* 62668 80071E68 21284002 */  addu       $a1, $s2, $zero
/* 6266C 80071E6C 3000BFAF */  sw         $ra, 0x30($sp)
/* 62670 80071E70 4154020C */  jal        G2Instance_GetKeylist
/* 62674 80071E74 1C00B1AF */   sw        $s1, 0x1C($sp)
/* 62678 80071E78 21208002 */  addu       $a0, $s4, $zero
/* 6267C 80071E7C 21280000 */  addu       $a1, $zero, $zero
/* 62680 80071E80 4240020C */  jal        G2AnimSection_SetAlphaTable
/* 62684 80071E84 21884000 */   addu      $s1, $v0, $zero
/* 62688 80071E88 21208002 */  addu       $a0, $s4, $zero
/* 6268C 80071E8C 21282002 */  addu       $a1, $s1, $zero
/* 62690 80071E90 21304002 */  addu       $a2, $s2, $zero
/* 62694 80071E94 40101000 */  sll        $v0, $s0, 1
/* 62698 80071E98 21105000 */  addu       $v0, $v0, $s0
/* 6269C 80071E9C C0100200 */  sll        $v0, $v0, 3
/* 626A0 80071EA0 21105000 */  addu       $v0, $v0, $s0
/* 626A4 80071EA4 80140200 */  sll        $v0, $v0, 18
/* 626A8 80071EA8 03140200 */  sra        $v0, $v0, 16
/* 626AC 80071EAC 21386002 */  addu       $a3, $s3, $zero
/* 626B0 80071EB0 0F40020C */  jal        G2AnimSection_InterpToKeylistFrame
/* 626B4 80071EB4 1000A2AF */   sw        $v0, 0x10($sp)
/* 626B8 80071EB8 0500A016 */  bnez       $s5, .L80071ED0
/* 626BC 80071EBC 00000000 */   nop
/* 626C0 80071EC0 7B40020C */  jal        G2AnimSection_SetPaused
/* 626C4 80071EC4 21208002 */   addu      $a0, $s4, $zero
/* 626C8 80071EC8 BFC70108 */  j          .L80071EFC
/* 626CC 80071ECC 00000000 */   nop
.L80071ED0:
/* 626D0 80071ED0 8040020C */  jal        G2AnimSection_SetUnpaused
/* 626D4 80071ED4 21208002 */   addu      $a0, $s4, $zero
/* 626D8 80071ED8 02000224 */  addiu      $v0, $zero, 0x2
/* 626DC 80071EDC 0500A216 */  bne        $s5, $v0, .L80071EF4
/* 626E0 80071EE0 00000000 */   nop
/* 626E4 80071EE4 5540020C */  jal        G2AnimSection_SetLooping
/* 626E8 80071EE8 21208002 */   addu      $a0, $s4, $zero
/* 626EC 80071EEC BFC70108 */  j          .L80071EFC
/* 626F0 80071EF0 00000000 */   nop
.L80071EF4:
/* 626F4 80071EF4 7140020C */  jal        G2AnimSection_SetNoLooping
/* 626F8 80071EF8 21208002 */   addu      $a0, $s4, $zero
.L80071EFC:
/* 626FC 80071EFC 3000BF8F */  lw         $ra, 0x30($sp)
/* 62700 80071F00 2C00B58F */  lw         $s5, 0x2C($sp)
/* 62704 80071F04 2800B48F */  lw         $s4, 0x28($sp)
/* 62708 80071F08 2400B38F */  lw         $s3, 0x24($sp)
/* 6270C 80071F0C 2000B28F */  lw         $s2, 0x20($sp)
/* 62710 80071F10 1C00B18F */  lw         $s1, 0x1C($sp)
/* 62714 80071F14 1800B08F */  lw         $s0, 0x18($sp)
/* 62718 80071F18 0800E003 */  jr         $ra
/* 6271C 80071F1C 3800BD27 */   addiu     $sp, $sp, 0x38
.size G2EmulationInstanceToInstanceSwitchAnimation, . - G2EmulationInstanceToInstanceSwitchAnimation

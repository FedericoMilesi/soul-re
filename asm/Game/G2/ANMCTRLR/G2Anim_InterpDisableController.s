.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Anim_InterpDisableController
/* 80E74 80090674 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 80E78 80090678 3000B2AF */  sw         $s2, 0x30($sp)
/* 80E7C 8009067C 21908000 */  addu       $s2, $a0, $zero
/* 80E80 80090680 3800B4AF */  sw         $s4, 0x38($sp)
/* 80E84 80090684 21A0A000 */  addu       $s4, $a1, $zero
/* 80E88 80090688 3400B3AF */  sw         $s3, 0x34($sp)
/* 80E8C 8009068C 2198C000 */  addu       $s3, $a2, $zero
/* 80E90 80090690 2800B0AF */  sw         $s0, 0x28($sp)
/* 80E94 80090694 2180E000 */  addu       $s0, $a3, $zero
/* 80E98 80090698 1800A427 */  addiu      $a0, $sp, 0x18
/* 80E9C 8009069C 21280000 */  addu       $a1, $zero, $zero
/* 80EA0 800906A0 06000624 */  addiu      $a2, $zero, 0x6
/* 80EA4 800906A4 4000BFAF */  sw         $ra, 0x40($sp)
/* 80EA8 800906A8 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 80EAC 800906AC 2EF2020C */  jal        memset
/* 80EB0 800906B0 2C00B1AF */   sw        $s1, 0x2C($sp)
/* 80EB4 800906B4 21A80002 */  addu       $s5, $s0, $zero
/* 80EB8 800906B8 00841000 */  sll        $s0, $s0, 16
/* 80EBC 800906BC 03000012 */  beqz       $s0, .L800906CC
/* 80EC0 800906C0 20000224 */   addiu     $v0, $zero, 0x20
/* 80EC4 800906C4 06006216 */  bne        $s3, $v0, .L800906E0
/* 80EC8 800906C8 21208002 */   addu      $a0, $s4, $zero
.L800906CC:
/* 80ECC 800906CC 21204002 */  addu       $a0, $s2, $zero
/* 80ED0 800906D0 21288002 */  addu       $a1, $s4, $zero
/* 80ED4 800906D4 8D41020C */  jal        G2Anim_DisableController
/* 80ED8 800906D8 21306002 */   addu      $a2, $s3, $zero
/* 80EDC 800906DC 21208002 */  addu       $a0, $s4, $zero
.L800906E0:
/* 80EE0 800906E0 21286002 */  addu       $a1, $s3, $zero
/* 80EE4 800906E4 0F48020C */  jal        _G2AnimControllerST_FindInList
/* 80EE8 800906E8 02004626 */   addiu     $a2, $s2, 0x2
/* 80EEC 800906EC 21884000 */  addu       $s1, $v0, $zero
/* 80EF0 800906F0 1F002012 */  beqz       $s1, .L80090770
/* 80EF4 800906F4 08000224 */   addiu     $v0, $zero, 0x8
/* 80EF8 800906F8 02002392 */  lbu        $v1, 0x2($s1)
/* 80EFC 800906FC 00000000 */  nop
/* 80F00 80090700 10006214 */  bne        $v1, $v0, .L80090744
/* 80F04 80090704 00141500 */   sll       $v0, $s5, 16
/* 80F08 80090708 21202002 */  addu       $a0, $s1, $zero
/* 80F0C 8009070C 21284002 */  addu       $a1, $s2, $zero
/* 80F10 80090710 2000B027 */  addiu      $s0, $sp, 0x20
/* 80F14 80090714 EF47020C */  jal        _G2AnimController_GetSimpleWorldRotQuat
/* 80F18 80090718 21300002 */   addu      $a2, $s0, $zero
/* 80F1C 8009071C 00141500 */  sll        $v0, $s5, 16
/* 80F20 80090720 03140200 */  sra        $v0, $v0, 16
/* 80F24 80090724 1000A2AF */  sw         $v0, 0x10($sp)
/* 80F28 80090728 21204002 */  addu       $a0, $s2, $zero
/* 80F2C 8009072C 21288002 */  addu       $a1, $s4, $zero
/* 80F30 80090730 21306002 */  addu       $a2, $s3, $zero
/* 80F34 80090734 E842020C */  jal        G2Anim_SetInterpController_Quat
/* 80F38 80090738 21380002 */   addu      $a3, $s0, $zero
/* 80F3C 8009073C D8410208 */  j          .L80090760
/* 80F40 80090740 00000000 */   nop
.L80090744:
/* 80F44 80090744 03140200 */  sra        $v0, $v0, 16
/* 80F48 80090748 1000A2AF */  sw         $v0, 0x10($sp)
/* 80F4C 8009074C 21204002 */  addu       $a0, $s2, $zero
/* 80F50 80090750 21288002 */  addu       $a1, $s4, $zero
/* 80F54 80090754 21306002 */  addu       $a2, $s3, $zero
/* 80F58 80090758 8F42020C */  jal        G2Anim_SetInterpController_Vector
/* 80F5C 8009075C 1800A727 */   addiu     $a3, $sp, 0x18
.L80090760:
/* 80F60 80090760 08002296 */  lhu        $v0, 0x8($s1)
/* 80F64 80090764 00000000 */  nop
/* 80F68 80090768 00804234 */  ori        $v0, $v0, 0x8000
/* 80F6C 8009076C 080022A6 */  sh         $v0, 0x8($s1)
.L80090770:
/* 80F70 80090770 4000BF8F */  lw         $ra, 0x40($sp)
/* 80F74 80090774 3C00B58F */  lw         $s5, 0x3C($sp)
/* 80F78 80090778 3800B48F */  lw         $s4, 0x38($sp)
/* 80F7C 8009077C 3400B38F */  lw         $s3, 0x34($sp)
/* 80F80 80090780 3000B28F */  lw         $s2, 0x30($sp)
/* 80F84 80090784 2C00B18F */  lw         $s1, 0x2C($sp)
/* 80F88 80090788 2800B08F */  lw         $s0, 0x28($sp)
/* 80F8C 8009078C 0800E003 */  jr         $ra
/* 80F90 80090790 4800BD27 */   addiu     $sp, $sp, 0x48
.size G2Anim_InterpDisableController, . - G2Anim_InterpDisableController

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_DisableHeadMove
/* 72F20 80082720 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 72F24 80082724 1800BFAF */  sw         $ra, 0x18($sp)
/* 72F28 80082728 1400B1AF */  sw         $s1, 0x14($sp)
/* 72F2C 8008272C 1000B0AF */  sw         $s0, 0x10($sp)
/* 72F30 80082730 2400908C */  lw         $s0, 0x24($a0)
/* 72F34 80082734 00000000 */  nop
/* 72F38 80082738 1A000292 */  lbu        $v0, 0x1A($s0)
/* 72F3C 8008273C 00000000 */  nop
/* 72F40 80082740 15004010 */  beqz       $v0, .L80082798
/* 72F44 80082744 C8019124 */   addiu     $s1, $a0, 0x1C8
/* 72F48 80082748 21202002 */  addu       $a0, $s1, $zero
/* 72F4C 8008274C 21284000 */  addu       $a1, $v0, $zero
/* 72F50 80082750 E541020C */  jal        G2Anim_IsControllerActive
/* 72F54 80082754 0E000624 */   addiu     $a2, $zero, 0xE
/* 72F58 80082758 0F004010 */  beqz       $v0, .L80082798
/* 72F5C 8008275C 21202002 */   addu      $a0, $s1, $zero
/* 72F60 80082760 1A000592 */  lbu        $a1, 0x1A($s0)
/* 72F64 80082764 8D41020C */  jal        G2Anim_DisableController
/* 72F68 80082768 0E000624 */   addiu     $a2, $zero, 0xE
/* 72F6C 8008276C 22000392 */  lbu        $v1, 0x22($s0)
/* 72F70 80082770 00000000 */  nop
/* 72F74 80082774 08006010 */  beqz       $v1, .L80082798
/* 72F78 80082778 00000000 */   nop
/* 72F7C 8008277C 1A000292 */  lbu        $v0, 0x1A($s0)
/* 72F80 80082780 00000000 */  nop
/* 72F84 80082784 04006210 */  beq        $v1, $v0, .L80082798
/* 72F88 80082788 21202002 */   addu      $a0, $s1, $zero
/* 72F8C 8008278C 21286000 */  addu       $a1, $v1, $zero
/* 72F90 80082790 8D41020C */  jal        G2Anim_DisableController
/* 72F94 80082794 0E000624 */   addiu     $a2, $zero, 0xE
.L80082798:
/* 72F98 80082798 1800BF8F */  lw         $ra, 0x18($sp)
/* 72F9C 8008279C 1400B18F */  lw         $s1, 0x14($sp)
/* 72FA0 800827A0 1000B08F */  lw         $s0, 0x10($sp)
/* 72FA4 800827A4 0800E003 */  jr         $ra
/* 72FA8 800827A8 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_DisableHeadMove, . - MON_DisableHeadMove

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_EnableHeadMove
/* 72E78 80082678 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 72E7C 8008267C 1800BFAF */  sw         $ra, 0x18($sp)
/* 72E80 80082680 1400B1AF */  sw         $s1, 0x14($sp)
/* 72E84 80082684 1000B0AF */  sw         $s0, 0x10($sp)
/* 72E88 80082688 2400908C */  lw         $s0, 0x24($a0)
/* 72E8C 8008268C 00000000 */  nop
/* 72E90 80082690 1A000292 */  lbu        $v0, 0x1A($s0)
/* 72E94 80082694 00000000 */  nop
/* 72E98 80082698 1C004010 */  beqz       $v0, .L8008270C
/* 72E9C 8008269C C8019124 */   addiu     $s1, $a0, 0x1C8
/* 72EA0 800826A0 21202002 */  addu       $a0, $s1, $zero
/* 72EA4 800826A4 21284000 */  addu       $a1, $v0, $zero
/* 72EA8 800826A8 E541020C */  jal        G2Anim_IsControllerActive
/* 72EAC 800826AC 0E000624 */   addiu     $a2, $zero, 0xE
/* 72EB0 800826B0 16004014 */  bnez       $v0, .L8008270C
/* 72EB4 800826B4 21202002 */   addu      $a0, $s1, $zero
/* 72EB8 800826B8 0E000624 */  addiu      $a2, $zero, 0xE
/* 72EBC 800826BC 1A000592 */  lbu        $a1, 0x1A($s0)
/* 72EC0 800826C0 6F42020C */  jal        G2Anim_SetControllerAngleOrder
/* 72EC4 800826C4 01000724 */   addiu     $a3, $zero, 0x1
/* 72EC8 800826C8 21202002 */  addu       $a0, $s1, $zero
/* 72ECC 800826CC 1A000592 */  lbu        $a1, 0x1A($s0)
/* 72ED0 800826D0 5641020C */  jal        G2Anim_EnableController
/* 72ED4 800826D4 0E000624 */   addiu     $a2, $zero, 0xE
/* 72ED8 800826D8 22000392 */  lbu        $v1, 0x22($s0)
/* 72EDC 800826DC 1A000292 */  lbu        $v0, 0x1A($s0)
/* 72EE0 800826E0 00000000 */  nop
/* 72EE4 800826E4 09006210 */  beq        $v1, $v0, .L8008270C
/* 72EE8 800826E8 21202002 */   addu      $a0, $s1, $zero
/* 72EEC 800826EC 0E000624 */  addiu      $a2, $zero, 0xE
/* 72EF0 800826F0 21286000 */  addu       $a1, $v1, $zero
/* 72EF4 800826F4 6F42020C */  jal        G2Anim_SetControllerAngleOrder
/* 72EF8 800826F8 01000724 */   addiu     $a3, $zero, 0x1
/* 72EFC 800826FC 21202002 */  addu       $a0, $s1, $zero
/* 72F00 80082700 22000592 */  lbu        $a1, 0x22($s0)
/* 72F04 80082704 5641020C */  jal        G2Anim_EnableController
/* 72F08 80082708 0E000624 */   addiu     $a2, $zero, 0xE
.L8008270C:
/* 72F0C 8008270C 1800BF8F */  lw         $ra, 0x18($sp)
/* 72F10 80082710 1400B18F */  lw         $s1, 0x14($sp)
/* 72F14 80082714 1000B08F */  lw         $s0, 0x10($sp)
/* 72F18 80082718 0800E003 */  jr         $ra
/* 72F1C 8008271C 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_EnableHeadMove, . - MON_EnableHeadMove

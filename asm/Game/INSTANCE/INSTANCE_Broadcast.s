.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_Broadcast
/* 24EE8 800346E8 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 24EEC 800346EC D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 24EF0 800346F0 1800B2AF */  sw         $s2, 0x18($sp)
/* 24EF4 800346F4 21908000 */  addu       $s2, $a0, $zero
/* 24EF8 800346F8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 24EFC 800346FC 2198A000 */  addu       $s3, $a1, $zero
/* 24F00 80034700 2000B4AF */  sw         $s4, 0x20($sp)
/* 24F04 80034704 21A0C000 */  addu       $s4, $a2, $zero
/* 24F08 80034708 2400B5AF */  sw         $s5, 0x24($sp)
/* 24F0C 8003470C 2800BFAF */  sw         $ra, 0x28($sp)
/* 24F10 80034710 1400B1AF */  sw         $s1, 0x14($sp)
/* 24F14 80034714 1000B0AF */  sw         $s0, 0x10($sp)
/* 24F18 80034718 0400508C */  lw         $s0, 0x4($v0)
/* 24F1C 8003471C D2BD9187 */  lh         $s1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 24F20 80034720 13000012 */  beqz       $s0, .L80034770
/* 24F24 80034724 21A8E000 */   addu      $s5, $a3, $zero
.L80034728:
/* 24F28 80034728 0D001212 */  beq        $s0, $s2, .L80034760
/* 24F2C 8003472C 21200002 */   addu      $a0, $s0, $zero
/* 24F30 80034730 92D1000C */  jal        INSTANCE_Query
/* 24F34 80034734 01000524 */   addiu     $a1, $zero, 0x1
/* 24F38 80034738 24105300 */  and        $v0, $v0, $s3
/* 24F3C 8003473C 08004010 */  beqz       $v0, .L80034760
/* 24F40 80034740 21200002 */   addu      $a0, $s0, $zero
/* 24F44 80034744 E5D1000C */  jal        INSTANCE_InPlane
/* 24F48 80034748 21282002 */   addu      $a1, $s1, $zero
/* 24F4C 8003474C 04004010 */  beqz       $v0, .L80034760
/* 24F50 80034750 21200002 */   addu      $a0, $s0, $zero
/* 24F54 80034754 21288002 */  addu       $a1, $s4, $zero
/* 24F58 80034758 A1D1000C */  jal        INSTANCE_Post
/* 24F5C 8003475C 2130A002 */   addu      $a2, $s5, $zero
.L80034760:
/* 24F60 80034760 0800108E */  lw         $s0, 0x8($s0)
/* 24F64 80034764 00000000 */  nop
/* 24F68 80034768 EFFF0016 */  bnez       $s0, .L80034728
/* 24F6C 8003476C 00000000 */   nop
.L80034770:
/* 24F70 80034770 2800BF8F */  lw         $ra, 0x28($sp)
/* 24F74 80034774 2400B58F */  lw         $s5, 0x24($sp)
/* 24F78 80034778 2000B48F */  lw         $s4, 0x20($sp)
/* 24F7C 8003477C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 24F80 80034780 1800B28F */  lw         $s2, 0x18($sp)
/* 24F84 80034784 1400B18F */  lw         $s1, 0x14($sp)
/* 24F88 80034788 1000B08F */  lw         $s0, 0x10($sp)
/* 24F8C 8003478C 0800E003 */  jr         $ra
/* 24F90 80034790 3000BD27 */   addiu     $sp, $sp, 0x30
.size INSTANCE_Broadcast, . - INSTANCE_Broadcast

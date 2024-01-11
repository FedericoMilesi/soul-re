.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_AttachedParticlePrimProcess
/* 38F08 80048708 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 38F0C 8004870C 21308000 */  addu       $a2, $a0, $zero
/* 38F10 80048710 1000BFAF */  sw         $ra, 0x10($sp)
/* 38F14 80048714 4200C284 */  lh         $v0, 0x42($a2)
/* 38F18 80048718 1800C38C */  lw         $v1, 0x18($a2)
/* 38F1C 8004871C 40110200 */  sll        $v0, $v0, 5
/* 38F20 80048720 4000648C */  lw         $a0, 0x40($v1)
/* 38F24 80048724 4400638C */  lw         $v1, 0x44($v1)
/* 38F28 80048728 21388200 */  addu       $a3, $a0, $v0
/* 38F2C 8004872C 15008010 */  beqz       $a0, .L80048784
/* 38F30 80048730 21406200 */   addu      $t0, $v1, $v0
/* 38F34 80048734 13006010 */  beqz       $v1, .L80048784
/* 38F38 80048738 00000000 */   nop
/* 38F3C 8004873C 1400E394 */  lhu        $v1, 0x14($a3)
/* 38F40 80048740 14000495 */  lhu        $a0, 0x14($t0)
/* 38F44 80048744 2C00C294 */  lhu        $v0, 0x2C($a2)
/* 38F48 80048748 23186400 */  subu       $v1, $v1, $a0
/* 38F4C 8004874C 21104300 */  addu       $v0, $v0, $v1
/* 38F50 80048750 2C00C2A4 */  sh         $v0, 0x2C($a2)
/* 38F54 80048754 1800E394 */  lhu        $v1, 0x18($a3)
/* 38F58 80048758 18000495 */  lhu        $a0, 0x18($t0)
/* 38F5C 8004875C 2E00C294 */  lhu        $v0, 0x2E($a2)
/* 38F60 80048760 23186400 */  subu       $v1, $v1, $a0
/* 38F64 80048764 21104300 */  addu       $v0, $v0, $v1
/* 38F68 80048768 2E00C2A4 */  sh         $v0, 0x2E($a2)
/* 38F6C 8004876C 1C00E394 */  lhu        $v1, 0x1C($a3)
/* 38F70 80048770 1C000495 */  lhu        $a0, 0x1C($t0)
/* 38F74 80048774 3000C294 */  lhu        $v0, 0x30($a2)
/* 38F78 80048778 23186400 */  subu       $v1, $v1, $a0
/* 38F7C 8004877C 21104300 */  addu       $v0, $v0, $v1
/* 38F80 80048780 3000C2A4 */  sh         $v0, 0x30($a2)
.L80048784:
/* 38F84 80048784 E620010C */  jal        FX_StandardFXPrimProcess
/* 38F88 80048788 2120C000 */   addu      $a0, $a2, $zero
/* 38F8C 8004878C 1000BF8F */  lw         $ra, 0x10($sp)
/* 38F90 80048790 00000000 */  nop
/* 38F94 80048794 0800E003 */  jr         $ra
/* 38F98 80048798 1800BD27 */   addiu     $sp, $sp, 0x18
.size FX_AttachedParticlePrimProcess, . - FX_AttachedParticlePrimProcess

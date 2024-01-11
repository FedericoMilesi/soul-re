.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800B9E70
/* AA670 800B9E70 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* AA674 800B9E74 1400B1AF */  sw         $s1, 0x14($sp)
/* AA678 800B9E78 21888000 */  addu       $s1, $a0, $zero
/* AA67C 800B9E7C 1800B2AF */  sw         $s2, 0x18($sp)
/* AA680 800B9E80 2190A000 */  addu       $s2, $a1, $zero
/* AA684 800B9E84 0D80053C */  lui        $a1, %hi(the_attract_movies + 0x6C)
/* AA688 800B9E88 18C9A524 */  addiu      $a1, $a1, %lo(the_attract_movies + 0x6C)
/* AA68C 800B9E8C 80101100 */  sll        $v0, $s1, 2
/* AA690 800B9E90 21204500 */  addu       $a0, $v0, $a1
/* AA694 800B9E94 2400BFAF */  sw         $ra, 0x24($sp)
/* AA698 800B9E98 2000B4AF */  sw         $s4, 0x20($sp)
/* AA69C 800B9E9C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* AA6A0 800B9EA0 1000B0AF */  sw         $s0, 0x10($sp)
/* AA6A4 800B9EA4 0000948C */  lw         $s4, 0x0($a0)
/* AA6A8 800B9EA8 00000000 */  nop
/* AA6AC 800B9EAC 3A005412 */  beq        $s2, $s4, .L800B9F98
/* AA6B0 800B9EB0 21108002 */   addu      $v0, $s4, $zero
/* AA6B4 800B9EB4 FCFFA294 */  lhu        $v0, -0x4($a1)
/* AA6B8 800B9EB8 00000000 */  nop
/* AA6BC 800B9EBC 35004010 */  beqz       $v0, .L800B9F94
/* AA6C0 800B9EC0 FCFFA624 */   addiu     $a2, $a1, -0x4
/* AA6C4 800B9EC4 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F8)
/* AA6C8 800B9EC8 A4D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F8)($v0)
/* AA6CC 800B9ECC 00000000 */  nop
/* AA6D0 800B9ED0 00004394 */  lhu        $v1, 0x0($v0)
/* AA6D4 800B9ED4 000040A4 */  sh         $zero, 0x0($v0)
/* AA6D8 800B9ED8 09004012 */  beqz       $s2, .L800B9F00
/* AA6DC 800B9EDC FFFF7330 */   andi      $s3, $v1, 0xFFFF
/* AA6E0 800B9EE0 01000324 */  addiu      $v1, $zero, 0x1
/* AA6E4 800B9EE4 04182302 */  sllv       $v1, $v1, $s1
/* AA6E8 800B9EE8 000092AC */  sw         $s2, 0x0($a0)
/* AA6EC 800B9EEC 3000C294 */  lhu        $v0, 0x30($a2)
/* AA6F0 800B9EF0 25986302 */  or         $s3, $s3, $v1
/* AA6F4 800B9EF4 25104300 */  or         $v0, $v0, $v1
/* AA6F8 800B9EF8 C8E70208 */  j          .L800B9F20
/* AA6FC 800B9EFC 3000C2A4 */   sh        $v0, 0x30($a2)
.L800B9F00:
/* AA700 800B9F00 01000224 */  addiu      $v0, $zero, 0x1
/* AA704 800B9F04 04102202 */  sllv       $v0, $v0, $s1
/* AA708 800B9F08 27100200 */  nor        $v0, $zero, $v0
/* AA70C 800B9F0C 000080AC */  sw         $zero, 0x0($a0)
/* AA710 800B9F10 2C00A394 */  lhu        $v1, 0x2C($a1)
/* AA714 800B9F14 24986202 */  and        $s3, $s3, $v0
/* AA718 800B9F18 24186200 */  and        $v1, $v1, $v0
/* AA71C 800B9F1C 2C00A3A4 */  sh         $v1, 0x2C($a1)
.L800B9F20:
/* AA720 800B9F20 08002016 */  bnez       $s1, .L800B9F44
/* AA724 800B9F24 04000224 */   addiu     $v0, $zero, 0x4
/* AA728 800B9F28 0100502E */  sltiu      $s0, $s2, 0x1
/* AA72C 800B9F2C C808030C */  jal        func_800C2320
/* AA730 800B9F30 21200002 */   addu      $a0, $s0, $zero
/* AA734 800B9F34 03000424 */  addiu      $a0, $zero, 0x3
/* AA738 800B9F38 CC08030C */  jal        func_800C2330
/* AA73C 800B9F3C 21280002 */   addu      $a1, $s0, $zero
/* AA740 800B9F40 04000224 */  addiu      $v0, $zero, 0x4
.L800B9F44:
/* AA744 800B9F44 05002216 */  bne        $s1, $v0, .L800B9F5C
/* AA748 800B9F48 05000224 */   addiu     $v0, $zero, 0x5
/* AA74C 800B9F4C 21200000 */  addu       $a0, $zero, $zero
/* AA750 800B9F50 CC08030C */  jal        func_800C2330
/* AA754 800B9F54 0100452E */   sltiu     $a1, $s2, 0x1
/* AA758 800B9F58 05000224 */  addiu      $v0, $zero, 0x5
.L800B9F5C:
/* AA75C 800B9F5C 05002216 */  bne        $s1, $v0, .L800B9F74
/* AA760 800B9F60 06000224 */   addiu     $v0, $zero, 0x6
/* AA764 800B9F64 01000424 */  addiu      $a0, $zero, 0x1
/* AA768 800B9F68 CC08030C */  jal        func_800C2330
/* AA76C 800B9F6C 0100452E */   sltiu     $a1, $s2, 0x1
/* AA770 800B9F70 06000224 */  addiu      $v0, $zero, 0x6
.L800B9F74:
/* AA774 800B9F74 03002216 */  bne        $s1, $v0, .L800B9F84
/* AA778 800B9F78 02000424 */   addiu     $a0, $zero, 0x2
/* AA77C 800B9F7C CC08030C */  jal        func_800C2330
/* AA780 800B9F80 0100452E */   sltiu     $a1, $s2, 0x1
.L800B9F84:
/* AA784 800B9F84 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x10F8)
/* AA788 800B9F88 A4D9428C */  lw         $v0, %lo(the_attract_movies + 0x10F8)($v0)
/* AA78C 800B9F8C 00000000 */  nop
/* AA790 800B9F90 000053A4 */  sh         $s3, 0x0($v0)
.L800B9F94:
/* AA794 800B9F94 21108002 */  addu       $v0, $s4, $zero
.L800B9F98:
/* AA798 800B9F98 2400BF8F */  lw         $ra, 0x24($sp)
/* AA79C 800B9F9C 2000B48F */  lw         $s4, 0x20($sp)
/* AA7A0 800B9FA0 1C00B38F */  lw         $s3, 0x1C($sp)
/* AA7A4 800B9FA4 1800B28F */  lw         $s2, 0x18($sp)
/* AA7A8 800B9FA8 1400B18F */  lw         $s1, 0x14($sp)
/* AA7AC 800B9FAC 1000B08F */  lw         $s0, 0x10($sp)
/* AA7B0 800B9FB0 0800E003 */  jr         $ra
/* AA7B4 800B9FB4 2800BD27 */   addiu     $sp, $sp, 0x28
.size func_800B9E70, . - func_800B9E70

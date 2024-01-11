.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memcard_initialize
/* A9ED8 800B96D8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A9EDC 800B96DC 1000B0AF */  sw         $s0, 0x10($sp)
/* A9EE0 800B96E0 21808000 */  addu       $s0, $a0, $zero
/* A9EE4 800B96E4 1800B2AF */  sw         $s2, 0x18($sp)
/* A9EE8 800B96E8 2190C000 */  addu       $s2, $a2, $zero
/* A9EEC 800B96EC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* A9EF0 800B96F0 2198E000 */  addu       $s3, $a3, $zero
/* A9EF4 800B96F4 21280000 */  addu       $a1, $zero, $zero
/* A9EF8 800B96F8 10000624 */  addiu      $a2, $zero, 0x10
/* A9EFC 800B96FC 2000BFAF */  sw         $ra, 0x20($sp)
/* A9F00 800B9700 2EF2020C */  jal        memset
/* A9F04 800B9704 1400B1AF */   sw        $s1, 0x14($sp)
/* A9F08 800B9708 6CE5020C */  jal        load
/* A9F0C 800B970C 21200002 */   addu      $a0, $s0, $zero
/* A9F10 800B9710 0400028E */  lw         $v0, 0x4($s0)
/* A9F14 800B9714 21880000 */  addu       $s1, $zero, $zero
/* A9F18 800B9718 15004010 */  beqz       $v0, .L800B9770
/* A9F1C 800B971C 0E0000A6 */   sh        $zero, 0xE($s0)
/* A9F20 800B9720 0E80043C */  lui        $a0, %hi(gMcmenu)
/* A9F24 800B9724 08BB8424 */  addiu      $a0, $a0, %lo(gMcmenu)
/* A9F28 800B9728 21280002 */  addu       $a1, $s0, $zero
/* A9F2C 800B972C 080004AE */  sw         $a0, 0x8($s0)
/* A9F30 800B9730 0400428C */  lw         $v0, 0x4($v0)
/* A9F34 800B9734 00000000 */  nop
/* A9F38 800B9738 09F84000 */  jalr       $v0
/* A9F3C 800B973C 21304002 */   addu      $a2, $s2, $zero
/* A9F40 800B9740 0400028E */  lw         $v0, 0x4($s0)
/* A9F44 800B9744 0800048E */  lw         $a0, 0x8($s0)
/* A9F48 800B9748 3800A68F */  lw         $a2, 0x38($sp)
/* A9F4C 800B974C 1400428C */  lw         $v0, 0x14($v0)
/* A9F50 800B9750 00000000 */  nop
/* A9F54 800B9754 09F84000 */  jalr       $v0
/* A9F58 800B9758 21286002 */   addu      $a1, $s3, $zero
/* A9F5C 800B975C 21884000 */  addu       $s1, $v0, $zero
/* A9F60 800B9760 9FE5020C */  jal        unload
/* A9F64 800B9764 21200002 */   addu      $a0, $s0, $zero
/* A9F68 800B9768 DFE50208 */  j          .L800B977C
/* A9F6C 800B976C 21102002 */   addu      $v0, $s1, $zero
.L800B9770:
/* A9F70 800B9770 01000224 */  addiu      $v0, $zero, 0x1
/* A9F74 800B9774 0E0002A6 */  sh         $v0, 0xE($s0)
/* A9F78 800B9778 21102002 */  addu       $v0, $s1, $zero
.L800B977C:
/* A9F7C 800B977C 2000BF8F */  lw         $ra, 0x20($sp)
/* A9F80 800B9780 1C00B38F */  lw         $s3, 0x1C($sp)
/* A9F84 800B9784 1800B28F */  lw         $s2, 0x18($sp)
/* A9F88 800B9788 1400B18F */  lw         $s1, 0x14($sp)
/* A9F8C 800B978C 1000B08F */  lw         $s0, 0x10($sp)
/* A9F90 800B9790 0800E003 */  jr         $ra
/* A9F94 800B9794 2800BD27 */   addiu     $sp, $sp, 0x28
.size memcard_initialize, . - memcard_initialize

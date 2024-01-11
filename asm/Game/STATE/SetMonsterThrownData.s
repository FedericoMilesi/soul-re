.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMonsterThrownData
/* 616C0 80070EC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 616C4 80070EC4 1400B1AF */  sw         $s1, 0x14($sp)
/* 616C8 80070EC8 21888000 */  addu       $s1, $a0, $zero
/* 616CC 80070ECC 1000B0AF */  sw         $s0, 0x10($sp)
/* 616D0 80070ED0 2180A000 */  addu       $s0, $a1, $zero
/* 616D4 80070ED4 1800B2AF */  sw         $s2, 0x18($sp)
/* 616D8 80070ED8 2190C000 */  addu       $s2, $a2, $zero
/* 616DC 80070EDC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 616E0 80070EE0 6DC3010C */  jal        CIRC_Alloc
/* 616E4 80070EE4 10000424 */   addiu     $a0, $zero, 0x10
/* 616E8 80070EE8 000051AC */  sw         $s1, 0x0($v0)
/* 616EC 80070EEC 00000396 */  lhu        $v1, 0x0($s0)
/* 616F0 80070EF0 00000000 */  nop
/* 616F4 80070EF4 040043A4 */  sh         $v1, 0x4($v0)
/* 616F8 80070EF8 02000396 */  lhu        $v1, 0x2($s0)
/* 616FC 80070EFC 00000000 */  nop
/* 61700 80070F00 060043A4 */  sh         $v1, 0x6($v0)
/* 61704 80070F04 04000396 */  lhu        $v1, 0x4($s0)
/* 61708 80070F08 0C0052A4 */  sh         $s2, 0xC($v0)
/* 6170C 80070F0C 080043A4 */  sh         $v1, 0x8($v0)
/* 61710 80070F10 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 61714 80070F14 1800B28F */  lw         $s2, 0x18($sp)
/* 61718 80070F18 1400B18F */  lw         $s1, 0x14($sp)
/* 6171C 80070F1C 1000B08F */  lw         $s0, 0x10($sp)
/* 61720 80070F20 0800E003 */  jr         $ra
/* 61724 80070F24 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetMonsterThrownData, . - SetMonsterThrownData

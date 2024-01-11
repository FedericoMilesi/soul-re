.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMonsterAlarmData
/* 61728 80070F28 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6172C 80070F2C 1400B1AF */  sw         $s1, 0x14($sp)
/* 61730 80070F30 21888000 */  addu       $s1, $a0, $zero
/* 61734 80070F34 1000B0AF */  sw         $s0, 0x10($sp)
/* 61738 80070F38 2180A000 */  addu       $s0, $a1, $zero
/* 6173C 80070F3C 1800B2AF */  sw         $s2, 0x18($sp)
/* 61740 80070F40 2190C000 */  addu       $s2, $a2, $zero
/* 61744 80070F44 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 61748 80070F48 6DC3010C */  jal        CIRC_Alloc
/* 6174C 80070F4C 0C000424 */   addiu     $a0, $zero, 0xC
/* 61750 80070F50 000051AC */  sw         $s1, 0x0($v0)
/* 61754 80070F54 00000396 */  lhu        $v1, 0x0($s0)
/* 61758 80070F58 00000000 */  nop
/* 6175C 80070F5C 040043A4 */  sh         $v1, 0x4($v0)
/* 61760 80070F60 02000396 */  lhu        $v1, 0x2($s0)
/* 61764 80070F64 00000000 */  nop
/* 61768 80070F68 060043A4 */  sh         $v1, 0x6($v0)
/* 6176C 80070F6C 04000396 */  lhu        $v1, 0x4($s0)
/* 61770 80070F70 0A0052A4 */  sh         $s2, 0xA($v0)
/* 61774 80070F74 080043A4 */  sh         $v1, 0x8($v0)
/* 61778 80070F78 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6177C 80070F7C 1800B28F */  lw         $s2, 0x18($sp)
/* 61780 80070F80 1400B18F */  lw         $s1, 0x14($sp)
/* 61784 80070F84 1000B08F */  lw         $s0, 0x10($sp)
/* 61788 80070F88 0800E003 */  jr         $ra
/* 6178C 80070F8C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SetMonsterAlarmData, . - SetMonsterAlarmData

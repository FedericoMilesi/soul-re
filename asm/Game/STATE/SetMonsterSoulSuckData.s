.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMonsterSoulSuckData
/* 61790 80070F90 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61794 80070F94 1000B0AF */  sw         $s0, 0x10($sp)
/* 61798 80070F98 21808000 */  addu       $s0, $a0, $zero
/* 6179C 80070F9C 1400B1AF */  sw         $s1, 0x14($sp)
/* 617A0 80070FA0 2188A000 */  addu       $s1, $a1, $zero
/* 617A4 80070FA4 1800B2AF */  sw         $s2, 0x18($sp)
/* 617A8 80070FA8 2190C000 */  addu       $s2, $a2, $zero
/* 617AC 80070FAC 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 617B0 80070FB0 2198E000 */  addu       $s3, $a3, $zero
/* 617B4 80070FB4 2000BFAF */  sw         $ra, 0x20($sp)
/* 617B8 80070FB8 6DC3010C */  jal        CIRC_Alloc
/* 617BC 80070FBC 0C000424 */   addiu     $a0, $zero, 0xC
/* 617C0 80070FC0 000050AC */  sw         $s0, 0x0($v0)
/* 617C4 80070FC4 040051A4 */  sh         $s1, 0x4($v0)
/* 617C8 80070FC8 060052A4 */  sh         $s2, 0x6($v0)
/* 617CC 80070FCC 080053A4 */  sh         $s3, 0x8($v0)
/* 617D0 80070FD0 2000BF8F */  lw         $ra, 0x20($sp)
/* 617D4 80070FD4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 617D8 80070FD8 1800B28F */  lw         $s2, 0x18($sp)
/* 617DC 80070FDC 1400B18F */  lw         $s1, 0x14($sp)
/* 617E0 80070FE0 1000B08F */  lw         $s0, 0x10($sp)
/* 617E4 80070FE4 0800E003 */  jr         $ra
/* 617E8 80070FE8 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetMonsterSoulSuckData, . - SetMonsterSoulSuckData

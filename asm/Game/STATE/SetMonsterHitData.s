.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetMonsterHitData
/* 61654 80070E54 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61658 80070E58 1400B1AF */  sw         $s1, 0x14($sp)
/* 6165C 80070E5C 21888000 */  addu       $s1, $a0, $zero
/* 61660 80070E60 1800B2AF */  sw         $s2, 0x18($sp)
/* 61664 80070E64 2190A000 */  addu       $s2, $a1, $zero
/* 61668 80070E68 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6166C 80070E6C 2198C000 */  addu       $s3, $a2, $zero
/* 61670 80070E70 2000B4AF */  sw         $s4, 0x20($sp)
/* 61674 80070E74 21A0E000 */  addu       $s4, $a3, $zero
/* 61678 80070E78 1000B0AF */  sw         $s0, 0x10($sp)
/* 6167C 80070E7C 3800B08F */  lw         $s0, 0x38($sp)
/* 61680 80070E80 2400BFAF */  sw         $ra, 0x24($sp)
/* 61684 80070E84 6DC3010C */  jal        CIRC_Alloc
/* 61688 80070E88 10000424 */   addiu     $a0, $zero, 0x10
/* 6168C 80070E8C 000051AC */  sw         $s1, 0x0($v0)
/* 61690 80070E90 040052AC */  sw         $s2, 0x4($v0)
/* 61694 80070E94 0C0053AC */  sw         $s3, 0xC($v0)
/* 61698 80070E98 080054A4 */  sh         $s4, 0x8($v0)
/* 6169C 80070E9C 0A0050A4 */  sh         $s0, 0xA($v0)
/* 616A0 80070EA0 2400BF8F */  lw         $ra, 0x24($sp)
/* 616A4 80070EA4 2000B48F */  lw         $s4, 0x20($sp)
/* 616A8 80070EA8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 616AC 80070EAC 1800B28F */  lw         $s2, 0x18($sp)
/* 616B0 80070EB0 1400B18F */  lw         $s1, 0x14($sp)
/* 616B4 80070EB4 1000B08F */  lw         $s0, 0x10($sp)
/* 616B8 80070EB8 0800E003 */  jr         $ra
/* 616BC 80070EBC 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetMonsterHitData, . - SetMonsterHitData

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetAnimationInstanceSwitchData
/* 61D90 80071590 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61D94 80071594 1400B1AF */  sw         $s1, 0x14($sp)
/* 61D98 80071598 21888000 */  addu       $s1, $a0, $zero
/* 61D9C 8007159C 1800B2AF */  sw         $s2, 0x18($sp)
/* 61DA0 800715A0 2190A000 */  addu       $s2, $a1, $zero
/* 61DA4 800715A4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 61DA8 800715A8 2198C000 */  addu       $s3, $a2, $zero
/* 61DAC 800715AC 2000B4AF */  sw         $s4, 0x20($sp)
/* 61DB0 800715B0 21A0E000 */  addu       $s4, $a3, $zero
/* 61DB4 800715B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 61DB8 800715B8 3800B08F */  lw         $s0, 0x38($sp)
/* 61DBC 800715BC 2400BFAF */  sw         $ra, 0x24($sp)
/* 61DC0 800715C0 6DC3010C */  jal        CIRC_Alloc
/* 61DC4 800715C4 14000424 */   addiu     $a0, $zero, 0x14
/* 61DC8 800715C8 000051AC */  sw         $s1, 0x0($v0)
/* 61DCC 800715CC 040052AC */  sw         $s2, 0x4($v0)
/* 61DD0 800715D0 080053AC */  sw         $s3, 0x8($v0)
/* 61DD4 800715D4 0C0054AC */  sw         $s4, 0xC($v0)
/* 61DD8 800715D8 100050AC */  sw         $s0, 0x10($v0)
/* 61DDC 800715DC 2400BF8F */  lw         $ra, 0x24($sp)
/* 61DE0 800715E0 2000B48F */  lw         $s4, 0x20($sp)
/* 61DE4 800715E4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 61DE8 800715E8 1800B28F */  lw         $s2, 0x18($sp)
/* 61DEC 800715EC 1400B18F */  lw         $s1, 0x14($sp)
/* 61DF0 800715F0 1000B08F */  lw         $s0, 0x10($sp)
/* 61DF4 800715F4 0800E003 */  jr         $ra
/* 61DF8 800715F8 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetAnimationInstanceSwitchData, . - SetAnimationInstanceSwitchData

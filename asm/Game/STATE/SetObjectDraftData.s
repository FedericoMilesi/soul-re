.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjectDraftData
/* 62188 80071988 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 6218C 8007198C 1400B1AF */  sw         $s1, 0x14($sp)
/* 62190 80071990 21888000 */  addu       $s1, $a0, $zero
/* 62194 80071994 1800B2AF */  sw         $s2, 0x18($sp)
/* 62198 80071998 2190A000 */  addu       $s2, $a1, $zero
/* 6219C 8007199C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 621A0 800719A0 2198C000 */  addu       $s3, $a2, $zero
/* 621A4 800719A4 2000B4AF */  sw         $s4, 0x20($sp)
/* 621A8 800719A8 21A0E000 */  addu       $s4, $a3, $zero
/* 621AC 800719AC 1000B0AF */  sw         $s0, 0x10($sp)
/* 621B0 800719B0 3800B08F */  lw         $s0, 0x38($sp)
/* 621B4 800719B4 2400BFAF */  sw         $ra, 0x24($sp)
/* 621B8 800719B8 6DC3010C */  jal        CIRC_Alloc
/* 621BC 800719BC 0A000424 */   addiu     $a0, $zero, 0xA
/* 621C0 800719C0 000051A4 */  sh         $s1, 0x0($v0)
/* 621C4 800719C4 020052A4 */  sh         $s2, 0x2($v0)
/* 621C8 800719C8 040053A4 */  sh         $s3, 0x4($v0)
/* 621CC 800719CC 060054A4 */  sh         $s4, 0x6($v0)
/* 621D0 800719D0 080050A4 */  sh         $s0, 0x8($v0)
/* 621D4 800719D4 2400BF8F */  lw         $ra, 0x24($sp)
/* 621D8 800719D8 2000B48F */  lw         $s4, 0x20($sp)
/* 621DC 800719DC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 621E0 800719E0 1800B28F */  lw         $s2, 0x18($sp)
/* 621E4 800719E4 1400B18F */  lw         $s1, 0x14($sp)
/* 621E8 800719E8 1000B08F */  lw         $s0, 0x10($sp)
/* 621EC 800719EC 0800E003 */  jr         $ra
/* 621F0 800719F0 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetObjectDraftData, . - SetObjectDraftData

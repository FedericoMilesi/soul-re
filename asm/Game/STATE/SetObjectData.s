.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetObjectData
/* 61884 80071084 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 61888 80071088 1400B1AF */  sw         $s1, 0x14($sp)
/* 6188C 8007108C 21888000 */  addu       $s1, $a0, $zero
/* 61890 80071090 1800B2AF */  sw         $s2, 0x18($sp)
/* 61894 80071094 2190A000 */  addu       $s2, $a1, $zero
/* 61898 80071098 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6189C 8007109C 2198C000 */  addu       $s3, $a2, $zero
/* 618A0 800710A0 2000B4AF */  sw         $s4, 0x20($sp)
/* 618A4 800710A4 21A0E000 */  addu       $s4, $a3, $zero
/* 618A8 800710A8 1000B0AF */  sw         $s0, 0x10($sp)
/* 618AC 800710AC 3800B08F */  lw         $s0, 0x38($sp)
/* 618B0 800710B0 2400BFAF */  sw         $ra, 0x24($sp)
/* 618B4 800710B4 6DC3010C */  jal        CIRC_Alloc
/* 618B8 800710B8 10000424 */   addiu     $a0, $zero, 0x10
/* 618BC 800710BC 000051A4 */  sh         $s1, 0x0($v0)
/* 618C0 800710C0 020052A4 */  sh         $s2, 0x2($v0)
/* 618C4 800710C4 040053A4 */  sh         $s3, 0x4($v0)
/* 618C8 800710C8 080054AC */  sw         $s4, 0x8($v0)
/* 618CC 800710CC 060050A4 */  sh         $s0, 0x6($v0)
/* 618D0 800710D0 2400BF8F */  lw         $ra, 0x24($sp)
/* 618D4 800710D4 2000B48F */  lw         $s4, 0x20($sp)
/* 618D8 800710D8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 618DC 800710DC 1800B28F */  lw         $s2, 0x18($sp)
/* 618E0 800710E0 1400B18F */  lw         $s1, 0x14($sp)
/* 618E4 800710E4 1000B08F */  lw         $s0, 0x10($sp)
/* 618E8 800710E8 0800E003 */  jr         $ra
/* 618EC 800710EC 2800BD27 */   addiu     $sp, $sp, 0x28
.size SetObjectData, . - SetObjectData

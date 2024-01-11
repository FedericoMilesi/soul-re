.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_ParryEntry
/* 78A94 80088294 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 78A98 80088298 1400B1AF */  sw         $s1, 0x14($sp)
/* 78A9C 8008829C 21888000 */  addu       $s1, $a0, $zero
/* 78AA0 800882A0 09000524 */  addiu      $a1, $zero, 0x9
/* 78AA4 800882A4 1800BFAF */  sw         $ra, 0x18($sp)
/* 78AA8 800882A8 1000B0AF */  sw         $s0, 0x10($sp)
/* 78AAC 800882AC 6C01308E */  lw         $s0, 0x16C($s1)
/* 78AB0 800882B0 B6FF010C */  jal        MON_PlayAnim
/* 78AB4 800882B4 01000624 */   addiu     $a2, $zero, 0x1
/* 78AB8 800882B8 C400028E */  lw         $v0, 0xC4($s0)
/* 78ABC 800882BC 00100624 */  addiu      $a2, $zero, 0x1000
/* 78AC0 800882C0 0400458C */  lw         $a1, 0x4($v0)
/* 78AC4 800882C4 21202002 */  addu       $a0, $s1, $zero
/* 78AC8 800882C8 6604020C */  jal        MON_TurnToPosition
/* 78ACC 800882CC 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 78AD0 800882D0 1800BF8F */  lw         $ra, 0x18($sp)
/* 78AD4 800882D4 1400B18F */  lw         $s1, 0x14($sp)
/* 78AD8 800882D8 1000B08F */  lw         $s0, 0x10($sp)
/* 78ADC 800882DC 0800E003 */  jr         $ra
/* 78AE0 800882E0 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_ParryEntry, . - MON_ParryEntry

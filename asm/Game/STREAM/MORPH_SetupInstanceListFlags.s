.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_SetupInstanceListFlags
/* 4CF94 8005C794 FCBD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x34)($gp)
/* 4CF98 8005C798 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4CF9C 8005C79C 1400BFAF */  sw         $ra, 0x14($sp)
/* 4CFA0 8005C7A0 1000B0AF */  sw         $s0, 0x10($sp)
/* 4CFA4 8005C7A4 0400508C */  lw         $s0, 0x4($v0)
/* 4CFA8 8005C7A8 00000000 */  nop
/* 4CFAC 8005C7AC 07000012 */  beqz       $s0, .L8005C7CC
/* 4CFB0 8005C7B0 00000000 */   nop
.L8005C7B4:
/* 4CFB4 8005C7B4 9B71010C */  jal        MORPH_SetupInstanceFlags
/* 4CFB8 8005C7B8 21200002 */   addu      $a0, $s0, $zero
/* 4CFBC 8005C7BC 0800108E */  lw         $s0, 0x8($s0)
/* 4CFC0 8005C7C0 00000000 */  nop
/* 4CFC4 8005C7C4 FBFF0016 */  bnez       $s0, .L8005C7B4
/* 4CFC8 8005C7C8 00000000 */   nop
.L8005C7CC:
/* 4CFCC 8005C7CC 1400BF8F */  lw         $ra, 0x14($sp)
/* 4CFD0 8005C7D0 1000B08F */  lw         $s0, 0x10($sp)
/* 4CFD4 8005C7D4 0800E003 */  jr         $ra
/* 4CFD8 8005C7D8 1800BD27 */   addiu     $sp, $sp, 0x18
.size MORPH_SetupInstanceListFlags, . - MORPH_SetupInstanceListFlags

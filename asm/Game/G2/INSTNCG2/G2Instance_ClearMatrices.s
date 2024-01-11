.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2Instance_ClearMatrices
/* 85D58 80095558 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 85D5C 8009555C 1000B0AF */  sw         $s0, 0x10($sp)
/* 85D60 80095560 21808000 */  addu       $s0, $a0, $zero
/* 85D64 80095564 1400BFAF */  sw         $ra, 0x14($sp)
/* 85D68 80095568 4000028E */  lw         $v0, 0x40($s0)
/* 85D6C 8009556C 400000AE */  sw         $zero, 0x40($s0)
/* 85D70 80095570 440002AE */  sw         $v0, 0x44($s0)
/* 85D74 80095574 4C01108E */  lw         $s0, 0x14C($s0)
/* 85D78 80095578 00000000 */  nop
/* 85D7C 8009557C 07000012 */  beqz       $s0, .L8009559C
/* 85D80 80095580 00000000 */   nop
.L80095584:
/* 85D84 80095584 5655020C */  jal        G2Instance_ClearMatrices
/* 85D88 80095588 21200002 */   addu      $a0, $s0, $zero
/* 85D8C 8009558C 5001108E */  lw         $s0, 0x150($s0)
/* 85D90 80095590 00000000 */  nop
/* 85D94 80095594 FBFF0016 */  bnez       $s0, .L80095584
/* 85D98 80095598 00000000 */   nop
.L8009559C:
/* 85D9C 8009559C 1400BF8F */  lw         $ra, 0x14($sp)
/* 85DA0 800955A0 1000B08F */  lw         $s0, 0x10($sp)
/* 85DA4 800955A4 0800E003 */  jr         $ra
/* 85DA8 800955A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size G2Instance_ClearMatrices, . - G2Instance_ClearMatrices

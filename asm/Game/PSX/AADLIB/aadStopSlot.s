.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadStopSlot
/* 4504C 8005484C D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 45050 80054850 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 45054 80054854 1400BFAF */  sw         $ra, 0x14($sp)
/* 45058 80054858 1000B0AF */  sw         $s0, 0x10($sp)
/* 4505C 8005485C 0400628C */  lw         $v0, 0x4($v1)
/* 45060 80054860 21808000 */  addu       $s0, $a0, $zero
/* 45064 80054864 2A100202 */  slt        $v0, $s0, $v0
/* 45068 80054868 0F004010 */  beqz       $v0, .L800548A8
/* 4506C 8005486C 80101000 */   sll       $v0, $s0, 2
/* 45070 80054870 21106200 */  addu       $v0, $v1, $v0
/* 45074 80054874 3400448C */  lw         $a0, 0x34($v0)
/* 45078 80054878 00000000 */  nop
/* 4507C 8005487C 3E058390 */  lbu        $v1, 0x53E($a0)
/* 45080 80054880 FF000224 */  addiu      $v0, $zero, 0xFF
/* 45084 80054884 08006210 */  beq        $v1, $v0, .L800548A8
/* 45088 80054888 00000000 */   nop
/* 4508C 8005488C 40058294 */  lhu        $v0, 0x540($a0)
/* 45090 80054890 00000000 */  nop
/* 45094 80054894 FEFF4230 */  andi       $v0, $v0, 0xFFFE
/* 45098 80054898 DE50010C */  jal        aadInitSequenceSlot
/* 4509C 8005489C 400582A4 */   sh        $v0, 0x540($a0)
/* 450A0 800548A0 AE52010C */  jal        aadAllNotesOff
/* 450A4 800548A4 21200002 */   addu      $a0, $s0, $zero
.L800548A8:
/* 450A8 800548A8 1400BF8F */  lw         $ra, 0x14($sp)
/* 450AC 800548AC 1000B08F */  lw         $s0, 0x10($sp)
/* 450B0 800548B0 0800E003 */  jr         $ra
/* 450B4 800548B4 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadStopSlot, . - aadStopSlot

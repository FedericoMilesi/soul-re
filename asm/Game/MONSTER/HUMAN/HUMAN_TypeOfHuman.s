.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel HUMAN_TypeOfHuman
/* 6E180 8007D980 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6E184 8007D984 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E188 8007D988 21808000 */  addu       $s0, $a0, $zero
/* 6E18C 8007D98C 1400BFAF */  sw         $ra, 0x14($sp)
/* 6E190 8007D990 92D1000C */  jal        INSTANCE_Query
/* 6E194 8007D994 01000524 */   addiu     $a1, $zero, 0x1
/* 6E198 8007D998 21184000 */  addu       $v1, $v0, $zero
/* 6E19C 8007D99C 00406230 */  andi       $v0, $v1, 0x4000
/* 6E1A0 8007D9A0 6C01048E */  lw         $a0, 0x16C($s0)
/* 6E1A4 8007D9A4 0D004014 */  bnez       $v0, .L8007D9DC
/* 6E1A8 8007D9A8 01000224 */   addiu     $v0, $zero, 0x1
/* 6E1AC 8007D9AC 00206230 */  andi       $v0, $v1, 0x2000
/* 6E1B0 8007D9B0 0A004014 */  bnez       $v0, .L8007D9DC
/* 6E1B4 8007D9B4 04000224 */   addiu     $v0, $zero, 0x4
/* 6E1B8 8007D9B8 00806230 */  andi       $v0, $v1, 0x8000
/* 6E1BC 8007D9BC 07004010 */  beqz       $v0, .L8007D9DC
/* 6E1C0 8007D9C0 21100000 */   addu      $v0, $zero, $zero
/* 6E1C4 8007D9C4 0400838C */  lw         $v1, 0x4($a0)
/* 6E1C8 8007D9C8 00000000 */  nop
/* 6E1CC 8007D9CC 20006330 */  andi       $v1, $v1, 0x20
/* 6E1D0 8007D9D0 02006014 */  bnez       $v1, .L8007D9DC
/* 6E1D4 8007D9D4 03000224 */   addiu     $v0, $zero, 0x3
/* 6E1D8 8007D9D8 02000224 */  addiu      $v0, $zero, 0x2
.L8007D9DC:
/* 6E1DC 8007D9DC 1400BF8F */  lw         $ra, 0x14($sp)
/* 6E1E0 8007D9E0 1000B08F */  lw         $s0, 0x10($sp)
/* 6E1E4 8007D9E4 0800E003 */  jr         $ra
/* 6E1E8 8007D9E8 1800BD27 */   addiu     $sp, $sp, 0x18
.size HUMAN_TypeOfHuman, . - HUMAN_TypeOfHuman

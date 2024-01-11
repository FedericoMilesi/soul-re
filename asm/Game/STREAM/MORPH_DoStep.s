.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MORPH_DoStep
/* 4E91C 8005E11C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4E920 8005E120 1000B0AF */  sw         $s0, 0x10($sp)
/* 4E924 8005E124 21808000 */  addu       $s0, $a0, $zero
/* 4E928 8005E128 40000424 */  addiu      $a0, $zero, 0x40
/* 4E92C 8005E12C 1400BFAF */  sw         $ra, 0x14($sp)
/* 4E930 8005E130 F9C5000C */  jal        GAMEPAD_Shock1
/* 4E934 8005E134 00F00534 */   ori       $a1, $zero, 0xF000
/* 4E938 8005E138 0800108E */  lw         $s0, 0x8($s0)
/* 4E93C 8005E13C 00000000 */  nop
/* 4E940 8005E140 0000028E */  lw         $v0, 0x0($s0)
/* 4E944 8005E144 00000000 */  nop
/* 4E948 8005E148 3C00428C */  lw         $v0, 0x3C($v0)
/* 4E94C 8005E14C 00000000 */  nop
/* 4E950 8005E150 25004010 */  beqz       $v0, .L8005E1E8
/* 4E954 8005E154 00000000 */   nop
/* 4E958 8005E158 21200002 */  addu       $a0, $s0, $zero
/* 4E95C 8005E15C 113F010C */  jal        VM_UpdateMorph
/* 4E960 8005E160 21280000 */   addu      $a1, $zero, $zero
/* 4E964 8005E164 D0BD8587 */  lh         $a1, %gp_rel(gameTrackerX + 0x8)($gp)
/* 4E968 8005E168 E8030224 */  addiu      $v0, $zero, 0x3E8
/* 4E96C 8005E16C 1400A214 */  bne        $a1, $v0, .L8005E1C0
/* 4E970 8005E170 00000000 */   nop
/* 4E974 8005E174 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E978 8005E178 D2BD8397 */  lhu        $v1, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E97C 8005E17C 06004014 */  bnez       $v0, .L8005E198
/* 4E980 8005E180 01006238 */   xori      $v0, $v1, 0x1
/* 4E984 8005E184 D2BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E988 8005E188 8472010C */  jal        MORPH_UpdateNormals
/* 4E98C 8005E18C 21200002 */   addu      $a0, $s0, $zero
/* 4E990 8005E190 69780108 */  j          .L8005E1A4
/* 4E994 8005E194 00000000 */   nop
.L8005E198:
/* 4E998 8005E198 D2BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E99C 8005E19C B173010C */  jal        MORPH_BringBackNormals
/* 4E9A0 8005E1A0 21200002 */   addu      $a0, $s0, $zero
.L8005E1A4:
/* 4E9A4 8005E1A4 D2BD8297 */  lhu        $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E9A8 8005E1A8 00000000 */  nop
/* 4E9AC 8005E1AC 01004238 */  xori       $v0, $v0, 0x1
/* 4E9B0 8005E1B0 D2BD82A7 */  sh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E9B4 8005E1B4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4E9B8 8005E1B8 7A780108 */  j          .L8005E1E8
/* 4E9BC 8005E1BC 940002AE */   sw        $v0, 0x94($s0)
.L8005E1C0:
/* 4E9C0 8005E1C0 D2BD8287 */  lh         $v0, %gp_rel(gameTrackerX + 0xA)($gp)
/* 4E9C4 8005E1C4 00000000 */  nop
/* 4E9C8 8005E1C8 05004014 */  bnez       $v0, .L8005E1E0
/* 4E9CC 8005E1CC 00000000 */   nop
/* 4E9D0 8005E1D0 CD74010C */  jal        MORPH_AddOffsets
/* 4E9D4 8005E1D4 21200002 */   addu      $a0, $s0, $zero
/* 4E9D8 8005E1D8 7A780108 */  j          .L8005E1E8
/* 4E9DC 8005E1DC 00000000 */   nop
.L8005E1E0:
/* 4E9E0 8005E1E0 C075010C */  jal        MORPH_SubtractOffsets
/* 4E9E4 8005E1E4 21200002 */   addu      $a0, $s0, $zero
.L8005E1E8:
/* 4E9E8 8005E1E8 1400BF8F */  lw         $ra, 0x14($sp)
/* 4E9EC 8005E1EC 1000B08F */  lw         $s0, 0x10($sp)
/* 4E9F0 8005E1F0 0800E003 */  jr         $ra
/* 4E9F4 8005E1F4 1800BD27 */   addiu     $sp, $sp, 0x18
.size MORPH_DoStep, . - MORPH_DoStep

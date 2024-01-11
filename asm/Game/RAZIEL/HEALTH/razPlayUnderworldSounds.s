.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel razPlayUnderworldSounds
/* 95750 800A4F50 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 95754 800A4F54 3400B3AF */  sw         $s3, 0x34($sp)
/* 95758 800A4F58 21988000 */  addu       $s3, $a0, $zero
/* 9575C 800A4F5C 94FB848F */  lw         $a0, %gp_rel(Raziel + 0x564)($gp)
/* 95760 800A4F60 3800B4AF */  sw         $s4, 0x38($sp)
/* 95764 800A4F64 94FB9427 */  addiu      $s4, $gp, %gp_rel(Raziel + 0x564)
/* 95768 800A4F68 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 9576C 800A4F6C 3000B2AF */  sw         $s2, 0x30($sp)
/* 95770 800A4F70 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 95774 800A4F74 04008010 */  beqz       $a0, .L800A4F88
/* 95778 800A4F78 2800B0AF */   sw        $s0, 0x28($sp)
/* 9577C 800A4F7C 1C02010C */  jal        SndEndLoop
/* 95780 800A4F80 00000000 */   nop
/* 95784 800A4F84 94FB80AF */  sw         $zero, %gp_rel(Raziel + 0x564)($gp)
.L800A4F88:
/* 95788 800A4F88 21206002 */  addu       $a0, $s3, $zero
/* 9578C 800A4F8C 21288002 */  addu       $a1, $s4, $zero
/* 95790 800A4F90 1A000624 */  addiu      $a2, $zero, 0x1A
/* 95794 800A4F94 06FF0724 */  addiu      $a3, $zero, -0xFA
/* 95798 800A4F98 2190E000 */  addu       $s2, $a3, $zero
/* 9579C 800A4F9C 78001024 */  addiu      $s0, $zero, 0x78
/* 957A0 800A4FA0 AC0D1124 */  addiu      $s1, $zero, 0xDAC
/* 957A4 800A4FA4 1000B2AF */  sw         $s2, 0x10($sp)
/* 957A8 800A4FA8 1400B0AF */  sw         $s0, 0x14($sp)
/* 957AC 800A4FAC 1800B0AF */  sw         $s0, 0x18($sp)
/* 957B0 800A4FB0 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 957B4 800A4FB4 509F020C */  jal        razSetupSoundRamp
/* 957B8 800A4FB8 2000B1AF */   sw        $s1, 0x20($sp)
/* 957BC 800A4FBC 21206002 */  addu       $a0, $s3, $zero
/* 957C0 800A4FC0 21288002 */  addu       $a1, $s4, $zero
/* 957C4 800A4FC4 1A000624 */  addiu      $a2, $zero, 0x1A
/* 957C8 800A4FC8 D4FE0724 */  addiu      $a3, $zero, -0x12C
/* 957CC 800A4FCC 2110E000 */  addu       $v0, $a3, $zero
/* 957D0 800A4FD0 1000A2AF */  sw         $v0, 0x10($sp)
/* 957D4 800A4FD4 1400B0AF */  sw         $s0, 0x14($sp)
/* 957D8 800A4FD8 1800B0AF */  sw         $s0, 0x18($sp)
/* 957DC 800A4FDC 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 957E0 800A4FE0 509F020C */  jal        razSetupSoundRamp
/* 957E4 800A4FE4 2000B1AF */   sw        $s1, 0x20($sp)
/* 957E8 800A4FE8 21206002 */  addu       $a0, $s3, $zero
/* 957EC 800A4FEC 21288002 */  addu       $a1, $s4, $zero
/* 957F0 800A4FF0 12000624 */  addiu      $a2, $zero, 0x12
/* 957F4 800A4FF4 24FF0724 */  addiu      $a3, $zero, -0xDC
/* 957F8 800A4FF8 2110E000 */  addu       $v0, $a3, $zero
/* 957FC 800A4FFC 1000A2AF */  sw         $v0, 0x10($sp)
/* 95800 800A5000 1400B0AF */  sw         $s0, 0x14($sp)
/* 95804 800A5004 1800B0AF */  sw         $s0, 0x18($sp)
/* 95808 800A5008 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 9580C 800A500C 509F020C */  jal        razSetupSoundRamp
/* 95810 800A5010 2000B1AF */   sw        $s1, 0x20($sp)
/* 95814 800A5014 21206002 */  addu       $a0, $s3, $zero
/* 95818 800A5018 21288002 */  addu       $a1, $s4, $zero
/* 9581C 800A501C 1A000624 */  addiu      $a2, $zero, 0x1A
/* 95820 800A5020 06FF0724 */  addiu      $a3, $zero, -0xFA
/* 95824 800A5024 1000B2AF */  sw         $s2, 0x10($sp)
/* 95828 800A5028 1400B0AF */  sw         $s0, 0x14($sp)
/* 9582C 800A502C 1800B0AF */  sw         $s0, 0x18($sp)
/* 95830 800A5030 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 95834 800A5034 509F020C */  jal        razSetupSoundRamp
/* 95838 800A5038 2000B1AF */   sw        $s1, 0x20($sp)
/* 9583C 800A503C 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 95840 800A5040 3800B48F */  lw         $s4, 0x38($sp)
/* 95844 800A5044 3400B38F */  lw         $s3, 0x34($sp)
/* 95848 800A5048 3000B28F */  lw         $s2, 0x30($sp)
/* 9584C 800A504C 2C00B18F */  lw         $s1, 0x2C($sp)
/* 95850 800A5050 2800B08F */  lw         $s0, 0x28($sp)
/* 95854 800A5054 0800E003 */  jr         $ra
/* 95858 800A5058 4000BD27 */   addiu     $sp, $sp, 0x40
.size razPlayUnderworldSounds, . - razPlayUnderworldSounds

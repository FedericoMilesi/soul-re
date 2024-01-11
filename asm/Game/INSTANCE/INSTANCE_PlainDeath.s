.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel INSTANCE_PlainDeath
/* 24CE4 800344E4 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 24CE8 800344E8 3400B5AF */  sw         $s5, 0x34($sp)
/* 24CEC 800344EC 21A88000 */  addu       $s5, $a0, $zero
/* 24CF0 800344F0 FFFB0324 */  addiu      $v1, $zero, -0x401
/* 24CF4 800344F4 3800BFAF */  sw         $ra, 0x38($sp)
/* 24CF8 800344F8 3000B4AF */  sw         $s4, 0x30($sp)
/* 24CFC 800344FC 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 24D00 80034500 2800B2AF */  sw         $s2, 0x28($sp)
/* 24D04 80034504 2400B1AF */  sw         $s1, 0x24($sp)
/* 24D08 80034508 2000B0AF */  sw         $s0, 0x20($sp)
/* 24D0C 8003450C 1400A28E */  lw         $v0, 0x14($s5)
/* 24D10 80034510 1C00A48E */  lw         $a0, 0x1C($s5)
/* 24D14 80034514 24104300 */  and        $v0, $v0, $v1
/* 24D18 80034518 1400A2AE */  sw         $v0, 0x14($s5)
/* 24D1C 8003451C 2C00828C */  lw         $v0, 0x2C($a0)
/* 24D20 80034520 00000000 */  nop
/* 24D24 80034524 04004230 */  andi       $v0, $v0, 0x4
/* 24D28 80034528 21004010 */  beqz       $v0, .L800345B0
/* 24D2C 8003452C 4800B426 */   addiu     $s4, $s5, 0x48
/* 24D30 80034530 21288002 */  addu       $a1, $s4, $zero
/* 24D34 80034534 5C00B326 */  addiu      $s3, $s5, 0x5C
/* 24D38 80034538 21306002 */  addu       $a2, $s3, $zero
/* 24D3C 8003453C 21188000 */  addu       $v1, $a0, $zero
/* 24D40 80034540 0008123C */  lui        $s2, (0x8000000 >> 16)
/* 24D44 80034544 1800B126 */  addiu      $s1, $s5, 0x18
/* 24D48 80034548 1800A28E */  lw         $v0, 0x18($s5)
/* 24D4C 8003454C 0002103C */  lui        $s0, (0x2000000 >> 16)
/* 24D50 80034550 00104234 */  ori        $v0, $v0, 0x1000
/* 24D54 80034554 1800A2AE */  sw         $v0, 0x18($s5)
/* 24D58 80034558 2C00678C */  lw         $a3, 0x2C($v1)
/* 24D5C 8003455C 24105200 */  and        $v0, $v0, $s2
/* 24D60 80034560 1000A2AF */  sw         $v0, 0x10($sp)
/* 24D64 80034564 1400A0AF */  sw         $zero, 0x14($sp)
/* 24D68 80034568 1800A0AF */  sw         $zero, 0x18($sp)
/* 24D6C 8003456C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 24D70 80034570 2800648C */  lw         $a0, 0x28($v1)
/* 24D74 80034574 3CFB000C */  jal        SOUND_ProcessInstanceSounds
/* 24D78 80034578 2438F000 */   and       $a3, $a3, $s0
/* 24D7C 8003457C 21288002 */  addu       $a1, $s4, $zero
/* 24D80 80034580 21306002 */  addu       $a2, $s3, $zero
/* 24D84 80034584 1C00A38E */  lw         $v1, 0x1C($s5)
/* 24D88 80034588 1800A28E */  lw         $v0, 0x18($s5)
/* 24D8C 8003458C 2C00678C */  lw         $a3, 0x2C($v1)
/* 24D90 80034590 24105200 */  and        $v0, $v0, $s2
/* 24D94 80034594 1000A2AF */  sw         $v0, 0x10($sp)
/* 24D98 80034598 1400A0AF */  sw         $zero, 0x14($sp)
/* 24D9C 8003459C 1800A0AF */  sw         $zero, 0x18($sp)
/* 24DA0 800345A0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 24DA4 800345A4 2800648C */  lw         $a0, 0x28($v1)
/* 24DA8 800345A8 3CFB000C */  jal        SOUND_ProcessInstanceSounds
/* 24DAC 800345AC 2438F000 */   and       $a3, $a3, $s0
.L800345B0:
/* 24DB0 800345B0 8C00A48E */  lw         $a0, 0x8C($s5)
/* 24DB4 800345B4 62D2000C */  jal        INSTANCE_Find
/* 24DB8 800345B8 00000000 */   nop
/* 24DBC 800345BC 21204000 */  addu       $a0, $v0, $zero
/* 24DC0 800345C0 05008010 */  beqz       $a0, .L800345D8
/* 24DC4 800345C4 7FFF0324 */   addiu     $v1, $zero, -0x81
/* 24DC8 800345C8 1800828C */  lw         $v0, 0x18($a0)
/* 24DCC 800345CC 00000000 */  nop
/* 24DD0 800345D0 24104300 */  and        $v0, $v0, $v1
/* 24DD4 800345D4 180082AC */  sw         $v0, 0x18($a0)
.L800345D8:
/* 24DD8 800345D8 73D9020C */  jal        SAVE_MarkDeadDead
/* 24DDC 800345DC 2120A002 */   addu      $a0, $s5, $zero
/* 24DE0 800345E0 1400A28E */  lw         $v0, 0x14($s5)
/* 24DE4 800345E4 00000000 */  nop
/* 24DE8 800345E8 20004234 */  ori        $v0, $v0, 0x20
/* 24DEC 800345EC 1400A2AE */  sw         $v0, 0x14($s5)
/* 24DF0 800345F0 3800BF8F */  lw         $ra, 0x38($sp)
/* 24DF4 800345F4 3400B58F */  lw         $s5, 0x34($sp)
/* 24DF8 800345F8 3000B48F */  lw         $s4, 0x30($sp)
/* 24DFC 800345FC 2C00B38F */  lw         $s3, 0x2C($sp)
/* 24E00 80034600 2800B28F */  lw         $s2, 0x28($sp)
/* 24E04 80034604 2400B18F */  lw         $s1, 0x24($sp)
/* 24E08 80034608 2000B08F */  lw         $s0, 0x20($sp)
/* 24E0C 8003460C 0800E003 */  jr         $ra
/* 24E10 80034610 4000BD27 */   addiu     $sp, $sp, 0x40
.size INSTANCE_PlainDeath, . - INSTANCE_PlainDeath

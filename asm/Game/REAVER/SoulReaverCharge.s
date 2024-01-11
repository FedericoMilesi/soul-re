.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SoulReaverCharge
/* 6ACB8 8007A4B8 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 6ACBC 8007A4BC 5800B2AF */  sw         $s2, 0x58($sp)
/* 6ACC0 8007A4C0 21908000 */  addu       $s2, $a0, $zero
/* 6ACC4 8007A4C4 5000B0AF */  sw         $s0, 0x50($sp)
/* 6ACC8 8007A4C8 2180A000 */  addu       $s0, $a1, $zero
/* 6ACCC 8007A4CC 5C00BFAF */  sw         $ra, 0x5C($sp)
/* 6ACD0 8007A4D0 5400B1AF */  sw         $s1, 0x54($sp)
/* 6ACD4 8007A4D4 0800058E */  lw         $a1, 0x8($s0)
/* 6ACD8 8007A4D8 2400518E */  lw         $s1, 0x24($s2)
/* 6ACDC 8007A4DC 3900A010 */  beqz       $a1, .L8007A5C4
/* 6ACE0 8007A4E0 0300033C */   lui       $v1, (0x3BFFF >> 16)
/* 6ACE4 8007A4E4 FFBF6334 */  ori        $v1, $v1, (0x3BFFF & 0xFFFF)
/* 6ACE8 8007A4E8 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6ACEC 8007A4EC 0C00048E */  lw         $a0, 0xC($s0)
/* 6ACF0 8007A4F0 2310A200 */  subu       $v0, $a1, $v0
/* 6ACF4 8007A4F4 2A186400 */  slt        $v1, $v1, $a0
/* 6ACF8 8007A4F8 0A006014 */  bnez       $v1, .L8007A524
/* 6ACFC 8007A4FC 080002AE */   sw        $v0, 0x8($s0)
/* 6AD00 8007A500 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 6AD04 8007A504 00000000 */  nop
/* 6AD08 8007A508 21108200 */  addu       $v0, $a0, $v0
/* 6AD0C 8007A50C 02004104 */  bgez       $v0, .L8007A518
/* 6AD10 8007A510 0C0002AE */   sw        $v0, 0xC($s0)
/* 6AD14 8007A514 FF0F4224 */  addiu      $v0, $v0, 0xFFF
.L8007A518:
/* 6AD18 8007A518 03130200 */  sra        $v0, $v0, 12
/* 6AD1C 8007A51C 4AE90108 */  j          .L8007A528
/* 6AD20 8007A520 32004424 */   addiu     $a0, $v0, 0x32
.L8007A524:
/* 6AD24 8007A524 6E000424 */  addiu      $a0, $zero, 0x6E
.L8007A528:
/* 6AD28 8007A528 F9C5000C */  jal        GAMEPAD_Shock1
/* 6AD2C 8007A52C 00500524 */   addiu     $a1, $zero, 0x5000
/* 6AD30 8007A530 0800068E */  lw         $a2, 0x8($s0)
/* 6AD34 8007A534 00000000 */  nop
/* 6AD38 8007A538 2200C01C */  bgtz       $a2, .L8007A5C4
/* 6AD3C 8007A53C 21204002 */   addu      $a0, $s2, $zero
/* 6AD40 8007A540 5C008524 */  addiu      $a1, $a0, 0x5C
/* 6AD44 8007A544 00F00234 */  ori        $v0, $zero, 0xF000
/* 6AD48 8007A548 04000386 */  lh         $v1, 0x4($s0)
/* 6AD4C 8007A54C 2110C200 */  addu       $v0, $a2, $v0
/* 6AD50 8007A550 080002AE */  sw         $v0, 0x8($s0)
/* 6AD54 8007A554 80180300 */  sll        $v1, $v1, 2
/* 6AD58 8007A558 21187100 */  addu       $v1, $v1, $s1
/* 6AD5C 8007A55C FCFF638C */  lw         $v1, -0x4($v1)
/* 6AD60 8007A560 68010224 */  addiu      $v0, $zero, 0x168
/* 6AD64 8007A564 1000A2AF */  sw         $v0, 0x10($sp)
/* 6AD68 8007A568 FFFF023C */  lui        $v0, (0xFFFF0000 >> 16)
/* 6AD6C 8007A56C 2400A2AF */  sw         $v0, 0x24($sp)
/* 6AD70 8007A570 40010224 */  addiu      $v0, $zero, 0x140
/* 6AD74 8007A574 2C00A2AF */  sw         $v0, 0x2C($sp)
/* 6AD78 8007A578 10010224 */  addiu      $v0, $zero, 0x110
/* 6AD7C 8007A57C 3000A2AF */  sw         $v0, 0x30($sp)
/* 6AD80 8007A580 E0000224 */  addiu      $v0, $zero, 0xE0
/* 6AD84 8007A584 3400A2AF */  sw         $v0, 0x34($sp)
/* 6AD88 8007A588 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6AD8C 8007A58C 4400A2AF */  sw         $v0, 0x44($sp)
/* 6AD90 8007A590 01000224 */  addiu      $v0, $zero, 0x1
/* 6AD94 8007A594 1400A0AF */  sw         $zero, 0x14($sp)
/* 6AD98 8007A598 1800A0AF */  sw         $zero, 0x18($sp)
/* 6AD9C 8007A59C 1C00A0AF */  sw         $zero, 0x1C($sp)
/* 6ADA0 8007A5A0 2000A0AF */  sw         $zero, 0x20($sp)
/* 6ADA4 8007A5A4 2800A0AF */  sw         $zero, 0x28($sp)
/* 6ADA8 8007A5A8 3C00A0AF */  sw         $zero, 0x3C($sp)
/* 6ADAC 8007A5AC 4000A0AF */  sw         $zero, 0x40($sp)
/* 6ADB0 8007A5B0 4800A2AF */  sw         $v0, 0x48($sp)
/* 6ADB4 8007A5B4 3800A3AF */  sw         $v1, 0x38($sp)
/* 6ADB8 8007A5B8 4000868C */  lw         $a2, 0x40($a0)
/* 6ADBC 8007A5BC CE2F010C */  jal        FX_DoBlastRing
/* 6ADC0 8007A5C0 21380000 */   addu      $a3, $zero, $zero
.L8007A5C4:
/* 6ADC4 8007A5C4 5C00BF8F */  lw         $ra, 0x5C($sp)
/* 6ADC8 8007A5C8 5800B28F */  lw         $s2, 0x58($sp)
/* 6ADCC 8007A5CC 5400B18F */  lw         $s1, 0x54($sp)
/* 6ADD0 8007A5D0 5000B08F */  lw         $s0, 0x50($sp)
/* 6ADD4 8007A5D4 0800E003 */  jr         $ra
/* 6ADD8 8007A5D8 6000BD27 */   addiu     $sp, $sp, 0x60
.size SoulReaverCharge, . - SoulReaverCharge

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_Idle
/* 7AB74 8008A374 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7AB78 8008A378 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7AB7C 8008A37C 21988000 */  addu       $s3, $a0, $zero
/* 7AB80 8008A380 2400BFAF */  sw         $ra, 0x24($sp)
/* 7AB84 8008A384 2000B4AF */  sw         $s4, 0x20($sp)
/* 7AB88 8008A388 1800B2AF */  sw         $s2, 0x18($sp)
/* 7AB8C 8008A38C 1400B1AF */  sw         $s1, 0x14($sp)
/* 7AB90 8008A390 1000B0AF */  sw         $s0, 0x10($sp)
/* 7AB94 8008A394 6C01708E */  lw         $s0, 0x16C($s3)
/* 7AB98 8008A398 00000000 */  nop
/* 7AB9C 8008A39C 0000028E */  lw         $v0, 0x0($s0)
/* 7ABA0 8008A3A0 00000000 */  nop
/* 7ABA4 8008A3A4 04004230 */  andi       $v0, $v0, 0x4
/* 7ABA8 8008A3A8 49004014 */  bnez       $v0, .L8008A4D0
/* 7ABAC 8008A3AC 21A00000 */   addu      $s4, $zero, $zero
/* 7ABB0 8008A3B0 C400128E */  lw         $s2, 0xC4($s0)
/* 7ABB4 8008A3B4 530D020C */  jal        MON_ValidPosition
/* 7ABB8 8008A3B8 FFFF1124 */   addiu     $s1, $zero, -0x1
/* 7ABBC 8008A3BC 03004014 */  bnez       $v0, .L8008A3CC
/* 7ABC0 8008A3C0 00000000 */   nop
/* 7ABC4 8008A3C4 2D290208 */  j          .L8008A4B4
/* 7ABC8 8008A3C8 01001124 */   addiu     $s1, $zero, 0x1
.L8008A3CC:
/* 7ABCC 8008A3CC 2D004012 */  beqz       $s2, .L8008A484
/* 7ABD0 8008A3D0 00000000 */   nop
/* 7ABD4 8008A3D4 01001424 */  addiu      $s4, $zero, 0x1
/* 7ABD8 8008A3D8 DD0C020C */  jal        MON_ShouldIFlee
/* 7ABDC 8008A3DC 21206002 */   addu      $a0, $s3, $zero
/* 7ABE0 8008A3E0 03004010 */  beqz       $v0, .L8008A3F0
/* 7ABE4 8008A3E4 00000000 */   nop
/* 7ABE8 8008A3E8 1C290208 */  j          .L8008A470
/* 7ABEC 8008A3EC 13001124 */   addiu     $s1, $zero, 0x13
.L8008A3F0:
/* 7ABF0 8008A3F0 16004296 */  lhu        $v0, 0x16($s2)
/* 7ABF4 8008A3F4 00000000 */  nop
/* 7ABF8 8008A3F8 00014230 */  andi       $v0, $v0, 0x100
/* 7ABFC 8008A3FC 03004010 */  beqz       $v0, .L8008A40C
/* 7AC00 8008A400 07000224 */   addiu     $v0, $zero, 0x7
/* 7AC04 8008A404 1C290208 */  j          .L8008A470
/* 7AC08 8008A408 19001124 */   addiu     $s1, $zero, 0x19
.L8008A40C:
/* 7AC0C 8008A40C 5A010392 */  lbu        $v1, 0x15A($s0)
/* 7AC10 8008A410 00000000 */  nop
/* 7AC14 8008A414 07006214 */  bne        $v1, $v0, .L8008A434
/* 7AC18 8008A418 00000000 */   nop
/* 7AC1C 8008A41C 14004386 */  lh         $v1, 0x14($s2)
/* 7AC20 8008A420 3C010286 */  lh         $v0, 0x13C($s0)
/* 7AC24 8008A424 00000000 */  nop
/* 7AC28 8008A428 2A104300 */  slt        $v0, $v0, $v1
/* 7AC2C 8008A42C 08004014 */  bnez       $v0, .L8008A450
/* 7AC30 8008A430 21206002 */   addu      $a0, $s3, $zero
.L8008A434:
/* 7AC34 8008A434 0400428E */  lw         $v0, 0x4($s2)
/* 7AC38 8008A438 00000000 */  nop
/* 7AC3C 8008A43C 3800458C */  lw         $a1, 0x38($v0)
/* 7AC40 8008A440 400D020C */  jal        MON_ValidUnit
/* 7AC44 8008A444 21206002 */   addu      $a0, $s3, $zero
/* 7AC48 8008A448 08004014 */  bnez       $v0, .L8008A46C
/* 7AC4C 8008A44C 21206002 */   addu      $a0, $s3, $zero
.L8008A450:
/* 7AC50 8008A450 6801028E */  lw         $v0, 0x168($s0)
/* 7AC54 8008A454 0400458E */  lw         $a1, 0x4($s2)
/* 7AC58 8008A458 1C004684 */  lh         $a2, 0x1C($v0)
/* 7AC5C 8008A45C 6604020C */  jal        MON_TurnToPosition
/* 7AC60 8008A460 5C00A524 */   addiu     $a1, $a1, 0x5C
/* 7AC64 8008A464 1C290208 */  j          .L8008A470
/* 7AC68 8008A468 00000000 */   nop
.L8008A46C:
/* 7AC6C 8008A46C 0D001124 */  addiu      $s1, $zero, 0xD
.L8008A470:
/* 7AC70 8008A470 0400428E */  lw         $v0, 0x4($s2)
/* 7AC74 8008A474 00000000 */  nop
/* 7AC78 8008A478 5C004224 */  addiu      $v0, $v0, 0x5C
/* 7AC7C 8008A47C 2D290208 */  j          .L8008A4B4
/* 7AC80 8008A480 200102AE */   sw        $v0, 0x120($s0)
.L8008A484:
/* 7AC84 8008A484 5A010292 */  lbu        $v0, 0x15A($s0)
/* 7AC88 8008A488 00000000 */  nop
/* 7AC8C 8008A48C FEFF4224 */  addiu      $v0, $v0, -0x2
/* 7AC90 8008A490 0200422C */  sltiu      $v0, $v0, 0x2
/* 7AC94 8008A494 08004010 */  beqz       $v0, .L8008A4B8
/* 7AC98 8008A498 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 7AC9C 8008A49C 1800628E */  lw         $v0, 0x18($s3)
/* 7ACA0 8008A4A0 00000000 */  nop
/* 7ACA4 8008A4A4 02004230 */  andi       $v0, $v0, 0x2
/* 7ACA8 8008A4A8 03004010 */  beqz       $v0, .L8008A4B8
/* 7ACAC 8008A4AC FFFF0224 */   addiu     $v0, $zero, -0x1
/* 7ACB0 8008A4B0 05001124 */  addiu      $s1, $zero, 0x5
.L8008A4B4:
/* 7ACB4 8008A4B4 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8008A4B8:
/* 7ACB8 8008A4B8 1E002212 */  beq        $s1, $v0, .L8008A534
/* 7ACBC 8008A4BC 21206002 */   addu      $a0, $s3, $zero
/* 7ACC0 8008A4C0 91FE010C */  jal        MON_SwitchState
/* 7ACC4 8008A4C4 21282002 */   addu      $a1, $s1, $zero
/* 7ACC8 8008A4C8 4D290208 */  j          .L8008A534
/* 7ACCC 8008A4CC 00000000 */   nop
.L8008A4D0:
/* 7ACD0 8008A4D0 0400028E */  lw         $v0, 0x4($s0)
/* 7ACD4 8008A4D4 0010033C */  lui        $v1, (0x10000000 >> 16)
/* 7ACD8 8008A4D8 24104300 */  and        $v0, $v0, $v1
/* 7ACDC 8008A4DC 15004010 */  beqz       $v0, .L8008A534
/* 7ACE0 8008A4E0 78006426 */   addiu     $a0, $s3, 0x78
/* 7ACE4 8008A4E4 6801028E */  lw         $v0, 0x168($s0)
/* 7ACE8 8008A4E8 00000000 */  nop
/* 7ACEC 8008A4EC 1C004384 */  lh         $v1, 0x1C($v0)
/* 7ACF0 8008A4F0 08C0828F */  lw         $v0, %gp_rel(gameTrackerX + 0x240)($gp)
/* 7ACF4 8008A4F4 00000000 */  nop
/* 7ACF8 8008A4F8 18006200 */  mult       $v1, $v0
/* 7ACFC 8008A4FC 28010586 */  lh         $a1, 0x128($s0)
/* 7AD00 8008A500 12380000 */  mflo       $a3
/* 7AD04 8008A504 00310700 */  sll        $a2, $a3, 4
/* 7AD08 8008A508 53E8000C */  jal        AngleMoveToward
/* 7AD0C 8008A50C 03340600 */   sra       $a2, $a2, 16
/* 7AD10 8008A510 78006386 */  lh         $v1, 0x78($s3)
/* 7AD14 8008A514 28010286 */  lh         $v0, 0x128($s0)
/* 7AD18 8008A518 00000000 */  nop
/* 7AD1C 8008A51C 05006214 */  bne        $v1, $v0, .L8008A534
/* 7AD20 8008A520 FFEF033C */   lui       $v1, (0xEFFFFFFF >> 16)
/* 7AD24 8008A524 0400028E */  lw         $v0, 0x4($s0)
/* 7AD28 8008A528 FFFF6334 */  ori        $v1, $v1, (0xEFFFFFFF & 0xFFFF)
/* 7AD2C 8008A52C 24104300 */  and        $v0, $v0, $v1
/* 7AD30 8008A530 040002AE */  sw         $v0, 0x4($s0)
.L8008A534:
/* 7AD34 8008A534 0000038E */  lw         $v1, 0x0($s0)
/* 7AD38 8008A538 00000000 */  nop
/* 7AD3C 8008A53C 04006230 */  andi       $v0, $v1, 0x4
/* 7AD40 8008A540 11004014 */  bnez       $v0, .L8008A588
/* 7AD44 8008A544 0004023C */   lui       $v0, (0x4000000 >> 16)
/* 7AD48 8008A548 24106200 */  and        $v0, $v1, $v0
/* 7AD4C 8008A54C 06004010 */  beqz       $v0, .L8008A568
/* 7AD50 8008A550 00000000 */   nop
/* 7AD54 8008A554 1800628E */  lw         $v0, 0x18($s3)
/* 7AD58 8008A558 00000000 */  nop
/* 7AD5C 8008A55C 02004230 */  andi       $v0, $v0, 0x2
/* 7AD60 8008A560 09004010 */  beqz       $v0, .L8008A588
/* 7AD64 8008A564 00000000 */   nop
.L8008A568:
/* 7AD68 8008A568 05008012 */  beqz       $s4, .L8008A580
/* 7AD6C 8008A56C 21206002 */   addu      $a0, $s3, $zero
/* 7AD70 8008A570 9D03020C */  jal        MON_PlayCombatIdle
/* 7AD74 8008A574 02000524 */   addiu     $a1, $zero, 0x2
/* 7AD78 8008A578 62290208 */  j          .L8008A588
/* 7AD7C 8008A57C 00000000 */   nop
.L8008A580:
/* 7AD80 8008A580 3403020C */  jal        MON_PlayRandomIdle
/* 7AD84 8008A584 02000524 */   addiu     $a1, $zero, 0x2
.L8008A588:
/* 7AD88 8008A588 F616020C */  jal        MON_IdleQueueHandler
/* 7AD8C 8008A58C 21206002 */   addu      $a0, $s3, $zero
/* 7AD90 8008A590 2400BF8F */  lw         $ra, 0x24($sp)
/* 7AD94 8008A594 2000B48F */  lw         $s4, 0x20($sp)
/* 7AD98 8008A598 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7AD9C 8008A59C 1800B28F */  lw         $s2, 0x18($sp)
/* 7ADA0 8008A5A0 1400B18F */  lw         $s1, 0x14($sp)
/* 7ADA4 8008A5A4 1000B08F */  lw         $s0, 0x10($sp)
/* 7ADA8 8008A5A8 0800E003 */  jr         $ra
/* 7ADAC 8008A5AC 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_Idle, . - MON_Idle

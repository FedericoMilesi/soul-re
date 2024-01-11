.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel STREAM_UpdateLevelPointer
/* 4AAE0 8005A2E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4AAE4 8005A2E4 1000BFAF */  sw         $ra, 0x10($sp)
/* 4AAE8 8005A2E8 2348A400 */  subu       $t1, $a1, $a0
/* 4AAEC 8005A2EC 21400000 */  addu       $t0, $zero, $zero
/* 4AAF0 8005A2F0 02000724 */  addiu      $a3, $zero, 0x2
/* 4AAF4 8005A2F4 3CC78327 */  addiu      $v1, $gp, %gp_rel(StreamTracker)
.L8005A2F8:
/* 4AAF8 8005A2F8 04006284 */  lh         $v0, 0x4($v1)
/* 4AAFC 8005A2FC 00000000 */  nop
/* 4AB00 8005A300 07004714 */  bne        $v0, $a3, .L8005A320
/* 4AB04 8005A304 00000000 */   nop
/* 4AB08 8005A308 0800628C */  lw         $v0, 0x8($v1)
/* 4AB0C 8005A30C 00000000 */  nop
/* 4AB10 8005A310 03004414 */  bne        $v0, $a0, .L8005A320
/* 4AB14 8005A314 00000000 */   nop
/* 4AB18 8005A318 CC680108 */  j          .L8005A330
/* 4AB1C 8005A31C 080065AC */   sw        $a1, 0x8($v1)
.L8005A320:
/* 4AB20 8005A320 01000825 */  addiu      $t0, $t0, 0x1
/* 4AB24 8005A324 10000229 */  slti       $v0, $t0, 0x10
/* 4AB28 8005A328 F3FF4014 */  bnez       $v0, .L8005A2F8
/* 4AB2C 8005A32C 40006324 */   addiu     $v1, $v1, 0x40
.L8005A330:
/* 4AB30 8005A330 F0BD828F */  lw         $v0, %gp_rel(gameTrackerX + 0x28)($gp)
/* 4AB34 8005A334 00000000 */  nop
/* 4AB38 8005A338 02004414 */  bne        $v0, $a0, .L8005A344
/* 4AB3C 8005A33C 00000000 */   nop
/* 4AB40 8005A340 F0BD85AF */  sw         $a1, %gp_rel(gameTrackerX + 0x28)($gp)
.L8005A344:
/* 4AB44 8005A344 C8BD8227 */  addiu      $v0, $gp, %gp_rel(gameTrackerX)
/* 4AB48 8005A348 3400428C */  lw         $v0, 0x34($v0)
/* 4AB4C 8005A34C 00000000 */  nop
/* 4AB50 8005A350 0400478C */  lw         $a3, 0x4($v0)
/* 4AB54 8005A354 00000000 */  nop
/* 4AB58 8005A358 5E00E010 */  beqz       $a3, .L8005A4D4
/* 4AB5C 8005A35C 00000000 */   nop
/* 4AB60 8005A360 21408600 */  addu       $t0, $a0, $a2
.L8005A364:
/* 4AB64 8005A364 2000E38C */  lw         $v1, 0x20($a3)
/* 4AB68 8005A368 00000000 */  nop
/* 4AB6C 8005A36C 2B106400 */  sltu       $v0, $v1, $a0
/* 4AB70 8005A370 07004014 */  bnez       $v0, .L8005A390
/* 4AB74 8005A374 2B100301 */   sltu      $v0, $t0, $v1
/* 4AB78 8005A378 05004014 */  bnez       $v0, .L8005A390
/* 4AB7C 8005A37C 00000000 */   nop
/* 4AB80 8005A380 02006010 */  beqz       $v1, .L8005A38C
/* 4AB84 8005A384 21100000 */   addu      $v0, $zero, $zero
/* 4AB88 8005A388 21106900 */  addu       $v0, $v1, $t1
.L8005A38C:
/* 4AB8C 8005A38C 2000E2AC */  sw         $v0, 0x20($a3)
.L8005A390:
/* 4AB90 8005A390 2800E38C */  lw         $v1, 0x28($a3)
/* 4AB94 8005A394 00000000 */  nop
/* 4AB98 8005A398 2B106400 */  sltu       $v0, $v1, $a0
/* 4AB9C 8005A39C 07004014 */  bnez       $v0, .L8005A3BC
/* 4ABA0 8005A3A0 2B100301 */   sltu      $v0, $t0, $v1
/* 4ABA4 8005A3A4 05004014 */  bnez       $v0, .L8005A3BC
/* 4ABA8 8005A3A8 00000000 */   nop
/* 4ABAC 8005A3AC 02006010 */  beqz       $v1, .L8005A3B8
/* 4ABB0 8005A3B0 21100000 */   addu      $v0, $zero, $zero
/* 4ABB4 8005A3B4 21106900 */  addu       $v0, $v1, $t1
.L8005A3B8:
/* 4ABB8 8005A3B8 2800E2AC */  sw         $v0, 0x28($a3)
.L8005A3BC:
/* 4ABBC 8005A3BC B400E38C */  lw         $v1, 0xB4($a3)
/* 4ABC0 8005A3C0 00000000 */  nop
/* 4ABC4 8005A3C4 2B106400 */  sltu       $v0, $v1, $a0
/* 4ABC8 8005A3C8 07004014 */  bnez       $v0, .L8005A3E8
/* 4ABCC 8005A3CC 2B100301 */   sltu      $v0, $t0, $v1
/* 4ABD0 8005A3D0 05004014 */  bnez       $v0, .L8005A3E8
/* 4ABD4 8005A3D4 00000000 */   nop
/* 4ABD8 8005A3D8 02006010 */  beqz       $v1, .L8005A3E4
/* 4ABDC 8005A3DC 21100000 */   addu      $v0, $zero, $zero
/* 4ABE0 8005A3E0 21106900 */  addu       $v0, $v1, $t1
.L8005A3E4:
/* 4ABE4 8005A3E4 B400E2AC */  sw         $v0, 0xB4($a3)
.L8005A3E8:
/* 4ABE8 8005A3E8 2801E38C */  lw         $v1, 0x128($a3)
/* 4ABEC 8005A3EC 00000000 */  nop
/* 4ABF0 8005A3F0 2B106400 */  sltu       $v0, $v1, $a0
/* 4ABF4 8005A3F4 07004014 */  bnez       $v0, .L8005A414
/* 4ABF8 8005A3F8 2B100301 */   sltu      $v0, $t0, $v1
/* 4ABFC 8005A3FC 05004014 */  bnez       $v0, .L8005A414
/* 4AC00 8005A400 00000000 */   nop
/* 4AC04 8005A404 02006010 */  beqz       $v1, .L8005A410
/* 4AC08 8005A408 21100000 */   addu      $v0, $zero, $zero
/* 4AC0C 8005A40C 21106900 */  addu       $v0, $v1, $t1
.L8005A410:
/* 4AC10 8005A410 2801E2AC */  sw         $v0, 0x128($a3)
.L8005A414:
/* 4AC14 8005A414 3001E38C */  lw         $v1, 0x130($a3)
/* 4AC18 8005A418 00000000 */  nop
/* 4AC1C 8005A41C 2B106400 */  sltu       $v0, $v1, $a0
/* 4AC20 8005A420 07004014 */  bnez       $v0, .L8005A440
/* 4AC24 8005A424 2B100301 */   sltu      $v0, $t0, $v1
/* 4AC28 8005A428 05004014 */  bnez       $v0, .L8005A440
/* 4AC2C 8005A42C 00000000 */   nop
/* 4AC30 8005A430 02006010 */  beqz       $v1, .L8005A43C
/* 4AC34 8005A434 21100000 */   addu      $v0, $zero, $zero
/* 4AC38 8005A438 21106900 */  addu       $v0, $v1, $t1
.L8005A43C:
/* 4AC3C 8005A43C 3001E2AC */  sw         $v0, 0x130($a3)
.L8005A440:
/* 4AC40 8005A440 B800E38C */  lw         $v1, 0xB8($a3)
/* 4AC44 8005A444 00000000 */  nop
/* 4AC48 8005A448 2B106400 */  sltu       $v0, $v1, $a0
/* 4AC4C 8005A44C 07004014 */  bnez       $v0, .L8005A46C
/* 4AC50 8005A450 2B100301 */   sltu      $v0, $t0, $v1
/* 4AC54 8005A454 05004014 */  bnez       $v0, .L8005A46C
/* 4AC58 8005A458 00000000 */   nop
/* 4AC5C 8005A45C 02006010 */  beqz       $v1, .L8005A468
/* 4AC60 8005A460 21100000 */   addu      $v0, $zero, $zero
/* 4AC64 8005A464 21106900 */  addu       $v0, $v1, $t1
.L8005A468:
/* 4AC68 8005A468 B800E2AC */  sw         $v0, 0xB8($a3)
.L8005A46C:
/* 4AC6C 8005A46C BC00E38C */  lw         $v1, 0xBC($a3)
/* 4AC70 8005A470 00000000 */  nop
/* 4AC74 8005A474 2B106400 */  sltu       $v0, $v1, $a0
/* 4AC78 8005A478 07004014 */  bnez       $v0, .L8005A498
/* 4AC7C 8005A47C 2B100301 */   sltu      $v0, $t0, $v1
/* 4AC80 8005A480 05004014 */  bnez       $v0, .L8005A498
/* 4AC84 8005A484 00000000 */   nop
/* 4AC88 8005A488 02006010 */  beqz       $v1, .L8005A494
/* 4AC8C 8005A48C 21100000 */   addu      $v0, $zero, $zero
/* 4AC90 8005A490 21106900 */  addu       $v0, $v1, $t1
.L8005A494:
/* 4AC94 8005A494 BC00E2AC */  sw         $v0, 0xBC($a3)
.L8005A498:
/* 4AC98 8005A498 CC00E38C */  lw         $v1, 0xCC($a3)
/* 4AC9C 8005A49C 00000000 */  nop
/* 4ACA0 8005A4A0 2B106400 */  sltu       $v0, $v1, $a0
/* 4ACA4 8005A4A4 07004014 */  bnez       $v0, .L8005A4C4
/* 4ACA8 8005A4A8 2B100301 */   sltu      $v0, $t0, $v1
/* 4ACAC 8005A4AC 05004014 */  bnez       $v0, .L8005A4C4
/* 4ACB0 8005A4B0 00000000 */   nop
/* 4ACB4 8005A4B4 02006010 */  beqz       $v1, .L8005A4C0
/* 4ACB8 8005A4B8 21100000 */   addu      $v0, $zero, $zero
/* 4ACBC 8005A4BC 21106900 */  addu       $v0, $v1, $t1
.L8005A4C0:
/* 4ACC0 8005A4C0 CC00E2AC */  sw         $v0, 0xCC($a3)
.L8005A4C4:
/* 4ACC4 8005A4C4 0800E78C */  lw         $a3, 0x8($a3)
/* 4ACC8 8005A4C8 00000000 */  nop
/* 4ACCC 8005A4CC A5FFE014 */  bnez       $a3, .L8005A364
/* 4ACD0 8005A4D0 00000000 */   nop
.L8005A4D4:
/* 4ACD4 8005A4D4 B4B0838F */  lw         $v1, %gp_rel(theCamera + 0x424)($gp)
/* 4ACD8 8005A4D8 00000000 */  nop
/* 4ACDC 8005A4DC 2B106400 */  sltu       $v0, $v1, $a0
/* 4ACE0 8005A4E0 08004014 */  bnez       $v0, .L8005A504
/* 4ACE4 8005A4E4 21108600 */   addu      $v0, $a0, $a2
/* 4ACE8 8005A4E8 2B104300 */  sltu       $v0, $v0, $v1
/* 4ACEC 8005A4EC 05004014 */  bnez       $v0, .L8005A504
/* 4ACF0 8005A4F0 00000000 */   nop
/* 4ACF4 8005A4F4 02006010 */  beqz       $v1, .L8005A500
/* 4ACF8 8005A4F8 21100000 */   addu      $v0, $zero, $zero
/* 4ACFC 8005A4FC 21106900 */  addu       $v0, $v1, $t1
.L8005A500:
/* 4AD00 8005A500 B4B082AF */  sw         $v0, %gp_rel(theCamera + 0x424)($gp)
.L8005A504:
/* 4AD04 8005A504 B8B0838F */  lw         $v1, %gp_rel(theCamera + 0x428)($gp)
/* 4AD08 8005A508 00000000 */  nop
/* 4AD0C 8005A50C 2B106400 */  sltu       $v0, $v1, $a0
/* 4AD10 8005A510 08004014 */  bnez       $v0, .L8005A534
/* 4AD14 8005A514 21108600 */   addu      $v0, $a0, $a2
/* 4AD18 8005A518 2B104300 */  sltu       $v0, $v0, $v1
/* 4AD1C 8005A51C 05004014 */  bnez       $v0, .L8005A534
/* 4AD20 8005A520 00000000 */   nop
/* 4AD24 8005A524 02006010 */  beqz       $v1, .L8005A530
/* 4AD28 8005A528 21100000 */   addu      $v0, $zero, $zero
/* 4AD2C 8005A52C 21106900 */  addu       $v0, $v1, $t1
.L8005A530:
/* 4AD30 8005A530 B8B082AF */  sw         $v0, %gp_rel(theCamera + 0x428)($gp)
.L8005A534:
/* 4AD34 8005A534 08AF8287 */  lh         $v0, %gp_rel(theCamera + 0x278)($gp)
/* 4AD38 8005A538 00000000 */  nop
/* 4AD3C 8005A53C 1E004004 */  bltz       $v0, .L8005A5B8
/* 4AD40 8005A540 21400000 */   addu      $t0, $zero, $zero
/* 4AD44 8005A544 21508600 */  addu       $t2, $a0, $a2
/* 4AD48 8005A548 90AC8727 */  addiu      $a3, $gp, %gp_rel(theCamera)
.L8005A54C:
/* 4AD4C 8005A54C 0403E38C */  lw         $v1, 0x304($a3)
/* 4AD50 8005A550 00000000 */  nop
/* 4AD54 8005A554 2B106400 */  sltu       $v0, $v1, $a0
/* 4AD58 8005A558 07004014 */  bnez       $v0, .L8005A578
/* 4AD5C 8005A55C 2B104301 */   sltu      $v0, $t2, $v1
/* 4AD60 8005A560 05004014 */  bnez       $v0, .L8005A578
/* 4AD64 8005A564 00000000 */   nop
/* 4AD68 8005A568 02006010 */  beqz       $v1, .L8005A574
/* 4AD6C 8005A56C 21100000 */   addu      $v0, $zero, $zero
/* 4AD70 8005A570 21106900 */  addu       $v0, $v1, $t1
.L8005A574:
/* 4AD74 8005A574 0403E2AC */  sw         $v0, 0x304($a3)
.L8005A578:
/* 4AD78 8005A578 0803E38C */  lw         $v1, 0x308($a3)
/* 4AD7C 8005A57C 00000000 */  nop
/* 4AD80 8005A580 2B106400 */  sltu       $v0, $v1, $a0
/* 4AD84 8005A584 07004014 */  bnez       $v0, .L8005A5A4
/* 4AD88 8005A588 2B104301 */   sltu      $v0, $t2, $v1
/* 4AD8C 8005A58C 05004014 */  bnez       $v0, .L8005A5A4
/* 4AD90 8005A590 00000000 */   nop
/* 4AD94 8005A594 02006010 */  beqz       $v1, .L8005A5A0
/* 4AD98 8005A598 21100000 */   addu      $v0, $zero, $zero
/* 4AD9C 8005A59C 21106900 */  addu       $v0, $v1, $t1
.L8005A5A0:
/* 4ADA0 8005A5A0 0803E2AC */  sw         $v0, 0x308($a3)
.L8005A5A4:
/* 4ADA4 8005A5A4 08AF8287 */  lh         $v0, %gp_rel(theCamera + 0x278)($gp)
/* 4ADA8 8005A5A8 01000825 */  addiu      $t0, $t0, 0x1
/* 4ADAC 8005A5AC 2A104800 */  slt        $v0, $v0, $t0
/* 4ADB0 8005A5B0 E6FF4010 */  beqz       $v0, .L8005A54C
/* 4ADB4 8005A5B4 7000E724 */   addiu     $a3, $a3, 0x70
.L8005A5B8:
/* 4ADB8 8005A5B8 E382010C */  jal        EVENT_UpdateResetSignalArrayAndWaterMovement
/* 4ADBC 8005A5BC 00000000 */   nop
/* 4ADC0 8005A5C0 1000BF8F */  lw         $ra, 0x10($sp)
/* 4ADC4 8005A5C4 00000000 */  nop
/* 4ADC8 8005A5C8 0800E003 */  jr         $ra
/* 4ADCC 8005A5CC 1800BD27 */   addiu     $sp, $sp, 0x18
.size STREAM_UpdateLevelPointer, . - STREAM_UpdateLevelPointer

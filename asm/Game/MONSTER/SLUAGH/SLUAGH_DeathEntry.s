.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SLUAGH_DeathEntry
/* 7DD4C 8008D54C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7DD50 8008D550 1400B1AF */  sw         $s1, 0x14($sp)
/* 7DD54 8008D554 21888000 */  addu       $s1, $a0, $zero
/* 7DD58 8008D558 1800BFAF */  sw         $ra, 0x18($sp)
/* 7DD5C 8008D55C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7DD60 8008D560 6C01308E */  lw         $s0, 0x16C($s1)
/* 7DD64 8008D564 00000000 */  nop
/* 7DD68 8008D568 DC00048E */  lw         $a0, 0xDC($s0)
/* 7DD6C 8008D56C 042E010C */  jal        FX_StopGlowEffect
/* 7DD70 8008D570 21280000 */   addu      $a1, $zero, $zero
/* 7DD74 8008D574 C400028E */  lw         $v0, 0xC4($s0)
/* 7DD78 8008D578 00000000 */  nop
/* 7DD7C 8008D57C 0C004010 */  beqz       $v0, .L8008D5B0
/* 7DD80 8008D580 DC0000AE */   sw        $zero, 0xDC($s0)
/* 7DD84 8008D584 0400458C */  lw         $a1, 0x4($v0)
/* 7DD88 8008D588 C000068E */  lw         $a2, 0xC0($s0)
/* 7DD8C 8008D58C 3511020C */  jal        MON_SetUpKnockBack
/* 7DD90 8008D590 21202002 */   addu      $a0, $s1, $zero
/* 7DD94 8008D594 03004010 */  beqz       $v0, .L8008D5A4
/* 7DD98 8008D598 21202002 */   addu      $a0, $s1, $zero
/* 7DD9C 8008D59C 6A350208 */  j          .L8008D5A8
/* 7DDA0 8008D5A0 21280000 */   addu      $a1, $zero, $zero
.L8008D5A4:
/* 7DDA4 8008D5A4 01000524 */  addiu      $a1, $zero, 0x1
.L8008D5A8:
/* 7DDA8 8008D5A8 B6FF010C */  jal        MON_PlayAnim
/* 7DDAC 8008D5AC 01000624 */   addiu     $a2, $zero, 0x1
.L8008D5B0:
/* 7DDB0 8008D5B0 0400028E */  lw         $v0, 0x4($s0)
/* 7DDB4 8008D5B4 09000324 */  addiu      $v1, $zero, 0x9
/* 7DDB8 8008D5B8 01004230 */  andi       $v0, $v0, 0x1
/* 7DDBC 8008D5BC 07004014 */  bnez       $v0, .L8008D5DC
/* 7DDC0 8008D5C0 5A0103A2 */   sb        $v1, 0x15A($s0)
/* 7DDC4 8008D5C4 E910020C */  jal        MON_BirthMana
/* 7DDC8 8008D5C8 21202002 */   addu      $a0, $s1, $zero
/* 7DDCC 8008D5CC 0400028E */  lw         $v0, 0x4($s0)
/* 7DDD0 8008D5D0 00000000 */  nop
/* 7DDD4 8008D5D4 01004234 */  ori        $v0, $v0, 0x1
/* 7DDD8 8008D5D8 040002AE */  sw         $v0, 0x4($s0)
.L8008D5DC:
/* 7DDDC 8008D5DC 21202002 */  addu       $a0, $s1, $zero
/* 7DDE0 8008D5E0 00080524 */  addiu      $a1, $zero, 0x800
/* 7DDE4 8008D5E4 14000624 */  addiu      $a2, $zero, 0x14
/* 7DDE8 8008D5E8 0000028E */  lw         $v0, 0x0($s0)
/* 7DDEC 8008D5EC 2000033C */  lui        $v1, (0x200000 >> 16)
/* 7DDF0 8008D5F0 25104300 */  or         $v0, $v0, $v1
/* 7DDF4 8008D5F4 7810020C */  jal        MON_StartSpecialFade
/* 7DDF8 8008D5F8 000002AE */   sw        $v0, 0x0($s0)
/* 7DDFC 8008D5FC 1800BF8F */  lw         $ra, 0x18($sp)
/* 7DE00 8008D600 1400B18F */  lw         $s1, 0x14($sp)
/* 7DE04 8008D604 1000B08F */  lw         $s0, 0x10($sp)
/* 7DE08 8008D608 0800E003 */  jr         $ra
/* 7DE0C 8008D60C 2000BD27 */   addiu     $sp, $sp, 0x20
.size SLUAGH_DeathEntry, . - SLUAGH_DeathEntry

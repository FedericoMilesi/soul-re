.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MonsterProcess
/* 6E4B0 8007DCB0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6E4B4 8007DCB4 1400B1AF */  sw         $s1, 0x14($sp)
/* 6E4B8 8007DCB8 21888000 */  addu       $s1, $a0, $zero
/* 6E4BC 8007DCBC 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 6E4C0 8007DCC0 1800B2AF */  sw         $s2, 0x18($sp)
/* 6E4C4 8007DCC4 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E4C8 8007DCC8 6C01328E */  lw         $s2, 0x16C($s1)
/* 6E4CC 8007DCCC 2400228E */  lw         $v0, 0x24($s1)
/* 6E4D0 8007DCD0 3F004012 */  beqz       $s2, .L8007DDD0
/* 6E4D4 8007DCD4 00000000 */   nop
/* 6E4D8 8007DCD8 3D004010 */  beqz       $v0, .L8007DDD0
/* 6E4DC 8007DCDC 0800033C */   lui       $v1, (0x80000 >> 16)
/* 6E4E0 8007DCE0 0000428E */  lw         $v0, 0x0($s2)
/* 6E4E4 8007DCE4 00000000 */  nop
/* 6E4E8 8007DCE8 24104300 */  and        $v0, $v0, $v1
/* 6E4EC 8007DCEC 38004014 */  bnez       $v0, .L8007DDD0
/* 6E4F0 8007DCF0 00000000 */   nop
/* 6E4F4 8007DCF4 280120AE */  sw         $zero, 0x128($s1)
/* 6E4F8 8007DCF8 371C020C */  jal        MONSENSE_DoSenses
/* 6E4FC 8007DCFC 300120AE */   sw        $zero, 0x130($s1)
/* 6E500 8007DD00 EE1C020C */  jal        MON_DoCombatTimers
/* 6E504 8007DD04 21202002 */   addu      $a0, $s1, $zero
/* 6E508 8007DD08 9801258E */  lw         $a1, 0x198($s1)
/* 6E50C 8007DD0C 2534020C */  jal        MONTABLE_GetStateFuncs
/* 6E510 8007DD10 21202002 */   addu      $a0, $s1, $zero
/* 6E514 8007DD14 1800238E */  lw         $v1, 0x18($s1)
/* 6E518 8007DD18 EFFF0424 */  addiu      $a0, $zero, -0x11
/* 6E51C 8007DD1C 24186400 */  and        $v1, $v1, $a0
/* 6E520 8007DD20 FDFF0424 */  addiu      $a0, $zero, -0x3
/* 6E524 8007DD24 24186400 */  and        $v1, $v1, $a0
/* 6E528 8007DD28 180023AE */  sw         $v1, 0x18($s1)
/* 6E52C 8007DD2C 0000438E */  lw         $v1, 0x0($s2)
/* 6E530 8007DD30 00000000 */  nop
/* 6E534 8007DD34 80006330 */  andi       $v1, $v1, 0x80
/* 6E538 8007DD38 03006014 */  bnez       $v1, .L8007DD48
/* 6E53C 8007DD3C 21804000 */   addu      $s0, $v0, $zero
/* 6E540 8007DD40 67C7010C */  jal        G2EmulationInstancePlayAnimation
/* 6E544 8007DD44 21202002 */   addu      $a0, $s1, $zero
.L8007DD48:
/* 6E548 8007DD48 0400028E */  lw         $v0, 0x4($s0)
/* 6E54C 8007DD4C 00000000 */  nop
/* 6E550 8007DD50 09F84000 */  jalr       $v0
/* 6E554 8007DD54 21202002 */   addu      $a0, $s1, $zero
/* 6E558 8007DD58 0000428E */  lw         $v0, 0x0($s2)
/* 6E55C 8007DD5C 00000000 */  nop
/* 6E560 8007DD60 01004230 */  andi       $v0, $v0, 0x1
/* 6E564 8007DD64 08004010 */  beqz       $v0, .L8007DD88
/* 6E568 8007DD68 00000000 */   nop
/* 6E56C 8007DD6C 9801258E */  lw         $a1, 0x198($s1)
/* 6E570 8007DD70 2534020C */  jal        MONTABLE_GetStateFuncs
/* 6E574 8007DD74 21202002 */   addu      $a0, $s1, $zero
/* 6E578 8007DD78 0000428C */  lw         $v0, 0x0($v0)
/* 6E57C 8007DD7C 00000000 */  nop
/* 6E580 8007DD80 09F84000 */  jalr       $v0
/* 6E584 8007DD84 21202002 */   addu      $a0, $s1, $zero
.L8007DD88:
/* 6E588 8007DD88 0000428E */  lw         $v0, 0x0($s2)
/* 6E58C 8007DD8C BEFF0324 */  addiu      $v1, $zero, -0x42
/* 6E590 8007DD90 24104300 */  and        $v0, $v0, $v1
/* 6E594 8007DD94 000042AE */  sw         $v0, 0x0($s2)
/* 6E598 8007DD98 1400228E */  lw         $v0, 0x14($s1)
/* 6E59C 8007DD9C 00000000 */  nop
/* 6E5A0 8007DDA0 00024230 */  andi       $v0, $v0, 0x200
/* 6E5A4 8007DDA4 06004010 */  beqz       $v0, .L8007DDC0
/* 6E5A8 8007DDA8 00000000 */   nop
/* 6E5AC 8007DDAC 4134020C */  jal        MONTABLE_GetDamageEffectFunc
/* 6E5B0 8007DDB0 21202002 */   addu      $a0, $s1, $zero
/* 6E5B4 8007DDB4 21202002 */  addu       $a0, $s1, $zero
/* 6E5B8 8007DDB8 09F84000 */  jalr       $v0
/* 6E5BC 8007DDBC 21280000 */   addu      $a1, $zero, $zero
.L8007DDC0:
/* 6E5C0 8007DDC0 7F0A020C */  jal        MON_ProcessLookAt
/* 6E5C4 8007DDC4 21202002 */   addu      $a0, $s1, $zero
/* 6E5C8 8007DDC8 E90F020C */  jal        MON_ProcessSpecialFade
/* 6E5CC 8007DDCC 21202002 */   addu      $a0, $s1, $zero
.L8007DDD0:
/* 6E5D0 8007DDD0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 6E5D4 8007DDD4 1800B28F */  lw         $s2, 0x18($sp)
/* 6E5D8 8007DDD8 1400B18F */  lw         $s1, 0x14($sp)
/* 6E5DC 8007DDDC 1000B08F */  lw         $s0, 0x10($sp)
/* 6E5E0 8007DDE0 0800E003 */  jr         $ra
/* 6E5E4 8007DDE4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MonsterProcess, . - MonsterProcess

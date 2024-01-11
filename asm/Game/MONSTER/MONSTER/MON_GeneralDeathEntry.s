.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_GeneralDeathEntry
/* 7BB1C 8008B31C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7BB20 8008B320 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 7BB24 8008B324 21888000 */  addu       $s1, $a0, $zero
/* 7BB28 8008B328 2400BFAF */  sw         $ra, 0x24($sp)
/* 7BB2C 8008B32C 2000B2AF */  sw         $s2, 0x20($sp)
/* 7BB30 8008B330 1800B0AF */  sw         $s0, 0x18($sp)
/* 7BB34 8008B334 6C01308E */  lw         $s0, 0x16C($s1)
/* 7BB38 8008B338 4801228E */  lw         $v0, 0x148($s1)
/* 7BB3C 8008B33C 2400328E */  lw         $s2, 0x24($s1)
/* 7BB40 8008B340 07004010 */  beqz       $v0, .L8008B360
/* 7BB44 8008B344 00000000 */   nop
/* 7BB48 8008B348 9210020C */  jal        MON_UnlinkFromRaziel
/* 7BB4C 8008B34C 00000000 */   nop
/* 7BB50 8008B350 F0FF0224 */  addiu      $v0, $zero, -0x10
/* 7BB54 8008B354 800120AE */  sw         $zero, 0x180($s1)
/* 7BB58 8008B358 840120AE */  sw         $zero, 0x184($s1)
/* 7BB5C 8008B35C 880122AE */  sw         $v0, 0x188($s1)
.L8008B360:
/* 7BB60 8008B360 1800228E */  lw         $v0, 0x18($s1)
/* 7BB64 8008B364 2000033C */  lui        $v1, (0x202000 >> 16)
/* 7BB68 8008B368 80004234 */  ori        $v0, $v0, 0x80
/* 7BB6C 8008B36C 180022AE */  sw         $v0, 0x18($s1)
/* 7BB70 8008B370 0000028E */  lw         $v0, 0x0($s0)
/* 7BB74 8008B374 00206334 */  ori        $v1, $v1, (0x202000 & 0xFFFF)
/* 7BB78 8008B378 25104300 */  or         $v0, $v0, $v1
/* 7BB7C 8008B37C EFFF0324 */  addiu      $v1, $zero, -0x11
/* 7BB80 8008B380 24104300 */  and        $v0, $v0, $v1
/* 7BB84 8008B384 54010396 */  lhu        $v1, 0x154($s0)
/* 7BB88 8008B388 000002AE */  sw         $v0, 0x0($s0)
/* 7BB8C 8008B38C 20000224 */  addiu      $v0, $zero, 0x20
/* 7BB90 8008B390 24006210 */  beq        $v1, $v0, .L8008B424
/* 7BB94 8008B394 21006228 */   slti      $v0, $v1, 0x21
/* 7BB98 8008B398 05004010 */  beqz       $v0, .L8008B3B0
/* 7BB9C 8008B39C 10000224 */   addiu     $v0, $zero, 0x10
/* 7BBA0 8008B3A0 0A006210 */  beq        $v1, $v0, .L8008B3CC
/* 7BBA4 8008B3A4 5C002426 */   addiu     $a0, $s1, 0x5C
/* 7BBA8 8008B3A8 372D0208 */  j          .L8008B4DC
/* 7BBAC 8008B3AC 00000000 */   nop
.L8008B3B0:
/* 7BBB0 8008B3B0 40000224 */  addiu      $v0, $zero, 0x40
/* 7BBB4 8008B3B4 1D006210 */  beq        $v1, $v0, .L8008B42C
/* 7BBB8 8008B3B8 00040224 */   addiu     $v0, $zero, 0x400
/* 7BBBC 8008B3BC 40006210 */  beq        $v1, $v0, .L8008B4C0
/* 7BBC0 8008B3C0 21202002 */   addu      $a0, $s1, $zero
/* 7BBC4 8008B3C4 372D0208 */  j          .L8008B4DC
/* 7BBC8 8008B3C8 00000000 */   nop
.L8008B3CC:
/* 7BBCC 8008B3CC 23000524 */  addiu      $a1, $zero, 0x23
/* 7BBD0 8008B3D0 58020624 */  addiu      $a2, $zero, 0x258
/* 7BBD4 8008B3D4 50000724 */  addiu      $a3, $zero, 0x50
/* 7BBD8 8008B3D8 10270224 */  addiu      $v0, $zero, 0x2710
/* 7BBDC 8008B3DC 1300010C */  jal        SOUND_Play3dSound
/* 7BBE0 8008B3E0 1000A2AF */   sw        $v0, 0x10($sp)
/* 7BBE4 8008B3E4 21202002 */  addu       $a0, $s1, $zero
/* 7BBE8 8008B3E8 1B000524 */  addiu      $a1, $zero, 0x1B
/* 7BBEC 8008B3EC 02000624 */  addiu      $a2, $zero, 0x2
/* 7BBF0 8008B3F0 B6FF010C */  jal        MON_PlayAnim
/* 7BBF4 8008B3F4 DC0002AE */   sw        $v0, 0xDC($s0)
/* 7BBF8 8008B3F8 21202002 */  addu       $a0, $s1, $zero
/* 7BBFC 8008B3FC 03000224 */  addiu      $v0, $zero, 0x3
/* 7BC00 8008B400 9006020C */  jal        MON_GetTime
/* 7BC04 8008B404 580102A2 */   sb        $v0, 0x158($s0)
/* 7BC08 8008B408 21202002 */  addu       $a0, $s1, $zero
/* 7BC0C 8008B40C B80B4224 */  addiu      $v0, $v0, 0xBB8
/* 7BC10 8008B410 9006020C */  jal        MON_GetTime
/* 7BC14 8008B414 140102AE */   sw        $v0, 0x114($s0)
/* 7BC18 8008B418 E02E4224 */  addiu      $v0, $v0, 0x2EE0
/* 7BC1C 8008B41C 4E2D0208 */  j          .L8008B538
/* 7BC20 8008B420 1C0102AE */   sw        $v0, 0x11C($s0)
.L8008B424:
/* 7BC24 8008B424 01000224 */  addiu      $v0, $zero, 0x1
/* 7BC28 8008B428 580102A2 */  sb         $v0, 0x158($s0)
.L8008B42C:
/* 7BC2C 8008B42C 1000428E */  lw         $v0, 0x10($s2)
/* 7BC30 8008B430 00000000 */  nop
/* 7BC34 8008B434 08004230 */  andi       $v0, $v0, 0x8
/* 7BC38 8008B438 04004010 */  beqz       $v0, .L8008B44C
/* 7BC3C 8008B43C 21202002 */   addu      $a0, $s1, $zero
/* 7BC40 8008B440 24000524 */  addiu      $a1, $zero, 0x24
/* 7BC44 8008B444 152D0208 */  j          .L8008B454
/* 7BC48 8008B448 01000624 */   addiu     $a2, $zero, 0x1
.L8008B44C:
/* 7BC4C 8008B44C 1B000524 */  addiu      $a1, $zero, 0x1B
/* 7BC50 8008B450 02000624 */  addiu      $a2, $zero, 0x2
.L8008B454:
/* 7BC54 8008B454 B6FF010C */  jal        MON_PlayAnim
/* 7BC58 8008B458 00000000 */   nop
/* 7BC5C 8008B45C 54010396 */  lhu        $v1, 0x154($s0)
/* 7BC60 8008B460 40000224 */  addiu      $v0, $zero, 0x40
/* 7BC64 8008B464 02006214 */  bne        $v1, $v0, .L8008B470
/* 7BC68 8008B468 02000224 */   addiu     $v0, $zero, 0x2
/* 7BC6C 8008B46C 580102A2 */  sb         $v0, 0x158($s0)
.L8008B470:
/* 7BC70 8008B470 9006020C */  jal        MON_GetTime
/* 7BC74 8008B474 21202002 */   addu      $a0, $s1, $zero
/* 7BC78 8008B478 21202002 */  addu       $a0, $s1, $zero
/* 7BC7C 8008B47C D0074224 */  addiu      $v0, $v0, 0x7D0
/* 7BC80 8008B480 140102AE */  sw         $v0, 0x114($s0)
/* 7BC84 8008B484 0000028E */  lw         $v0, 0x0($s0)
/* 7BC88 8008B488 4000033C */  lui        $v1, (0x400000 >> 16)
/* 7BC8C 8008B48C 25104300 */  or         $v0, $v0, $v1
/* 7BC90 8008B490 9006020C */  jal        MON_GetTime
/* 7BC94 8008B494 000002AE */   sw        $v0, 0x0($s0)
/* 7BC98 8008B498 21202002 */  addu       $a0, $s1, $zero
/* 7BC9C 8008B49C 60490524 */  addiu      $a1, $zero, 0x4960
/* 7BCA0 8008B4A0 FFFF0624 */  addiu      $a2, $zero, -0x1
/* 7BCA4 8008B4A4 21380000 */  addu       $a3, $zero, $zero
/* 7BCA8 8008B4A8 10274224 */  addiu      $v0, $v0, 0x2710
/* 7BCAC 8008B4AC 1C0102AE */  sw         $v0, 0x11C($s0)
/* 7BCB0 8008B4B0 642C020C */  jal        MON_MonsterGlow
/* 7BCB4 8008B4B4 1000A0AF */   sw        $zero, 0x10($sp)
/* 7BCB8 8008B4B8 4F2D0208 */  j          .L8008B53C
/* 7BCBC 8008B4BC 800120AE */   sw        $zero, 0x180($s1)
.L8008B4C0:
/* 7BCC0 8008B4C0 24000524 */  addiu      $a1, $zero, 0x24
/* 7BCC4 8008B4C4 B6FF010C */  jal        MON_PlayAnim
/* 7BCC8 8008B4C8 01000624 */   addiu     $a2, $zero, 0x1
/* 7BCCC 8008B4CC 06000224 */  addiu      $v0, $zero, 0x6
/* 7BCD0 8008B4D0 580102A2 */  sb         $v0, 0x158($s0)
/* 7BCD4 8008B4D4 4E2D0208 */  j          .L8008B538
/* 7BCD8 8008B4D8 140100AE */   sw        $zero, 0x114($s0)
.L8008B4DC:
/* 7BCDC 8008B4DC C400028E */  lw         $v0, 0xC4($s0)
/* 7BCE0 8008B4E0 00000000 */  nop
/* 7BCE4 8008B4E4 0C004010 */  beqz       $v0, .L8008B518
/* 7BCE8 8008B4E8 21202002 */   addu      $a0, $s1, $zero
/* 7BCEC 8008B4EC 0400458C */  lw         $a1, 0x4($v0)
/* 7BCF0 8008B4F0 C000068E */  lw         $a2, 0xC0($s0)
/* 7BCF4 8008B4F4 3511020C */  jal        MON_SetUpKnockBack
/* 7BCF8 8008B4F8 21202002 */   addu      $a0, $s1, $zero
/* 7BCFC 8008B4FC 03004010 */  beqz       $v0, .L8008B50C
/* 7BD00 8008B500 21280000 */   addu      $a1, $zero, $zero
/* 7BD04 8008B504 472D0208 */  j          .L8008B51C
/* 7BD08 8008B508 21202002 */   addu      $a0, $s1, $zero
.L8008B50C:
/* 7BD0C 8008B50C 21202002 */  addu       $a0, $s1, $zero
/* 7BD10 8008B510 472D0208 */  j          .L8008B51C
/* 7BD14 8008B514 01000524 */   addiu     $a1, $zero, 0x1
.L8008B518:
/* 7BD18 8008B518 24000524 */  addiu      $a1, $zero, 0x24
.L8008B51C:
/* 7BD1C 8008B51C B6FF010C */  jal        MON_PlayAnim
/* 7BD20 8008B520 01000624 */   addiu     $a2, $zero, 0x1
/* 7BD24 8008B524 21202002 */  addu       $a0, $s1, $zero
/* 7BD28 8008B528 07000224 */  addiu      $v0, $zero, 0x7
/* 7BD2C 8008B52C 140100AE */  sw         $zero, 0x114($s0)
/* 7BD30 8008B530 7BFE010C */  jal        MON_TurnOffAllSpheres
/* 7BD34 8008B534 580102A2 */   sb        $v0, 0x158($s0)
.L8008B538:
/* 7BD38 8008B538 800120AE */  sw         $zero, 0x180($s1)
.L8008B53C:
/* 7BD3C 8008B53C 840120AE */  sw         $zero, 0x184($s1)
/* 7BD40 8008B540 740120AE */  sw         $zero, 0x174($s1)
/* 7BD44 8008B544 780120AE */  sw         $zero, 0x178($s1)
/* 7BD48 8008B548 8209020C */  jal        MON_DropAllObjects
/* 7BD4C 8008B54C 21202002 */   addu      $a0, $s1, $zero
/* 7BD50 8008B550 2400BF8F */  lw         $ra, 0x24($sp)
/* 7BD54 8008B554 2000B28F */  lw         $s2, 0x20($sp)
/* 7BD58 8008B558 1C00B18F */  lw         $s1, 0x1C($sp)
/* 7BD5C 8008B55C 1800B08F */  lw         $s0, 0x18($sp)
/* 7BD60 8008B560 0800E003 */  jr         $ra
/* 7BD64 8008B564 2800BD27 */   addiu     $sp, $sp, 0x28
.size MON_GeneralDeathEntry, . - MON_GeneralDeathEntry

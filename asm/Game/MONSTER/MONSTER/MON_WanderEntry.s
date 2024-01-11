.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MON_WanderEntry
/* 7B410 8008AC10 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7B414 8008AC14 1400B1AF */  sw         $s1, 0x14($sp)
/* 7B418 8008AC18 21888000 */  addu       $s1, $a0, $zero
/* 7B41C 8008AC1C 1800BFAF */  sw         $ra, 0x18($sp)
/* 7B420 8008AC20 1000B0AF */  sw         $s0, 0x10($sp)
/* 7B424 8008AC24 6C01308E */  lw         $s0, 0x16C($s1)
/* 7B428 8008AC28 0100033C */  lui        $v1, (0x11000 >> 16)
/* 7B42C 8008AC2C 0000028E */  lw         $v0, 0x0($s0)
/* 7B430 8008AC30 00106334 */  ori        $v1, $v1, (0x11000 & 0xFFFF)
/* 7B434 8008AC34 25104300 */  or         $v0, $v0, $v1
/* 7B438 8008AC38 000002AE */  sw         $v0, 0x0($s0)
/* 7B43C 8008AC3C 04004230 */  andi       $v0, $v0, 0x4
/* 7B440 8008AC40 05004010 */  beqz       $v0, .L8008AC58
/* 7B444 8008AC44 02000524 */   addiu     $a1, $zero, 0x2
/* 7B448 8008AC48 B6FF010C */  jal        MON_PlayAnim
/* 7B44C 8008AC4C 2130A000 */   addu      $a2, $a1, $zero
/* 7B450 8008AC50 212B0208 */  j          .L8008AC84
/* 7B454 8008AC54 FDFF023C */   lui       $v0, (0xFFFDFFFF >> 16)
.L8008AC58:
/* 7B458 8008AC58 C908020C */  jal        MON_GetPlanSlot
/* 7B45C 8008AC5C 21200002 */   addu      $a0, $s0, $zero
/* 7B460 8008AC60 21202002 */  addu       $a0, $s1, $zero
/* 7B464 8008AC64 C3FF010C */  jal        MON_AnimPlaying
/* 7B468 8008AC68 02000524 */   addiu     $a1, $zero, 0x2
/* 7B46C 8008AC6C 05004014 */  bnez       $v0, .L8008AC84
/* 7B470 8008AC70 FDFF023C */   lui       $v0, (0xFFFDFFFF >> 16)
/* 7B474 8008AC74 21202002 */  addu       $a0, $s1, $zero
/* 7B478 8008AC78 3403020C */  jal        MON_PlayRandomIdle
/* 7B47C 8008AC7C 02000524 */   addiu     $a1, $zero, 0x2
/* 7B480 8008AC80 FDFF023C */  lui        $v0, (0xFFFDFFFF >> 16)
.L8008AC84:
/* 7B484 8008AC84 0000038E */  lw         $v1, 0x0($s0)
/* 7B488 8008AC88 FFFF4234 */  ori        $v0, $v0, (0xFFFDFFFF & 0xFFFF)
/* 7B48C 8008AC8C 24186200 */  and        $v1, $v1, $v0
/* 7B490 8008AC90 000003AE */  sw         $v1, 0x0($s0)
/* 7B494 8008AC94 9006020C */  jal        MON_GetTime
/* 7B498 8008AC98 21202002 */   addu      $a0, $s1, $zero
/* 7B49C 8008AC9C E8034224 */  addiu      $v0, $v0, 0x3E8
/* 7B4A0 8008ACA0 140102AE */  sw         $v0, 0x114($s0)
/* 7B4A4 8008ACA4 1800BF8F */  lw         $ra, 0x18($sp)
/* 7B4A8 8008ACA8 1400B18F */  lw         $s1, 0x14($sp)
/* 7B4AC 8008ACAC 1000B08F */  lw         $s0, 0x10($sp)
/* 7B4B0 8008ACB0 0800E003 */  jr         $ra
/* 7B4B4 8008ACB4 2000BD27 */   addiu     $sp, $sp, 0x20
.size MON_WanderEntry, . - MON_WanderEntry

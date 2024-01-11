.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_SetLightTable
/* 5B408 8006AC08 00BF8797 */  lhu        $a3, %gp_rel(gameTrackerX + 0x138)($gp)
/* 5B40C 8006AC0C 02008284 */  lh         $v0, 0x2($a0)
/* 5B410 8006AC10 00000000 */  nop
/* 5B414 8006AC14 1800E200 */  mult       $a3, $v0
/* 5B418 8006AC18 00008390 */  lbu        $v1, 0x0($a0)
/* 5B41C 8006AC1C 12380000 */  mflo       $a3
/* 5B420 8006AC20 00130300 */  sll        $v0, $v1, 12
/* 5B424 8006AC24 00000000 */  nop
/* 5B428 8006AC28 1A00E200 */  div        $zero, $a3, $v0
/* 5B42C 8006AC2C 10380000 */  mfhi       $a3
/* 5B430 8006AC30 0400888C */  lw         $t0, 0x4($a0)
/* 5B434 8006AC34 FF0FEA30 */  andi       $t2, $a3, 0xFFF
/* 5B438 8006AC38 033B0700 */  sra        $a3, $a3, 12
/* 5B43C 8006AC3C C0100700 */  sll        $v0, $a3, 3
/* 5B440 8006AC40 0100E724 */  addiu      $a3, $a3, 0x1
/* 5B444 8006AC44 0200E314 */  bne        $a3, $v1, .L8006AC50
/* 5B448 8006AC48 21480201 */   addu      $t1, $t0, $v0
/* 5B44C 8006AC4C 21380000 */  addu       $a3, $zero, $zero
.L8006AC50:
/* 5B450 8006AC50 01008290 */  lbu        $v0, 0x1($a0)
/* 5B454 8006AC54 00000000 */  nop
/* 5B458 8006AC58 1200A2A0 */  sb         $v0, 0x12($a1)
/* 5B45C 8006AC5C C0100700 */  sll        $v0, $a3, 3
/* 5B460 8006AC60 21200201 */  addu       $a0, $t0, $v0
/* 5B464 8006AC64 06008284 */  lh         $v0, 0x6($a0)
/* 5B468 8006AC68 06002385 */  lh         $v1, 0x6($t1)
/* 5B46C 8006AC6C 00000000 */  nop
/* 5B470 8006AC70 23104300 */  subu       $v0, $v0, $v1
/* 5B474 8006AC74 18004A00 */  mult       $v0, $t2
/* 5B478 8006AC78 06002395 */  lhu        $v1, 0x6($t1)
/* 5B47C 8006AC7C 12580000 */  mflo       $t3
/* 5B480 8006AC80 03130B00 */  sra        $v0, $t3, 12
/* 5B484 8006AC84 21186200 */  addu       $v1, $v1, $v0
/* 5B488 8006AC88 001C0300 */  sll        $v1, $v1, 16
/* 5B48C 8006AC8C 031C0300 */  sra        $v1, $v1, 16
/* 5B490 8006AC90 00140600 */  sll        $v0, $a2, 16
/* 5B494 8006AC94 03140200 */  sra        $v0, $v0, 16
/* 5B498 8006AC98 18006200 */  mult       $v1, $v0
/* 5B49C 8006AC9C 12580000 */  mflo       $t3
/* 5B4A0 8006ACA0 03130B00 */  sra        $v0, $t3, 12
/* 5B4A4 8006ACA4 1000A2A4 */  sh         $v0, 0x10($a1)
/* 5B4A8 8006ACA8 00140200 */  sll        $v0, $v0, 16
/* 5B4AC 8006ACAC 0200401C */  bgtz       $v0, .L8006ACB8
/* 5B4B0 8006ACB0 01000224 */   addiu     $v0, $zero, 0x1
/* 5B4B4 8006ACB4 1000A2A4 */  sh         $v0, 0x10($a1)
.L8006ACB8:
/* 5B4B8 8006ACB8 00002285 */  lh         $v0, 0x0($t1)
/* 5B4BC 8006ACBC 00008384 */  lh         $v1, 0x0($a0)
/* 5B4C0 8006ACC0 00000000 */  nop
/* 5B4C4 8006ACC4 23186200 */  subu       $v1, $v1, $v0
/* 5B4C8 8006ACC8 18006A00 */  mult       $v1, $t2
/* 5B4CC 8006ACCC 00130200 */  sll        $v0, $v0, 12
/* 5B4D0 8006ACD0 12380000 */  mflo       $a3
/* 5B4D4 8006ACD4 1000A384 */  lh         $v1, 0x10($a1)
/* 5B4D8 8006ACD8 21104700 */  addu       $v0, $v0, $a3
/* 5B4DC 8006ACDC 1A004300 */  div        $zero, $v0, $v1
/* 5B4E0 8006ACE0 12100000 */  mflo       $v0
/* 5B4E4 8006ACE4 00000000 */  nop
/* 5B4E8 8006ACE8 00140200 */  sll        $v0, $v0, 16
/* 5B4EC 8006ACEC 03140200 */  sra        $v0, $v0, 16
/* 5B4F0 8006ACF0 0400A2AC */  sw         $v0, 0x4($a1)
/* 5B4F4 8006ACF4 02002285 */  lh         $v0, 0x2($t1)
/* 5B4F8 8006ACF8 02008384 */  lh         $v1, 0x2($a0)
/* 5B4FC 8006ACFC 00000000 */  nop
/* 5B500 8006AD00 23186200 */  subu       $v1, $v1, $v0
/* 5B504 8006AD04 18006A00 */  mult       $v1, $t2
/* 5B508 8006AD08 00130200 */  sll        $v0, $v0, 12
/* 5B50C 8006AD0C 12380000 */  mflo       $a3
/* 5B510 8006AD10 1000A384 */  lh         $v1, 0x10($a1)
/* 5B514 8006AD14 21104700 */  addu       $v0, $v0, $a3
/* 5B518 8006AD18 1A004300 */  div        $zero, $v0, $v1
/* 5B51C 8006AD1C 12100000 */  mflo       $v0
/* 5B520 8006AD20 00000000 */  nop
/* 5B524 8006AD24 00140200 */  sll        $v0, $v0, 16
/* 5B528 8006AD28 03140200 */  sra        $v0, $v0, 16
/* 5B52C 8006AD2C 0800A2AC */  sw         $v0, 0x8($a1)
/* 5B530 8006AD30 04002285 */  lh         $v0, 0x4($t1)
/* 5B534 8006AD34 04008384 */  lh         $v1, 0x4($a0)
/* 5B538 8006AD38 00000000 */  nop
/* 5B53C 8006AD3C 23186200 */  subu       $v1, $v1, $v0
/* 5B540 8006AD40 18006A00 */  mult       $v1, $t2
/* 5B544 8006AD44 00130200 */  sll        $v0, $v0, 12
/* 5B548 8006AD48 12380000 */  mflo       $a3
/* 5B54C 8006AD4C 1000A384 */  lh         $v1, 0x10($a1)
/* 5B550 8006AD50 21104700 */  addu       $v0, $v0, $a3
/* 5B554 8006AD54 1A004300 */  div        $zero, $v0, $v1
/* 5B558 8006AD58 12100000 */  mflo       $v0
/* 5B55C 8006AD5C 00000000 */  nop
/* 5B560 8006AD60 00140200 */  sll        $v0, $v0, 16
/* 5B564 8006AD64 03140200 */  sra        $v0, $v0, 16
/* 5B568 8006AD68 0800E003 */  jr         $ra
/* 5B56C 8006AD6C 0C00A2AC */   sw        $v0, 0xC($a1)
.size PHYSOB_SetLightTable, . - PHYSOB_SetLightTable

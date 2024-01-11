.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel my_itoa
/* 64F14 80074714 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 64F18 80074718 21188000 */  addu       $v1, $a0, $zero
/* 64F1C 8007471C 2120A003 */  addu       $a0, $sp, $zero
/* 64F20 80074720 09006014 */  bnez       $v1, .L80074748
/* 64F24 80074724 2138A000 */   addu      $a3, $a1, $zero
/* 64F28 80074728 0D80023C */  lui        $v0, %hi(VRAM_NeedToUpdateMorph + 0x4)
/* 64F2C 8007472C 741A4B24 */  addiu      $t3, $v0, %lo(VRAM_NeedToUpdateMorph + 0x4)
/* 64F30 80074730 00006881 */  lb         $t0, 0x0($t3)
/* 64F34 80074734 01006981 */  lb         $t1, 0x1($t3)
/* 64F38 80074738 0000A8A0 */  sb         $t0, 0x0($a1)
/* 64F3C 8007473C 0100A9A0 */  sb         $t1, 0x1($a1)
/* 64F40 80074740 F7D10108 */  j          .L800747DC
/* 64F44 80074744 2110A000 */   addu      $v0, $a1, $zero
.L80074748:
/* 64F48 80074748 FEFFC224 */  addiu      $v0, $a2, -0x2
/* 64F4C 8007474C 2300422C */  sltiu      $v0, $v0, 0x23
/* 64F50 80074750 02004014 */  bnez       $v0, .L8007475C
/* 64F54 80074754 0A000224 */   addiu     $v0, $zero, 0xA
/* 64F58 80074758 0A000624 */  addiu      $a2, $zero, 0xA
.L8007475C:
/* 64F5C 8007475C 0600C214 */  bne        $a2, $v0, .L80074778
/* 64F60 80074760 00000000 */   nop
/* 64F64 80074764 04006104 */  bgez       $v1, .L80074778
/* 64F68 80074768 2D000224 */   addiu     $v0, $zero, 0x2D
/* 64F6C 8007476C 0000A2A0 */  sb         $v0, 0x0($a1)
/* 64F70 80074770 0100A724 */  addiu      $a3, $a1, 0x1
/* 64F74 80074774 23180300 */  negu       $v1, $v1
.L80074778:
/* 64F78 80074778 07006010 */  beqz       $v1, .L80074798
/* 64F7C 8007477C 00000000 */   nop
.L80074780:
/* 64F80 80074780 1B006600 */  divu       $zero, $v1, $a2
/* 64F84 80074784 12180000 */  mflo       $v1
/* 64F88 80074788 10100000 */  mfhi       $v0
/* 64F8C 8007478C 000082A0 */  sb         $v0, 0x0($a0)
/* 64F90 80074790 FBFF6014 */  bnez       $v1, .L80074780
/* 64F94 80074794 01008424 */   addiu     $a0, $a0, 0x1
.L80074798:
/* 64F98 80074798 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 64F9C 8007479C 2B109D00 */  sltu       $v0, $a0, $sp
/* 64FA0 800747A0 0C004014 */  bnez       $v0, .L800747D4
/* 64FA4 800747A4 00000000 */   nop
.L800747A8:
/* 64FA8 800747A8 00008390 */  lbu        $v1, 0x0($a0)
/* 64FAC 800747AC 00000000 */  nop
/* 64FB0 800747B0 0A00622C */  sltiu      $v0, $v1, 0xA
/* 64FB4 800747B4 02004014 */  bnez       $v0, .L800747C0
/* 64FB8 800747B8 30006224 */   addiu     $v0, $v1, 0x30
/* 64FBC 800747BC 57006224 */  addiu      $v0, $v1, 0x57
.L800747C0:
/* 64FC0 800747C0 0000E2A0 */  sb         $v0, 0x0($a3)
/* 64FC4 800747C4 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 64FC8 800747C8 2B109D00 */  sltu       $v0, $a0, $sp
/* 64FCC 800747CC F6FF4010 */  beqz       $v0, .L800747A8
/* 64FD0 800747D0 0100E724 */   addiu     $a3, $a3, 0x1
.L800747D4:
/* 64FD4 800747D4 0000E0A0 */  sb         $zero, 0x0($a3)
/* 64FD8 800747D8 2110A000 */  addu       $v0, $a1, $zero
.L800747DC:
/* 64FDC 800747DC 0800E003 */  jr         $ra
/* 64FE0 800747E0 2000BD27 */   addiu     $sp, $sp, 0x20
.size my_itoa, . - my_itoa

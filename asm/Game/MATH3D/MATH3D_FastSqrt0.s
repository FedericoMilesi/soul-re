.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_FastSqrt0
/* 2A698 80039E98 21008010 */  beqz       $a0, .L80039F20
/* 2A69C 80039E9C 1F000524 */   addiu     $a1, $zero, 0x1F
/* 2A6A0 80039EA0 05008004 */  bltz       $a0, .L80039EB8
/* 2A6A4 80039EA4 0080063C */   lui       $a2, (0x80000000 >> 16)
.L80039EA8:
/* 2A6A8 80039EA8 43300600 */  sra        $a2, $a2, 1
/* 2A6AC 80039EAC 2410C400 */  and        $v0, $a2, $a0
/* 2A6B0 80039EB0 FDFF4010 */  beqz       $v0, .L80039EA8
/* 2A6B4 80039EB4 FFFFA524 */   addiu     $a1, $a1, -0x1
.L80039EB8:
/* 2A6B8 80039EB8 43280500 */  sra        $a1, $a1, 1
/* 2A6BC 80039EBC 01000224 */  addiu      $v0, $zero, 0x1
/* 2A6C0 80039EC0 0440A200 */  sllv       $t0, $v0, $a1
/* 2A6C4 80039EC4 21300001 */  addu       $a2, $t0, $zero
/* 2A6C8 80039EC8 04184500 */  sllv       $v1, $a1, $v0
/* 2A6CC 80039ECC 04186200 */  sllv       $v1, $v0, $v1
/* 2A6D0 80039ED0 21386000 */  addu       $a3, $v1, $zero
/* 2A6D4 80039ED4 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 2A6D8 80039ED8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 2A6DC 80039EDC 0E00A210 */  beq        $a1, $v0, .L80039F18
/* 2A6E0 80039EE0 23208300 */   subu      $a0, $a0, $v1
/* 2A6E4 80039EE4 21484000 */  addu       $t1, $v0, $zero
/* 2A6E8 80039EE8 43300600 */  sra        $a2, $a2, 1
.L80039EEC:
/* 2A6EC 80039EEC 83380700 */  sra        $a3, $a3, 2
/* 2A6F0 80039EF0 23108300 */  subu       $v0, $a0, $v1
/* 2A6F4 80039EF4 23104700 */  subu       $v0, $v0, $a3
/* 2A6F8 80039EF8 04004004 */  bltz       $v0, .L80039F0C
/* 2A6FC 80039EFC 43180300 */   sra       $v1, $v1, 1
/* 2A700 80039F00 21204000 */  addu       $a0, $v0, $zero
/* 2A704 80039F04 21186700 */  addu       $v1, $v1, $a3
/* 2A708 80039F08 25400601 */  or         $t0, $t0, $a2
.L80039F0C:
/* 2A70C 80039F0C FFFFA524 */  addiu      $a1, $a1, -0x1
/* 2A710 80039F10 F6FFA914 */  bne        $a1, $t1, .L80039EEC
/* 2A714 80039F14 43300600 */   sra       $a2, $a2, 1
.L80039F18:
/* 2A718 80039F18 0800E003 */  jr         $ra
/* 2A71C 80039F1C 21100001 */   addu      $v0, $t0, $zero
.L80039F20:
/* 2A720 80039F20 0800E003 */  jr         $ra
/* 2A724 80039F24 21100000 */   addu      $v0, $zero, $zero
.size MATH3D_FastSqrt0, . - MATH3D_FastSqrt0

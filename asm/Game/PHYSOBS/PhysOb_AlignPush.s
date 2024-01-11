.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PhysOb_AlignPush
/* 5ABE0 8006A3E0 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 5ABE4 8006A3E4 6000B4AF */  sw         $s4, 0x60($sp)
/* 5ABE8 8006A3E8 21A08000 */  addu       $s4, $a0, $zero
/* 5ABEC 8006A3EC 6400B5AF */  sw         $s5, 0x64($sp)
/* 5ABF0 8006A3F0 21A8A000 */  addu       $s5, $a1, $zero
/* 5ABF4 8006A3F4 5C00B3AF */  sw         $s3, 0x5C($sp)
/* 5ABF8 8006A3F8 2198C000 */  addu       $s3, $a2, $zero
/* 5ABFC 8006A3FC 6800B6AF */  sw         $s6, 0x68($sp)
/* 5AC00 8006A400 21B0E000 */  addu       $s6, $a3, $zero
/* 5AC04 8006A404 5400B1AF */  sw         $s1, 0x54($sp)
/* 5AC08 8006A408 C8019126 */  addiu      $s1, $s4, 0x1C8
/* 5AC0C 8006A40C 21202002 */  addu       $a0, $s1, $zero
/* 5AC10 8006A410 21280000 */  addu       $a1, $zero, $zero
/* 5AC14 8006A414 5000B0AF */  sw         $s0, 0x50($sp)
/* 5AC18 8006A418 8000B08F */  lw         $s0, 0x80($sp)
/* 5AC1C 8006A41C 4C000624 */  addiu      $a2, $zero, 0x4C
/* 5AC20 8006A420 6C00BFAF */  sw         $ra, 0x6C($sp)
/* 5AC24 8006A424 5641020C */  jal        G2Anim_EnableController
/* 5AC28 8006A428 5800B2AF */   sw        $s2, 0x58($sp)
/* 5AC2C 8006A42C 21202002 */  addu       $a0, $s1, $zero
/* 5AC30 8006A430 02000524 */  addiu      $a1, $zero, 0x2
/* 5AC34 8006A434 5641020C */  jal        G2Anim_EnableController
/* 5AC38 8006A438 0E000624 */   addiu     $a2, $zero, 0xE
/* 5AC3C 8006A43C EFFF033C */  lui        $v1, (0xFFEFFFFF >> 16)
/* 5AC40 8006A440 FFFF6334 */  ori        $v1, $v1, (0xFFEFFFFF & 0xFFFF)
/* 5AC44 8006A444 0000028E */  lw         $v0, 0x0($s0)
/* 5AC48 8006A448 00081224 */  addiu      $s2, $zero, 0x800
/* 5AC4C 8006A44C 040015A6 */  sh         $s5, 0x4($s0)
/* 5AC50 8006A450 060013A6 */  sh         $s3, 0x6($s0)
/* 5AC54 8006A454 280016A6 */  sh         $s6, 0x28($s0)
/* 5AC58 8006A458 24104300 */  and        $v0, $v0, $v1
/* 5AC5C 8006A45C 0600601E */  bgtz       $s3, .L8006A478
/* 5AC60 8006A460 000002AE */   sw        $v0, 0x0($s0)
/* 5AC64 8006A464 04006006 */  bltz       $s3, .L8006A478
/* 5AC68 8006A468 21900000 */   addu      $s2, $zero, $zero
/* 5AC6C 8006A46C 0200A106 */  bgez       $s5, .L8006A478
/* 5AC70 8006A470 00041224 */   addiu     $s2, $zero, 0x400
/* 5AC74 8006A474 00FC1224 */  addiu      $s2, $zero, -0x400
.L8006A478:
/* 5AC78 8006A478 C8019126 */  addiu      $s1, $s4, 0x1C8
/* 5AC7C 8006A47C 21202002 */  addu       $a0, $s1, $zero
/* 5AC80 8006A480 21280000 */  addu       $a1, $zero, $zero
/* 5AC84 8006A484 4C000624 */  addiu      $a2, $zero, 0x4C
/* 5AC88 8006A488 1000A727 */  addiu      $a3, $sp, 0x10
/* 5AC8C 8006A48C 1000A0A7 */  sh         $zero, 0x10($sp)
/* 5AC90 8006A490 1200A0A7 */  sh         $zero, 0x12($sp)
/* 5AC94 8006A494 7D42020C */  jal        G2Anim_SetController_Vector
/* 5AC98 8006A498 1400B2A7 */   sh        $s2, 0x14($sp)
/* 5AC9C 8006A49C 1000A427 */  addiu      $a0, $sp, 0x10
/* 5ACA0 8006A4A0 1800B027 */  addiu      $s0, $sp, 0x18
/* 5ACA4 8006A4A4 21280002 */  addu       $a1, $s0, $zero
/* 5ACA8 8006A4A8 23101200 */  negu       $v0, $s2
/* 5ACAC 8006A4AC D8E2010C */  jal        func_80078B60
/* 5ACB0 8006A4B0 1400A2A7 */   sh        $v0, 0x14($sp)
/* 5ACB4 8006A4B4 21200002 */  addu       $a0, $s0, $zero
/* 5ACB8 8006A4B8 3000B027 */  addiu      $s0, $sp, 0x30
/* 5ACBC 8006A4BC 4000858E */  lw         $a1, 0x40($s4)
/* 5ACC0 8006A4C0 21300002 */  addu       $a2, $s0, $zero
/* 5ACC4 8006A4C4 BFF7020C */  jal        func_800BDEFC
/* 5ACC8 8006A4C8 4000A524 */   addiu     $a1, $a1, 0x40
/* 5ACCC 8006A4CC 4800A427 */  addiu      $a0, $sp, 0x48
/* 5ACD0 8006A4D0 21280002 */  addu       $a1, $s0, $zero
/* 5ACD4 8006A4D4 1758020C */  jal        G2EulerAngles_FromMatrix
/* 5ACD8 8006A4D8 15000624 */   addiu     $a2, $zero, 0x15
/* 5ACDC 8006A4DC 21202002 */  addu       $a0, $s1, $zero
/* 5ACE0 8006A4E0 02000524 */  addiu      $a1, $zero, 0x2
/* 5ACE4 8006A4E4 0E000624 */  addiu      $a2, $zero, 0xE
/* 5ACE8 8006A4E8 4800A297 */  lhu        $v0, 0x48($sp)
/* 5ACEC 8006A4EC 4A00A397 */  lhu        $v1, 0x4A($sp)
/* 5ACF0 8006A4F0 4C00A897 */  lhu        $t0, 0x4C($sp)
/* 5ACF4 8006A4F4 1000A727 */  addiu      $a3, $sp, 0x10
/* 5ACF8 8006A4F8 1000A2A7 */  sh         $v0, 0x10($sp)
/* 5ACFC 8006A4FC 1200A3A7 */  sh         $v1, 0x12($sp)
/* 5AD00 8006A500 7D42020C */  jal        G2Anim_SetController_Vector
/* 5AD04 8006A504 1400A8A7 */   sh        $t0, 0x14($sp)
/* 5AD08 8006A508 1C00828E */  lw         $v0, 0x1C($s4)
/* 5AD0C 8006A50C 21202002 */  addu       $a0, $s1, $zero
/* 5AD10 8006A510 1000438C */  lw         $v1, 0x10($v0)
/* 5AD14 8006A514 80101600 */  sll        $v0, $s6, 2
/* 5AD18 8006A518 21104300 */  addu       $v0, $v0, $v1
/* 5AD1C 8006A51C 0000458C */  lw         $a1, 0x0($v0)
/* 5AD20 8006A520 B33F020C */  jal        G2Anim_SwitchToKeylist
/* 5AD24 8006A524 2130C002 */   addu      $a2, $s6, $zero
/* 5AD28 8006A528 6C00BF8F */  lw         $ra, 0x6C($sp)
/* 5AD2C 8006A52C 6800B68F */  lw         $s6, 0x68($sp)
/* 5AD30 8006A530 6400B58F */  lw         $s5, 0x64($sp)
/* 5AD34 8006A534 6000B48F */  lw         $s4, 0x60($sp)
/* 5AD38 8006A538 5C00B38F */  lw         $s3, 0x5C($sp)
/* 5AD3C 8006A53C 5800B28F */  lw         $s2, 0x58($sp)
/* 5AD40 8006A540 5400B18F */  lw         $s1, 0x54($sp)
/* 5AD44 8006A544 5000B08F */  lw         $s0, 0x50($sp)
/* 5AD48 8006A548 0800E003 */  jr         $ra
/* 5AD4C 8006A54C 7000BD27 */   addiu     $sp, $sp, 0x70
.size PhysOb_AlignPush, . - PhysOb_AlignPush

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SOUND_ProcessInstanceSounds
/* 2F4F0 8003ECF0 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 2F4F4 8003ECF4 4000BEAF */  sw         $fp, 0x40($sp)
/* 2F4F8 8003ECF8 5800BE8F */  lw         $fp, 0x58($sp)
/* 2F4FC 8003ECFC 3800B6AF */  sw         $s6, 0x38($sp)
/* 2F500 8003ED00 5C00B68F */  lw         $s6, 0x5C($sp)
/* 2F504 8003ED04 3400B5AF */  sw         $s5, 0x34($sp)
/* 2F508 8003ED08 6000B58F */  lw         $s5, 0x60($sp)
/* 2F50C 8003ED0C 3ABF8287 */  lh         $v0, %gp_rel(gameTrackerX + 0x172)($gp)
/* 2F510 8003ED10 2000B0AF */  sw         $s0, 0x20($sp)
/* 2F514 8003ED14 21808000 */  addu       $s0, $a0, $zero
/* 2F518 8003ED18 3000B4AF */  sw         $s4, 0x30($sp)
/* 2F51C 8003ED1C 21A0C000 */  addu       $s4, $a2, $zero
/* 2F520 8003ED20 3C00B7AF */  sw         $s7, 0x3C($sp)
/* 2F524 8003ED24 6400B78F */  lw         $s7, 0x64($sp)
/* 2F528 8003ED28 06000324 */  addiu      $v1, $zero, 0x6
/* 2F52C 8003ED2C 4400BFAF */  sw         $ra, 0x44($sp)
/* 2F530 8003ED30 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 2F534 8003ED34 2800B2AF */  sw         $s2, 0x28($sp)
/* 2F538 8003ED38 2400B1AF */  sw         $s1, 0x24($sp)
/* 2F53C 8003ED3C 42004310 */  beq        $v0, $v1, .L8003EE48
/* 2F540 8003ED40 5400A7AF */   sw        $a3, 0x54($sp)
/* 2F544 8003ED44 40000012 */  beqz       $s0, .L8003EE48
/* 2F548 8003ED48 00000000 */   nop
/* 2F54C 8003ED4C 3E00A010 */  beqz       $a1, .L8003EE48
/* 2F550 8003ED50 BE000224 */   addiu     $v0, $zero, 0xBE
/* 2F554 8003ED54 00000392 */  lbu        $v1, 0x0($s0)
/* 2F558 8003ED58 00000000 */  nop
/* 2F55C 8003ED5C 3A006214 */  bne        $v1, $v0, .L8003EE48
/* 2F560 8003ED60 01001026 */   addiu     $s0, $s0, 0x1
/* 2F564 8003ED64 00000392 */  lbu        $v1, 0x0($s0)
/* 2F568 8003ED68 EF000224 */  addiu      $v0, $zero, 0xEF
/* 2F56C 8003ED6C 36006214 */  bne        $v1, $v0, .L8003EE48
/* 2F570 8003ED70 01001026 */   addiu     $s0, $s0, 0x1
/* 2F574 8003ED74 00001392 */  lbu        $s3, 0x0($s0)
/* 2F578 8003ED78 02001026 */  addiu      $s0, $s0, 0x2
/* 2F57C 8003ED7C 32006012 */  beqz       $s3, .L8003EE48
/* 2F580 8003ED80 21900000 */   addu      $s2, $zero, $zero
/* 2F584 8003ED84 2188A000 */  addu       $s1, $a1, $zero
.L8003ED88:
/* 2F588 8003ED88 00000392 */  lbu        $v1, 0x0($s0)
/* 2F58C 8003ED8C 01000224 */  addiu      $v0, $zero, 0x1
/* 2F590 8003ED90 18006210 */  beq        $v1, $v0, .L8003EDF4
/* 2F594 8003ED94 02006228 */   slti      $v0, $v1, 0x2
/* 2F598 8003ED98 05004010 */  beqz       $v0, .L8003EDB0
/* 2F59C 8003ED9C 00000000 */   nop
/* 2F5A0 8003EDA0 08006010 */  beqz       $v1, .L8003EDC4
/* 2F5A4 8003EDA4 21208002 */   addu      $a0, $s4, $zero
/* 2F5A8 8003EDA8 8EFB0008 */  j          .L8003EE38
/* 2F5AC 8003EDAC 03003126 */   addiu     $s1, $s1, 0x3
.L8003EDB0:
/* 2F5B0 8003EDB0 05006228 */  slti       $v0, $v1, 0x5
/* 2F5B4 8003EDB4 1F004010 */  beqz       $v0, .L8003EE34
/* 2F5B8 8003EDB8 21208002 */   addu      $a0, $s4, $zero
/* 2F5BC 8003EDBC 83FB0008 */  j          .L8003EE0C
/* 2F5C0 8003EDC0 2128C002 */   addu      $a1, $s6, $zero
.L8003EDC4:
/* 2F5C4 8003EDC4 2130C003 */  addu       $a2, $fp, $zero
/* 2F5C8 8003EDC8 5400A58F */  lw         $a1, 0x54($sp)
/* 2F5CC 8003EDCC 2138C002 */  addu       $a3, $s6, $zero
/* 2F5D0 8003EDD0 1000B5AF */  sw         $s5, 0x10($sp)
/* 2F5D4 8003EDD4 1400B1AF */  sw         $s1, 0x14($sp)
/* 2F5D8 8003EDD8 61FC000C */  jal        processPeriodicSound
/* 2F5DC 8003EDDC 1800B0AF */   sw        $s0, 0x18($sp)
/* 2F5E0 8003EDE0 01000292 */  lbu        $v0, 0x1($s0)
/* 2F5E4 8003EDE4 00000000 */  nop
/* 2F5E8 8003EDE8 40100200 */  sll        $v0, $v0, 1
/* 2F5EC 8003EDEC 8CFB0008 */  j          .L8003EE30
/* 2F5F0 8003EDF0 12004224 */   addiu     $v0, $v0, 0x12
.L8003EDF4:
/* 2F5F4 8003EDF4 21208002 */  addu       $a0, $s4, $zero
/* 2F5F8 8003EDF8 21282002 */  addu       $a1, $s1, $zero
/* 2F5FC 8003EDFC 89FD000C */  jal        processEventSound
/* 2F600 8003EE00 21300002 */   addu      $a2, $s0, $zero
/* 2F604 8003EE04 88FB0008 */  j          .L8003EE20
/* 2F608 8003EE08 00000000 */   nop
.L8003EE0C:
/* 2F60C 8003EE0C 2130A002 */  addu       $a2, $s5, $zero
/* 2F610 8003EE10 2138E002 */  addu       $a3, $s7, $zero
/* 2F614 8003EE14 1000B1AF */  sw         $s1, 0x10($sp)
/* 2F618 8003EE18 41FF000C */  jal        processOneShotSound
/* 2F61C 8003EE1C 1400B0AF */   sw        $s0, 0x14($sp)
.L8003EE20:
/* 2F620 8003EE20 01000292 */  lbu        $v0, 0x1($s0)
/* 2F624 8003EE24 00000000 */  nop
/* 2F628 8003EE28 40100200 */  sll        $v0, $v0, 1
/* 2F62C 8003EE2C 0E004224 */  addiu      $v0, $v0, 0xE
.L8003EE30:
/* 2F630 8003EE30 21800202 */  addu       $s0, $s0, $v0
.L8003EE34:
/* 2F634 8003EE34 03003126 */  addiu      $s1, $s1, 0x3
.L8003EE38:
/* 2F638 8003EE38 01005226 */  addiu      $s2, $s2, 0x1
/* 2F63C 8003EE3C 2A105302 */  slt        $v0, $s2, $s3
/* 2F640 8003EE40 D1FF4014 */  bnez       $v0, .L8003ED88
/* 2F644 8003EE44 00000000 */   nop
.L8003EE48:
/* 2F648 8003EE48 4400BF8F */  lw         $ra, 0x44($sp)
/* 2F64C 8003EE4C 4000BE8F */  lw         $fp, 0x40($sp)
/* 2F650 8003EE50 3C00B78F */  lw         $s7, 0x3C($sp)
/* 2F654 8003EE54 3800B68F */  lw         $s6, 0x38($sp)
/* 2F658 8003EE58 3400B58F */  lw         $s5, 0x34($sp)
/* 2F65C 8003EE5C 3000B48F */  lw         $s4, 0x30($sp)
/* 2F660 8003EE60 2C00B38F */  lw         $s3, 0x2C($sp)
/* 2F664 8003EE64 2800B28F */  lw         $s2, 0x28($sp)
/* 2F668 8003EE68 2400B18F */  lw         $s1, 0x24($sp)
/* 2F66C 8003EE6C 2000B08F */  lw         $s0, 0x20($sp)
/* 2F670 8003EE70 0800E003 */  jr         $ra
/* 2F674 8003EE74 4800BD27 */   addiu     $sp, $sp, 0x48
.size SOUND_ProcessInstanceSounds, . - SOUND_ProcessInstanceSounds

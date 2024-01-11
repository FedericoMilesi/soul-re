.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel AddVertex
/* 4ECA8 8005E4A8 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 4ECAC 8005E4AC 0000838C */  lw         $v1, 0x0($a0)
/* 4ECB0 8005E4B0 00000000 */  nop
/* 4ECB4 8005E4B4 03006104 */  bgez       $v1, .L8005E4C4
/* 4ECB8 8005E4B8 2140A000 */   addu      $t0, $a1, $zero
/* 4ECBC 8005E4BC 33790108 */  j          .L8005E4CC
/* 4ECC0 8005E4C0 00800224 */   addiu     $v0, $zero, -0x8000
.L8005E4C4:
/* 4ECC4 8005E4C4 03006018 */  blez       $v1, .L8005E4D4
/* 4ECC8 8005E4C8 00800234 */   ori       $v0, $zero, 0x8000
.L8005E4CC:
/* 4ECCC 8005E4CC 21106200 */  addu       $v0, $v1, $v0
/* 4ECD0 8005E4D0 000082AC */  sw         $v0, 0x0($a0)
.L8005E4D4:
/* 4ECD4 8005E4D4 0400838C */  lw         $v1, 0x4($a0)
/* 4ECD8 8005E4D8 00000000 */  nop
/* 4ECDC 8005E4DC 03006004 */  bltz       $v1, .L8005E4EC
/* 4ECE0 8005E4E0 00800224 */   addiu     $v0, $zero, -0x8000
/* 4ECE4 8005E4E4 03006018 */  blez       $v1, .L8005E4F4
/* 4ECE8 8005E4E8 00800234 */   ori       $v0, $zero, 0x8000
.L8005E4EC:
/* 4ECEC 8005E4EC 21106200 */  addu       $v0, $v1, $v0
/* 4ECF0 8005E4F0 040082AC */  sw         $v0, 0x4($a0)
.L8005E4F4:
/* 4ECF4 8005E4F4 0800838C */  lw         $v1, 0x8($a0)
/* 4ECF8 8005E4F8 00000000 */  nop
/* 4ECFC 8005E4FC 04006004 */  bltz       $v1, .L8005E510
/* 4ED00 8005E500 00800224 */   addiu     $v0, $zero, -0x8000
/* 4ED04 8005E504 04006018 */  blez       $v1, .L8005E518
/* 4ED08 8005E508 00000000 */   nop
/* 4ED0C 8005E50C 00800234 */  ori        $v0, $zero, 0x8000
.L8005E510:
/* 4ED10 8005E510 21106200 */  addu       $v0, $v1, $v0
/* 4ED14 8005E514 080082AC */  sw         $v0, 0x8($a0)
.L8005E518:
/* 4ED18 8005E518 02008284 */  lh         $v0, 0x2($a0)
/* 4ED1C 8005E51C 00000000 */  nop
/* 4ED20 8005E520 0000A2A7 */  sh         $v0, 0x0($sp)
/* 4ED24 8005E524 06008284 */  lh         $v0, 0x6($a0)
/* 4ED28 8005E528 00000000 */  nop
/* 4ED2C 8005E52C 0200A2A7 */  sh         $v0, 0x2($sp)
/* 4ED30 8005E530 0A008284 */  lh         $v0, 0xA($a0)
/* 4ED34 8005E534 00000000 */  nop
/* 4ED38 8005E538 0400A2A7 */  sh         $v0, 0x4($sp)
/* 4ED3C 8005E53C 0000A0CB */  lwc2       $0, 0x0($sp)
/* 4ED40 8005E540 0400A1CB */  lwc2       $1, 0x4($sp)
/* 4ED44 8005E544 00000000 */  nop
/* 4ED48 8005E548 00000000 */  nop
/* 4ED4C 8005E54C 1200484A */  MVMVA      1, 0, 0, 0, 0
/* 4ED50 8005E550 00480C48 */  mfc2       $t4, $9 # handwritten instruction
/* 4ED54 8005E554 00500D48 */  mfc2       $t5, $10 # handwritten instruction
/* 4ED58 8005E558 00580E48 */  mfc2       $t6, $11 # handwritten instruction
/* 4ED5C 8005E55C 0000ACA7 */  sh         $t4, 0x0($sp)
/* 4ED60 8005E560 0200ADA7 */  sh         $t5, 0x2($sp)
/* 4ED64 8005E564 0400AEA7 */  sh         $t6, 0x4($sp)
/* 4ED68 8005E568 0400A297 */  lhu        $v0, 0x4($sp)
/* 4ED6C 8005E56C 00000000 */  nop
/* 4ED70 8005E570 00140200 */  sll        $v0, $v0, 16
/* 4ED74 8005E574 033C0200 */  sra        $a3, $v0, 16
/* 4ED78 8005E578 2C00E018 */  blez       $a3, .L8005E62C
/* 4ED7C 8005E57C FFFF0224 */   addiu     $v0, $zero, -0x1
/* 4ED80 8005E580 0000A287 */  lh         $v0, 0x0($sp)
/* 4ED84 8005E584 2128E000 */  addu       $a1, $a3, $zero
/* 4ED88 8005E588 80200200 */  sll        $a0, $v0, 2
/* 4ED8C 8005E58C 21208200 */  addu       $a0, $a0, $v0
/* 4ED90 8005E590 80210400 */  sll        $a0, $a0, 6
/* 4ED94 8005E594 1A008500 */  div        $zero, $a0, $a1
/* 4ED98 8005E598 12200000 */  mflo       $a0
/* 4ED9C 8005E59C 0200A397 */  lhu        $v1, 0x2($sp)
/* 4EDA0 8005E5A0 00000000 */  nop
/* 4EDA4 8005E5A4 001C0300 */  sll        $v1, $v1, 16
/* 4EDA8 8005E5A8 031C0300 */  sra        $v1, $v1, 16
/* 4EDAC 8005E5AC 80100300 */  sll        $v0, $v1, 2
/* 4EDB0 8005E5B0 21104300 */  addu       $v0, $v0, $v1
/* 4EDB4 8005E5B4 80110200 */  sll        $v0, $v0, 6
/* 4EDB8 8005E5B8 1A004500 */  div        $zero, $v0, $a1
/* 4EDBC 8005E5BC 12100000 */  mflo       $v0
/* 4EDC0 8005E5C0 00000385 */  lh         $v1, 0x0($t0)
/* 4EDC4 8005E5C4 00018424 */  addiu      $a0, $a0, 0x100
/* 4EDC8 8005E5C8 78004524 */  addiu      $a1, $v0, 0x78
/* 4EDCC 8005E5CC 2A106400 */  slt        $v0, $v1, $a0
/* 4EDD0 8005E5D0 02004010 */  beqz       $v0, .L8005E5DC
/* 4EDD4 8005E5D4 21308000 */   addu      $a2, $a0, $zero
/* 4EDD8 8005E5D8 21306000 */  addu       $a2, $v1, $zero
.L8005E5DC:
/* 4EDDC 8005E5DC 04000385 */  lh         $v1, 0x4($t0)
/* 4EDE0 8005E5E0 00000000 */  nop
/* 4EDE4 8005E5E4 2A108300 */  slt        $v0, $a0, $v1
/* 4EDE8 8005E5E8 02004010 */  beqz       $v0, .L8005E5F4
/* 4EDEC 8005E5EC 000006A5 */   sh        $a2, 0x0($t0)
/* 4EDF0 8005E5F0 21206000 */  addu       $a0, $v1, $zero
.L8005E5F4:
/* 4EDF4 8005E5F4 02000385 */  lh         $v1, 0x2($t0)
/* 4EDF8 8005E5F8 2130A000 */  addu       $a2, $a1, $zero
/* 4EDFC 8005E5FC 2A106500 */  slt        $v0, $v1, $a1
/* 4EE00 8005E600 02004010 */  beqz       $v0, .L8005E60C
/* 4EE04 8005E604 040004A5 */   sh        $a0, 0x4($t0)
/* 4EE08 8005E608 21306000 */  addu       $a2, $v1, $zero
.L8005E60C:
/* 4EE0C 8005E60C 06000485 */  lh         $a0, 0x6($t0)
/* 4EE10 8005E610 2118A000 */  addu       $v1, $a1, $zero
/* 4EE14 8005E614 2A106400 */  slt        $v0, $v1, $a0
/* 4EE18 8005E618 02004010 */  beqz       $v0, .L8005E624
/* 4EE1C 8005E61C 020006A5 */   sh        $a2, 0x2($t0)
/* 4EE20 8005E620 21188000 */  addu       $v1, $a0, $zero
.L8005E624:
/* 4EE24 8005E624 060003A5 */  sh         $v1, 0x6($t0)
/* 4EE28 8005E628 2110E000 */  addu       $v0, $a3, $zero
.L8005E62C:
/* 4EE2C 8005E62C 0800E003 */  jr         $ra
/* 4EE30 8005E630 0800BD27 */   addiu     $sp, $sp, 0x8
.size AddVertex, . - AddVertex

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EVENT_TransformSplineAttribute
/* 53DE0 800635E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 53DE4 800635E4 22000224 */  addiu      $v0, $zero, 0x22
/* 53DE8 800635E8 1400BFAF */  sw         $ra, 0x14($sp)
/* 53DEC 800635EC 1000B0AF */  sw         $s0, 0x10($sp)
/* 53DF0 800635F0 0400B08C */  lw         $s0, 0x4($a1)
/* 53DF4 800635F4 2B00C210 */  beq        $a2, $v0, .L800636A4
/* 53DF8 800635F8 2300C228 */   slti      $v0, $a2, 0x23
/* 53DFC 800635FC 05004010 */  beqz       $v0, .L80063614
/* 53E00 80063600 1F000224 */   addiu     $v0, $zero, 0x1F
/* 53E04 80063604 0800C210 */  beq        $a2, $v0, .L80063628
/* 53E08 80063608 0200E724 */   addiu     $a3, $a3, 0x2
/* 53E0C 8006360C B38D0108 */  j          .L800636CC
/* 53E10 80063610 0C00A6AC */   sw        $a2, 0xC($a1)
.L80063614:
/* 53E14 80063614 23000224 */  addiu      $v0, $zero, 0x23
/* 53E18 80063618 2700C210 */  beq        $a2, $v0, .L800636B8
/* 53E1C 8006361C 01000324 */   addiu     $v1, $zero, 0x1
/* 53E20 80063620 B48D0108 */  j          .L800636D0
/* 53E24 80063624 0C00A6AC */   sw        $a2, 0xC($a1)
.L80063628:
/* 53E28 80063628 02000224 */  addiu      $v0, $zero, 0x2
/* 53E2C 8006362C 5CA482AF */  sw         $v0, %gp_rel(MoveCodeStreamExtra)($gp)
/* 53E30 80063630 0000E294 */  lhu        $v0, 0x0($a3)
/* 53E34 80063634 00000000 */  nop
/* 53E38 80063638 840202A6 */  sh         $v0, 0x284($s0)
/* 53E3C 8006363C 80020296 */  lhu        $v0, 0x280($s0)
/* 53E40 80063640 0200E394 */  lhu        $v1, 0x2($a3)
/* 53E44 80063644 02004434 */  ori        $a0, $v0, 0x2
/* 53E48 80063648 860203A6 */  sh         $v1, 0x286($s0)
/* 53E4C 8006364C 8402038E */  lw         $v1, 0x284($s0)
/* 53E50 80063650 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 53E54 80063654 04006214 */  bne        $v1, $v0, .L80063668
/* 53E58 80063658 800204A6 */   sh        $a0, 0x280($s0)
/* 53E5C 8006365C FDFF8230 */  andi       $v0, $a0, 0xFFFD
/* 53E60 80063660 B38D0108 */  j          .L800636CC
/* 53E64 80063664 800202A6 */   sh        $v0, 0x280($s0)
.L80063668:
/* 53E68 80063668 E3F3000C */  jal        SCRIPTCountFramesInSpline
/* 53E6C 8006366C 21200002 */   addu      $a0, $s0, $zero
/* 53E70 80063670 00140200 */  sll        $v0, $v0, 16
/* 53E74 80063674 86020386 */  lh         $v1, 0x286($s0)
/* 53E78 80063678 03140200 */  sra        $v0, $v0, 16
/* 53E7C 8006367C 2A186200 */  slt        $v1, $v1, $v0
/* 53E80 80063680 02006014 */  bnez       $v1, .L8006368C
/* 53E84 80063684 00000000 */   nop
/* 53E88 80063688 860202A6 */  sh         $v0, 0x286($s0)
.L8006368C:
/* 53E8C 8006368C 84020286 */  lh         $v0, 0x284($s0)
/* 53E90 80063690 00000000 */  nop
/* 53E94 80063694 0E004104 */  bgez       $v0, .L800636D0
/* 53E98 80063698 01000324 */   addiu     $v1, $zero, 0x1
/* 53E9C 8006369C B48D0108 */  j          .L800636D0
/* 53EA0 800636A0 840200A6 */   sh        $zero, 0x284($s0)
.L800636A4:
/* 53EA4 800636A4 1800A28C */  lw         $v0, 0x18($a1)
/* 53EA8 800636A8 01000324 */  addiu      $v1, $zero, 0x1
/* 53EAC 800636AC 04004234 */  ori        $v0, $v0, 0x4
/* 53EB0 800636B0 B48D0108 */  j          .L800636D0
/* 53EB4 800636B4 1800A2AC */   sw        $v0, 0x18($a1)
.L800636B8:
/* 53EB8 800636B8 1800A28C */  lw         $v0, 0x18($a1)
/* 53EBC 800636BC 00000000 */  nop
/* 53EC0 800636C0 08004234 */  ori        $v0, $v0, 0x8
/* 53EC4 800636C4 B48D0108 */  j          .L800636D0
/* 53EC8 800636C8 1800A2AC */   sw        $v0, 0x18($a1)
.L800636CC:
/* 53ECC 800636CC 01000324 */  addiu      $v1, $zero, 0x1
.L800636D0:
/* 53ED0 800636D0 1400BF8F */  lw         $ra, 0x14($sp)
/* 53ED4 800636D4 1000B08F */  lw         $s0, 0x10($sp)
/* 53ED8 800636D8 21106000 */  addu       $v0, $v1, $zero
/* 53EDC 800636DC 0800E003 */  jr         $ra
/* 53EE0 800636E0 1800BD27 */   addiu     $sp, $sp, 0x18
.size EVENT_TransformSplineAttribute, . - EVENT_TransformSplineAttribute

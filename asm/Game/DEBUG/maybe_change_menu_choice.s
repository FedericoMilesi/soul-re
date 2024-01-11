.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel maybe_change_menu_choice
/* 3F5C 8001375C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3F60 80013760 1800B2AF */  sw         $s2, 0x18($sp)
/* 3F64 80013764 2190A000 */  addu       $s2, $a1, $zero
/* 3F68 80013768 1000B0AF */  sw         $s0, 0x10($sp)
/* 3F6C 8001376C 48009024 */  addiu      $s0, $a0, 0x48
/* 3F70 80013770 1400B1AF */  sw         $s1, 0x14($sp)
/* 3F74 80013774 108A918F */  lw         $s1, %gp_rel(debugMenuChoice)($gp)
/* 3F78 80013778 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3F7C 8001377C CB4D000C */  jal        num_menu_items
/* 3F80 80013780 21204002 */   addu      $a0, $s2, $zero
/* 3F84 80013784 0400038E */  lw         $v1, 0x4($s0)
/* 3F88 80013788 21204000 */  addu       $a0, $v0, $zero
/* 3F8C 8001378C 01006230 */  andi       $v0, $v1, 0x1
/* 3F90 80013790 03004014 */  bnez       $v0, .L800137A0
/* 3F94 80013794 42180300 */   srl       $v1, $v1, 1
/* 3F98 80013798 E94D0008 */  j          .L800137A4
/* 3F9C 8001379C 01006330 */   andi      $v1, $v1, 0x1
.L800137A0:
/* 3FA0 800137A0 FFFF0324 */  addiu      $v1, $zero, -0x1
.L800137A4:
/* 3FA4 800137A4 19006010 */  beqz       $v1, .L8001380C
/* 3FA8 800137A8 00000000 */   nop
/* 3FAC 800137AC 17002006 */  bltz       $s1, .L8001380C
/* 3FB0 800137B0 21102402 */   addu      $v0, $s1, $a0
/* 3FB4 800137B4 108A858F */  lw         $a1, %gp_rel(debugMenuChoice)($gp)
.L800137B8:
/* 3FB8 800137B8 21104300 */  addu       $v0, $v0, $v1
/* 3FBC 800137BC 1A004400 */  div        $zero, $v0, $a0
/* 3FC0 800137C0 10880000 */  mfhi       $s1
/* 3FC4 800137C4 00000000 */  nop
/* 3FC8 800137C8 10002512 */  beq        $s1, $a1, .L8001380C
/* 3FCC 800137CC 40101100 */   sll       $v0, $s1, 1
/* 3FD0 800137D0 21105100 */  addu       $v0, $v0, $s1
/* 3FD4 800137D4 C0100200 */  sll        $v0, $v0, 3
/* 3FD8 800137D8 21105200 */  addu       $v0, $v0, $s2
/* 3FDC 800137DC 0000428C */  lw         $v0, 0x0($v0)
/* 3FE0 800137E0 00000000 */  nop
/* 3FE4 800137E4 0600422C */  sltiu      $v0, $v0, 0x6
/* 3FE8 800137E8 F3FF4010 */  beqz       $v0, .L800137B8
/* 3FEC 800137EC 21102402 */   addu      $v0, $s1, $a0
/* 3FF0 800137F0 108A828F */  lw         $v0, %gp_rel(debugMenuChoice)($gp)
/* 3FF4 800137F4 00000000 */  nop
/* 3FF8 800137F8 04002212 */  beq        $s1, $v0, .L8001380C
/* 3FFC 800137FC 00000000 */   nop
/* 4000 80013800 0E02010C */  jal        SndPlay
/* 4004 80013804 05000424 */   addiu     $a0, $zero, 0x5
/* 4008 80013808 108A91AF */  sw         $s1, %gp_rel(debugMenuChoice)($gp)
.L8001380C:
/* 400C 8001380C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4010 80013810 1800B28F */  lw         $s2, 0x18($sp)
/* 4014 80013814 1400B18F */  lw         $s1, 0x14($sp)
/* 4018 80013818 1000B08F */  lw         $s0, 0x10($sp)
/* 401C 8001381C 0800E003 */  jr         $ra
/* 4020 80013820 2000BD27 */   addiu     $sp, $sp, 0x20
.size maybe_change_menu_choice, . - maybe_change_menu_choice

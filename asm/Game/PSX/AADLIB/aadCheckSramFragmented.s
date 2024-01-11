.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadCheckSramFragmented
/* 44724 80053F24 21400000 */  addu       $t0, $zero, $zero
/* 44728 80053F28 0F00093C */  lui        $t1, (0xF423F >> 16)
/* 4472C 80053F2C 3F422935 */  ori        $t1, $t1, (0xF423F & 0xFFFF)
/* 44730 80053F30 21380001 */  addu       $a3, $t0, $zero
/* 44734 80053F34 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 44738 80053F38 00000000 */  nop
/* 4473C 80053F3C F41B628C */  lw         $v0, 0x1BF4($v1)
/* 44740 80053F40 F0176324 */  addiu      $v1, $v1, 0x17F0
/* 44744 80053F44 C0100200 */  sll        $v0, $v0, 3
/* 44748 80053F48 21286200 */  addu       $a1, $v1, $v0
/* 4474C 80053F4C 1B00A010 */  beqz       $a1, .L80053FBC
/* 44750 80053F50 80000624 */   addiu     $a2, $zero, 0x80
.L80053F54:
/* 44754 80053F54 0000A294 */  lhu        $v0, 0x0($a1)
/* 44758 80053F58 00000000 */  nop
/* 4475C 80053F5C 00404230 */  andi       $v0, $v0, 0x4000
/* 44760 80053F60 07004014 */  bnez       $v0, .L80053F80
/* 44764 80053F64 00000000 */   nop
/* 44768 80053F68 0400A494 */  lhu        $a0, 0x4($a1)
/* 4476C 80053F6C 0100E724 */  addiu      $a3, $a3, 0x1
/* 44770 80053F70 2A108900 */  slt        $v0, $a0, $t1
/* 44774 80053F74 02004010 */  beqz       $v0, .L80053F80
/* 44778 80053F78 21400401 */   addu      $t0, $t0, $a0
/* 4477C 80053F7C 21488000 */  addu       $t1, $a0, $zero
.L80053F80:
/* 44780 80053F80 0700A280 */  lb         $v0, 0x7($a1)
/* 44784 80053F84 00000000 */  nop
/* 44788 80053F88 06004004 */  bltz       $v0, .L80053FA4
/* 4478C 80053F8C 00000000 */   nop
/* 44790 80053F90 0700A290 */  lbu        $v0, 0x7($a1)
/* 44794 80053F94 00000000 */  nop
/* 44798 80053F98 C0100200 */  sll        $v0, $v0, 3
/* 4479C 80053F9C EA4F0108 */  j          .L80053FA8
/* 447A0 80053FA0 21286200 */   addu      $a1, $v1, $v0
.L80053FA4:
/* 447A4 80053FA4 21280000 */  addu       $a1, $zero, $zero
.L80053FA8:
/* 447A8 80053FA8 FFFFC624 */  addiu      $a2, $a2, -0x1
/* 447AC 80053FAC 0400C010 */  beqz       $a2, .L80053FC0
/* 447B0 80053FB0 0300E228 */   slti      $v0, $a3, 0x3
/* 447B4 80053FB4 E7FFA014 */  bnez       $a1, .L80053F54
/* 447B8 80053FB8 00000000 */   nop
.L80053FBC:
/* 447BC 80053FBC 0300E228 */  slti       $v0, $a3, 0x3
.L80053FC0:
/* 447C0 80053FC0 03004014 */  bnez       $v0, .L80053FD0
/* 447C4 80053FC4 21180000 */   addu      $v1, $zero, $zero
/* 447C8 80053FC8 83100800 */  sra        $v0, $t0, 2
/* 447CC 80053FCC 2A182201 */  slt        $v1, $t1, $v0
.L80053FD0:
/* 447D0 80053FD0 0800E003 */  jr         $ra
/* 447D4 80053FD4 21106000 */   addu      $v0, $v1, $zero
.size aadCheckSramFragmented, . - aadCheckSramFragmented

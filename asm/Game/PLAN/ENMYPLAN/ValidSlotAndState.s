.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ValidSlotAndState
/* 878DC 800970DC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 878E0 800970E0 0300A210 */  beq        $a1, $v0, .L800970F0
/* 878E4 800970E4 0A00A228 */   slti      $v0, $a1, 0xA
/* 878E8 800970E8 03004014 */  bnez       $v0, .L800970F8
/* 878EC 800970EC 40100500 */   sll       $v0, $a1, 1
.L800970F0:
/* 878F0 800970F0 0800E003 */  jr         $ra
/* 878F4 800970F4 21100000 */   addu      $v0, $zero, $zero
.L800970F8:
/* 878F8 800970F8 21104500 */  addu       $v0, $v0, $a1
/* 878FC 800970FC 00110200 */  sll        $v0, $v0, 4
/* 87900 80097100 23104500 */  subu       $v0, $v0, $a1
/* 87904 80097104 40100200 */  sll        $v0, $v0, 1
/* 87908 80097108 21104400 */  addu       $v0, $v0, $a0
/* 8790C 8009710C 01004290 */  lbu        $v0, 0x1($v0)
/* 87910 80097110 00000000 */  nop
/* 87914 80097114 FEFF4224 */  addiu      $v0, $v0, -0x2
/* 87918 80097118 0800E003 */  jr         $ra
/* 8791C 8009711C 0200422C */   sltiu     $v0, $v0, 0x2
.size ValidSlotAndState, . - ValidSlotAndState

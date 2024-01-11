.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SIGNAL_FindSignal
/* EEC8 8001E6C8 D000838C */  lw         $v1, 0xD0($a0)
/* EECC 8001E6CC D400828C */  lw         $v0, 0xD4($a0)
/* EED0 8001E6D0 00000000 */  nop
/* EED4 8001E6D4 2B106200 */  sltu       $v0, $v1, $v0
/* EED8 8001E6D8 20004010 */  beqz       $v0, .L8001E75C
/* EEDC 8001E6DC 00000000 */   nop
/* EEE0 8001E6E0 FF7F093C */  lui        $t1, (0x7FFFFFFF >> 16)
/* EEE4 8001E6E4 FFFF2935 */  ori        $t1, $t1, (0x7FFFFFFF & 0xFFFF)
/* EEE8 8001E6E8 908E8A27 */  addiu      $t2, $gp, %gp_rel(signalInfoList)
.L8001E6EC:
/* EEEC 8001E6EC 04006284 */  lh         $v0, 0x4($v1)
/* EEF0 8001E6F0 00000000 */  nop
/* EEF4 8001E6F4 1900A210 */  beq        $a1, $v0, .L8001E75C
/* EEF8 8001E6F8 08006724 */   addiu     $a3, $v1, 0x8
/* EEFC 8001E6FC 0000688C */  lw         $t0, 0x0($v1)
/* EF00 8001E700 00000000 */  nop
/* EF04 8001E704 10000019 */  blez       $t0, .L8001E748
/* EF08 8001E708 21300000 */   addu      $a2, $zero, $zero
.L8001E70C:
/* EF0C 8001E70C 0000E38C */  lw         $v1, 0x0($a3)
/* EF10 8001E710 00000000 */  nop
/* EF14 8001E714 24186900 */  and        $v1, $v1, $t1
/* EF18 8001E718 40100300 */  sll        $v0, $v1, 1
/* EF1C 8001E71C 21104300 */  addu       $v0, $v0, $v1
/* EF20 8001E720 80100200 */  sll        $v0, $v0, 2
/* EF24 8001E724 21104A00 */  addu       $v0, $v0, $t2
/* EF28 8001E728 04004284 */  lh         $v0, 0x4($v0)
/* EF2C 8001E72C 0100C624 */  addiu      $a2, $a2, 0x1
/* EF30 8001E730 01004224 */  addiu      $v0, $v0, 0x1
/* EF34 8001E734 80100200 */  sll        $v0, $v0, 2
/* EF38 8001E738 2138E200 */  addu       $a3, $a3, $v0
/* EF3C 8001E73C 2A10C800 */  slt        $v0, $a2, $t0
/* EF40 8001E740 F2FF4014 */  bnez       $v0, .L8001E70C
/* EF44 8001E744 00000000 */   nop
.L8001E748:
/* EF48 8001E748 D400828C */  lw         $v0, 0xD4($a0)
/* EF4C 8001E74C 0400E324 */  addiu      $v1, $a3, 0x4
/* EF50 8001E750 2B106200 */  sltu       $v0, $v1, $v0
/* EF54 8001E754 E5FF4014 */  bnez       $v0, .L8001E6EC
/* EF58 8001E758 00000000 */   nop
.L8001E75C:
/* EF5C 8001E75C D400828C */  lw         $v0, 0xD4($a0)
/* EF60 8001E760 00000000 */  nop
/* EF64 8001E764 02006214 */  bne        $v1, $v0, .L8001E770
/* EF68 8001E768 00000000 */   nop
/* EF6C 8001E76C 21180000 */  addu       $v1, $zero, $zero
.L8001E770:
/* EF70 8001E770 0800E003 */  jr         $ra
/* EF74 8001E774 21106000 */   addu      $v0, $v1, $zero
.size SIGNAL_FindSignal, . - SIGNAL_FindSignal

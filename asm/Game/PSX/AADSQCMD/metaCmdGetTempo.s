.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetTempo
/* 46DCC 800565CC 06008690 */  lbu        $a2, 0x6($a0)
/* 46DD0 800565D0 07008790 */  lbu        $a3, 0x7($a0)
/* 46DD4 800565D4 08008890 */  lbu        $t0, 0x8($a0)
/* 46DD8 800565D8 8000C228 */  slti       $v0, $a2, 0x80
/* 46DDC 800565DC 12004010 */  beqz       $v0, .L80056628
/* 46DE0 800565E0 8000E228 */   slti      $v0, $a3, 0x80
/* 46DE4 800565E4 10004010 */  beqz       $v0, .L80056628
/* 46DE8 800565E8 80000229 */   slti      $v0, $t0, 0x80
/* 46DEC 800565EC 0E004010 */  beqz       $v0, .L80056628
/* 46DF0 800565F0 00000000 */   nop
/* 46DF4 800565F4 3805A38C */  lw         $v1, 0x538($a1)
/* 46DF8 800565F8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 46DFC 800565FC 1400648C */  lw         $a0, 0x14($v1)
/* 46E00 80056600 21104600 */  addu       $v0, $v0, $a2
/* 46E04 80056604 081C44A0 */  sb         $a0, 0x1C08($v0)
/* 46E08 80056608 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 46E0C 8005660C 021A0400 */  srl        $v1, $a0, 8
/* 46E10 80056610 21104700 */  addu       $v0, $v0, $a3
/* 46E14 80056614 081C43A0 */  sb         $v1, 0x1C08($v0)
/* 46E18 80056618 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 46E1C 8005661C 02240400 */  srl        $a0, $a0, 16
/* 46E20 80056620 21104800 */  addu       $v0, $v0, $t0
/* 46E24 80056624 081C44A0 */  sb         $a0, 0x1C08($v0)
.L80056628:
/* 46E28 80056628 0800E003 */  jr         $ra
/* 46E2C 8005662C 00000000 */   nop
.size metaCmdGetTempo, . - metaCmdGetTempo

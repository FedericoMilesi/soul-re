.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSubstituteVariables
/* 46658 80055E58 04008290 */  lbu        $v0, 0x4($a0)
/* 4665C 80055E5C 00000000 */  nop
/* 46660 80055E60 2128A200 */  addu       $a1, $a1, $v0
/* 46664 80055E64 D803A690 */  lbu        $a2, 0x3D8($a1)
/* 46668 80055E68 00000000 */  nop
/* 4666C 80055E6C 0700C230 */  andi       $v0, $a2, 0x7
/* 46670 80055E70 25004010 */  beqz       $v0, .L80055F08
/* 46674 80055E74 00000000 */   nop
/* 46678 80055E78 05008290 */  lbu        $v0, 0x5($a0)
/* 4667C 80055E7C 00000000 */  nop
/* 46680 80055E80 BFFF4224 */  addiu      $v0, $v0, -0x41
/* 46684 80055E84 0300422C */  sltiu      $v0, $v0, 0x3
/* 46688 80055E88 1F004014 */  bnez       $v0, .L80055F08
/* 4668C 80055E8C 0100C230 */   andi      $v0, $a2, 0x1
/* 46690 80055E90 09004010 */  beqz       $v0, .L80055EB8
/* 46694 80055E94 0200C230 */   andi      $v0, $a2, 0x2
/* 46698 80055E98 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4669C 80055E9C 06008390 */  lbu        $v1, 0x6($a0)
/* 466A0 80055EA0 00000000 */  nop
/* 466A4 80055EA4 21104300 */  addu       $v0, $v0, $v1
/* 466A8 80055EA8 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 466AC 80055EAC FE00C630 */  andi       $a2, $a2, 0xFE
/* 466B0 80055EB0 060082A0 */  sb         $v0, 0x6($a0)
/* 466B4 80055EB4 0200C230 */  andi       $v0, $a2, 0x2
.L80055EB8:
/* 466B8 80055EB8 09004010 */  beqz       $v0, .L80055EE0
/* 466BC 80055EBC 0400C230 */   andi      $v0, $a2, 0x4
/* 466C0 80055EC0 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 466C4 80055EC4 07008390 */  lbu        $v1, 0x7($a0)
/* 466C8 80055EC8 00000000 */  nop
/* 466CC 80055ECC 21104300 */  addu       $v0, $v0, $v1
/* 466D0 80055ED0 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 466D4 80055ED4 FD00C630 */  andi       $a2, $a2, 0xFD
/* 466D8 80055ED8 070082A0 */  sb         $v0, 0x7($a0)
/* 466DC 80055EDC 0400C230 */  andi       $v0, $a2, 0x4
.L80055EE0:
/* 466E0 80055EE0 08004010 */  beqz       $v0, .L80055F04
/* 466E4 80055EE4 00000000 */   nop
/* 466E8 80055EE8 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 466EC 80055EEC 08008390 */  lbu        $v1, 0x8($a0)
/* 466F0 80055EF0 00000000 */  nop
/* 466F4 80055EF4 21104300 */  addu       $v0, $v0, $v1
/* 466F8 80055EF8 081C4290 */  lbu        $v0, 0x1C08($v0)
/* 466FC 80055EFC FB00C630 */  andi       $a2, $a2, 0xFB
/* 46700 80055F00 080082A0 */  sb         $v0, 0x8($a0)
.L80055F04:
/* 46704 80055F04 D803A6A0 */  sb         $a2, 0x3D8($a1)
.L80055F08:
/* 46708 80055F08 0800E003 */  jr         $ra
/* 4670C 80055F0C 00000000 */   nop
.size aadSubstituteVariables, . - aadSubstituteVariables

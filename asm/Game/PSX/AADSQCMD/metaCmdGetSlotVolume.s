.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetSlotVolume
/* 46F70 80056770 06008490 */  lbu        $a0, 0x6($a0)
/* 46F74 80056774 00000000 */  nop
/* 46F78 80056778 80008228 */  slti       $v0, $a0, 0x80
/* 46F7C 8005677C 06004010 */  beqz       $v0, .L80056798
/* 46F80 80056780 00000000 */   nop
/* 46F84 80056784 3805A28C */  lw         $v0, 0x538($a1)
/* 46F88 80056788 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46F8C 8005678C 52054290 */  lbu        $v0, 0x552($v0)
/* 46F90 80056790 21186400 */  addu       $v1, $v1, $a0
/* 46F94 80056794 081C62A0 */  sb         $v0, 0x1C08($v1)
.L80056798:
/* 46F98 80056798 0800E003 */  jr         $ra
/* 46F9C 8005679C 00000000 */   nop
.size metaCmdGetSlotVolume, . - metaCmdGetSlotVolume

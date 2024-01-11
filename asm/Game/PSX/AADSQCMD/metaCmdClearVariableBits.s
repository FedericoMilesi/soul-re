.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdClearVariableBits
/* 470E0 800568E0 07008390 */  lbu        $v1, 0x7($a0)
/* 470E4 800568E4 06008490 */  lbu        $a0, 0x6($a0)
/* 470E8 800568E8 80006228 */  slti       $v0, $v1, 0x80
/* 470EC 800568EC 08004010 */  beqz       $v0, .L80056910
/* 470F0 800568F0 27200400 */   nor       $a0, $zero, $a0
/* 470F4 800568F4 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 470F8 800568F8 00000000 */  nop
/* 470FC 800568FC 21104300 */  addu       $v0, $v0, $v1
/* 47100 80056900 081C4390 */  lbu        $v1, 0x1C08($v0)
/* 47104 80056904 00000000 */  nop
/* 47108 80056908 24186400 */  and        $v1, $v1, $a0
/* 4710C 8005690C 081C43A0 */  sb         $v1, 0x1C08($v0)
.L80056910:
/* 47110 80056910 0800E003 */  jr         $ra
/* 47114 80056914 00000000 */   nop
.size metaCmdClearVariableBits, . - metaCmdClearVariableBits

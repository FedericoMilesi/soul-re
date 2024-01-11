.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetVariableBits
/* 470A8 800568A8 07008590 */  lbu        $a1, 0x7($a0)
/* 470AC 800568AC 06008490 */  lbu        $a0, 0x6($a0)
/* 470B0 800568B0 8000A228 */  slti       $v0, $a1, 0x80
/* 470B4 800568B4 08004010 */  beqz       $v0, .L800568D8
/* 470B8 800568B8 00000000 */   nop
/* 470BC 800568BC D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 470C0 800568C0 00000000 */  nop
/* 470C4 800568C4 21186500 */  addu       $v1, $v1, $a1
/* 470C8 800568C8 081C6290 */  lbu        $v0, 0x1C08($v1)
/* 470CC 800568CC 00000000 */  nop
/* 470D0 800568D0 25104400 */  or         $v0, $v0, $a0
/* 470D4 800568D4 081C62A0 */  sb         $v0, 0x1C08($v1)
.L800568D8:
/* 470D8 800568D8 0800E003 */  jr         $ra
/* 470DC 800568DC 00000000 */   nop
.size metaCmdSetVariableBits, . - metaCmdSetVariableBits

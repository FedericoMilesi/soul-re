.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSubtractVariable
/* 47070 80056870 07008590 */  lbu        $a1, 0x7($a0)
/* 47074 80056874 06008490 */  lbu        $a0, 0x6($a0)
/* 47078 80056878 8000A228 */  slti       $v0, $a1, 0x80
/* 4707C 8005687C 08004010 */  beqz       $v0, .L800568A0
/* 47080 80056880 00000000 */   nop
/* 47084 80056884 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 47088 80056888 00000000 */  nop
/* 4708C 8005688C 21186500 */  addu       $v1, $v1, $a1
/* 47090 80056890 081C6290 */  lbu        $v0, 0x1C08($v1)
/* 47094 80056894 00000000 */  nop
/* 47098 80056898 23104400 */  subu       $v0, $v0, $a0
/* 4709C 8005689C 081C62A0 */  sb         $v0, 0x1C08($v1)
.L800568A0:
/* 470A0 800568A0 0800E003 */  jr         $ra
/* 470A4 800568A4 00000000 */   nop
.size metaCmdSubtractVariable, . - metaCmdSubtractVariable

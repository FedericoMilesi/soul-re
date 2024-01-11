.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdAddVariable
/* 47038 80056838 07008590 */  lbu        $a1, 0x7($a0)
/* 4703C 8005683C 06008490 */  lbu        $a0, 0x6($a0)
/* 47040 80056840 8000A228 */  slti       $v0, $a1, 0x80
/* 47044 80056844 08004010 */  beqz       $v0, .L80056868
/* 47048 80056848 00000000 */   nop
/* 4704C 8005684C D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 47050 80056850 00000000 */  nop
/* 47054 80056854 21186500 */  addu       $v1, $v1, $a1
/* 47058 80056858 081C6290 */  lbu        $v0, 0x1C08($v1)
/* 4705C 8005685C 00000000 */  nop
/* 47060 80056860 21104400 */  addu       $v0, $v0, $a0
/* 47064 80056864 081C62A0 */  sb         $v0, 0x1C08($v1)
.L80056868:
/* 47068 80056868 0800E003 */  jr         $ra
/* 4706C 8005686C 00000000 */   nop
.size metaCmdAddVariable, . - metaCmdAddVariable

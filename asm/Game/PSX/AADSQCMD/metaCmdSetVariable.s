.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetVariable
/* 46FD0 800567D0 07008390 */  lbu        $v1, 0x7($a0)
/* 46FD4 800567D4 06008490 */  lbu        $a0, 0x6($a0)
/* 46FD8 800567D8 80006228 */  slti       $v0, $v1, 0x80
/* 46FDC 800567DC 05004010 */  beqz       $v0, .L800567F4
/* 46FE0 800567E0 00000000 */   nop
/* 46FE4 800567E4 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 46FE8 800567E8 00000000 */  nop
/* 46FEC 800567EC 21104300 */  addu       $v0, $v0, $v1
/* 46FF0 800567F0 081C44A0 */  sb         $a0, 0x1C08($v0)
.L800567F4:
/* 46FF4 800567F4 0800E003 */  jr         $ra
/* 46FF8 800567F8 00000000 */   nop
.size metaCmdSetVariable, . - metaCmdSetVariable

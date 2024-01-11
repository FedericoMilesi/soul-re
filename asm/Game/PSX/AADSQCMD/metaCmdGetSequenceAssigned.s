.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetSequenceAssigned
/* 46D9C 8005659C 06008490 */  lbu        $a0, 0x6($a0)
/* 46DA0 800565A0 00000000 */  nop
/* 46DA4 800565A4 80008228 */  slti       $v0, $a0, 0x80
/* 46DA8 800565A8 06004010 */  beqz       $v0, .L800565C4
/* 46DAC 800565AC 00000000 */   nop
/* 46DB0 800565B0 3805A28C */  lw         $v0, 0x538($a1)
/* 46DB4 800565B4 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46DB8 800565B8 3E054290 */  lbu        $v0, 0x53E($v0)
/* 46DBC 800565BC 21186400 */  addu       $v1, $v1, $a0
/* 46DC0 800565C0 081C62A0 */  sb         $v0, 0x1C08($v1)
.L800565C4:
/* 46DC4 800565C4 0800E003 */  jr         $ra
/* 46DC8 800565C8 00000000 */   nop
.size metaCmdGetSequenceAssigned, . - metaCmdGetSequenceAssigned

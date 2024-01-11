.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetSlotStatus
/* 46E30 80056630 06008490 */  lbu        $a0, 0x6($a0)
/* 46E34 80056634 00000000 */  nop
/* 46E38 80056638 80008228 */  slti       $v0, $a0, 0x80
/* 46E3C 8005663C 06004010 */  beqz       $v0, .L80056658
/* 46E40 80056640 00000000 */   nop
/* 46E44 80056644 3805A28C */  lw         $v0, 0x538($a1)
/* 46E48 80056648 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46E4C 8005664C 40054290 */  lbu        $v0, 0x540($v0)
/* 46E50 80056650 21186400 */  addu       $v1, $v1, $a0
/* 46E54 80056654 081C62A0 */  sb         $v0, 0x1C08($v1)
.L80056658:
/* 46E58 80056658 0800E003 */  jr         $ra
/* 46E5C 8005665C 00000000 */   nop
.size metaCmdGetSlotStatus, . - metaCmdGetSlotStatus

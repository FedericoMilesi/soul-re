.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetChannelMute
/* 46E60 80056660 06008690 */  lbu        $a2, 0x6($a0)
/* 46E64 80056664 07008490 */  lbu        $a0, 0x7($a0)
/* 46E68 80056668 8000C228 */  slti       $v0, $a2, 0x80
/* 46E6C 8005666C 0E004010 */  beqz       $v0, .L800566A8
/* 46E70 80056670 80008228 */   slti      $v0, $a0, 0x80
/* 46E74 80056674 0C004010 */  beqz       $v0, .L800566A8
/* 46E78 80056678 00000000 */   nop
/* 46E7C 8005667C 3805A38C */  lw         $v1, 0x538($a1)
/* 46E80 80056680 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 46E84 80056684 42056390 */  lbu        $v1, 0x542($v1)
/* 46E88 80056688 21104600 */  addu       $v0, $v0, $a2
/* 46E8C 8005668C 081C43A0 */  sb         $v1, 0x1C08($v0)
/* 46E90 80056690 3805A28C */  lw         $v0, 0x538($a1)
/* 46E94 80056694 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46E98 80056698 42054294 */  lhu        $v0, 0x542($v0)
/* 46E9C 8005669C 21186400 */  addu       $v1, $v1, $a0
/* 46EA0 800566A0 02120200 */  srl        $v0, $v0, 8
/* 46EA4 800566A4 081C62A0 */  sb         $v0, 0x1C08($v1)
.L800566A8:
/* 46EA8 800566A8 0800E003 */  jr         $ra
/* 46EAC 800566AC 00000000 */   nop
.size metaCmdGetChannelMute, . - metaCmdGetChannelMute

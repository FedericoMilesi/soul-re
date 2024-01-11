.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetChannelPan
/* 46EE8 800566E8 06008490 */  lbu        $a0, 0x6($a0)
/* 46EEC 800566EC 3D05A390 */  lbu        $v1, 0x53D($a1)
/* 46EF0 800566F0 80008228 */  slti       $v0, $a0, 0x80
/* 46EF4 800566F4 08004010 */  beqz       $v0, .L80056718
/* 46EF8 800566F8 00000000 */   nop
/* 46EFC 800566FC 3805A28C */  lw         $v0, 0x538($a1)
/* 46F00 80056700 00000000 */  nop
/* 46F04 80056704 21104300 */  addu       $v0, $v0, $v1
/* 46F08 80056708 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46F0C 8005670C B0054290 */  lbu        $v0, 0x5B0($v0)
/* 46F10 80056710 21186400 */  addu       $v1, $v1, $a0
/* 46F14 80056714 081C62A0 */  sb         $v0, 0x1C08($v1)
.L80056718:
/* 46F18 80056718 0800E003 */  jr         $ra
/* 46F1C 8005671C 00000000 */   nop
.size metaCmdGetChannelPan, . - metaCmdGetChannelPan

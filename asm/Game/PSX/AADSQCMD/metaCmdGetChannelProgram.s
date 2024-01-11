.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetChannelProgram
/* 46F28 80056728 06008490 */  lbu        $a0, 0x6($a0)
/* 46F2C 8005672C 3D05A390 */  lbu        $v1, 0x53D($a1)
/* 46F30 80056730 80008228 */  slti       $v0, $a0, 0x80
/* 46F34 80056734 08004010 */  beqz       $v0, .L80056758
/* 46F38 80056738 00000000 */   nop
/* 46F3C 8005673C 3805A28C */  lw         $v0, 0x538($a1)
/* 46F40 80056740 00000000 */  nop
/* 46F44 80056744 21104300 */  addu       $v0, $v0, $v1
/* 46F48 80056748 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46F4C 8005674C 90054290 */  lbu        $v0, 0x590($v0)
/* 46F50 80056750 21186400 */  addu       $v1, $v1, $a0
/* 46F54 80056754 081C62A0 */  sb         $v0, 0x1C08($v1)
.L80056758:
/* 46F58 80056758 0800E003 */  jr         $ra
/* 46F5C 8005675C 00000000 */   nop
.size metaCmdGetChannelProgram, . - metaCmdGetChannelProgram

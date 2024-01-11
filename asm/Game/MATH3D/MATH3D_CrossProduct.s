.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MATH3D_CrossProduct
/* 2AEF8 8003A6F8 0200A384 */  lh         $v1, 0x2($a1)
/* 2AEFC 8003A6FC 0400C284 */  lh         $v0, 0x4($a2)
/* 2AF00 8003A700 00000000 */  nop
/* 2AF04 8003A704 18006200 */  mult       $v1, $v0
/* 2AF08 8003A708 0400A384 */  lh         $v1, 0x4($a1)
/* 2AF0C 8003A70C 12380000 */  mflo       $a3
/* 2AF10 8003A710 0200C284 */  lh         $v0, 0x2($a2)
/* 2AF14 8003A714 00000000 */  nop
/* 2AF18 8003A718 18006200 */  mult       $v1, $v0
/* 2AF1C 8003A71C 12100000 */  mflo       $v0
/* 2AF20 8003A720 2310E200 */  subu       $v0, $a3, $v0
/* 2AF24 8003A724 03130200 */  sra        $v0, $v0, 12
/* 2AF28 8003A728 000082A4 */  sh         $v0, 0x0($a0)
/* 2AF2C 8003A72C 0000A384 */  lh         $v1, 0x0($a1)
/* 2AF30 8003A730 0400C284 */  lh         $v0, 0x4($a2)
/* 2AF34 8003A734 00000000 */  nop
/* 2AF38 8003A738 18006200 */  mult       $v1, $v0
/* 2AF3C 8003A73C 0400A384 */  lh         $v1, 0x4($a1)
/* 2AF40 8003A740 12380000 */  mflo       $a3
/* 2AF44 8003A744 0000C284 */  lh         $v0, 0x0($a2)
/* 2AF48 8003A748 00000000 */  nop
/* 2AF4C 8003A74C 18006200 */  mult       $v1, $v0
/* 2AF50 8003A750 12100000 */  mflo       $v0
/* 2AF54 8003A754 2310E200 */  subu       $v0, $a3, $v0
/* 2AF58 8003A758 03130200 */  sra        $v0, $v0, 12
/* 2AF5C 8003A75C 23100200 */  negu       $v0, $v0
/* 2AF60 8003A760 020082A4 */  sh         $v0, 0x2($a0)
/* 2AF64 8003A764 0000A384 */  lh         $v1, 0x0($a1)
/* 2AF68 8003A768 0200C284 */  lh         $v0, 0x2($a2)
/* 2AF6C 8003A76C 00000000 */  nop
/* 2AF70 8003A770 18006200 */  mult       $v1, $v0
/* 2AF74 8003A774 0200A384 */  lh         $v1, 0x2($a1)
/* 2AF78 8003A778 12380000 */  mflo       $a3
/* 2AF7C 8003A77C 0000C284 */  lh         $v0, 0x0($a2)
/* 2AF80 8003A780 00000000 */  nop
/* 2AF84 8003A784 18006200 */  mult       $v1, $v0
/* 2AF88 8003A788 12100000 */  mflo       $v0
/* 2AF8C 8003A78C 2310E200 */  subu       $v0, $a3, $v0
/* 2AF90 8003A790 03130200 */  sra        $v0, $v0, 12
/* 2AF94 8003A794 0800E003 */  jr         $ra
/* 2AF98 8003A798 040082A4 */   sh        $v0, 0x4($a0)
.size MATH3D_CrossProduct, . - MATH3D_CrossProduct

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel FX_GetPlaneEquation
/* 3B734 8004AF34 00008294 */  lhu        $v0, 0x0($a0)
/* 3B738 8004AF38 00000000 */  nop
/* 3B73C 8004AF3C 0000C2A4 */  sh         $v0, 0x0($a2)
/* 3B740 8004AF40 02008294 */  lhu        $v0, 0x2($a0)
/* 3B744 8004AF44 00000000 */  nop
/* 3B748 8004AF48 0200C2A4 */  sh         $v0, 0x2($a2)
/* 3B74C 8004AF4C 04008394 */  lhu        $v1, 0x4($a0)
/* 3B750 8004AF50 0000C484 */  lh         $a0, 0x0($a2)
/* 3B754 8004AF54 0400C3A4 */  sh         $v1, 0x4($a2)
/* 3B758 8004AF58 0000A284 */  lh         $v0, 0x0($a1)
/* 3B75C 8004AF5C 00000000 */  nop
/* 3B760 8004AF60 18008200 */  mult       $a0, $v0
/* 3B764 8004AF64 0200C484 */  lh         $a0, 0x2($a2)
/* 3B768 8004AF68 12380000 */  mflo       $a3
/* 3B76C 8004AF6C 0200A284 */  lh         $v0, 0x2($a1)
/* 3B770 8004AF70 00000000 */  nop
/* 3B774 8004AF74 18008200 */  mult       $a0, $v0
/* 3B778 8004AF78 001C0300 */  sll        $v1, $v1, 16
/* 3B77C 8004AF7C 12200000 */  mflo       $a0
/* 3B780 8004AF80 0400A284 */  lh         $v0, 0x4($a1)
/* 3B784 8004AF84 031C0300 */  sra        $v1, $v1, 16
/* 3B788 8004AF88 18006200 */  mult       $v1, $v0
/* 3B78C 8004AF8C 2110E400 */  addu       $v0, $a3, $a0
/* 3B790 8004AF90 12180000 */  mflo       $v1
/* 3B794 8004AF94 21104300 */  addu       $v0, $v0, $v1
/* 3B798 8004AF98 03130200 */  sra        $v0, $v0, 12
/* 3B79C 8004AF9C 23100200 */  negu       $v0, $v0
/* 3B7A0 8004AFA0 0800E003 */  jr         $ra
/* 3B7A4 8004AFA4 0800C2AC */   sw        $v0, 0x8($a2)
.size FX_GetPlaneEquation, . - FX_GetPlaneEquation

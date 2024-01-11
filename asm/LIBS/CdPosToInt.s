.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CdPosToInt
/* AF958 800BF158 00008390 */  lbu        $v1, 0x0($a0)
/* AF95C 800BF15C 01008690 */  lbu        $a2, 0x1($a0)
/* AF960 800BF160 02290300 */  srl        $a1, $v1, 4
/* AF964 800BF164 80100500 */  sll        $v0, $a1, 2
/* AF968 800BF168 21104500 */  addu       $v0, $v0, $a1
/* AF96C 800BF16C 40100200 */  sll        $v0, $v0, 1
/* AF970 800BF170 0F006330 */  andi       $v1, $v1, 0xF
/* AF974 800BF174 21104300 */  addu       $v0, $v0, $v1
/* AF978 800BF178 00290200 */  sll        $a1, $v0, 4
/* AF97C 800BF17C 2328A200 */  subu       $a1, $a1, $v0
/* AF980 800BF180 80280500 */  sll        $a1, $a1, 2
/* AF984 800BF184 02190600 */  srl        $v1, $a2, 4
/* AF988 800BF188 80100300 */  sll        $v0, $v1, 2
/* AF98C 800BF18C 21104300 */  addu       $v0, $v0, $v1
/* AF990 800BF190 40100200 */  sll        $v0, $v0, 1
/* AF994 800BF194 0F00C630 */  andi       $a2, $a2, 0xF
/* AF998 800BF198 21104600 */  addu       $v0, $v0, $a2
/* AF99C 800BF19C 2128A200 */  addu       $a1, $a1, $v0
/* AF9A0 800BF1A0 80180500 */  sll        $v1, $a1, 2
/* AF9A4 800BF1A4 21186500 */  addu       $v1, $v1, $a1
/* AF9A8 800BF1A8 00110300 */  sll        $v0, $v1, 4
/* AF9AC 800BF1AC 02008590 */  lbu        $a1, 0x2($a0)
/* AF9B0 800BF1B0 23104300 */  subu       $v0, $v0, $v1
/* AF9B4 800BF1B4 02210500 */  srl        $a0, $a1, 4
/* AF9B8 800BF1B8 80180400 */  sll        $v1, $a0, 2
/* AF9BC 800BF1BC 21186400 */  addu       $v1, $v1, $a0
/* AF9C0 800BF1C0 40180300 */  sll        $v1, $v1, 1
/* AF9C4 800BF1C4 0F00A530 */  andi       $a1, $a1, 0xF
/* AF9C8 800BF1C8 21186500 */  addu       $v1, $v1, $a1
/* AF9CC 800BF1CC 21104300 */  addu       $v0, $v0, $v1
/* AF9D0 800BF1D0 0800E003 */  jr         $ra
/* AF9D4 800BF1D4 6AFF4224 */   addiu     $v0, $v0, -0x96
/* AF9D8 800BF1D8 00000000 */  nop
/* AF9DC 800BF1DC 00000000 */  nop
/* AF9E0 800BF1E0 00000000 */  nop
.size CdPosToInt, . - CdPosToInt

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PLANAPI_PairType
/* 88A1C 8009821C 14008294 */  lhu        $v0, 0x14($a0)
/* 88A20 80098220 00000000 */  nop
/* 88A24 80098224 C2100200 */  srl        $v0, $v0, 3
/* 88A28 80098228 03004330 */  andi       $v1, $v0, 0x3
/* 88A2C 8009822C 1400A294 */  lhu        $v0, 0x14($a1)
/* 88A30 80098230 21306000 */  addu       $a2, $v1, $zero
/* 88A34 80098234 C2100200 */  srl        $v0, $v0, 3
/* 88A38 80098238 03004430 */  andi       $a0, $v0, 0x3
/* 88A3C 8009823C 2A108300 */  slt        $v0, $a0, $v1
/* 88A40 80098240 05004010 */  beqz       $v0, .L80098258
/* 88A44 80098244 21288000 */   addu      $a1, $a0, $zero
/* 88A48 80098248 26186400 */  xor        $v1, $v1, $a0
/* 88A4C 8009824C 26108300 */  xor        $v0, $a0, $v1
/* 88A50 80098250 21284000 */  addu       $a1, $v0, $zero
/* 88A54 80098254 26306200 */  xor        $a2, $v1, $v0
.L80098258:
/* 88A58 80098258 00120600 */  sll        $v0, $a2, 8
/* 88A5C 8009825C 0800E003 */  jr         $ra
/* 88A60 80098260 2510A200 */   or        $v0, $a1, $v0
.size PLANAPI_PairType, . - PLANAPI_PairType

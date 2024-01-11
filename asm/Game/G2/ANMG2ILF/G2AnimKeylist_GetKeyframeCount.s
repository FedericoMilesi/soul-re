.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2AnimKeylist_GetKeyframeCount
/* 80774 8008FF74 04008294 */  lhu        $v0, 0x4($a0)
/* 80778 8008FF78 06008384 */  lh         $v1, 0x6($a0)
/* 8077C 8008FF7C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 80780 8008FF80 18006200 */  mult       $v1, $v0
/* 80784 8008FF84 01008390 */  lbu        $v1, 0x1($a0)
/* 80788 8008FF88 00000000 */  nop
/* 8078C 8008FF8C 40200300 */  sll        $a0, $v1, 1
/* 80790 8008FF90 12300000 */  mflo       $a2
/* 80794 8008FF94 FFFFC224 */  addiu      $v0, $a2, -0x1
/* 80798 8008FF98 21104400 */  addu       $v0, $v0, $a0
/* 8079C 8008FF9C 1A004300 */  div        $zero, $v0, $v1
/* 807A0 8008FFA0 12100000 */  mflo       $v0
/* 807A4 8008FFA4 0800E003 */  jr         $ra
/* 807A8 8008FFA8 00000000 */   nop
.size G2AnimKeylist_GetKeyframeCount, . - G2AnimKeylist_GetKeyframeCount

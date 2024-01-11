.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fDRAW_SPLIT_INTPL_XYZ
/* 1B110 8002A910 0000C284 */  lh         $v0, 0x0($a2)
/* 1B114 8002A914 0000A784 */  lh         $a3, 0x0($a1)
/* 1B118 8002A918 0400A384 */  lh         $v1, 0x4($a1)
/* 1B11C 8002A91C 23104700 */  subu       $v0, $v0, $a3
/* 1B120 8002A920 18006200 */  mult       $v1, $v0
/* 1B124 8002A924 0400C284 */  lh         $v0, 0x4($a2)
/* 1B128 8002A928 12380000 */  mflo       $a3
/* 1B12C 8002A92C 23186200 */  subu       $v1, $v1, $v0
/* 1B130 8002A930 00000000 */  nop
/* 1B134 8002A934 1A00E300 */  div        $zero, $a3, $v1
/* 1B138 8002A938 12180000 */  mflo       $v1
/* 1B13C 8002A93C 0000A294 */  lhu        $v0, 0x0($a1)
/* 1B140 8002A940 00000000 */  nop
/* 1B144 8002A944 21104300 */  addu       $v0, $v0, $v1
/* 1B148 8002A948 000082A4 */  sh         $v0, 0x0($a0)
/* 1B14C 8002A94C 0200C284 */  lh         $v0, 0x2($a2)
/* 1B150 8002A950 0200A784 */  lh         $a3, 0x2($a1)
/* 1B154 8002A954 0400A384 */  lh         $v1, 0x4($a1)
/* 1B158 8002A958 23104700 */  subu       $v0, $v0, $a3
/* 1B15C 8002A95C 18006200 */  mult       $v1, $v0
/* 1B160 8002A960 0400C284 */  lh         $v0, 0x4($a2)
/* 1B164 8002A964 12380000 */  mflo       $a3
/* 1B168 8002A968 23186200 */  subu       $v1, $v1, $v0
/* 1B16C 8002A96C 00000000 */  nop
/* 1B170 8002A970 1A00E300 */  div        $zero, $a3, $v1
/* 1B174 8002A974 12180000 */  mflo       $v1
/* 1B178 8002A978 0200A294 */  lhu        $v0, 0x2($a1)
/* 1B17C 8002A97C 040080A4 */  sh         $zero, 0x4($a0)
/* 1B180 8002A980 21104300 */  addu       $v0, $v0, $v1
/* 1B184 8002A984 0800E003 */  jr         $ra
/* 1B188 8002A988 020082A4 */   sh        $v0, 0x2($a0)
.size fDRAW_SPLIT_INTPL_XYZ, . - fDRAW_SPLIT_INTPL_XYZ

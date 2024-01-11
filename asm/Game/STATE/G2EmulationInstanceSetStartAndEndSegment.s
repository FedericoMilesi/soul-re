.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel G2EmulationInstanceSetStartAndEndSegment
/* 63068 80072868 FF00A530 */  andi       $a1, $a1, 0xFF
/* 6306C 8007286C 40100500 */  sll        $v0, $a1, 1
/* 63070 80072870 21104500 */  addu       $v0, $v0, $a1
/* 63074 80072874 00110200 */  sll        $v0, $v0, 4
/* 63078 80072878 EC014224 */  addiu      $v0, $v0, 0x1EC
/* 6307C 8007287C 21208200 */  addu       $a0, $a0, $v0
/* 63080 80072880 2338E600 */  subu       $a3, $a3, $a2
/* 63084 80072884 0100E724 */  addiu      $a3, $a3, 0x1
/* 63088 80072888 020086A0 */  sb         $a2, 0x2($a0)
/* 6308C 8007288C 0800E003 */  jr         $ra
/* 63090 80072890 030087A0 */   sb        $a3, 0x3($a0)
.size G2EmulationInstanceSetStartAndEndSegment, . - G2EmulationInstanceSetStartAndEndSegment

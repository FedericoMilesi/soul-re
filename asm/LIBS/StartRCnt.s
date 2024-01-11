.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel StartRCnt
/* ADBE4 800BD3E4 FFFF8230 */  andi       $v0, $a0, 0xFFFF
/* ADBE8 800BD3E8 80200200 */  sll        $a0, $v0, 2
/* ADBEC 800BD3EC 0D80053C */  lui        $a1, %hi(ratan_tbl + 0x810)
/* ADBF0 800BD3F0 8CE3A58C */  lw         $a1, %lo(ratan_tbl + 0x810)($a1)
/* ADBF4 800BD3F4 0D80013C */  lui        $at, %hi(ratan_tbl + 0x818)
/* ADBF8 800BD3F8 21082400 */  addu       $at, $at, $a0
/* ADBFC 800BD3FC 94E3248C */  lw         $a0, %lo(ratan_tbl + 0x818)($at)
/* ADC00 800BD400 0400A38C */  lw         $v1, 0x4($a1)
/* ADC04 800BD404 03004228 */  slti       $v0, $v0, 0x3
/* ADC08 800BD408 25186400 */  or         $v1, $v1, $a0
/* ADC0C 800BD40C 0800E003 */  jr         $ra
/* ADC10 800BD410 0400A3AC */   sw        $v1, 0x4($a1)
.size StartRCnt, . - StartRCnt

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel midiProgramChange
/* 464F4 80055CF4 05008290 */  lbu        $v0, 0x5($a0)
/* 464F8 80055CF8 06008390 */  lbu        $v1, 0x6($a0)
/* 464FC 80055CFC 0F004230 */  andi       $v0, $v0, 0xF
/* 46500 80055D00 2128A200 */  addu       $a1, $a1, $v0
/* 46504 80055D04 0800E003 */  jr         $ra
/* 46508 80055D08 9005A3A0 */   sb        $v1, 0x590($a1)
.size midiProgramChange, . - midiProgramChange

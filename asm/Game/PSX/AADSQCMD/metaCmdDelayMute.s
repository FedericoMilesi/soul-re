.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdDelayMute
/* 46C30 80056430 07008390 */  lbu        $v1, 0x7($a0)
/* 46C34 80056434 3805A58C */  lw         $a1, 0x538($a1)
/* 46C38 80056438 06008490 */  lbu        $a0, 0x6($a0)
/* 46C3C 8005643C 001A0300 */  sll        $v1, $v1, 8
/* 46C40 80056440 4405A294 */  lhu        $v0, 0x544($a1)
/* 46C44 80056444 25186400 */  or         $v1, $v1, $a0
/* 46C48 80056448 25104300 */  or         $v0, $v0, $v1
/* 46C4C 8005644C 0800E003 */  jr         $ra
/* 46C50 80056450 4405A2A4 */   sh        $v0, 0x544($a1)
.size metaCmdDelayMute, . - metaCmdDelayMute

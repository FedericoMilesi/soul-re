.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelProgram
/* 46D08 80056508 3805A28C */  lw         $v0, 0x538($a1)
/* 46D0C 8005650C 3D05A390 */  lbu        $v1, 0x53D($a1)
/* 46D10 80056510 06008490 */  lbu        $a0, 0x6($a0)
/* 46D14 80056514 21104300 */  addu       $v0, $v0, $v1
/* 46D18 80056518 0800E003 */  jr         $ra
/* 46D1C 8005651C 900544A0 */   sb        $a0, 0x590($v0)
.size metaCmdSetChannelProgram, . - metaCmdSetChannelProgram

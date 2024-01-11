.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelTranspose
/* 46D28 80056528 3D05A690 */  lbu        $a2, 0x53D($a1)
/* 46D2C 8005652C 3805A28C */  lw         $v0, 0x538($a1)
/* 46D30 80056530 06008390 */  lbu        $v1, 0x6($a0)
/* 46D34 80056534 21104600 */  addu       $v0, $v0, $a2
/* 46D38 80056538 0800E003 */  jr         $ra
/* 46D3C 8005653C C00543A0 */   sb        $v1, 0x5C0($v0)
.size metaCmdSetChannelTranspose, . - metaCmdSetChannelTranspose

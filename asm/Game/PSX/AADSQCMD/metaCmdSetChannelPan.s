.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelPan
/* 46AA4 800562A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46AA8 800562A8 1000BFAF */  sw         $ra, 0x10($sp)
/* 46AAC 800562AC 3805A28C */  lw         $v0, 0x538($a1)
/* 46AB0 800562B0 3D05A390 */  lbu        $v1, 0x53D($a1)
/* 46AB4 800562B4 06008490 */  lbu        $a0, 0x6($a0)
/* 46AB8 800562B8 21104300 */  addu       $v0, $v0, $v1
/* 46ABC 800562BC B00544A0 */  sb         $a0, 0x5B0($v0)
/* 46AC0 800562C0 3805A48C */  lw         $a0, 0x538($a1)
/* 46AC4 800562C4 3D05A590 */  lbu        $a1, 0x53D($a1)
/* 46AC8 800562C8 0855010C */  jal        aadUpdateChannelVolPan
/* 46ACC 800562CC 00000000 */   nop
/* 46AD0 800562D0 1000BF8F */  lw         $ra, 0x10($sp)
/* 46AD4 800562D4 00000000 */  nop
/* 46AD8 800562D8 0800E003 */  jr         $ra
/* 46ADC 800562DC 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdSetChannelPan, . - metaCmdSetChannelPan

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetChannelVolume
/* 46A68 80056268 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46A6C 8005626C 1000BFAF */  sw         $ra, 0x10($sp)
/* 46A70 80056270 3805A28C */  lw         $v0, 0x538($a1)
/* 46A74 80056274 3D05A390 */  lbu        $v1, 0x53D($a1)
/* 46A78 80056278 06008490 */  lbu        $a0, 0x6($a0)
/* 46A7C 8005627C 21104300 */  addu       $v0, $v0, $v1
/* 46A80 80056280 A00544A0 */  sb         $a0, 0x5A0($v0)
/* 46A84 80056284 3805A48C */  lw         $a0, 0x538($a1)
/* 46A88 80056288 3D05A590 */  lbu        $a1, 0x53D($a1)
/* 46A8C 8005628C 0855010C */  jal        aadUpdateChannelVolPan
/* 46A90 80056290 00000000 */   nop
/* 46A94 80056294 1000BF8F */  lw         $ra, 0x10($sp)
/* 46A98 80056298 00000000 */  nop
/* 46A9C 8005629C 0800E003 */  jr         $ra
/* 46AA0 800562A0 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdSetChannelVolume, . - metaCmdSetChannelVolume

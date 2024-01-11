.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdUnMuteChannel
/* 46B50 80056350 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46B54 80056354 01000324 */  addiu      $v1, $zero, 0x1
/* 46B58 80056358 1000BFAF */  sw         $ra, 0x10($sp)
/* 46B5C 8005635C 3D05A290 */  lbu        $v0, 0x53D($a1)
/* 46B60 80056360 3805A48C */  lw         $a0, 0x538($a1)
/* 46B64 80056364 0D53010C */  jal        aadUnMuteChannels
/* 46B68 80056368 04284300 */   sllv      $a1, $v1, $v0
/* 46B6C 8005636C 1000BF8F */  lw         $ra, 0x10($sp)
/* 46B70 80056370 00000000 */  nop
/* 46B74 80056374 0800E003 */  jr         $ra
/* 46B78 80056378 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdUnMuteChannel, . - metaCmdUnMuteChannel

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdMuteChannel
/* 46B24 80056324 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46B28 80056328 01000324 */  addiu      $v1, $zero, 0x1
/* 46B2C 8005632C 1000BFAF */  sw         $ra, 0x10($sp)
/* 46B30 80056330 3D05A290 */  lbu        $v0, 0x53D($a1)
/* 46B34 80056334 3805A48C */  lw         $a0, 0x538($a1)
/* 46B38 80056338 D652010C */  jal        aadMuteChannels
/* 46B3C 8005633C 04284300 */   sllv      $a1, $v1, $v0
/* 46B40 80056340 1000BF8F */  lw         $ra, 0x10($sp)
/* 46B44 80056344 00000000 */  nop
/* 46B48 80056348 0800E003 */  jr         $ra
/* 46B4C 8005634C 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdMuteChannel, . - metaCmdMuteChannel

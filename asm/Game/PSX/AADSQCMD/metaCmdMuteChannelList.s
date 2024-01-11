.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdMuteChannelList
/* 46B7C 8005637C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46B80 80056380 1000BFAF */  sw         $ra, 0x10($sp)
/* 46B84 80056384 07008290 */  lbu        $v0, 0x7($a0)
/* 46B88 80056388 06008390 */  lbu        $v1, 0x6($a0)
/* 46B8C 8005638C 3805A48C */  lw         $a0, 0x538($a1)
/* 46B90 80056390 00120200 */  sll        $v0, $v0, 8
/* 46B94 80056394 D652010C */  jal        aadMuteChannels
/* 46B98 80056398 25284300 */   or        $a1, $v0, $v1
/* 46B9C 8005639C 1000BF8F */  lw         $ra, 0x10($sp)
/* 46BA0 800563A0 00000000 */  nop
/* 46BA4 800563A4 0800E003 */  jr         $ra
/* 46BA8 800563A8 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdMuteChannelList, . - metaCmdMuteChannelList

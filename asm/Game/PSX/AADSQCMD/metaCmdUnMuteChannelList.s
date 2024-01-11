.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdUnMuteChannelList
/* 46BAC 800563AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 46BB0 800563B0 1000BFAF */  sw         $ra, 0x10($sp)
/* 46BB4 800563B4 07008290 */  lbu        $v0, 0x7($a0)
/* 46BB8 800563B8 06008390 */  lbu        $v1, 0x6($a0)
/* 46BBC 800563BC 3805A48C */  lw         $a0, 0x538($a1)
/* 46BC0 800563C0 00120200 */  sll        $v0, $v0, 8
/* 46BC4 800563C4 0D53010C */  jal        aadUnMuteChannels
/* 46BC8 800563C8 25284300 */   or        $a1, $v0, $v1
/* 46BCC 800563CC 1000BF8F */  lw         $ra, 0x10($sp)
/* 46BD0 800563D0 00000000 */  nop
/* 46BD4 800563D4 0800E003 */  jr         $ra
/* 46BD8 800563D8 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdUnMuteChannelList, . - metaCmdUnMuteChannelList

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadUnMuteChannels
/* 45434 80054C34 44058294 */  lhu        $v0, 0x544($a0)
/* 45438 80054C38 00000000 */  nop
/* 4543C 80054C3C 24304500 */  and        $a2, $v0, $a1
/* 45440 80054C40 0500C010 */  beqz       $a2, .L80054C58
/* 45444 80054C44 27180600 */   nor       $v1, $zero, $a2
/* 45448 80054C48 48058294 */  lhu        $v0, 0x548($a0)
/* 4544C 80054C4C 2428A300 */  and        $a1, $a1, $v1
/* 45450 80054C50 25104600 */  or         $v0, $v0, $a2
/* 45454 80054C54 480582A4 */  sh         $v0, 0x548($a0)
.L80054C58:
/* 45458 80054C58 42058294 */  lhu        $v0, 0x542($a0)
/* 4545C 80054C5C 27180500 */  nor        $v1, $zero, $a1
/* 45460 80054C60 24104300 */  and        $v0, $v0, $v1
/* 45464 80054C64 0800E003 */  jr         $ra
/* 45468 80054C68 420582A4 */   sh        $v0, 0x542($a0)
.size aadUnMuteChannels, . - aadUnMuteChannels

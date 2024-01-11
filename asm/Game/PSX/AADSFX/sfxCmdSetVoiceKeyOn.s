.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfxCmdSetVoiceKeyOn
/* 48768 80057F68 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 4876C 80057F6C 0400848C */  lw         $a0, 0x4($a0)
/* 48770 80057F70 C804438C */  lw         $v1, 0x4C8($v0)
/* 48774 80057F74 00000000 */  nop
/* 48778 80057F78 25186400 */  or         $v1, $v1, $a0
/* 4877C 80057F7C 0800E003 */  jr         $ra
/* 48780 80057F80 C80443AC */   sw        $v1, 0x4C8($v0)
.size sfxCmdSetVoiceKeyOn, . - sfxCmdSetVoiceKeyOn

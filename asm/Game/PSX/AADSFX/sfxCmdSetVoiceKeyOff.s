.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfxCmdSetVoiceKeyOff
/* 48784 80057F84 D89B858F */  lw         $a1, %gp_rel(aadMem)($gp)
/* 48788 80057F88 0400838C */  lw         $v1, 0x4($a0)
/* 4878C 80057F8C C404A28C */  lw         $v0, 0x4C4($a1)
/* 48790 80057F90 00000000 */  nop
/* 48794 80057F94 25104300 */  or         $v0, $v0, $v1
/* 48798 80057F98 C404A2AC */  sw         $v0, 0x4C4($a1)
/* 4879C 80057F9C 0400828C */  lw         $v0, 0x4($a0)
/* 487A0 80057FA0 C804A38C */  lw         $v1, 0x4C8($a1)
/* 487A4 80057FA4 27100200 */  nor        $v0, $zero, $v0
/* 487A8 80057FA8 24186200 */  and        $v1, $v1, $v0
/* 487AC 80057FAC 0800E003 */  jr         $ra
/* 487B0 80057FB0 C804A3AC */   sw        $v1, 0x4C8($a1)
.size sfxCmdSetVoiceKeyOff, . - sfxCmdSetVoiceKeyOff

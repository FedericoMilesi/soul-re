.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadInstallEndSequenceCallback
/* 4546C 80054C6C D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 45470 80054C70 00000000 */  nop
/* 45474 80054C74 FC1B628C */  lw         $v0, 0x1BFC($v1)
/* 45478 80054C78 FC1B64AC */  sw         $a0, 0x1BFC($v1)
/* 4547C 80054C7C 0800E003 */  jr         $ra
/* 45480 80054C80 041C65AC */   sw        $a1, 0x1C04($v1)
.size aadInstallEndSequenceCallback, . - aadInstallEndSequenceCallback

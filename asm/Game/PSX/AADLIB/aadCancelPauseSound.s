.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadCancelPauseSound
/* 45570 80054D70 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 45574 80054D74 00000000 */  nop
/* 45578 80054D78 2400438C */  lw         $v1, 0x24($v0)
/* 4557C 80054D7C F3FF0424 */  addiu      $a0, $zero, -0xD
/* 45580 80054D80 24186400 */  and        $v1, $v1, $a0
/* 45584 80054D84 0800E003 */  jr         $ra
/* 45588 80054D88 240043AC */   sw        $v1, 0x24($v0)
.size aadCancelPauseSound, . - aadCancelPauseSound

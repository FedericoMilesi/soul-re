.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSetNoUpdateMode
/* 45498 80054C98 08008010 */  beqz       $a0, .L80054CBC
/* 4549C 80054C9C FDFF0424 */   addiu     $a0, $zero, -0x3
/* 454A0 80054CA0 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 454A4 80054CA4 00000000 */  nop
/* 454A8 80054CA8 2400628C */  lw         $v0, 0x24($v1)
/* 454AC 80054CAC 00000000 */  nop
/* 454B0 80054CB0 02004234 */  ori        $v0, $v0, 0x2
/* 454B4 80054CB4 0800E003 */  jr         $ra
/* 454B8 80054CB8 240062AC */   sw        $v0, 0x24($v1)
.L80054CBC:
/* 454BC 80054CBC D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 454C0 80054CC0 00000000 */  nop
/* 454C4 80054CC4 2400438C */  lw         $v1, 0x24($v0)
/* 454C8 80054CC8 00000000 */  nop
/* 454CC 80054CCC 24186400 */  and        $v1, $v1, $a0
/* 454D0 80054CD0 0800E003 */  jr         $ra
/* 454D4 80054CD4 240043AC */   sw        $v1, 0x24($v0)
.size aadSetNoUpdateMode, . - aadSetNoUpdateMode

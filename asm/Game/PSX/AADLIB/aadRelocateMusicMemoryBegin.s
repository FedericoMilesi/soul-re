.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadRelocateMusicMemoryBegin
/* 4348C 80052C8C D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 43490 80052C90 00000000 */  nop
/* 43494 80052C94 2400628C */  lw         $v0, 0x24($v1)
/* 43498 80052C98 00000000 */  nop
/* 4349C 80052C9C 02004234 */  ori        $v0, $v0, 0x2
/* 434A0 80052CA0 0800E003 */  jr         $ra
/* 434A4 80052CA4 240062AC */   sw        $v0, 0x24($v1)
.size aadRelocateMusicMemoryBegin, . - aadRelocateMusicMemoryBegin

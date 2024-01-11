.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadSetUserVariable
/* 45484 80054C84 D89B828F */  lw         $v0, %gp_rel(aadMem)($gp)
/* 45488 80054C88 00000000 */  nop
/* 4548C 80054C8C 21104400 */  addu       $v0, $v0, $a0
/* 45490 80054C90 0800E003 */  jr         $ra
/* 45494 80054C94 081C45A0 */   sb        $a1, 0x1C08($v0)
.size aadSetUserVariable, . - aadSetUserVariable

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadPauseSlot
/* 451D8 800549D8 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 451DC 800549DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 451E0 800549E0 1000BFAF */  sw         $ra, 0x10($sp)
/* 451E4 800549E4 0400628C */  lw         $v0, 0x4($v1)
/* 451E8 800549E8 00000000 */  nop
/* 451EC 800549EC 2A108200 */  slt        $v0, $a0, $v0
/* 451F0 800549F0 09004010 */  beqz       $v0, .L80054A18
/* 451F4 800549F4 80100400 */   sll       $v0, $a0, 2
/* 451F8 800549F8 21106200 */  addu       $v0, $v1, $v0
/* 451FC 800549FC 3400438C */  lw         $v1, 0x34($v0)
/* 45200 80054A00 00000000 */  nop
/* 45204 80054A04 40056294 */  lhu        $v0, 0x540($v1)
/* 45208 80054A08 00000000 */  nop
/* 4520C 80054A0C FEFF4230 */  andi       $v0, $v0, 0xFFFE
/* 45210 80054A10 AE52010C */  jal        aadAllNotesOff
/* 45214 80054A14 400562A4 */   sh        $v0, 0x540($v1)
.L80054A18:
/* 45218 80054A18 1000BF8F */  lw         $ra, 0x10($sp)
/* 4521C 80054A1C 00000000 */  nop
/* 45220 80054A20 0800E003 */  jr         $ra
/* 45224 80054A24 1800BD27 */   addiu     $sp, $sp, 0x18
.size aadPauseSlot, . - aadPauseSlot

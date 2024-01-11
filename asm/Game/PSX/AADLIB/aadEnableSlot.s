.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel aadEnableSlot
/* 45198 80054998 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 4519C 8005499C 00000000 */  nop
/* 451A0 800549A0 0400628C */  lw         $v0, 0x4($v1)
/* 451A4 800549A4 00000000 */  nop
/* 451A8 800549A8 2A108200 */  slt        $v0, $a0, $v0
/* 451AC 800549AC 08004010 */  beqz       $v0, .L800549D0
/* 451B0 800549B0 80100400 */   sll       $v0, $a0, 2
/* 451B4 800549B4 21106200 */  addu       $v0, $v1, $v0
/* 451B8 800549B8 3400438C */  lw         $v1, 0x34($v0)
/* 451BC 800549BC 00000000 */  nop
/* 451C0 800549C0 50056290 */  lbu        $v0, 0x550($v1)
/* 451C4 800549C4 00000000 */  nop
/* 451C8 800549C8 FE004230 */  andi       $v0, $v0, 0xFE
/* 451CC 800549CC 500562A0 */  sb         $v0, 0x550($v1)
.L800549D0:
/* 451D0 800549D0 0800E003 */  jr         $ra
/* 451D4 800549D4 00000000 */   nop
.size aadEnableSlot, . - aadEnableSlot

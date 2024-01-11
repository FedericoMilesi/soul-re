.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGetSlotPan
/* 46FA0 800567A0 06008490 */  lbu        $a0, 0x6($a0)
/* 46FA4 800567A4 00000000 */  nop
/* 46FA8 800567A8 80008228 */  slti       $v0, $a0, 0x80
/* 46FAC 800567AC 06004010 */  beqz       $v0, .L800567C8
/* 46FB0 800567B0 00000000 */   nop
/* 46FB4 800567B4 3805A28C */  lw         $v0, 0x538($a1)
/* 46FB8 800567B8 D89B838F */  lw         $v1, %gp_rel(aadMem)($gp)
/* 46FBC 800567BC 53054290 */  lbu        $v0, 0x553($v0)
/* 46FC0 800567C0 21186400 */  addu       $v1, $v1, $a0
/* 46FC4 800567C4 081C62A0 */  sb         $v0, 0x1C08($v1)
.L800567C8:
/* 46FC8 800567C8 0800E003 */  jr         $ra
/* 46FCC 800567CC 00000000 */   nop
.size metaCmdGetSlotPan, . - metaCmdGetSlotPan

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdGotoLabel
/* 4734C 80056B4C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47350 80056B50 21108000 */  addu       $v0, $a0, $zero
/* 47354 80056B54 2120A000 */  addu       $a0, $a1, $zero
/* 47358 80056B58 1000BFAF */  sw         $ra, 0x10($sp)
/* 4735C 80056B5C 04004590 */  lbu        $a1, 0x4($v0)
/* 47360 80056B60 06004690 */  lbu        $a2, 0x6($v0)
/* 47364 80056B64 615A010C */  jal        aadGotoSequenceLabel
/* 47368 80056B68 00000000 */   nop
/* 4736C 80056B6C 1000BF8F */  lw         $ra, 0x10($sp)
/* 47370 80056B70 00000000 */  nop
/* 47374 80056B74 0800E003 */  jr         $ra
/* 47378 80056B78 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdGotoLabel, . - metaCmdGotoLabel

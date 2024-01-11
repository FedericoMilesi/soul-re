.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel metaCmdSetSequencePosition
/* 4737C 80056B7C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 47380 80056B80 21108000 */  addu       $v0, $a0, $zero
/* 47384 80056B84 1000BFAF */  sw         $ra, 0x10($sp)
/* 47388 80056B88 3805A48C */  lw         $a0, 0x538($a1)
/* 4738C 80056B8C 04004590 */  lbu        $a1, 0x4($v0)
/* 47390 80056B90 06004690 */  lbu        $a2, 0x6($v0)
/* 47394 80056B94 615A010C */  jal        aadGotoSequenceLabel
/* 47398 80056B98 00000000 */   nop
/* 4739C 80056B9C 1000BF8F */  lw         $ra, 0x10($sp)
/* 473A0 80056BA0 00000000 */  nop
/* 473A4 80056BA4 0800E003 */  jr         $ra
/* 473A8 80056BA8 1800BD27 */   addiu     $sp, $sp, 0x18
.size metaCmdSetSequencePosition, . - metaCmdSetSequencePosition

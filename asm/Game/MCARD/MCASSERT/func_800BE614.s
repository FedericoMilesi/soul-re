.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE614
/* AEE14 800BE614 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AEE18 800BE618 1000BFAF */  sw         $ra, 0x10($sp)
/* AEE1C 800BE61C 2514030C */  jal        func_800C5094
/* AEE20 800BE620 00000000 */   nop
/* AEE24 800BE624 05004014 */  bnez       $v0, .L800BE63C
/* AEE28 800BE628 00000000 */   nop
/* AEE2C 800BE62C D613030C */  jal        func_800C4F58
/* AEE30 800BE630 00000000 */   nop
/* AEE34 800BE634 90F90208 */  j          .L800BE640
/* AEE38 800BE638 0100422C */   sltiu     $v0, $v0, 0x1
.L800BE63C:
/* AEE3C 800BE63C 21100000 */  addu       $v0, $zero, $zero
.L800BE640:
/* AEE40 800BE640 1000BF8F */  lw         $ra, 0x10($sp)
/* AEE44 800BE644 1800BD27 */  addiu      $sp, $sp, 0x18
/* AEE48 800BE648 0800E003 */  jr         $ra
/* AEE4C 800BE64C 00000000 */   nop
.size func_800BE614, . - func_800BE614

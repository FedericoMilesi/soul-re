.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE51C
/* AED1C 800BE51C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AED20 800BE520 1000BFAF */  sw         $ra, 0x10($sp)
/* AED24 800BE524 3715030C */  jal        func_800C54DC
/* AED28 800BE528 00000000 */   nop
/* AED2C 800BE52C 1000BF8F */  lw         $ra, 0x10($sp)
/* AED30 800BE530 0100422C */  sltiu      $v0, $v0, 0x1
/* AED34 800BE534 0800E003 */  jr         $ra
/* AED38 800BE538 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BE51C, . - func_800BE51C

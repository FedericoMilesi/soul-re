.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE560
/* AED60 800BE560 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AED64 800BE564 1000BFAF */  sw         $ra, 0x10($sp)
/* AED68 800BE568 9D14030C */  jal        func_800C5274
/* AED6C 800BE56C 00000000 */   nop
/* AED70 800BE570 1000BF8F */  lw         $ra, 0x10($sp)
/* AED74 800BE574 1800BD27 */  addiu      $sp, $sp, 0x18
/* AED78 800BE578 0800E003 */  jr         $ra
/* AED7C 800BE57C 00000000 */   nop
/* AED80 800BE580 00000000 */  nop
.size func_800BE560, . - func_800BE560

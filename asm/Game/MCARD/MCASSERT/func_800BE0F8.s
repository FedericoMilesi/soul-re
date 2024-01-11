.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE0F8
/* AE8F8 800BE0F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AE8FC 800BE0FC 1000BFAF */  sw         $ra, 0x10($sp)
/* AE900 800BE100 EC11030C */  jal        func_800C47B0
/* AE904 800BE104 00000000 */   nop
/* AE908 800BE108 1000BF8F */  lw         $ra, 0x10($sp)
/* AE90C 800BE10C 1800BD27 */  addiu      $sp, $sp, 0x18
/* AE910 800BE110 0800E003 */  jr         $ra
/* AE914 800BE114 00000000 */   nop
.size func_800BE0F8, . - func_800BE0F8

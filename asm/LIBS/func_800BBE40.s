.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BBE40
/* AC640 800BBE40 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AC644 800BBE44 1000BFAF */  sw         $ra, 0x10($sp)
/* AC648 800BBE48 2138C000 */  addu       $a3, $a2, $zero
/* AC64C 800BBE4C 99EF020C */  jal        func_800BBE64
/* AC650 800BBE50 21300000 */   addu      $a2, $zero, $zero
/* AC654 800BBE54 1000BF8F */  lw         $ra, 0x10($sp)
/* AC658 800BBE58 1800BD27 */  addiu      $sp, $sp, 0x18
/* AC65C 800BBE5C 0800E003 */  jr         $ra
/* AC660 800BBE60 00000000 */   nop
.size func_800BBE40, . - func_800BBE40

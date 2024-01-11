.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BE53C
/* AED3C 800BE53C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AED40 800BE540 1000BFAF */  sw         $ra, 0x10($sp)
/* AED44 800BE544 21288000 */  addu       $a1, $a0, $zero
/* AED48 800BE548 B7E6020C */  jal        func_800B9ADC
/* AED4C 800BE54C 03000424 */   addiu     $a0, $zero, 0x3
/* AED50 800BE550 1000BF8F */  lw         $ra, 0x10($sp)
/* AED54 800BE554 1800BD27 */  addiu      $sp, $sp, 0x18
/* AED58 800BE558 0800E003 */  jr         $ra
/* AED5C 800BE55C 00000000 */   nop
.size func_800BE53C, . - func_800BE53C

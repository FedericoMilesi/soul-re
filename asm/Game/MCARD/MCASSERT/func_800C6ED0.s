.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800C6ED0
/* B76D0 800C6ED0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B76D4 800C6ED4 1000BFAF */  sw         $ra, 0x10($sp)
/* B76D8 800C6ED8 21288000 */  addu       $a1, $a0, $zero
/* B76DC 800C6EDC B7E6020C */  jal        func_800B9ADC
/* B76E0 800C6EE0 04000424 */   addiu     $a0, $zero, 0x4
/* B76E4 800C6EE4 1000BF8F */  lw         $ra, 0x10($sp)
/* B76E8 800C6EE8 1800BD27 */  addiu      $sp, $sp, 0x18
/* B76EC 800C6EEC 0800E003 */  jr         $ra
/* B76F0 800C6EF0 00000000 */   nop
/* B76F4 800C6EF4 00000000 */  nop
/* B76F8 800C6EF8 00000000 */  nop
/* B76FC 800C6EFC 00000000 */  nop
.size func_800C6ED0, . - func_800C6ED0

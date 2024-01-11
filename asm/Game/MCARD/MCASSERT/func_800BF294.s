.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800BF294
/* AFA94 800BF294 01000424 */  addiu      $a0, $zero, 0x1
/* AFA98 800BF298 0C000000 */  syscall    0 # handwritten instruction
/* AFA9C 800BF29C 0800E003 */  jr         $ra
/* AFAA0 800BF2A0 00000000 */   nop
.size func_800BF294, . - func_800BF294

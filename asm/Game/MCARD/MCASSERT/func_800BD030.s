.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BD030
/* AD830 800BD030 08008010 */  beqz       $a0, .L800BD054
/* AD834 800BD034 00160500 */   sll       $v0, $a1, 24
/* AD838 800BD038 03160200 */  sra        $v0, $v0, 24
.L800BD03C:
/* AD83C 800BD03C 00008380 */  lb         $v1, 0x0($a0)
/* AD840 800BD040 00000000 */  nop
/* AD844 800BD044 05006210 */  beq        $v1, $v0, .L800BD05C
/* AD848 800BD048 00000000 */   nop
/* AD84C 800BD04C FBFF6014 */  bnez       $v1, .L800BD03C
/* AD850 800BD050 01008424 */   addiu     $a0, $a0, 0x1
.L800BD054:
/* AD854 800BD054 18F40208 */  j          .L800BD060
/* AD858 800BD058 21100000 */   addu      $v0, $zero, $zero
.L800BD05C:
/* AD85C 800BD05C 21108000 */  addu       $v0, $a0, $zero
.L800BD060:
/* AD860 800BD060 0800E003 */  jr         $ra
/* AD864 800BD064 00000000 */   nop
/* AD868 800BD068 00000000 */  nop
/* AD86C 800BD06C 00000000 */  nop
.size func_800BD030, . - func_800BD030

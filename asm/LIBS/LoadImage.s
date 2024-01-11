.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel LoadImage
/* AAE50 800BA650 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AAE54 800BA654 1000B0AF */  sw         $s0, 0x10($sp)
/* AAE58 800BA658 21808000 */  addu       $s0, $a0, $zero
/* AAE5C 800BA65C 1400B1AF */  sw         $s1, 0x14($sp)
/* AAE60 800BA660 2188A000 */  addu       $s1, $a1, $zero
/* AAE64 800BA664 0180043C */  lui        $a0, %hi(D_80012670)
/* AAE68 800BA668 70268424 */  addiu      $a0, $a0, %lo(D_80012670)
/* AAE6C 800BA66C 1800BFAF */  sw         $ra, 0x18($sp)
/* AAE70 800BA670 29E9020C */  jal        func_800BA4A4
/* AAE74 800BA674 21280002 */   addu      $a1, $s0, $zero
/* AAE78 800BA678 21280002 */  addu       $a1, $s0, $zero
/* AAE7C 800BA67C 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x1158)
/* AAE80 800BA680 04DA428C */  lw         $v0, %lo(the_attract_movies + 0x1158)($v0)
/* AAE84 800BA684 08000624 */  addiu      $a2, $zero, 0x8
/* AAE88 800BA688 2000448C */  lw         $a0, 0x20($v0)
/* AAE8C 800BA68C 0800428C */  lw         $v0, 0x8($v0)
/* AAE90 800BA690 00000000 */  nop
/* AAE94 800BA694 09F84000 */  jalr       $v0
/* AAE98 800BA698 21382002 */   addu      $a3, $s1, $zero
/* AAE9C 800BA69C 1800BF8F */  lw         $ra, 0x18($sp)
/* AAEA0 800BA6A0 1400B18F */  lw         $s1, 0x14($sp)
/* AAEA4 800BA6A4 1000B08F */  lw         $s0, 0x10($sp)
/* AAEA8 800BA6A8 0800E003 */  jr         $ra
/* AAEAC 800BA6AC 2000BD27 */   addiu     $sp, $sp, 0x20
.size LoadImage, . - LoadImage

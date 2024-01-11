.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA814
/* AB014 800BA814 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AB018 800BA818 1000B0AF */  sw         $s0, 0x10($sp)
/* AB01C 800BA81C 21808000 */  addu       $s0, $a0, $zero
/* AB020 800BA820 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x1158)
/* AB024 800BA824 04DA428C */  lw         $v0, %lo(the_attract_movies + 0x1158)($v0)
/* AB028 800BA828 1800BFAF */  sw         $ra, 0x18($sp)
/* AB02C 800BA82C 1400B1AF */  sw         $s1, 0x14($sp)
/* AB030 800BA830 3C00428C */  lw         $v0, 0x3C($v0)
/* AB034 800BA834 03001192 */  lbu        $s1, 0x3($s0)
/* AB038 800BA838 09F84000 */  jalr       $v0
/* AB03C 800BA83C 21200000 */   addu      $a0, $zero, $zero
/* AB040 800BA840 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x1158)
/* AB044 800BA844 04DA428C */  lw         $v0, %lo(the_attract_movies + 0x1158)($v0)
/* AB048 800BA848 04000426 */  addiu      $a0, $s0, 0x4
/* AB04C 800BA84C 1400428C */  lw         $v0, 0x14($v0)
/* AB050 800BA850 00000000 */  nop
/* AB054 800BA854 09F84000 */  jalr       $v0
/* AB058 800BA858 21282002 */   addu      $a1, $s1, $zero
/* AB05C 800BA85C 1800BF8F */  lw         $ra, 0x18($sp)
/* AB060 800BA860 1400B18F */  lw         $s1, 0x14($sp)
/* AB064 800BA864 1000B08F */  lw         $s0, 0x10($sp)
/* AB068 800BA868 0800E003 */  jr         $ra
/* AB06C 800BA86C 2000BD27 */   addiu     $sp, $sp, 0x20
.size func_800BA814, . - func_800BA814

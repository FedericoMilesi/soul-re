.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800BA870
/* AB070 800BA870 0D80023C */  lui        $v0, %hi(GEnv + 0x2)
/* AB074 800BA874 0EDA4290 */  lbu        $v0, %lo(GEnv + 0x2)($v0)
/* AB078 800BA878 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AB07C 800BA87C 1000B0AF */  sw         $s0, 0x10($sp)
/* AB080 800BA880 21808000 */  addu       $s0, $a0, $zero
/* AB084 800BA884 0200422C */  sltiu      $v0, $v0, 0x2
/* AB088 800BA888 08004014 */  bnez       $v0, .L800BA8AC
/* AB08C 800BA88C 1400BFAF */   sw        $ra, 0x14($sp)
/* AB090 800BA890 0180043C */  lui        $a0, %hi(D_800126C4)
/* AB094 800BA894 C4268424 */  addiu      $a0, $a0, %lo(D_800126C4)
/* AB098 800BA898 0D80023C */  lui        $v0, %hi(GPU_printf)
/* AB09C 800BA89C 08DA428C */  lw         $v0, %lo(GPU_printf)($v0)
/* AB0A0 800BA8A0 00000000 */  nop
/* AB0A4 800BA8A4 09F84000 */  jalr       $v0
/* AB0A8 800BA8A8 21280002 */   addu      $a1, $s0, $zero
.L800BA8AC:
/* AB0AC 800BA8AC 21280002 */  addu       $a1, $s0, $zero
/* AB0B0 800BA8B0 0D80023C */  lui        $v0, %hi(the_attract_movies + 0x1158)
/* AB0B4 800BA8B4 04DA428C */  lw         $v0, %lo(the_attract_movies + 0x1158)($v0)
/* AB0B8 800BA8B8 21300000 */  addu       $a2, $zero, $zero
/* AB0BC 800BA8BC 1800448C */  lw         $a0, 0x18($v0)
/* AB0C0 800BA8C0 0800428C */  lw         $v0, 0x8($v0)
/* AB0C4 800BA8C4 00000000 */  nop
/* AB0C8 800BA8C8 09F84000 */  jalr       $v0
/* AB0CC 800BA8CC 21380000 */   addu      $a3, $zero, $zero
/* AB0D0 800BA8D0 1400BF8F */  lw         $ra, 0x14($sp)
/* AB0D4 800BA8D4 1000B08F */  lw         $s0, 0x10($sp)
/* AB0D8 800BA8D8 0800E003 */  jr         $ra
/* AB0DC 800BA8DC 1800BD27 */   addiu     $sp, $sp, 0x18
.size func_800BA870, . - func_800BA870

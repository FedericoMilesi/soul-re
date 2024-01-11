.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800251AC
/* 159AC 800251AC 0D80023C */  lui        $v0, %hi(debugSoundMenu)
/* 159B0 800251B0 AC204224 */  addiu      $v0, $v0, %lo(debugSoundMenu)
/* 159B4 800251B4 0E80033C */  lui        $v1, %hi(D_800DFE74)
/* 159B8 800251B8 74FE6324 */  addiu      $v1, $v1, %lo(D_800DFE74)
.L800251BC:
/* 159BC 800251BC 000040AC */  sw         $zero, 0x0($v0)
/* 159C0 800251C0 04004224 */  addiu      $v0, $v0, 0x4
/* 159C4 800251C4 2B084300 */  sltu       $at, $v0, $v1
/* 159C8 800251C8 FCFF2014 */  bnez       $at, .L800251BC
/* 159CC 800251CC 00000000 */   nop
/* 159D0 800251D0 0800E003 */  jr         $ra
/* 159D4 800251D4 00000000 */   nop
.size func_800251AC, . - func_800251AC

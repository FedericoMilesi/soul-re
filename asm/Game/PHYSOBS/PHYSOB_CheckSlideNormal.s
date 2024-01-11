.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSOB_CheckSlideNormal
/* 61350 80070B50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 61354 80070B54 1000B0AF */  sw         $s0, 0x10($sp)
/* 61358 80070B58 21808000 */  addu       $s0, $a0, $zero
/* 6135C 80070B5C 1400B1AF */  sw         $s1, 0x14($sp)
/* 61360 80070B60 2188E000 */  addu       $s1, $a3, $zero
/* 61364 80070B64 2400A427 */  addiu      $a0, $sp, 0x24
/* 61368 80070B68 2400A5AF */  sw         $a1, 0x24($sp)
/* 6136C 80070B6C 2800A527 */  addiu      $a1, $sp, 0x28
/* 61370 80070B70 1800BFAF */  sw         $ra, 0x18($sp)
/* 61374 80070B74 E9C2010C */  jal        PHYSOB_NormalToAxis
/* 61378 80070B78 2800A6AF */   sw        $a2, 0x28($sp)
/* 6137C 80070B7C 21200002 */  addu       $a0, $s0, $zero
/* 61380 80070B80 2400A58F */  lw         $a1, 0x24($sp)
/* 61384 80070B84 2800A68F */  lw         $a2, 0x28($sp)
/* 61388 80070B88 8BC2010C */  jal        PHYSOB_CheckSlide2
/* 6138C 80070B8C 21382002 */   addu      $a3, $s1, $zero
/* 61390 80070B90 1800BF8F */  lw         $ra, 0x18($sp)
/* 61394 80070B94 1400B18F */  lw         $s1, 0x14($sp)
/* 61398 80070B98 1000B08F */  lw         $s0, 0x10($sp)
/* 6139C 80070B9C 0800E003 */  jr         $ra
/* 613A0 80070BA0 2000BD27 */   addiu     $sp, $sp, 0x20
.size PHYSOB_CheckSlideNormal, . - PHYSOB_CheckSlideNormal

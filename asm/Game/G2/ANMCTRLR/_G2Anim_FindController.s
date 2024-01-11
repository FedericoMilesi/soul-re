.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _G2Anim_FindController
/* 82428 80091C28 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8242C 80091C2C 1800B2AF */  sw         $s2, 0x18($sp)
/* 82430 80091C30 21908000 */  addu       $s2, $a0, $zero
/* 82434 80091C34 1000B0AF */  sw         $s0, 0x10($sp)
/* 82438 80091C38 2180A000 */  addu       $s0, $a1, $zero
/* 8243C 80091C3C 1400B1AF */  sw         $s1, 0x14($sp)
/* 82440 80091C40 2188C000 */  addu       $s1, $a2, $zero
/* 82444 80091C44 21200002 */  addu       $a0, $s0, $zero
/* 82448 80091C48 21282002 */  addu       $a1, $s1, $zero
/* 8244C 80091C4C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 82450 80091C50 0F48020C */  jal        _G2AnimControllerST_FindInList
/* 82454 80091C54 02004626 */   addiu     $a2, $s2, 0x2
/* 82458 80091C58 04004014 */  bnez       $v0, .L80091C6C
/* 8245C 80091C5C 21200002 */   addu      $a0, $s0, $zero
/* 82460 80091C60 21282002 */  addu       $a1, $s1, $zero
/* 82464 80091C64 0F48020C */  jal        _G2AnimControllerST_FindInList
/* 82468 80091C68 04004626 */   addiu     $a2, $s2, 0x4
.L80091C6C:
/* 8246C 80091C6C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 82470 80091C70 1800B28F */  lw         $s2, 0x18($sp)
/* 82474 80091C74 1400B18F */  lw         $s1, 0x14($sp)
/* 82478 80091C78 1000B08F */  lw         $s0, 0x10($sp)
/* 8247C 80091C7C 0800E003 */  jr         $ra
/* 82480 80091C80 2000BD27 */   addiu     $sp, $sp, 0x20
.size _G2Anim_FindController, . - _G2Anim_FindController

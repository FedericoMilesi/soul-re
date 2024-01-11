.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_CheckForObjectCollide
/* 68644 80077E44 B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 68648 80077E48 3E000224 */  addiu      $v0, $zero, 0x3E
/* 6864C 80077E4C 4000BFAF */  sw         $ra, 0x40($sp)
/* 68650 80077E50 2800A5AF */  sw         $a1, 0x28($sp)
/* 68654 80077E54 2400A6AF */  sw         $a2, 0x24($sp)
/* 68658 80077E58 4000858C */  lw         $a1, 0x40($a0)
/* 6865C 80077E5C 40390700 */  sll        $a3, $a3, 5
/* 68660 80077E60 3400A2AF */  sw         $v0, 0x34($sp)
/* 68664 80077E64 2128A700 */  addu       $a1, $a1, $a3
/* 68668 80077E68 2130A000 */  addu       $a2, $a1, $zero
/* 6866C 80077E6C 2DE0010C */  jal        PHYSICS_GenericLineCheckMask
/* 68670 80077E70 1000A727 */   addiu     $a3, $sp, 0x10
/* 68674 80077E74 1000A287 */  lh         $v0, 0x10($sp)
/* 68678 80077E78 4000BF8F */  lw         $ra, 0x40($sp)
/* 6867C 80077E7C 2B100200 */  sltu       $v0, $zero, $v0
/* 68680 80077E80 0800E003 */  jr         $ra
/* 68684 80077E84 4800BD27 */   addiu     $sp, $sp, 0x48
.size PHYSICS_CheckForObjectCollide, . - PHYSICS_CheckForObjectCollide

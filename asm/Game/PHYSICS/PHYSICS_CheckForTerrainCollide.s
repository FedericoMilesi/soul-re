.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel PHYSICS_CheckForTerrainCollide
/* 685FC 80077DFC B8FFBD27 */  addiu      $sp, $sp, -0x48
/* 68600 80077E00 01000224 */  addiu      $v0, $zero, 0x1
/* 68604 80077E04 4000BFAF */  sw         $ra, 0x40($sp)
/* 68608 80077E08 2800A5AF */  sw         $a1, 0x28($sp)
/* 6860C 80077E0C 2400A6AF */  sw         $a2, 0x24($sp)
/* 68610 80077E10 4000858C */  lw         $a1, 0x40($a0)
/* 68614 80077E14 40390700 */  sll        $a3, $a3, 5
/* 68618 80077E18 3400A2AF */  sw         $v0, 0x34($sp)
/* 6861C 80077E1C 2128A700 */  addu       $a1, $a1, $a3
/* 68620 80077E20 2130A000 */  addu       $a2, $a1, $zero
/* 68624 80077E24 2DE0010C */  jal        PHYSICS_GenericLineCheckMask
/* 68628 80077E28 1000A727 */   addiu     $a3, $sp, 0x10
/* 6862C 80077E2C 1000A287 */  lh         $v0, 0x10($sp)
/* 68630 80077E30 4000BF8F */  lw         $ra, 0x40($sp)
/* 68634 80077E34 03004238 */  xori       $v0, $v0, 0x3
/* 68638 80077E38 0100422C */  sltiu      $v0, $v0, 0x1
/* 6863C 80077E3C 0800E003 */  jr         $ra
/* 68640 80077E40 4800BD27 */   addiu     $sp, $sp, 0x48
.size PHYSICS_CheckForTerrainCollide, . - PHYSICS_CheckForTerrainCollide
